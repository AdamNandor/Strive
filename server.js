const express = require('express');
const session = require('express-session');
const bcrypt = require('bcryptjs');
const mysql = require('mysql2/promise');
const path = require('path');

const app = express();
const port = Number(process.env.PORT || 3000);
const pool = mysql.createPool({
  host: process.env.DB_HOST || '127.0.0.1',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'strive_database',
  waitForConnections: true,
  connectionLimit: 10,
  charset: 'utf8mb4'
});

app.use(express.json());
app.use(session({
  secret: process.env.SESSION_SECRET || 'change-this-local-development-secret',
  resave: false,
  saveUninitialized: false,
  cookie: { httpOnly: true, sameSite: 'lax', secure: false, maxAge: 24 * 60 * 60 * 1000 }
}));

app.post('/api/auth', async (req, res) => {
  const action = req.body?.action;
  const email = String(req.body?.email || '').trim().toLowerCase();
  const password = String(req.body?.password || '');
  if (!/^\S+@\S+\.\S+$/.test(email) || !password) {
    return res.status(400).json({ message: 'Adj meg érvényes e-mail-címet és jelszót.' });
  }

  try {
    if (action === 'register') {
      const name = String(req.body?.name || '').trim();
      if (!name || name.length > 100 || password.length < 8) {
        return res.status(400).json({ message: 'Adj meg nevet, és legalább 8 karakteres jelszót.' });
      }
      const passwordHash = await bcrypt.hash(password, 12);
      const [result] = await pool.execute(
        "INSERT INTO `user` (`name`, `email`, `password_hash`, `role`) VALUES (?, ?, ?, 'member')",
        [name, email, passwordHash]
      );
      req.session.userId = result.insertId;
      return res.json({ message: 'Sikeres regisztráció.' });
    }

    if (action === 'login') {
      const [rows] = await pool.execute(
        'SELECT id, password_hash FROM `user` WHERE email = ? LIMIT 1', [email]
      );
      if (!rows.length || !await bcrypt.compare(password, rows[0].password_hash)) {
        return res.status(401).json({ message: 'Hibás e-mail-cím vagy jelszó.' });
      }
      req.session.userId = rows[0].id;
      return res.json({ message: 'Sikeres bejelentkezés.' });
    }
    return res.status(400).json({ message: 'Ismeretlen művelet.' });
  } catch (error) {
    if (error.code === 'ER_DUP_ENTRY') {
      return res.status(409).json({ message: 'Ezzel az e-mail-címmel már létezik fiók.' });
    }
    console.error('Authentication error:', error.message);
    return res.status(500).json({ message: 'Nem sikerült feldolgozni a kérést. Ellenőrizd az adatbázis-kapcsolatot.' });
  }
});

app.get('/api/session', (req, res) => {
  if (!req.session.userId) return res.status(401).json({ authenticated: false });
  res.json({ authenticated: true });
});

app.use(express.static(path.join(__dirname)));
app.listen(port, () => console.log(`Strive elérhető: http://localhost:${port}`));
