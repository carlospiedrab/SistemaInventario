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
    public class CompaniaConfiguracion : IEntityTypeConfiguration<Compania>
    {
        public void Configure(EntityTypeBuilder<Compania> builder)
        {
            builder.Property(x => x.Id).IsRequired();
            builder.Property(x =>x.Nombre).IsRequired().HasMaxLength(60);
            builder.Property(x =>x.Descripcion).IsRequired().HasMaxLength(100);
            builder.Property(x => x.Pais).IsRequired();
            builder.Property(x => x.Ciudad).IsRequired();
            builder.Property(x => x.Direccion).IsRequired();
            builder.Property(x => x.Telefono).IsRequired();
            builder.Property(x => x.BodegaVentaId).IsRequired();
            builder.Property(x => x.CreadoPorId).IsRequired(false);
            builder.Property(x => x.ActualizadoPorId).IsRequired(false);

            /* Relaciones*/

            builder.HasOne(x => x.Bodega).WithMany()
                   .HasForeignKey(x => x.BodegaVentaId)
                   .OnDelete(DeleteBehavior.NoAction);

            builder.HasOne(x => x.CreadoPor).WithMany()
                   .HasForeignKey(x => x.CreadoPorId)
                   .OnDelete(DeleteBehavior.NoAction);

            builder.HasOne(x => x.ActualizadoPor).WithMany()
                  .HasForeignKey(x => x.ActualizadoPorId)
                  .OnDelete(DeleteBehavior.NoAction);
        }
    }
}
