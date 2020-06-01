$(document).ready(function(){
    
    $(document).on('click','.categorias', function(e){ //esta función se ejecutará en todos los casos

    let id_Categoria = $(this).attr('idCategoria')


        Vaciar("#items");
           
        let newArr = baseDeDatos.filter(item=>{
            return item.categoria.id == id_Categoria;
        })
        
        renderItems(newArr)


    });

 const compra = {
          tipoCompra:null,
          sucursal:null ,
          id:null ,        
          cuil:null ,
          direccion:null        
        
       }
       var token =localStorage.getItem("token");
       if(!token){
        $('#modalInicio').modal('show');

       }
      $('#sucrusaldiv').hide();
      $("#tipoVentaSelect").change(function(){
        $('#sucrusaldiv').hide();
        $('#tipoVentabtn').attr("disabled", false);
        if($('#tipoVentaSelect').val()==='Asistida'){
          $('#sucrusaldiv').show();
        }
            compra.tipoCompra=$('#tipoVentaSelect').val()
        });
        $("#sucursalSelectinicio").change(function(){
          compra.sucursal= $("#sucursalSelectinicio option:selected").attr('razonSocial')
          compra.direccion= $("#sucursalSelectinicio option:selected").attr('cuil')
          compra.cuil= $("#sucursalSelectinicio option:selected").attr('direccion')
          compra.id = $('#sucursalSelectinicio').val();
          $('#tipoVentabtn').attr("disabled", false);
       
        });
        

      $("#tipoVentabtn").click(function(){

        if($('#tipoVentaSelect').val()==='Asistida'){
            localStorage.removeItem("Compra");
            localStorage.setItem("Compra",JSON.stringify(compra));
        }else{
            localStorage.removeItem("Compra");
            localStorage.setItem("Compra",JSON.stringify(compra));
        }

        Vaciar("#items");
        cargarProductos();



      })


      $("#ChangeMode").click(function(){

        localStorage.clear();
        location.reload();

        // Vaciar("#items");
        // cargarProductos();


      })






    

})

// window.addEventListener("scroll", function(){
//     var st = window.pageYOffset || document.documentElement.scrollTop; 
//     if (st > 295){
//       console.log('agranda el div');

//     } else {
//       console.log('para arriba'+st);
//     }
//  }, false);

$(window).scroll(function(){
    var sticky = $('#contenedorCarrito'),
        scroll = $(window).scrollTop();
  
    if (scroll >= 295) sticky.addClass('fixed');
    else sticky.removeClass('fixed');
  });



    let baseDeDatos = []
cargarProductos();

function cargarProductos(){

    
    
    let idSucursal;
    let compralstorage = localStorage.getItem("Compra");
    console.log(compralstorage)
    
    if(JSON.parse(compralstorage)?.tipoCompra === 'Asistida'){
        compralstorage= JSON.parse(compralstorage);
        idSucursal=compralstorage.id;
    }
    console.log(idSucursal)
    var requestOptions = {
        method: 'GET',
        redirect: 'follow'
    };
    
    let enpointProduct = "http://localhost:60227/api/product"
   // console.log("asd"+compralstorage.id)
    if( compralstorage?.id!=null){
        enpointProduct =`http://localhost:60227/api/Product/Sucursal/${compralstorage.id}`
    } 
    
    
    fetch(enpointProduct, requestOptions)
    .then(response => response.text())
    .then(result => {
        console.log(JSON.parse(result));
        baseDeDatos = JSON.parse(result);  
        renderItems(JSON.parse(result));
    
        })
        
    
    .catch(error => console.log('error', error));
    
}


// let img = "https://assets.adidas.com/images/w_840,h_840,f_auto,q_auto:sensitive,fl_lossy/d02db446868c4f2a8b31a9f10119d830_9366/Pelota_Top_de_Entrenamiento_Argentina_19_Blanco_DY2519_DY2519_01_standard.jpg"
// let baseDeDatos = []

// let idSucursal;
// let compralstorage = localStorage.getItem("Compra");
// console.log(compralstorage)

// if(compralstorage != null){
//     compralstorage= JSON.parse(compralstorage);
//     idSucursal=compralstorage.id;
// }
// console.log(idSucursal)
// var requestOptions = {
//     method: 'GET',
//     redirect: 'follow'
// };

// let enpointProduct = "http://localhost:60227/api/product"
// console.log("asd"+compralstorage.id)
// if(compralstorage.id!=null){
//     enpointProduct =`http://localhost:60227/api/Product/Sucursal/${compralstorage.id}`
// } 


