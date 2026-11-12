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
        private List<Felhasznalo> felhasznalok = new List<Felhasznalo>();
        public MainWindow()
        {
            InitializeComponent();
            try
            {
                string connStr = "SERVER = localhost; PORT = 3306; DATABASE = strive_database; USER = root; PASSWORD=;";
                mySqlConnection = new MySqlConnection(connStr);
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
            felhasznalok = new FelhasznaloService(mySqlConnection).GetAllUser();
            lbxFelhasznalok.ItemsSource = felhasznalok;
        }


        private void lbxFelhasznalok_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (lbxFelhasznalok.SelectedItem is Felhasznalo kivalasztott)
            {
                tbxNev.Text = kivalasztott.Name;
                tbxEmail.Text = kivalasztott.Email;
                cbxRole.Text = kivalasztott.Role;
            }
        }
    }
}
