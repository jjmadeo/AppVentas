'use strict'
 $(document).ready(function() {

   if(localStorage.getItem("token")!=null){
           var USER_ROLE = JSON.parse(atob(localStorage.getItem("token").split('.')[1])).Role.trim()
   }

    const HTML_ADM = `
            <div class="col-3">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Administrar
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                      <a class="dropdown-item" data-toggle="modal" data-target="#modalEmpleados" id="menuADMempl" href="#">Empleados</a>
                      <a class="dropdown-item" href="#">Modulo De Seguimiento</a>
                    </div>
                  </div>
            </div>
            <div class="col-5">
            
          </div>  
          <div class="col-2">
          <button type="button" id="ChangeMode" class="btn btn-warning">Cambiar Modo</button>
            </div>  
            <div class="col-2">
                <button type="button" id="logout" class="btn btn-primary">Salir</button>
            </div>    
    `
    const HTML_VENTAS = `
            <div class="col-3">
               
            </div> 
            <div class="col-5">
              
          </div>
          <div class="col-2">
          <button type="button" id="ChangeMode" class="btn btn-warning">Cambiar Modo</button>

          </div>  
          <div class="col-2">
              <button type="button" id="logout" class="btn btn-primary">Salir</button>
          </div>      
    `
    const HTML_CLIENTE = `
            <div class="col-3">
               
            </div>
            <div class="col-5">
              
          </div>
          <div class="col-2">
          <button type="button" id="ChangeMode" class="btn btn-warning">Cambiar Modo</button>
          </div>  
          <div class="col-2">
              <button type="button" id="logout" class="btn btn-primary">Salir</button>
          </div>    
           
                     
    `
    const HTML_INVITADO = `
            <div class="col-3">
                
            </div>
            <div class="col-5">
               <button type="button" id="ChangeMode"  class="btn btn-warning">Cambiar Modo</button>

            </div>  
            <div class="col-2">
                <button type="button" id=" " class="btn btn-primary" data-toggle="modal" data-target="#registro">Registrarse</button>
            </div>  
            <div class="col-2">
                <button type="button" id="" class="btn btn-primary" data-toggle="modal" data-target="#login">Iniciar Session </button>
            </div>
                 
    `
    
   
    switch (USER_ROLE) {
       case 'ADM':
          $("#menu").append(HTML_ADM)
          break;
      case 'VENTAS':
         $("#menu").append(HTML_VENTAS)

          break;
      case 'CLIENTE':
         $("#menu").append(HTML_CLIENTE)

          break;
    
       default:
         $("#menu").append(HTML_INVITADO)

          break;
    }



    $("#logout").click(()=>{
       localStorage.removeItem("token")
       localStorage.removeItem("expirate")

       ComprobarSession();
    })



function ComprobarSession(){

   var token = localStorage.getItem("token")
    if( token===null||token===undefined ){
        console.log("debe registrarse");
        $("#menu").empty();
        $("#menu").append(HTML_INVITADO);
        //window.location.href = "./login.html"
    }else{        
        console.log(JSON.parse(atob(localStorage.getItem("token").split('.')[1])).Role)
    }
}





    });