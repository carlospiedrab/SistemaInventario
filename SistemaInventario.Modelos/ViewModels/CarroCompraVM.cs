using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaInventario.Modelos.ViewModels
{
    public class CarroCompraVM
    {
        public Compania Compania { get; set; }
        public Producto Producto { get; set; }

        public int Stock { get; set; }

        public CarroCompra CarroCompra { get; set; }

        public IEnumerable<CarroCompra> CarroCompraLista { get; set; }
        public Orden Orden { get; set; }
    }
}
