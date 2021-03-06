﻿using System;
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

        [HttpGet("Sucursal/{idsucursal}", Name = "getProductosSucursal")]
        public Producto[] getProductosSucursal(int idsucursal) {

            Producto[] productos = new BLL.Producto().getProductoBLL(idsucursal);


            return productos;
        }

        


        



        [HttpGet]
        [Route("categorias")]
        public Categoria[] getCategorias() {

            Categoria[] categorias = new BLL.Producto().getCategoriasBLL();


            return categorias;
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
