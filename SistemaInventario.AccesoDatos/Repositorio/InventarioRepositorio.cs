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
    public class InventarioRepositorio : Repositorio<Inventario>, IInventarioRepositorio
    {

        private readonly ApplicationDbContext _db;

        public InventarioRepositorio(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }

        public void Actualizar(Inventario inventario)
        {
           var inventarioBD = _db.Inventarios.FirstOrDefault(b => b.Id == inventario.Id);
            if(inventarioBD != null)
            {

                inventarioBD.BodegaId = inventario.BodegaId;
                inventarioBD.FechaFinal = inventario.FechaFinal;
                inventarioBD.Estado = inventario.Estado;


                _db.SaveChanges();
            }
        }

        public IEnumerable<SelectListItem> ObtenerTodosDropdownLista(string obj)
        {
           if(obj == "Bodega")
            {
                return _db.Bodegas.Where(b => b.Estado == true).Select(b => new SelectListItem
                {
                    Text = b.Nombre,
                    Value = b.Id.ToString()
                });
            }
            return null;
        }
    }
}
