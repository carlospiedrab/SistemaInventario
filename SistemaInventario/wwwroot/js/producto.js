let datatable;

$(document).ready(function () {
    loadDataTable();
});

function loadDataTable() {
    datatable = $('#tblDatos').DataTable({
        "language": {
            "lengthMenu": "Mostrar _MENU_ Registros Por Pagina",
            "zeroRecords": "Ningun Registro",
            "info": "Mostrar page _PAGE_ de _PAGES_",
            "infoEmpty": "no hay registros",
            "infoFiltered": "(filtered from _MAX_ total registros)",
            "search": "Buscar",
            "paginate": {
                "first": "Primero",
                "last": "Último",
                "next": "Siguiente",
                "previous": "Anterior"
            }
        },
        "ajax": {
            "url": "/Admin/Producto/ObtenerTodos"
        },
        "columns": [
            { "data": "numeroSerie" },
            { "data": "descripcion" },
            { "data": "categoria.nombre" },
            { "data": "marca.nombre" },
            {
                "data": "precio", "className": "text-end",
                "render": function (data) {
                    var d = data.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
                    return d;
                }
            },
            {
                "data": "estado",
                "render": function (data) {
                    if (data == true) {
                        return "Activo";
                    }
                    else {
                        return "Inactivo";
                    }
                }
            },
            {
                "data": "id",
                "render": function (data) {
                    return `
                        <div class="text-center">
                           <a href="/Admin/Producto/Upsert/${data}" class="btn btn-success text-white" style="cursor:pointer">
                              <i class="bi bi-pencil-square"></i>  
                           </a>
                           <a onclick=Delete("/Admin/Producto/Delete/${data}") class="btn btn-danger text-white" style="cursor:pointer">
                                <i class="bi bi-trash3-fill"></i>
                           </a> 
                        </div>
                    `;
                }, "width": "20%"
            }
         ]

    });
}

function Delete(url) {

    swal({
        title: "Esta seguro de Eliminar el Producto?",
        text: "Este registro no se podra recuperar",
        icon: "warning",
        buttons: true,
        dangerMode: true
    }).then((borrar) => {
        if (borrar) {
            $.ajax({
                type: "POST",
                url: url,
                success: function (data) {
                    if (data.success) {
                        toastr.success(data.message);
                        datatable.ajax.reload();
                    }
                    else {
                        toastr.error(data.message);
                    }
                }
            });
        }
    });
}