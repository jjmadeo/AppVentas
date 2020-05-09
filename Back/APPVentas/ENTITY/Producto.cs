using ENTITY;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTITY {
    public class Producto {

        public int id { get; set; }
        public string nombre { get; set; }
        public string detalle { get; set; }
        public double  precio { get; set; }
        public int stock { get; set; }
       // public Categoria categoria { get; set; }
        public int  fecha { get; set; }
        public bool visible { get; set; }

        public Producto(string nombre, string detalle, float precio, int stock, int fecha, bool visible,int id) {
            this.nombre = nombre;
            this.detalle = detalle;
            this.precio = precio;
            this.stock = stock;
            this.fecha = fecha;
            this.visible = visible;
            this.id = id;
        }
    }
}
