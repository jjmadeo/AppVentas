'use strict'
 $(document).ready(function() {
   if(localStorage.getItem("token")!=null){
           var USER_ROLE = JSON.parse(atob(localStorage.getItem("token").split('.')[1])).Role.trim()
   }

    const HTML_ADM = `
            <div class="col-10">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Administrar
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                      <a class="dropdown-item" href="#">Empleados</a>
                      <a class="dropdown-item" href="#">Productos</a>
                      <a class="dropdown-item" href="#">Categorias</a>
                    </div>
                  </div>
            </div>
            <div class="col-2">
                <button type="button" id="logout" class="btn btn-primary">Salir</button>
            </div>    
    `
    const HTML_VENTAS = `
            <div class="col-10">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Ventas
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                      <a class="dropdown-item" href="#">Nueva Venta</a>
                      <a class="dropdown-item" href="#">Formalizar Venta</a>
                      <a class="dropdown-item" href="#">Buscar</a>
                    </div>
                  </div>
            </div> 
            <div class="col-2">
                <button type="button" id="logout" class="btn btn-primary">Salir</button>
            </div>       
    `
    const HTML_CLIENTE = `
            <div class="col-10">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Menu
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                      <a class="dropdown-item" href="#">Comprar</a>
                      <a class="dropdown-item" href="#">Mis Compras</a>
                      <a class="dropdown-item" href="#">Buscar</a>
                      <a class="dropdown-item" href="#">Mi Changuito</a>

                    </div>
                  </div>
            </div>
            <div class="col-2">
                <button type="button" id="logout" class="btn btn-primary">Salir</button>
            </div>        
    `
    const HTML_INVITADO = `
            <div class="col-8">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Menu
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                      <a class="dropdown-item" href="#">Buscar</a>
                      <a class="dropdown-item" href="#">Mi Changuito</a>
                    </div>
                  </div>
            </div>
            <div class="col-2">
                <button type="button" id=" " class="btn btn-primary" data-toggle="modal" data-target="#registro"">Registrarse</button>
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
       localStorage.clear();
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