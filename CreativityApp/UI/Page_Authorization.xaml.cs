using CreativityApp.Class;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
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
using static System.Net.Mime.MediaTypeNames;
using Brush = System.Drawing.Brush;
using Brushes = System.Drawing.Brushes;
using Color = System.Drawing.Color;
using Image = System.Windows.Controls.Image;
using Point = System.Drawing.Point;

namespace CreativityApp.UI
{
    /// <summary>
    /// Логика взаимодействия для Page_Authorization.xaml
    /// </summary>
    public partial class Page_Authorization : Page
    {
        public Page_Authorization()
        {
            InitializeComponent();
        }

        private void enter_Click(object sender, RoutedEventArgs e)
        {
            Authorization.AccsessCheck(login.Text, password.Text, passwordBox.Password);   
        }

        private void cbShowPassword_Click(object sender, RoutedEventArgs e)
        {
            if (cbShowPassword.IsChecked.Value)
            {
                password.Text = passwordBox.Password;
                passwordBox.Visibility = Visibility.Hidden;
                password.Visibility = Visibility.Visible;
            }
            else
            {
                passwordBox.Password = password.Text;
                passwordBox.Visibility = Visibility.Visible;
                password.Visibility = Visibility.Hidden;
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
                
        }
        private void buttonShowProduct_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new Page_Catalog());
        }
    }
}
