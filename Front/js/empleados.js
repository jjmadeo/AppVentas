$(document).ready(function (){
    $("#containerAlta").show();
    $("#containerModi").hide();
    $("#containerBaja").hide();
    $("#containerConsul").hide();
    

    $("#menuADMempl").click(function(){
        GetSucursales();
        GetRoles();
    })


    $("#alta").click(function(){
        $(this).last().addClass("active");
        GetSucursales();
        GetRoles();
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
    $("#consultar").click(function(){
        $(this).last().addClass("active");

        $("#baja").last().removeClass("active");
        $("#modificacion").last().removeClass("active");
        $("#alta").last().removeClass("active");

        $("#containerAlta").hide();
        $("#containerModi").hide();
        $("#containerBaja").hide();
        $("#containerConsul").show();

    })







    function GetSucursales(){
        var requestOptions = {
            method: 'GET',
            redirect: 'follow'
          };
          let  $slectSucursal = $("#sucursalAltaEmpleado");
          fetch("http://localhost:60227/api/Sucrusal", requestOptions)
            .then(response => response.text())
            .then(result => {
              result = JSON.parse(result);
            console.log(result);
            result.sucursales.forEach(element => {
                
               $slectSucursal.append(`<option value="${element.id}" cuil="${element.cuil}" direccion="${element.direccion}" razonSocial="${element.razonSocial}">${element.razonSocial}</option>`);

            });

            })
            .catch(error => console.log('error', error));

    }



   function GetRoles(){
        var requestOptions = {
            method: 'GET',
            redirect: 'follow'
          };
          let  $slectrRole = $("#rolAltaEmpleado");
          fetch("http://localhost:60227/api/Account/Roles", requestOptions)
            .then(response => response.text())
            .then(result => {
              result = JSON.parse(result);
            console.log(result);
            result.roles.forEach(element => {
                
               $slectrRole.append(`<option value="${element.id}" >${element.nombre}</option>`);

            });

            })
            .catch(error => console.log('error', error));

    }
    


})



