using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Mvc.Api.DbModel
{
    [Table("auto_marca")]
    public class AutoMarca
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("codigo")]
        public string Codigo { get; set; }

        [Column("descripcion")]
        public string Descripcion { get; set; }

        /* CAMPOS DE AUDITORÍA */
        [Column("user_create")]
        public int UserCreate { get; set; }

        [Column("user_update")]
        public int? UserUpdate { get; set; }

        [Column("date_created")]
        public DateTime? DateCreated { get; set; }

        [Column("date_update")]
        public DateTime? DateUpdate { get; set; }
    }
}