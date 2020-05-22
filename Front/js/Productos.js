'use strict'

$(document).ready(function() {

    var requestOptions = {
        method: 'GET',
        redirect: 'follow'
      };
      let $contenedorCategorias = $("#contenedorCategorias");
      fetch("http://localhost:60227/api/Product/categorias", requestOptions)
        .then(response => response.text())
        .then(result => {
            result = JSON.parse(result);
            console.log(result);
            result.forEach(element => {
                
               $contenedorCategorias.append(`<a class="dropdown-item categorias" id ="" idCategoria ="${element.id}" >${element.nombre.trim()}</a>`);

            });





        }).catch(error => console.log('error', error));





});