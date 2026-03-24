using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Mvc.Api.DbModel
{
    [Table("usuario")]
    public class Usuario
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("username")]
        public string Username { get; set; }

        [Column("password")]
        public string Password { get; set; }

        [Column("NombreCompleto")]
        public string NombreCompleto { get; set; }

        [Column("rol")]
        public string Rol { get; set; }
    }
}