// fetch(enpointProduct, requestOptions)
// .then(response => response.text())
// .then(result => {
//     console.log(JSON.parse(result));
//     baseDeDatos = JSON.parse(result);  
//     renderItems(JSON.parse(result));

//     })
    

// .catch(error => console.log('error', error));



// Variables
    console.log(baseDeDatos)
let $items = document.querySelector('#items');
let carrito = [];
let total = 0;
let $carrito = document.querySelector('#carrito');
let $total = document.querySelector('#total');
let $search = document.querySelector('#buscar')

// document.addEventListener("DOMContentLoaded", function(event) {
 
// //     var container = document.querySelector('#contenedorCategorias').childNodes;
// // var matches = container.querySelectorAll('.btnCategoria');

// var highlightedItems = userList.querySelectorAll('.btnCategoria');

// highlightedItems.forEach(function(userItem) {
//   console.log(userItem);
// });


    
//   });




$search.addEventListener('keyup',()=>{
    //clearInner($items)
  Vaciar("#items");
   

let inputSerch = $search.value.toLowerCase()
console.log(inputSerch);

let newArr = baseDeDatos.filter(item=>{
    return item.nombre.toLowerCase().includes(inputSerch);
})

console.log(newArr);
renderItems(newArr)

})



// Funciones
 function renderItems (arr) {
    
     console.log("Rendered...")

//let nombreProducto = search.value.ToLowerCase();

     let i =0;
    for (let info of arr) {
        //let nProductoArr = info.nombre.ToLowerCase();

       
        
        // Estructura
        let miNodo = document.createElement('div');

            switch (i) {
                case 0:
                    miNodo.classList.add('card', 'col-sm-6','m-1');
                    i++
                    break;
            
                case  1:
                    miNodo.classList.add('card', 'col-sm-4','m-1');
                    i++

                    break;
                    case 2:
                        miNodo.classList.add('card', 'col-sm-4','m-1');
                        i++
                        break;
                
                    case  3:
                        miNodo.classList.add('card', 'col-sm-6','m-1');
                            i=0;
                        break;
            }



        // Body
        let miNodoCardBody = document.createElement('div');
        miNodoCardBody.classList.add('card-body');
        // Titulo
        let miNodoTitle = document.createElement('h5');
        miNodoTitle.classList.add('card-title');
        miNodoTitle.textContent = info['nombre'];
        //Ver detalle
        let miNodoVerDetalle = document.createElement('button');
        miNodoVerDetalle.classList.add('btn', 'btn-info');
        miNodoVerDetalle.setAttribute('id', "VerDetalle"+info['id']);
        miNodoVerDetalle.textContent="Detalle"
        miNodoVerDetalle.addEventListener('click', function(e){
            let idDetalle= ("#"+e.target.id+"p")
            let $detalle = document.querySelector(idDetalle);

            if($detalle.style.display === 'none'){
                $detalle.style.display="block";
            }else{
                $detalle.style.display="none";

            }
            


        });


        //detalle
        let miNodoDetalle = document.createElement('p');
        miNodoDetalle.classList.add('card-text');
        miNodoDetalle.textContent = info['detalle'];
        miNodoDetalle.setAttribute('id', "VerDetalle"+info['id']+"p");
        miNodoDetalle.style.display="none";


        // Imagen
        let miNodoImagen = document.createElement('img');
        miNodoImagen.classList.add('img-fluid');
        miNodoImagen.setAttribute('src', info['imgUrl']);
        // Precio
        let miNodoPrecio = document.createElement('p');
        miNodoPrecio.classList.add('card-text');
        miNodoPrecio.textContent ='$'+info['precio'] ;
        // Boton 
        let miNodoBoton = document.createElement('button');
        miNodoBoton.classList.add('btn', 'btn-success', 'rounded-circle');
        miNodoBoton.textContent = '+';
        miNodoBoton.setAttribute('marcador', info['id']);
        miNodoBoton.addEventListener('click', anyadirCarrito);

        if(info['stock']===0){
            miNodoBoton.setAttribute('disabled',true)
        }
        if(localStorage.getItem("token")!=null){
            if(JSON.parse(atob(localStorage.getItem("token").split('.')[1])).Role.trim()==='ADM'){
            miNodoBoton.setAttribute('hidden',true)
            document.querySelector('#contenedorCarrito').setAttribute('hidden',true)
            }
         }else if(localStorage.getItem("Compra")===null){
            // miNodoBoton.setAttribute('hidden',true)
            // document.querySelector('#contenedorCarrito').setAttribute('hidden',true)
         }
         
        // Insertamos
        miNodoCardBody.appendChild(miNodoImagen);
        miNodoCardBody.appendChild(miNodoTitle);
        miNodoCardBody.appendChild(miNodoVerDetalle);
        miNodoCardBody.appendChild(miNodoDetalle);
        miNodoCardBody.appendChild(miNodoPrecio);
        miNodoCardBody.appendChild(miNodoBoton);

        miNodo.appendChild(miNodoCardBody);
        $items.appendChild(miNodo);
    }
}
function anyadirCarrito () {
    // Anyadimos el Nodo a nuestro carrito
    carrito.push(this.getAttribute('marcador'))
    // Calculo el total
    calcularTotal();
    // Renderizamos el carrito 
    renderizarCarrito();

}

