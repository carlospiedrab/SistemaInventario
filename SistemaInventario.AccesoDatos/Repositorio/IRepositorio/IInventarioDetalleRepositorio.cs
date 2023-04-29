using Microsoft.AspNetCore.Mvc.Rendering;
using SistemaInventario.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaInventario.AccesoDatos.Repositorio.IRepositorio
{
    public interface IInventarioDetalleRepositorio : IRepositorio<InventarioDetalle>
    {
        void Actualizar(InventarioDetalle inventarioDetalle);

  
    }
}
