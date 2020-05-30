using ENTITY;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTITY {
    public class Producto {

        private int _id;

        public int id {
            get { return _id; }
            set { _id = value; }
        }

        private string _detalle;

        public string detalle {
            get { return _detalle; }
            set { _detalle = value; }
        }

        private double _precio;

        public double precio {
            get { return _precio; }
            set { _precio = value; }
        }

        private int _stock;

        public int stock {
            get { return _stock; }
            set { _stock = value; }
        }

        private int _fecha;

        public int fecha {
            get { return _fecha; }
            set { _fecha = value; }
        }

        private bool _visible;
                
        public bool visible {
            get { return _visible; }
            set { _visible = value; }
        }

        private string _nombre;

        public string nombre {
            get { return _nombre; }
            set { _nombre = value; }
        }

        private Categoria _categoria;
            
        public Categoria Categoria {
            get { return _categoria; }
            set { _categoria = value; }
        }
        private string _imgURl;

        public string ImgUrl {
            get { return _imgURl; }
            set { _imgURl = value; }
        }



        public Producto(String nombre, string detalle, double precio, int stock, int fecha, bool visible, int id, Categoria  categoria,string imgURl) {
            _nombre = nombre;
            _id = id;
            _detalle = detalle;
            _precio = precio;
            _stock = stock;
            _fecha = fecha;
            _visible = visible;
            _categoria = categoria;
            _imgURl = imgURl;
        }



        // public Categoria categoria { get; set; }


    }
}
