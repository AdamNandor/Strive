using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfApp1.Models;
using WpfApp1.Services;

namespace Strive
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        MySqlConnection mySqlConnection;
        private FelhasznaloService felhasznaloService;
        private List<Felhasznalo> felhasznalok = new List<Felhasznalo>();
        private int Id;
        public MainWindow()
        {
            InitializeComponent();
            try
            {
                string connStr = "SERVER = localhost; PORT = 3306; DATABASE = strive_database; USER = root; PASSWORD=;";
                mySqlConnection = new MySqlConnection(connStr);
                felhasznaloService = new FelhasznaloService(mySqlConnection);
                LoadUsers();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Hiba az adatbázis inicializációja során!" + ex.Message);
            }
        }

        private void LoadUsers()
        {
            felhasznalok.Clear();
            felhasznalok = felhasznaloService.GetAllUser();
            lbxFelhasznalok.ItemsSource = felhasznalok;
        }


        public void lbxFelhasznalok_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (lbxFelhasznalok.SelectedItem is Felhasznalo kivalasztott)
            {
                spUjFelhasznalo.Visibility = Visibility.Collapsed;
                spAdatok.Visibility = Visibility.Visible;

                lblAdatok.Content = "ADATOK";
                Id = kivalasztott.Id;
                tbxNev.Text = kivalasztott.Name;
                tbxEmail.Text = kivalasztott.Email;
                cbxRole.Text = kivalasztott.Role;
            }
        }

        private void btnMentes_Click(object sender, RoutedEventArgs e)
        {
            felhasznaloService.UpdateUser(Id, tbxNev.Text, tbxEmail.Text, cbxRole.Text);
            MessageBox.Show($"Sikeres mentés! Változás: {Id}. név: {tbxNev.Text}, email: {tbxEmail.Text}, szerep: {cbxRole.Text}");
            LoadUsers();
        }

        private void btnTorles_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult result = MessageBox.Show($"Biztosan kitörli a(z) {Id} sorszámú felhasználót?", "Törlés", MessageBoxButton.YesNo);
            if (result == MessageBoxResult.Yes)
            {
                felhasznaloService.DeleteUser(Id);
                MessageBox.Show($"Sikeresen kitörölte a {Id}. sorszámú felhasználót");
                LoadUsers();
            }
            
        }

        private void btnUjFelhasznalo_Click(object sender, RoutedEventArgs e)
        {
            lbxFelhasznalok.SelectedItem = null;
            spAdatok.Visibility = Visibility.Collapsed;
            spUjFelhasznalo.Visibility = Visibility.Visible;
        }

        private void btnLetrehozas_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult result = MessageBox.Show($"Biztosan létrehoz egy új felhasználót?", "Létrehozás", MessageBoxButton.YesNo);
            if (result == MessageBoxResult.Yes)
            {
                string passwordHash = BCrypt.Net.BCrypt.HashPassword(pwbUjJelszo.Password, 10);
                bool sikeres = felhasznaloService.CreateUser(tbxUjNev.Text, tbxUjEmail.Text, passwordHash, cbxRole.Text);

                if (sikeres) 
                {
                    MessageBox.Show("Új felhasználó sikeresen létrehozva!");
                    spUjFelhasznalo.Visibility = Visibility.Collapsed;
                    spAdatok.Visibility = Visibility.Visible;
                    LoadUsers();
                }
            }
        }

        private void btnMegsem_Click(object sender, RoutedEventArgs e)
        {
            spUjFelhasznalo.Visibility = Visibility.Collapsed;
            spAdatok.Visibility = Visibility.Visible;
        }
    }
}
