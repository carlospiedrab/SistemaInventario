using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaInventario.Modelos
{
    public class OrdenDetalle
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public int OrdenId { get; set; }

        [ForeignKey("OrdenId")]
        public Orden Orden { get; set; }

        [Required]
        public int ProductoId { get; set; }

        [ForeignKey("ProductoId")]
        public Producto Producto { get; set; }

        public int Cantidad { get; set; }

        public double Precio { get; set; }
    }
}
