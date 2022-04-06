using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;

namespace UTTT.Ejemplo.Persona.Control
{
    public class SessionManager
    {
        private int idPersona;
        private int idUsuario;
        private bool accionAgregar = false;
        private bool accionEditar = false;
        private int idManager = 0;

        public int IdManager
        {
            get { return idManager; }
            set { idManager = value; }
        }

        public bool AccionEditar
        {
            get { return accionEditar; }
            set { accionEditar = value; }
        }

        public bool AccionAgregar
        {
            get { return accionAgregar; }
            set { accionAgregar = value; }
        }


        public int IdPersona
        {
            get { return idPersona; }
            set { idPersona = value; }
        }

        private String strNombrePersona;

        public String StrNombrePersona
        {
            get { return strNombrePersona; }
            set { strNombrePersona = value; }
        }

        public int IdUsuario
        {
            get { return idUsuario; }
            set { idUsuario = value; }
        }

        private String strNombreUsuario;

        public String StrNombreUsuario
        {
            get { return strNombreUsuario; }
            set { strNombreUsuario = value; }
        }


        private String pantalla;

        public String Pantalla
        {
            get { return pantalla; }
            set { pantalla = value; }
        }

        private Hashtable parametros;

        public Hashtable Parametros
        {
            get
            {
                if (parametros == null)
                {
                    parametros = new Hashtable();
                }
                return parametros;
            }
            set { parametros = value; }
        }
    }
}
