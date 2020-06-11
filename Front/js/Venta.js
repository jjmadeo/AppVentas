$(document).ready(function (){
  var $TokenUsuario;
  var VentaRequest =
    {
    "empleado": {
      "usuario": "",
      "password": "",
      "role": "",
      "nombre": "",
      "email": "",
      "direccion": "",
      "id_sucursal": 0,
      "id": 0
    },
    "cliente": {
      "usuario": "",
      "password": "",
      "role": "",
      "nombre": "",
      "email": "",
      "direccion": "",
      "id_sucursal": 0,
      "id": 0
    },
    "tarjetaClie": {
      "nTarjeta": 0,
      "fechaVencimiento": 0,
      "nombreCompleto": "",
      "pin": 0,
      "id_usuario": 0
    },
    "medioDePago": "",
    "nombreCompletoClie": "",
    "cuilClie": "",
    "total": 0,
    "direccionClie": "",
    "detalleVentas": [
     
    ]
  };

  var zonaAutenticacion = $("#ZonaAutenticacion")


    $("#btnComprarBotton").click(function (){
      zonaAutenticacion.css("display","inline")

      
      cargarSucursales("sucursalventa")

    


    if(localStorage.getItem("token") !=null && localStorage.getItem("token") != undefined){
         $TokenUsuario  =  "Bearer " +localStorage.getItem("token").replace(/"/gi,'') ;
        console.log($TokenUsuario)

        var _Empleado ={id:JSON.parse(atob(localStorage.getItem("token")?.split('.')[1])).Id, id_sucursal:JSON.parse(atob(localStorage.getItem("token")?.split('.')[1])).id_sucursal}
        var _Cliente ={id:JSON.parse(atob(localStorage.getItem("token")?.split('.')[1])).Id}
      }

      if(localStorage.getItem("Compra") != null){
        var _tipocompra = JSON.parse(localStorage.getItem("Compra")).tipoCompra;

      }
      $("#paso1asist").hide();
      $("#paso1").hide();


        console.log(_tipocompra)
      if(_tipocompra === 'Asistida'){
          $("#paso1asist").show();

      }else if(_tipocompra === 'Autoasistida'){

        $("#paso1").show();
      }
    
    console.log(_tipocompra)
    console.log(_Empleado)
    console.log(_Cliente)

    if(localStorage.getItem("token")!= null){
      VentaRequest.cliente.id = JSON.parse(atob(localStorage.getItem("token")?.split('.')[1])).Id
      VentaRequest.cliente.nombre = JSON.parse(atob(localStorage.getItem("token")?.split('.')[1])).Nombre
      VentaRequest.cliente.role = JSON.parse(atob(localStorage.getItem("token")?.split('.')[1])).Role
      VentaRequest.cliente.direccion = JSON.parse(atob(localStorage.getItem("token")?.split('.')[1])).Direccion
      VentaRequest.cliente.email = null
      VentaRequest.cliente.usuario = JSON.parse(atob(localStorage.getItem("token")?.split('.')[1])).Usuario
    }
    

    if(localStorage.getItem("Compra") !=null && JSON.parse(localStorage.getItem("Compra")).tipoCompra === 'Autoasistida' ){
      zonaAutenticacion.css("display","none")
      $("#nombreClie").val(JSON.parse(atob(localStorage.getItem("token")?.split('.')[1])).Nombre);
      $("#domicilioClie").val(JSON.parse(atob(localStorage.getItem("token")?.split('.')[1])).Direccion);
      obtenerTarjetas(VentaRequest.cliente.id);
      $("#misTarjetas").css("display","block");
      $("#medioDepago option[value='CREDITO']").attr("selected","selected");
      $("#medioDepago option[value='EFECTIVO']").css("display","none");
      $("#tarjeta").css("display","block");






    }else{
      $("#datosPersonales").css("display","none")
      $("#realizarCompra").css("display","none")


    }

    // if(localStorage.getItem("token") ===null && (localStorage.getItem("Compra") !=null && JSON.parse(localStorage.getItem("Compra")).tipoCompra === 'Autoasistida')  ){
    // }
    // else{

    //}




        

         console.log(VentaRequest)





    


})

$("#terjetasUsuario").change(function(){
  $("#nTarjeta").val($("#terjetasUsuario option:selected").attr('value'))
  $("#fechaVencimiento").val($("#terjetasUsuario option:selected").attr('fecha'))
  $("#nombreCompleto").val($("#terjetasUsuario option:selected").attr('nombre'))
  $("#pin").val($("#terjetasUsuario option:selected").attr('pin'))

 
 })



$("#medioDepago").change(function(){
 if($('#medioDepago').val()!=='EFECTIVO'){
   $("#tarjeta").css("display","block")
 }else{
  $("#tarjeta").css("display","none")

 }

})

$("#tipoEnvio").change(function(){
  if($('#tipoEnvio  option:selected').attr('value')==='SUCURSAL'){
    $("#SucursalVentaDiv").css("display","block")
  }else{
   $("#SucursalVentaDiv").css("display","none")
 
  }
 
 })



function obtenerTarjetas(id){

  var requestOptions = {
    method: 'GET',
    redirect: 'follow'
  };
  let $tarjetasVENTA = $("#terjetasUsuario")

  fetch("http://185.254.205.224:60227/api/Tarjetas/user/"+id, requestOptions)
    .then(response => response.text())
    .then(result => {
      result = JSON.parse(result);
    console.log(result);
    result.tarjetas.forEach(element => {
        
       $tarjetasVENTA.append(`<option value="${element.nTarjeta}" fecha="${element.fechaVencimiento}" pin="${element.pin}" nombre="${element.nombreCompleto}" >${element.nTarjeta}</option>`);

    });

    })
    .catch(error => console.log('error', error));

}

$("#validarEmpl").click(function (){
  console.log("asd")
  var myHeaders = new Headers();
   myHeaders.append("Content-Type", "application/json");
   var usuario = document.getElementById("validarEMPlusuario").value
   var pass = document.getElementById("validarEMPlpass").value

   if(usuario==='' || pass===''){
     alert("completa todos los campos");
   }else{
     console.log(usuario+" "+pass);

     var raw = JSON.stringify({"Usuario":usuario,"password":pass});

     var requestOptions = {
     method: 'POST',
     headers: myHeaders,
     body: raw,
     redirect: 'follow'
     };

     fetch("http://185.254.205.224:60227/api/account/login", requestOptions)
     .then(response =>{
       if(!response.ok) throw Error(response.status)
       
       return response.text();
       
       })
     .then(result => {
       console.log("Empleado PARA LA VENTA.",JSON.parse(result))
       let res =  JSON.parse(result);

       
       VentaRequest.empleado.id = JSON.parse(atob(res.token.split('.')[1])).Id
       VentaRequest.empleado.nombre = JSON.parse(atob(res.token.split('.')[1])).Nombre
       VentaRequest.empleado.role = JSON.parse(atob(res.token.split('.')[1])).Role
       VentaRequest.empleado.id_sucursal = JSON.parse(atob(res.token.split('.')[1])).id_sucursal

      console.log(JSON.parse(atob(res.token.split('.')[1])))
      console.log(VentaRequest)

      zonaAutenticacion.css("display","none")
      $("#datosPersonales").css("display","block")
      $("#realizarCompra").css("display","block")

      console.log(res)
      $TokenUsuario = "Bearer " +res.token.replace(/"/gi,'') ;
      console.log($TokenUsuario)


      var banner = $("#notificacionVenta")
         
              banner.css("display","none")
              banner.empty();

              banner.append(`
              <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong>Bienvenido</strong> 
                
              </div>
              
              `)
              banner.css("display","inline")
          
              setTimeout(()=>{
                banner.css("display","none")
                banner.empty();
          
              },10000)




     })
     .catch(error =>{



      var banner = $("#notificacionVenta")
         
    banner.css("display","none")
    banner.empty();

  
    



      var banner = $("#notificacionVenta")
         
      banner.css("display","none")
      banner.empty();

    if(error.toString().includes("404")){
    
      banner.append(`
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
      <strong>Verifique las Credenciales.</strong> 
      
    </div>
    
    `)
    banner.css("display","inline")

    setTimeout(()=>{
      banner.css("display","none")
      banner.empty();

    },10000)
    }


     });
   }
   event.preventDefault()

})


$( "#ventaForm" ).submit(function( event ) {


  if($('#medioDepago').val()!=='EFECTIVO'){
    VentaRequest.tarjetaClie.fechaVencimiento =  parseInt( $("#fechaVencimiento").val(),10)

    VentaRequest.tarjetaClie.nTarjeta = parseInt( $("#nTarjeta").val(),10)
  
    VentaRequest.tarjetaClie.nombreCompleto =  $("#nombreCompleto").val()
  
    VentaRequest.tarjetaClie.pin =    parseInt($("#pin").val(),10)
  }

  
if(VentaRequest.cliente.role === "CLIENTE"){
  VentaRequest.cliente.role = "3"
}else if(VentaRequest.empleado.role === "VENTAS"){
  VentaRequest.empleado.role = "2"

}else{

}



  if( $("#tarjeta").css("display") !== 'none' && ($("#nTarjeta").val() ===''||  $("#fechaVencimiento").val()===''||   $("#nombreCompleto").val() ===''|| $("#pin").val() ==='')){
    
    var banner = $("#notificacionVenta")
         
    banner.css("display","none")
    banner.empty();

  
    banner.append(`
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
      <strong>Verifique los campos</strong> 
      
    </div>
    
    `)
    banner.css("display","inline")

    setTimeout(()=>{
      banner.css("display","none")
      banner.empty();

    },10000)

  }else{


       VentaRequest.nombreCompletoClie =$('#nombreClie').val()
       VentaRequest.cuilClie = $('#cuilClie').val()
       VentaRequest.direccionClie =$('#domicilioClie').val()
       VentaRequest.medioDePago  = $('#medioDepago  option:selected').attr('value')

      console.log("venta=>",VentaRequest)


    
      VentaRequest.total = $('#totalVenta').html()
      if(VentaRequest.total =='' ){
        var banner = $("#notificacionVenta")
         
        banner.css("display","none")
        banner.empty();
    
      
        banner.append(`
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
          <strong>Ingrese Productos en el carrito</strong> 
          
        </div>
        
        `)
        banner.css("display","inline")
    
        setTimeout(()=>{
          banner.css("display","none")
          banner.empty();
    
        },10000)
    


      }else{


        var arryCarrito = JSON.parse(localStorage.getItem("itemsSeleccionados"))
      if(arryCarrito !== null ){

        arryCarrito.forEach(element => {
          console.log(element)

          let detalle = {
            cantidad : element.catidad,
            valor : element.precio,
            producto:{id:element.id} 
          }
          VentaRequest.detalleVentas.push(detalle)
          
        });

      }

      realizarVenta(VentaRequest);

      }

      


  }



  


   event.preventDefault()


})




function cargarSucursales(idContenedor){
 
  var requestOptions = {
    method: 'GET',
    redirect: 'follow'
  };
  let $SucursalesVENTA = $("#"+idContenedor)
  fetch("http://185.254.205.224:60227/api/Sucrusal", requestOptions)
    .then(response => response.text())
    .then(result => {
      result = JSON.parse(result);
    console.log(result);
    result.sucursales.forEach(element => {
        
       $SucursalesVENTA.append(`<option value="${element.id}" cuil="${element.cuil}" direccion="${element.direccion}" razonSocial="${element.razonSocial}">${element.razonSocial}</option>`);

    });

    })
    .catch(error => console.log('error', error));
}


function realizarVenta(objetoRequest){
  var myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify(objetoRequest)
myHeaders.append("Authorization",  $TokenUsuario);

//var raw = JSON.stringify({"id":0,"empleado":{"usuario":"","role":"","nombre":"","id_sucursal":0,"id":0},"cliente":{"usuario":"juan","role":"3","nombre":"jjmadeo@gmail.com","email":"Juan Jose","direccion":"Alberdi 1637  Luis Guillon","id":49},"tarjetaClie":{"nTarjeta":"1623187916231888","fechaVencimiento":523,"nombreCompleto":"MADEO JUAN JOSE","pin":835,"id_usuario":49},"medioDePago":"Efectivo","nombreCompletoClie":"MADEO JUAN JOSE","cuilClie":"20385897001","total":3596236,"direccionClie":"Alberdi 1637  Luis Guillon","detalleVentas":[{"producto":{"id":335,"detalle":"mochila","precio":2199,"stock":20,"fecha":20200529,"visible":true,"nombre":"MOCHILA LOTTO DELTA PLUS","categoria":{"nombre":"Aceesorios","id":1},"imgUrl":"https://dexter.vteximg.com.br/arquivos/ids/557763-540-540/601-0565-002_zoom1.jpg?v=637261959891500000"},"cantidad":5,"valor":32223},{"producto":{"id":336,"detalle":"botines topper","precio":2849,"stock":300,"fecha":20200529,"visible":true,"nombre":"BOTINES TOPPER STINGRAY MACH 1","categoria":{"nombre":"botines   ","id":7},"imgUrl":"https://dexter.vteximg.com.br/arquivos/ids/558528-540-540/TO51446_1.jpg?v=637262824657430000"},"cantidad":35,"valor":988},{"producto":{"id":337,"detalle":"botines nike","precio":11299,"stock":120,"fecha":20200529,"visible":false,"nombre":"BOTINES NIKE PHANTOM VENOM PRO FG","categoria":{"nombre":"botines   ","id":7},"imgUrl":"https://dexter.vteximg.com.br/arquivos/ids/557632-540-540/IMG_1115.jpg?v=637253995206470000"},"cantidad":65,"valor":356}]});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("http://185.254.205.224:60227/api/Ventas", requestOptions)
.then(response => response)
.then(result => {

  var banner = $("#notificacionVenta");
         
  banner.css("display","none");
  banner.empty();

  if(result.ok){
    document.querySelector("#ventaForm").reset();

    result.text().then(value=>{
      banner.append(`
        <div class="alert alert-success alert-dismissible fade show" role="alert">
          <strong>${JSON.parse(value).msj}</strong> 
          
        </div>
        
        `)
  banner.css("display","inline")

  setTimeout(()=>{
    banner.css("display","none")
    banner.empty();

  },10000)


    })
    

  }else{

    result.text().then(value=>{
      console.log(JSON.parse(value))

          banner.append(`
      <div class="alert alert-warning alert-dismissible fade show" role="alert">
        <strong>${JSON.parse(value).msj}</strong> 
        
      </div>
      
      `)
  banner.css("display","inline")

  setTimeout(()=>{
    banner.css("display","none")
    banner.empty();

  },10000)



    })

  }




  



})

}


})
