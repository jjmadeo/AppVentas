$(document).ready(function (){
   
   
    var requestOptions = {
        method: 'GET',
        redirect: 'follow'
      };
      
      fetch("http://185.254.205.224:60227/api/Auditoria", requestOptions)
        .then(response => response.text())
        .then(result => {
           let datasoruce = JSON.parse(result).auditorias;
            
            datasoruce.forEach(element => {

                $("#TablaSeguimiento tbody").append(`
                    <tr>
                        
                        <th>${element.modulo}</th>
                        <th>${element.usuario}</th>
                        <th>${element.nombreRole}</th>
                        <th>${element.detalle}</th>
                        <th>${element.nombreCompleEMPL}</th>
                        <th>${element.fecha}</th>

                    </tr>
                                
                `)

                
            });

            $('#TablaSeguimiento').DataTable({
                "language": {
                    "sProcessing":     "Procesando...",
                    "sLengthMenu":     "Mostrar _MENU_ registros",
                    "sZeroRecords":    "No se encontraron resultados",
                    "sEmptyTable":     "Ningún dato disponible en esta tabla",
                    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
                    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
                    "sInfoPostFix":    "",
                    "sSearch":         "Buscar:",
                    "sUrl":            "",
                    "sInfoThousands":  ",",
                    "sLoadingRecords": "Cargando...",
                    "oPaginate": {
                        "sFirst":    "Primero",
                        "sLast":     "Último",
                        "sNext":     "Siguiente",
                        "sPrevious": "Anterior"
                    },
                    "oAria": {
                        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                    },
                    "buttons": {
                        "copy": "Copiar",
                        "colvis": "Visibilidad"
                    }
                                }
            });

            
            

            
            console.log(datasoruce)})
        .catch(error => console.log('error', error));






});
