using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaInventario.Modelos
{
    public class CarroCompra
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string UsuarioAplicacionId { get; set; }

        [ForeignKey("UsuarioAplicacionId")]
        public UsuarioAplicacion UsuarioAplicacion { get; set; }

        [Required]
        public int ProductoId { get; set; }

        [ForeignKey("ProductoId")]
        public Producto Producto { get; set; }

        [Required]
        public int Cantidad { get; set; }

        [NotMapped]
        public double Precio { get; set; }
    }
}
