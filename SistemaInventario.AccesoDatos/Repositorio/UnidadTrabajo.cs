using SistemaInventario.AccesoDatos.Data;
using SistemaInventario.AccesoDatos.Repositorio.IRepositorio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaInventario.AccesoDatos.Repositorio
{
    public class UnidadTrabajo : IUnidadTrabajo
    {
        private readonly ApplicationDbContext _db;
        public IBodegaRepositorio Bodega { get; private set; }
        public ICategoriaRepositorio Categoria { get; private set; }
        public IMarcaRepositorio Marca { get; private set; }
        public IProductoRepositorio Producto { get; private set; }

        public IUsuarioAplicacionRepositorio UsuarioAplicacion { get; private set; }

        public IBodegaProductoRepositorio BodegaProducto { get; private set; }
        public IInventarioRepositorio Inventario { get; private set; }

        public IInventarioDetalleRepositorio InventarioDetalle { get; private set; }

        public IKardexInventarioRepositorio KardexInventario { get; private set; }

        public ICompaniaRepositorio Compania { get; private set; }

        public ICarroCompraRepositorio CarroCompra { get; private set; }

        public IOrdenRepositorio Orden { get; private set; }

        public IOrdenDetalleRepositorio OrdenDetalle { get; private set; }

        public UnidadTrabajo(ApplicationDbContext db)
        {
            _db = db;
            Bodega = new BodegaRepositorio(_db);
            Categoria = new CategoriaRepositorio(_db);
            Marca = new MarcaRepositorio(_db); 
            Producto = new ProductoRepositorio(_db);
            UsuarioAplicacion = new UsuarioAplicacionRepositorio(_db);
            BodegaProducto = new BodegaProductoRepositorio(_db);
            Inventario = new InventarioRepositorio(_db);
            InventarioDetalle = new InventarioDetalleRepositorio(_db);
            KardexInventario = new KardexInventarioRepositorio(_db);
            Compania = new CompaniaRepositorio(_db);
            CarroCompra = new CarroCompraRepositorio(_db);
            Orden = new OrdenRepositorio(_db);
            OrdenDetalle = new OrdenDetalleRepositorio(_db);
        }
      
        public void Dispose()
        {
            _db.Dispose();
        }

        public async Task Guardar()
        {
            await _db.SaveChangesAsync();
        }
    }
}
