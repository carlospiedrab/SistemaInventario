using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaInventario.Utilidades
{
    public static class DS
    {
        public const string Exitosa = "Exitosa";
        public const string Error = "Error";

        public const string ImagenRuta = @"\imagenes\producto\";
        public const string ssCarroCompras = "Sesion carro Compras";

        public const string Role_Admin = "Admin";
        public const string Role_Cliente = "Cliente";
        public const string Role_Inventario = "Inventario";

        // Estados de la Orden
        public const string EstadoPendiente = "Pendiente";
        public const string EstadoAprobado = "Aprobado";
        public const string EstadoEnProceso = "Procesando";
        public const string EstadoEnviado = "Enviado";
        public const string EstadoCancelado = "Cancelado";
        public const string EstadoDevuelto = "Devuelto";
        // Estado del Pago de la Orden
        public const string PagoEstadoPendiente = "Pendiente";
        public const string PagoEstadoAprobado = "Aprobado";
        public const string PagoEstadoRetrasado = "Retrasado";
        public const string PagoEstadoRechazado = "Rechazado";

    }
}
