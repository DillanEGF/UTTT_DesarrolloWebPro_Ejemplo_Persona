using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;

namespace UTTT.Ejemplo.Persona.RecuperarContraseñaForms
{
    public partial class BuscarUsuario : System.Web.UI.Page
    {
        private SessionManager session = new SessionManager();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsValid)
                {
                    return;
                }

                DataContext dcGuardar = new DcGeneralDataContext();
                UTTT.Ejemplo.Linq.Data.Entity.Usuario usuario = new Linq.Data.Entity.Usuario();

                usuario.strNombreUsuario = this.txtNombre.Text.Trim();

                String mensaje = "";

                if (!this.validar(usuario, ref mensaje))
                {
                    this.lblMensaje.Text = mensaje;
                    this.lblMensaje.Visible = true;
                    return;
                }


                if (validarUsuario(usuario))
                {
                    usuario = dcGuardar.GetTable<Usuario>().First(c => c.strNombreUsuario == usuario.strNombreUsuario);

                    Hashtable parametrosRagion = new Hashtable();
                    parametrosRagion.Add("idUsuario", usuario.id.ToString());
                    this.session.Parametros = parametrosRagion;
                    this.Session["SessionManager"] = this.session;
                    this.session.Pantalla = String.Empty;
                    this.session.Pantalla = "~/CambiarPass.aspx";
                    this.Response.Redirect(this.session.Pantalla, false);

                }
                else
                {
                    this.lblMensaje.Text = "Este usuario no existe";
                    this.lblMensaje.Visible = true;
                    return;
                }


            }
            catch (Exception _e)
            {
                string mensaje = _e.Message;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                this.Response.Redirect("Login.aspx");
            }
            catch (Exception _e)
            {
                string mensaje = _e.Message;
            }
        }

        public bool validar(UTTT.Ejemplo.Linq.Data.Entity.Usuario _usuario, ref String _mensaje)
        {
            if (_usuario.strNombreUsuario.Equals(String.Empty))
            {
                _mensaje = "El Nombre esta vacío";
                return false;
            }

            return true;
        }

            public bool validarUsuario(Usuario user)
        {
            bool resp = false;

            DataContext datos = new DcGeneralDataContext();

            try
            {
                if (datos.GetTable<Usuario>().First(c => c.strNombreUsuario == user.strNombreUsuario) != null)
                {
                    resp = true;
                }
            }
            catch (Exception)
            {
                resp = false;
            }


            return resp;
        }
    }
}