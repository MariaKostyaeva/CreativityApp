using CreativityApp.Database;
using CreativityApp.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace CreativityApp.Class
{
    public class Authorization
    {
        public static bool AccsessCheck(string login, string password, string hide_password)
        {
            var data = DB_Creativity.GetContext();
            var user = from users in data.User
                       where users.UserLogin == login && (users.UserPassword == password || users.UserPassword == hide_password)
                       select users;
            if (user == null || user.FirstOrDefault() == null)
            {
                MessageBox.Show("Вы ввели неверный логин или пароль! Пожалуйста повторите ввод.");
                return false;
            }
            else
            {
                //user.FirstOrDefault().LastEnter = new DateTime();
                Manager.MainFrame.Navigate(new Page_Sidebar(login));
                return true;
            }
        }
    }
}
