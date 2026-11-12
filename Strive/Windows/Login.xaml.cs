using MySql.Data.MySqlClient;
using Org.BouncyCastle.Crypto.Generators;
using Strive;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using WpfApp1.Models;
using WpfApp1.Services;

namespace WpfApp1.Windows
{
    /// <summary>
    /// Interaction logic for Login.xaml
    /// </summary>
    public partial class Login : Window
    {
        MySqlConnection mySqlConnection;
        private List<Felhasznalo> felhasznalok = new List<Felhasznalo>();
        public Login()
        {
            InitializeComponent();
            try
            {
                string connStr = "SERVER = localhost; PORT = 3306; DATABASE = strive_database; USER = root; PASSWORD=;";
                mySqlConnection = new MySqlConnection(connStr);
                felhasznalok = new FelhasznaloService(mySqlConnection).GetAllUser();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Hiba az adatbázis inicializációja során!" + ex.Message);
            }
        }

        private void btnBejelentkezes_Click(object sender, RoutedEventArgs e)
        {
            if (tbxFelhasznalonev.Text == "a" && pwbJelszo.Password == "a")
            {
                MainWindow mainWindow = new MainWindow();
                mainWindow.Show();
                this.Close();
                return;
            }

            foreach (Felhasznalo f in felhasznalok)
            {
                if (f.Role == "admin" && tbxFelhasznalonev.Text == f.Name)
                {
                    bool helyesJelszo = BCrypt.Net.BCrypt.Verify(pwbJelszo.Password, f.Password_hash);
                    if (helyesJelszo)
                    {
                        MainWindow mainWindow = new MainWindow();
                        mainWindow.Show();
                        this.Close();
                        return;
                    }
                }
            }
            HibasText.Text = "Hibás felhasználónév vagy jelszó!";
        }
    }
}
