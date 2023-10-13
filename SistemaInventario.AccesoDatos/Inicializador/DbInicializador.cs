using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using SistemaInventario.AccesoDatos.Data;
using SistemaInventario.Modelos;
using SistemaInventario.Utilidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaInventario.AccesoDatos.Inicializador
{
    public class DbInicializador : IDbInicializador
    {
        private readonly ApplicationDbContext _db;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        public DbInicializador(ApplicationDbContext db, UserManager<IdentityUser> userManager,  
                                              RoleManager<IdentityRole> roleManager)
        {
            _db = db;
            _userManager = userManager;
            _roleManager = roleManager;
        }

        public void Inicializar()
        {
            try
            {
                if(_db.Database.GetPendingMigrations().Count() >0)
                {
                    _db.Database.Migrate();  // Ejecuta las migraciones pendientes
                }
            }
            catch (Exception)
            {

                throw;
            }

            // Datos Iniciales
            if (_db.Roles.Any(r => r.Name == DS.Role_Admin)) return;

            _roleManager.CreateAsync(new IdentityRole(DS.Role_Admin)).GetAwaiter().GetResult();
            _roleManager.CreateAsync(new IdentityRole(DS.Role_Cliente)).GetAwaiter().GetResult();
            _roleManager.CreateAsync(new IdentityRole(DS.Role_Inventario)).GetAwaiter().GetResult();

            // Crea un usuario administrador
            _userManager.CreateAsync(new UsuarioAplicacion
            {
                UserName = "support@baezstone.com",
                Email = "support@baezstone.com",
                EmailConfirmed = true,
                Nombres= "Carlos",
                Apellidos = "Piedra"
            }, "Admin123*").GetAwaiter().GetResult();

            // Asigna el Rol al usuario
            UsuarioAplicacion usuario = _db.UsuarioAplicacion.Where(u => u.UserName == "support@baezstone.com").FirstOrDefault();
            _userManager.AddToRoleAsync(usuario, DS.Role_Admin).GetAwaiter().GetResult();
        }
    }
}
