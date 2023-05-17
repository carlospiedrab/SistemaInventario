using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using SistemaInventario.Modelos;
using System.Reflection;

namespace SistemaInventario.AccesoDatos.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Bodega> Bodegas { get; set; }
        public DbSet<Categoria> Categorias { get; set; }
        public DbSet<Marca> Marcas { get; set; }

        public DbSet<Producto> Productos { get; set; }

        public DbSet<UsuarioAplicacion> UsuarioAplicacion { get; set; }

        public DbSet<BodegaProducto> BodegasProductos { get; set; }

        public DbSet<Inventario> Inventarios { get; set; }

        public DbSet<InventarioDetalle> InventarioDetalles { get; set; }

        public DbSet<KardexInventario> KardexInventarios { get; set; }

        public DbSet<Compania> Companias { get; set; }

        public DbSet<CarroCompra> CarroCompras { get; set; }

        public DbSet<Orden> Ordenes { get; set; }

        public DbSet<OrdenDetalle> OrdenDetalles { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            builder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
        }

    }
}