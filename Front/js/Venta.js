$(document).ready(function (){

    $("#btnComprarBotton").click(function (){

  

    


    if(localStorage.getItem("token") !=null && localStorage.getItem("token") != undefined){
        var $TokenUsuario  =  "Bearer " +localStorage.getItem("token").replace(/"/gi,'') ;
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


    if(localStorage.getItem("Compra") !=null){

    }

    


})




})
