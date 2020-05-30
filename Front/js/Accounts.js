'use strict'
 $(document).ready(function() {

   if(localStorage.getItem("token")!=null){
           var USER_ROLE = JSON.parse(atob(localStorage.getItem("token").split('.')[1])).Role.trim()
   }

    const HTML_ADM = `
    
       <ul class="navbar-nav mr-auto">
         <li class="nav-item active">
           <a id="ChangeMode" class="nav-link text-success">Cambiar Modo</a>
         </li>
         <li class="nav-item">
           <a id="logout" class="nav-link text-success">Salir</a>
         </li>
        <li class="dropdown">
                       <a class="nav-link dropdown-toggle text-success" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         Administrar
                       </a>
                       <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                         <a class="dropdown-item" data-toggle="modal" data-target="#modalEmpleados" id="menuADMempl" href="#">Empleados</a>
                         <a class="dropdown-item" data-toggle="modal" data-target="#moduloSeguimiento" href="#">Modulo De Seguimiento</a>
                       </div>
                     </div>
               </li>
         
       </ul>
       
    `
    const HTML_VENTAS = `
   
  
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a id="ChangeMode" class="nav-link text-success">Cambiar Modo</a>
        </li>
        <li class="nav-item">
          <a id="logout" class="nav-link text-success">Salir</a>
        </li>
       </ul>
    


            
    `
    const HTML_CLIENTE = `
          
              <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                  <a id="ChangeMode" class="nav-link text-success">Cambiar Modo</a>
                </li>
                <li class="nav-item">
                   <a id="logout" class="nav-link text-success">Salir</a>
                </li>
               </ul>

              
           
                     
    `
    const HTML_INVITADO = `
            
   
       <ul class="navbar-nav mr-auto">
         <li class="nav-item active">
           <a id="ChangeMode" class="nav-link text-success">Cambiar Modo</a>
         </li>

         <li class="nav-item">
           <a  data-toggle="modal" data-target="#registro" class="nav-link text-success">Registrarse</a>
         </li>

         <li class="nav-item">
           <a  data-toggle="modal" data-target="#login" class="nav-link text-success">Iniciar Session</a>
         </li>
       </ul>
         
    `
    
   
    switch (USER_ROLE) {
       case 'ADM':
          $("#navbarSupportedContent").append(HTML_ADM)
          break;
      case 'VENTAS':
         $("#navbarSupportedContent").append(HTML_VENTAS)

          break;
      case 'CLIENTE':
         $("#navbarSupportedContent").append(HTML_CLIENTE)

          break;
    
       default:
         $("#navbarSupportedContent").append(HTML_INVITADO)

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
        $("#navbarSupportedContent").empty();
        $("#navbarSupportedContent").append(HTML_INVITADO);
        location.reload();
        //window.location.href = "./login.html"
    }else{        
        console.log(JSON.parse(atob(localStorage.getItem("token").split('.')[1])).Role)
    }
}





    });