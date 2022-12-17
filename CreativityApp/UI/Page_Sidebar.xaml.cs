using CreativityApp.Class;
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

namespace CreativityApp.UI
{
    /// <summary>
    /// Логика взаимодействия для Page_Sidebar.xaml
    /// </summary>
    public partial class Page_Sidebar : Page
    {
        public Page_Sidebar(string role)
        {
            InitializeComponent();
        }

        private void buttonChangeUser_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new Page_Authorization());
        }

        private void buttonExit_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show($"Вы точно хотите выйти из подсистемы?", "Внимание",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                Application.Current.Shutdown();
        }

        private void buttonShowProduct_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new Page_Catalog());
        }
    }
}
