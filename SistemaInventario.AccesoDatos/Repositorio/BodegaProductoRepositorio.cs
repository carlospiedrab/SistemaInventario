using Microsoft.AspNetCore.Mvc.Rendering;
using SistemaInventario.AccesoDatos.Data;
using SistemaInventario.AccesoDatos.Repositorio.IRepositorio;
using SistemaInventario.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaInventario.AccesoDatos.Repositorio
{
    public class BodegaProductoRepositorio : Repositorio<BodegaProducto>, IBodegaProductoRepositorio
    {

        private readonly ApplicationDbContext _db;

        public BodegaProductoRepositorio(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }

        public void Actualizar(BodegaProducto bodegaProducto)
        {
           var bodegaProductoBD = _db.BodegasProductos.FirstOrDefault(b => b.Id == bodegaProducto.Id);
            if(bodegaProductoBD != null)
            {

                bodegaProductoBD.Cantidad = bodegaProducto.Cantidad;


                _db.SaveChanges();
            }
        }

      
    }
}
