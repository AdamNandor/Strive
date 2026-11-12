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

namespace Strive
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static bool bejelentkezve = false;
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Exit(object sender, EventArgs e)
        {
            MessageBoxResult result = MessageBox.Show("Biztosan ki akarsz lépni a programból?", "Kilépés", MessageBoxButton.YesNo);
            if (result == MessageBoxResult.Yes)
            {
                Application.Current.Shutdown();
            }
        }

        private void FelhasznalokKarbantartasa(object sender, RoutedEventArgs e)
        {
            WpfApp1.Windows.Felhasznalok felhasznalok = new WpfApp1.Windows.Felhasznalok();
            felhasznalok.Show();
        }

    }
}
