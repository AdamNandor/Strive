using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WpfApp1.Models;

namespace WpfApp1.Services
{
    internal class FelhasznaloService
    {
        private MySqlConnection _connection;

        public FelhasznaloService(MySqlConnection connection)
        {
            _connection = connection;
        }

        public List<Felhasznalo> GetAllUser()
        {
            List<Felhasznalo> result = new List<Felhasznalo>();
            try
            {
                _connection.Open();
                string sql = "SELECT * FROM user;";
                using (MySqlCommand command = new MySqlCommand(sql, _connection))
                {
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Felhasznalo ujFelh = new Felhasznalo()
                        {
                            Id = reader.GetInt32("Id"),
                            Name = reader.GetString("Name"),
                            Email = reader.GetString("Email"),
                            Password_hash = reader.GetString("Password_hash"),
                            Role = reader.GetString("Role"),
                            CreatedAt = reader.GetDateTime("created_at")
                        };
                        result.Add(ujFelh);
                    }
                }
                return result;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                return result;
            }
        }
    }
}
