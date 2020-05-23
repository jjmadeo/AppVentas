using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ENTITY;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ENTITY;
namespace Servicios.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class ProductController : ControllerBase
    {
        [HttpGet]
        public Producto[] getProductos() {

            Producto[] productos = new BLL.Producto().getProductoBLL();


            return productos;
        }

        [HttpPost]
        public IActionResult nuevoProducto([FromBody] Producto producto) {

            //Producto productos = new BLL.Producto().newProductoBLL(producto);


            return Ok(new { ProductoCreated = producto });

        }
        [HttpPut("{id}", Name = "ProductoUpdate")] // id viene el identificador de la categoria 
        public IActionResult ProductoUpdate(int id, [FromBody] Producto producto) { // Form body viene el contenido de la categoria.

            //buscas al producto con el @{id} prodporcionado y actualizarlo con los valores recibidos en en producto.


            return Ok(new { MSG = "Producto actualizado." });
        }


        [HttpDelete("{id}", Name = "ProductoDelete")] // id viene el identificador de la categoria 
        public IActionResult ProductoDelete(int id) { // Form body viene el contenido de la categoria.


            // buscar por id y borrar el producto de la base.

            return Ok(new { MSG = "Producto Eliminado." });
        }



        [HttpGet]
        [Route("categorias")]
        public Categoria[] getCategorias() {

            Categoria[] categorias = new BLL.Producto().getCategoriasBLL();


            return categorias;
        }

        //actualizar
        [HttpPut]
        [Route("categorias")]
        [HttpGet("{id}", Name = "cateogiraUpdate")] // id viene el identificador de la categoria 
        public IActionResult  cateogiraUpdate(int id,[FromBody] Categoria categoria ) { // Form body viene el contenido de la categoria.

            //codigo para actualizar una categoria existente.


            return Ok(new { MSG="Producto actualizado." }); 
        }

        [HttpPost]
        [Route("categorias")]
        public IActionResult cateogiraUpdate([FromBody] Categoria categoria) { // Form body viene el contenido de la categoria.

            //codigo para actualizar una categoria existente.


            return Ok(new { MSG = "Producto actualizado." }); 
        }



















        /*/// GET: api/Product
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "Coca-Cola", "Lavandina" };
        }

        // GET: api/Product/5
        [HttpGet("{id}", Name = "Get")]
        public string Get(int id, [FromBody]UserInfo model)
        {
            return "value";
        }

        // POST: api/Product
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Product/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }*/
    }
}
