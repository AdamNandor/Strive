using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfApp1.Models
{
    internal class Felhasznalo
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password_hash { get; set; }
        public string Role { get; set; } = "member";
        public DateTime CreatedAt { get; set; }

        public override string ToString()
        {
            return $"{Id} | {Name} | {Email} | {Role} | {CreatedAt}";
        }
    }
}
