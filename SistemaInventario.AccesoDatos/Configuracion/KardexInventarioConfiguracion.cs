using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SistemaInventario.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaInventario.AccesoDatos.Configuracion
{
    public class KardexInventarioConfiguracion : IEntityTypeConfiguration<KardexInventario>
    {
        public void Configure(EntityTypeBuilder<KardexInventario> builder)
        {
            builder.Property(x => x.Id).IsRequired();
            builder.Property(x => x.BodegaProductoId).IsRequired();
            builder.Property(x => x.Tipo).IsRequired();
            builder.Property(x => x.Detalle).IsRequired();
            builder.Property(x => x.StockAnterior).IsRequired();
            builder.Property(x => x.Cantidad).IsRequired();
            builder.Property(x => x.Costo).IsRequired();
            builder.Property(x => x.Stock).IsRequired();
            builder.Property(x => x.Total).IsRequired();
            builder.Property(x => x.UsuarioAplicacionId).IsRequired();
            builder.Property(x => x.FechaRegistro).IsRequired();


            /* Relaciones*/

            builder.HasOne(x => x.BodegaProducto).WithMany()
                .HasForeignKey(x => x.BodegaProductoId)
                .OnDelete(DeleteBehavior.NoAction);

            builder.HasOne(x => x.UsuarioAplicacion).WithMany()
               .HasForeignKey(x => x.UsuarioAplicacionId)
               .OnDelete(DeleteBehavior.NoAction);
        }
    }
}
