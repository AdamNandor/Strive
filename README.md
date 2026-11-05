# Strive

A Strive egy fitnesz- és jólléti platform prototípusa, amely a személyes egészségkövetésre, az edzéscoachingra és a célorientált tervezésre épül. A projekt egy .NET WPF asztali alkalmazást egy könnyű webes felülettel és egy MySQL/MariaDB-adatbázissémával egyesít.

## Áttekintés

Ez a tároló egy fitneszalkalmazás-demót tartalmaz, amely segít a felhasználóknak:

- nyomon követni egészségi állapotukat és fejlődésüket
- kiszámítani a BMI-t és a kalóriaszükségletet
- megismerkedni a személyi edzéssel és a fitnesztervekkel
- kezelni a tagok, edzők és edzésprogramok adatait

A projekt prototípusként épül fel, és asztali, valamint webes komponenseket is tartalmaz.

## Funkciók

- Kezdő- és hitelesítési képernyők egy fitneszplatformhoz
- BMI-kalkulátor
- Nem és cél alapján működő kalóriakalkulátor
- Adatbázisséma felhasználók, edzők, edzéstervek és mérések kezeléséhez
- Minta fitneszadatok tagokhoz és edzőkhöz
- WPF-alapú asztali alkalmazásváz

## Technológiai háttér

- C# / WPF (.NET Framework 4.8)
- HTML
- CSS
- JavaScript
- MySQL / MariaDB SQL-séma

## A tároló felépítése

```text
Strive/
├── Strive.sln
├── Strive/
│   ├── App.xaml
│   ├── App.xaml.cs
│   ├── MainWindow.xaml
│   ├── MainWindow.xaml.cs
│   ├── App.config
│   ├── Strive.csproj
│   ├── Database/
│   │   └── strive_database.sql
│   ├── Web/
│   │   ├── CSS/
│   │   ├── HTML/
│   │   └── JS/
│   └── Properties/
└── README.md
```

## A projekt moduljai

### Asztali alkalmazás
Az asztali alkalmazás a `Strive/Strive.csproj` fájlban beállított WPF-projekt, és ez biztosítja a projekt alkalmazásvázát.

### Webes felület
A webes mappa statikus oldalakat és szkripteket tartalmaz az alábbiakhoz:

- nyitóoldal (`Strive/Web/HTML/Strive.html`)
- BMI-kalkulátor (`Strive/Web/HTML/BMI.html`)
- kalóriakalkulátor (`Strive/Web/HTML/CalorieCalculator.html`)

Ezek az oldalak az alábbi JavaScript-fájlokban található logikát használják:

- `Strive/Web/JS/BMI.js`
- `Strive/Web/JS/CalorieCalculator.js`

### Adatbázis
A minta MySQL-adatbázis sémáját az alábbi fájl határozza meg:

- `Strive/Database/strive_database.sql`

Többek között az alábbi táblákat tartalmazza:

- `users`
- `trainers`
- `workout_plans`
- `measurements_calculations`

## Első lépések

### Előfeltételek

- Visual Studio 2022 vagy újabb verzió
- .NET Framework 4.8
- MySQL- vagy MariaDB-kiszolgáló

### 1. A megoldás visszaállítása és megnyitása

Nyisd meg a `Strive.sln` fájlt a Visual Studióban.

### 2. Az adatbázis létrehozása

Importáld az SQL-fájlt egy `strive_database` nevű MariaDB/MySQL-adatbázisba:

```bash
mysql -u your_user -p < Strive/Database/strive_database.sql
```

### 3. Az alkalmazás futtatása

Készítsd el és futtasd a WPF-projektet a Visual Studióból.

## Használat

A projekt jelenleg prototípusként/demóplatformként szolgál, működő kalkulátoroldalakkal és egy olyan alapokkal, amely készen áll egy átfogóbb fitneszalkalmazás adatbázisának kialakítására.

Elérhető oldalak például:

- a Strive márka nyitóoldala
- bejelentkezési/regisztrációs demófelület
- BMI-kalkulátor
- kalóriaszükséglet-kalkulátor

## A projekt állapota

Ez a projekt egy prototípus, amely a felhasználói felületre, az adatmodellezésre és az egészséggel kapcsolatos funkciókra összpontosít. Még nem teljes, éles használatra kész fitneszplatform.

## További fejlesztési lehetőségek

A lehetséges következő lépések:

- háttérbeli API-integráció
- felhasználói hitelesítés és jogosultságkezelés
- állandó adatbázis-kapcsolatok
- irányítópultok a felhasználói mutatók és a fejlődés követéséhez
- edző- és tagkezelési folyamatok
- telepítési támogatás és környezeti konfiguráció

## Kapcsolódó hivatkozások

- Trello-tábla: https://trello.com/b/wXBgoemi/goaldiggers

## Megjegyzések

A jelenlegi kódbázis kiváló kiindulópont egy fitneszalkalmazás koncepciójához, és jól szemlélteti egy egészségközpontú termék reális felépítését WPF-alapú asztali felülettel és webes kalkulátoroldalakkal.
