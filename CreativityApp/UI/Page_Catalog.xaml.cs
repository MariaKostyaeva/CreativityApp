using CreativityApp.Database;
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
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace CreativityApp.UI
{
    /// <summary>
    /// Логика взаимодействия для Page_Catalog.xaml
    /// </summary>
    public partial class Page_Catalog : Page
    {
        private List<Product> products;
        public Page_Catalog()
        {
            InitializeComponent();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            var data = DB_Creativity.GetContext();
            productList.ItemsSource = data.Product.ToList();

            List<string> manufacturers = new List<string>();
            manufacturers.Add("Все производители");
            data.Manufacturer.ToList().ForEach(item => manufacturers.Add(item.Manufacturer1));
            comboBoxManufacturer.ItemsSource = manufacturers;
            comboBoxManufacturer.SelectedItem = "Все производители";
        }

        private void search_box_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateProductListAll();
        }

        private void UpdateProductListAll()
        {
            var data = DB_Creativity.GetContext().Product.ToList();
            if (comboBoxManufacturer != null && search_box != null)
            {
                products = data;
                if (radioButtonAsc.IsChecked == true)
                {
                    products = data.OrderBy(cost => cost.ProductCost).ToList();
                }
                else if (radioButtonDesc.IsChecked == true)
                {
                    products = data.OrderByDescending(cost => cost.ProductCost).ToList();
                }
                if(comboBoxManufacturer.SelectedIndex > 0)
                {
                    products = data.Where(currentProduct => currentProduct.Manufacturer.IdManufacturer.ToString().Contains(comboBoxManufacturer.SelectedIndex.ToString())).ToList();
                }
                if (search_box.Text.Length != 0)
                {
                    products = products.Where(p => p.ProductName.ToLower().Contains(search_box.Text.ToLower())
                    || p.Manufacturer.Manufacturer1.ToLower().Contains(search_box.Text.ToLower())
                    || p.ProductDescription.ToLower().Contains(search_box.Text.ToLower())).ToList();
                }
                productList.ItemsSource = products;
                if (productList.Items.Count == 0)
                {
                    productList.Visibility = Visibility.Collapsed;
                    textBlock_NotFound.Visibility = Visibility.Visible;
                    textBlockAmountOfDataOutput.Text = productList.Items.Count.ToString() + '/' + DB_Creativity.GetContext().Product.Count().ToString();
                }
                else
                {
                    productList.Visibility = Visibility.Visible;
                    textBlock_NotFound.Visibility = Visibility.Collapsed;
                    textBlockAmountOfDataOutput.Text = productList.Items.Count.ToString() + '/' + DB_Creativity.GetContext().Product.Count().ToString();
                }
            }
        }

        private void radioButtonAsc_Click(object sender, RoutedEventArgs e)
        {
            UpdateProductListAll();
        }

        private void radioButtonDesc_Click(object sender, RoutedEventArgs e)
        {
            UpdateProductListAll();
        }

        private void comboBoxManufacturer_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateProductListAll();
        }
    }
}
