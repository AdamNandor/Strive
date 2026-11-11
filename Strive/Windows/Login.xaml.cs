using Strive;
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
using System.Windows.Shapes;

namespace WpfApp1.Windows
{
    /// <summary>
    /// Interaction logic for Login.xaml
    /// </summary>
    public partial class Login : Window
    {
        public Login()
        {
            InitializeComponent();
        }

        private void btnBejelentkezes_Click(object sender, RoutedEventArgs e)
        {
            if (tbxFelhasznalonev.Text == "a" && pwbJelszo.Password == "a")
            {
                MainWindow mainWindow = new MainWindow();
                mainWindow.Show();
                this.Close();
            }
            else
            {
                string hibasszoveg = "Hibás felhasználónév vagy jelszó!";
                MessageBox.Show(hibasszoveg, "Hiba", MessageBoxButton.OK, MessageBoxImage.Error);
                HibasText.Text = hibasszoveg;
            }
        }
    }
}
