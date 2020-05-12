'use strict'

$(document).ready(function() {

//getProductos();

function getProductos(){
    let img = "https://assets.adidas.com/images/w_840,h_840,f_auto,q_auto:sensitive,fl_lossy/d02db446868c4f2a8b31a9f10119d830_9366/Pelota_Top_de_Entrenamiento_Argentina_19_Blanco_DY2519_DY2519_01_standard.jpg"


    var requestOptions = {
        method: 'GET',
        redirect: 'follow'
    };
  
  fetch("http://localhost:60227/api/product", requestOptions)
    .then(response => response.text())
    .then(result => {
        console.log(JSON.parse(result));
        JSON.parse(result).forEach(element => {
            const PRODUCTO =`   
            <div class="col m-3">
                <div class="card" style="width: 18rem;">
                    <img src="${img}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">${element.nombre}</h5>
                        <p class="card-text">${element.detalle}</p>
                        <span class="badge badge-secundary" id="Precio">$35</span> <br>
                        <button  id="añadir" class="btn btn-primary añadirProduct" >Añadir al carrito</button>
                        <input type="number"  name="cantidad" min="1"  value="1">
                    </div>
                </div>
            </div>
        `


        

        $("#productos").append(PRODUCTO);
            
        });
        





    })

    .catch(error => console.log('error', error));






}





});