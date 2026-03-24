using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;
namespace Mvc.Api.DbModel
{
    [Table("auto")]
    public class Auto
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("id_marca")]
        public int IdMarca { get; set; }

        [Column("IdTipo")]
        [JsonPropertyName("IdTipo")] 
        public int IdTipo { get; set; }

        [Column("IdCombustible")]
        [JsonPropertyName("IdCombustible")]
        public int IdCombustible { get; set; }

        [Column("placa")]
        public string Placa { get; set; }

        [Column("modelo")]
        public string Modelo { get; set; }

        [Column("color")]
        public string Color { get; set; }

        [Column("anio")]
        public int Anio { get; set; }

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