function renderizarCarrito () {
    // Vaciamos todo el html
    $carrito.textContent = '';
    let caantidad = 0;
    // Quitamos los duplicados
    let carritoSinDuplicados = [...new Set(carrito)];
    // Generamos los Nodos a partir de carrito
    carritoSinDuplicados.forEach(function (item, indice) {
        // Obtenemos el item que necesitamos de la variable base de datos
        let miItem = baseDeDatos.filter(function(itemBaseDatos) {
            return itemBaseDatos['id'] == item;
        });
        // Cuenta el número de veces que se repite el producto
        let numeroUnidadesItem = carrito.reduce(function (total, itemId) {
            return itemId === item ? total += 1 : total;
        }, 0);
        // Creamos el nodo del item del carrito
        let miNodo = document.createElement('li');
        let miFila = document.createElement('div');
        miFila.classList.add('row')

        let col1 = document.createElement('div');
        col1.classList.add('col-1')
        col1.textContent= "X "+numeroUnidadesItem
        let col2 = document.createElement('div');
        col2.classList.add('col-5')
        col2.textContent =miItem[0]['nombre']
        let col3 = document.createElement('div');
        col3.classList.add('col-3')
        col3.textContent = "$"+miItem[0]['precio']
        let col4 = document.createElement('div');
        col4.classList.add('col-3')
      

        miNodo.classList.add('list-group-item', 'text-right', 'mx-2','itemCarrito','row');
        // miNodo.textContent = `${numeroUnidadesItem} x ${miItem[0]['nombre']} - $${miItem[0]['precio']}`;
        caantidad = caantidad + numeroUnidadesItem;

        // Boton de borrar
        let miBoton = document.createElement('button');
        miBoton.classList.add('btn', 'btn-danger','rounded-circle' );
        miBoton.textContent = 'X';
        miBoton.style.marginLeft = '1rem';
        miBoton.setAttribute('item', item);
        miBoton.addEventListener('click', borrarItemCarrito);
        col4.appendChild(miBoton);
        // Mezclamos nodos
        miFila.appendChild(col2)
        miFila.appendChild(col1)
        miFila.appendChild(col3)
        miFila.appendChild(col4)
        miNodo.appendChild(miFila)

        //miNodo.appendChild(miBoton);
        $carrito.appendChild(miNodo);
    })
    console.log("CARRITO=>",$carrito)
    document.querySelector("#badge").textContent=caantidad


}

function borrarItemCarrito () {
    console.log()
    // Obtenemos el producto ID que hay en el boton pulsado
    let id = this.getAttribute('item');
    // Borramos todos los productos
    carrito = carrito.filter(function (carritoId) {
        return carritoId !== id;
    });
    // volvemos a renderizar
    renderizarCarrito();
    // Calculamos de nuevo el precio
    calcularTotal();
}

function calcularTotal () {
    // Limpiamos precio anterior
    total = 0;
    // Recorremos el array del carrito
    for (let item of carrito) {
        // De cada elemento obtenemos su precio
        let miItem = baseDeDatos.filter(function(itemBaseDatos) {
            return itemBaseDatos['id'] == item;
        });
        total = total + miItem[0]['precio'];
    }
    // Renderizamos el precio en el HTML
    $total.textContent = total.toFixed(2);
}
// Eventos


function MOdetalle(detalle){
    console.log(detalle)

}



function Vaciar(idPadre){
    var cell = document.querySelector(idPadre);

    if ( cell.hasChildNodes() ){
        while ( cell.childNodes.length >= 1 ){
            cell.removeChild( cell.firstChild );
        }
    }
}

const Categorias = function(e){
    console.log("boton")
}


