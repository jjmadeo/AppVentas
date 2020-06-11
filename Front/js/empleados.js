$(document).ready(function (){
    $("#containerAlta").show();
    $("#containerModi").hide();
    $("#containerBaja").hide();
    $("#containerConsul").hide();
    $("#zonaModificacionEMPL").hide();
   

if(localStorage.getItem("token") !=null && localStorage.getItem("token") != undefined){
  var $TokenUsuario  =  "Bearer " +localStorage.getItem("token").replace(/"/gi,'') ;
  console.log($TokenUsuario)
}
GetSucursales();
GetRoles();
GetEmpleados();
let empleado=[];

    $('#deseaModificar').on('change', function() {
        if (!$(this).is(':checked') ) {
           $( ".modificar" ).prop( "disabled", true );
        } else {
           $( ".modificar" ).prop( "disabled", false );
       }
   });

   $('#PaswordModif').on('change', function() {
    if (!$(this).is(':checked') ) {
       $( ".modificarPass" ).prop( "disabled", true );
    } else {
       $( ".modificarPass" ).prop( "disabled", false );
   }
});
    $("#menuADMempl").click(function(){
        // GetSucursales();
        // GetRoles();
        // GetEmpleados()
    })


    $("#alta").click(function(){
        $(this).last().addClass("active");
        // GetSucursales();
        // GetRoles();
        $("#baja").last().removeClass("active");
        $("#modificacion").last().removeClass("active");
        $("#consultar").last().removeClass("active");

        $("#containerAlta").show();
        $("#containerModi").hide();
        $("#containerBaja").hide();
        $("#containerConsul").hide();
       

    })
    $("#baja").click(function(){
        $(this).last().addClass("active");

        $("#alta").last().removeClass("active");
        $("#modificacion").last().removeClass("active");
        $("#consultar").last().removeClass("active");

        $("#containerAlta").hide();
        $("#containerModi").hide();
        $("#containerBaja").show();
        $("#containerConsul").hide();

    })
    $("#modificacion").click(function(){
        $(this).last().addClass("active");

        $("#baja").last().removeClass("active");
        $("#alta").last().removeClass("active");
        $("#consultar").last().removeClass("active");

        $("#containerAlta").hide();
        $("#containerModi").show();
        $("#containerBaja").hide();
        $("#containerConsul").hide();

    })
    // $("#consultar").click(function(){
    //     $(this).last().addClass("active");

    //     $("#baja").last().removeClass("active");
    //     $("#modificacion").last().removeClass("active");
    //     $("#alta").last().removeClass("active");

    //     $("#containerAlta").hide();
    //     $("#containerModi").hide();
    //     $("#containerBaja").hide();
    //     $("#containerConsul").show();

    // })


    $( "#formAltaEMpl" ).submit(function( event ) {


        var myHeaders = new Headers();
        myHeaders.append("Authorization",  $TokenUsuario);
        myHeaders.append("Content-Type", "application/json");

        var raw = JSON.stringify(
            {"usuario":$('#UsuarioAltaEmpleado').val(),
            "password":$('#passwordAltaEmpleado').val(),
            "role":$('#rolAltaEmpleado').val(),
            "nombre":$('#nombreAltaEmpleado').val(),
            "id_sucursal":$('#sucursalAltaEmpleado').val()
        });

        var requestOptions = {
        method: 'POST',
        headers: myHeaders,
        body: raw,
        redirect: 'follow'
        };

        console.log(raw)

        fetch("http://185.254.205.224:60227/api/Account/Create", requestOptions)
        .then(response =>{
            if(!response.ok) throw Error(response.status)
            
            return response.text();
            
            })
          .then(result => {
            
            console.log("Usuario Creado=>>",JSON.parse(result))
            var banner = $("#notificacionEMPL")
         
            banner.css("display","none")
            banner.empty();
            banner.append(`
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong>Listo!!</strong> El Empleado se creo correctamente.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            `)
            banner.css("display","inline")

                document.querySelector("#formAltaEMpl").reset();

                $("#todosEMPl").empty()
                $("#todosEMPlEliminar").empty()
                GetEmpleados();



        })
        .catch(error =>{
            var banner = $("#notificacionEMPL")
         
              banner.css("display","none")
              banner.empty();

            if(error.toString().includes("404")){
            
              banner.append(`
              <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Hay un problema</strong> El usuario ya existe.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              
              `)
              banner.css("display","inline")


            }

            if(error.toString().includes("400")){
              console.log(error.toString());
            
            banner.append(`
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
              <strong>Hay un problema</strong> El usuario ya existe.
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            
            `)
            banner.css("display","inline")


          }

          });
      


        event.preventDefault();

      });






    function GetSucursales(){
        var requestOptions = {
            method: 'GET',
            redirect: 'follow'
          };
          let $sleectSucursalModifi = $("#sucursalModiEmpleado");
          let  $slectSucursal = $("#sucursalAltaEmpleado");
          fetch("http://185.254.205.224:60227/api/Sucrusal", requestOptions)
            .then(response => response.text())
            .then(result => {
              result = JSON.parse(result);
            console.log(result);
            result.sucursales.forEach(element => {
                
               $slectSucursal.append(`<option value="${element.id}" cuil="${element.cuil}" direccion="${element.direccion}" razonSocial="${element.razonSocial}">${element.razonSocial}</option>`);
               $sleectSucursalModifi.append(`<option value="${element.id}" cuil="${element.cuil}" direccion="${element.direccion}" razonSocial="${element.razonSocial}">${element.razonSocial}</option>`);
            });

            })
            .catch(error => console.log('error', error));

    }


    $("#todosEMPl").change(function(){
        let idEMPL = $("#todosEMPl option:selected").attr('value')


        GetEmpl(idEMPL)


        console.log(empleado)
        
     
      });

      $("#todosEMPlEliminar").change(function(){
        let idEMPL = $("#todosEMPlEliminar option:selected").attr('value')

        $('#formEliminarEMpl div div button').attr("value", idEMPL);

        $('#formEliminarEMpl div div button').attr("disabled", false);
        console.log(idEMPL)
        
     
      });

      $( "#formEliminarEMpl" ).submit((event)=>{
        let deleteUserid=  $('#formEliminarEMpl div div button').attr("value")
        eliminarEmpleado(deleteUserid)

       

      
        $('#formEliminarEMpl div div button').attr("disabled", true);
        document.querySelector("#formEliminarEMpl").reset();

        $('#todosEMPlEliminar').val(0)

        event.preventDefault();
      });




   function GetRoles(){
        var myHeaders = new Headers();
          myHeaders.append("Authorization",  $TokenUsuario);
          console.log($TokenUsuario)

          var requestOptions = {
            method: 'GET',
            headers: myHeaders,
            redirect: 'follow'
          };
          let $rolesModifi = $('#rolModiEmpleado')
          let  $slectrRole = $("#rolAltaEmpleado");
          fetch("http://185.254.205.224:60227/api/Account/Roles", requestOptions)
            .then(response => response.text())
            .then(result => {
              result = JSON.parse(result);
            console.log(result);

            result.roles = result.roles.filter(item=>{
              return item.nombre != 'CLIENTE';
          })

            result.roles.forEach(element => {
                
               $slectrRole.append(`<option value="${element.id}" >${element.nombre}</option>`);
               $rolesModifi .append(`<option value="${element.id}" >${element.nombre}</option>`);

            });

            })
            .catch(error => console.log('error', error));

    }




    function GetEmpleados(){

      var myHeaders = new Headers();
          myHeaders.append("Authorization",  $TokenUsuario);
        var requestOptions = {
          headers:myHeaders,
            method: 'GET',
            redirect: 'follow'
          };
          let  $slectEMPl = $("#todosEMPl");
          let $slectEMPlElimianr = $("#todosEMPlEliminar");
          fetch("http://185.254.205.224:60227/api/Account/Empleados", requestOptions)
            .then(response => response.text())
            .then(result => {
              result = JSON.parse(result);
            console.log(result);
            result.empleados.forEach(element => {
                
               $slectEMPl.append(`<option value="${element.id}">${element.nombre}</option>`);
               $slectEMPlElimianr.append(`<option value="${element.id}">${element.nombre}</option>`);

            });

            })
            .catch(error => console.log('error', error));

    }



    function GetEmpl(id){

        $('#nombreModiEmpleado').val('')
        $('#UsuarioModiEmpleado').val('')
        $('#passwordModiEmpleado').val('')
        $('#rolModiEmpleado').val(0)
        $('#sucursalModiEmpleado').val(0)



        
        console.log(id)

        var myHeaders = new Headers();
          myHeaders.append("Authorization",  $TokenUsuario);
        var requestOptions = {
          headers:myHeaders,
            method: 'GET',
            redirect: 'follow'
          };
            fetch("http://185.254.205.224:60227/api/Account/Empleados/"+id, requestOptions)
            .then(response => response.text())
            .then(result => {
              result = JSON.parse(result);
                let rol 
                console.log(result)

              switch (result.empleados.role) {
                  case 'ADM':
                      rol = 1;
                      break;
                case 'VENTAS':
                         rol=2;
                    break;
               
              }
            
              
              $('#nombreModiEmpleado').val(result.empleados.nombre)
              $('#UsuarioModiEmpleado').val(result.empleados.usuario)
              //$('#passwordModiEmpleado').val(result.empleados.password)
              $('#rolModiEmpleado').val(rol)
              $('#sucursalModiEmpleado').val(result.empleados.id_sucursal)





            
              $("#zonaModificacionEMPL").show();

            })
            .catch(error => console.log('error', error));

    }
    $( "#formModiEMpl" ).submit((event)=>{
        

            let modiusuario=$('#UsuarioModiEmpleado').val()
            let modipassword=$('#passwordModiEmpleado').val()
            let modirole=$('#rolModiEmpleado').val()
            let modiid_sucursal=Number($('#sucursalModiEmpleado').val())
            let modinombre= $('#nombreModiEmpleado').val()
        
            let idempleado= $("#todosEMPl option:selected").attr('value');

        
        
        
        




        var myHeaders = new Headers();
          myHeaders.append("Authorization",  $TokenUsuario);
        myHeaders.append("Content-Type", "application/json");

        var raw = JSON.stringify({"usuario":modiusuario,"password":modipassword,"role":modirole,"nombre":modinombre,"id_sucursal":modiid_sucursal});
        console.log("dato a enviar =>",JSON.parse(raw))
        var requestOptions = {
        method: 'PUT',
        headers: myHeaders,
        body: raw,
        redirect: 'follow'
        };

        fetch("http://185.254.205.224:60227/api/Account/Empleados/"+idempleado, requestOptions)
        .then(response =>{
            if(!response.ok) throw Error(response.status)
            
            return response.text();
            
            })
          .then(result => {

            console.log(JSON.parse(result))
            
            var banner = $("#notificacionEMPL")
         
            banner.css("display","none")
            banner.empty();
            banner.append(`
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong>Listo!!</strong> El Empleado se ha actualizado
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            `)
            banner.css("display","inline")

            document.querySelector("#formModiEMpl").reset();
            $("#todosEMPl").empty()
            $("#todosEMPlEliminar").empty()
            GetEmpleados()
            $("#zonaModificacionEMPL").hide();
            $( ".modificar" ).prop( "disabled", true );



        })
        .catch(error =>{
            var banner = $("#notificacionEMPL")
         
              banner.css("display","none")
              banner.empty();

            if(error.toString().includes("404")){
            
              banner.append(`
              <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Hay un problema</strong> El usuario ya existe.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              
              `)
              banner.css("display","inline")


            }else{

            
              console.log(error.toString());
            
            banner.append(`
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
              <strong>Hay un problema</strong> El usuario ya existe.
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            
            `)
            banner.css("display","inline")

            }
          

          });



        event.preventDefault();

    });
    

    function eliminarEmpleado(id){
      var myHeaders = new Headers();
      myHeaders.append("Authorization",  $TokenUsuario);

        var raw = "";

        var requestOptions = {
        method: 'DELETE',
        headers:myHeaders,
        body: raw,
        redirect: 'follow'
        };

        fetch("http://185.254.205.224:60227/api/Account/Empleados/"+id, requestOptions)
        .then(response =>{
            if(!response.ok) throw Error(response.status)
            
            return response.text();
            
            })
          .then(result => {

            console.log(JSON.parse(result))
            
            var banner = $("#notificacionEMPL")
         
            banner.css("display","none")
            banner.empty();
            banner.append(`
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong>Listo!!</strong> El Empleado Fue eliminado.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            `)
            banner.css("display","inline")

            document.querySelector("#formEliminarEMpl").reset();
            $("#todosEMPl").empty()
            $("#todosEMPlEliminar").empty()
            GetEmpleados();
            $("#zonaModificacionEMPL").hide();
            $( ".modificar" ).prop( "disabled", true );



        })
        .catch(error => console.log('error', error));
    }
        

    $("#UsuarioAltaEmpleado").on('blur', function() {

     var usuarioAverificar= $("#UsuarioAltaEmpleado").val();

      verificarUsuario(usuarioAverificar);

  });
    
   
  // document.querySelector("#UsuarioModiEmpleado").addEventListener("blur", function(){


  //   alert("asd")


  // });


    function verificarUsuario(usuario){




      var requestOptions = {
        method: 'GET',
        redirect: 'follow'
      };
      
      fetch("http://185.254.205.224:60227/api/Account/verifyUser/"+usuario, requestOptions)
        .then(response => response.text())
        .then(result => {

          result = JSON.parse(result);
          console.log(result.userExist)     
          
          ///// FUNCIONA///


            if(result.userExist === true){
    
              $("#UsuarioAltaEmpleado").last().removeClass("bg-danger");
              $("#UsuarioAltaEmpleado").last().removeClass("bg-success");
              $("#UsuarioAltaEmpleado" ).last().addClass( "bg-danger" );
    
              $('#formAltaEMpl div div button').attr("disabled", true);

    
    
    
            }else{
              $("#UsuarioAltaEmpleado").last().removeClass("bg-danger");
              $("#UsuarioAltaEmpleado").last().removeClass("bg-success");
              $("#UsuarioAltaEmpleado" ).last().addClass( "bg-success" );
              $('#formAltaEMpl div div button').attr("disabled", false);

    
            }


        })
        .catch(error => console.log('error', error));



          // if(){
  
          //   $("#UsuarioAltaEmpleado").last().removeClass("bg-danger");
          //   $("#UsuarioAltaEmpleado").last().removeClass("bg-success");
          //   $("#UsuarioAltaEmpleado" ).last().addClass( "bg-danger" );
  
  
  
  
  
          // }else{
          //   $("#UsuarioAltaEmpleado").last().removeClass("bg-danger");
          //   $("#UsuarioAltaEmpleado").last().removeClass("bg-success");
          //   $("#UsuarioAltaEmpleado" ).last().addClass( "bg-success" );
  
          // }
        
       


    }
    


})



