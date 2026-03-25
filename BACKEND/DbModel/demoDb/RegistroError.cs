using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Mvc.Api.DbModel
{
    [Table("registroerror")]
    public class RegistroError
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("mensaje")]
        public string Mensaje { get; set; }

        [Column("detalle")]
        public string Detalle { get; set; }

        [Column("ruta")]
        public string Ruta { get; set; }

        [Column("fecha")]
        public DateTime Fecha { get; set; }

        [Column("payload")]
        public string? Payload { get; set; } 
    }
}