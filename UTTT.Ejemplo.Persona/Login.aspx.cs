using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;

namespace UTTT.Ejemplo.Persona
{
    public partial class Login : System.Web.UI.Page
    {
        #region Variables

        private SessionManager session = new SessionManager();

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Hashtable parametrosRagion = new Hashtable();
                parametrosRagion.Add("idPersona", "0");
                parametrosRagion.Add("idUsuario", "0");
                this.session.Parametros = parametrosRagion;
                this.Session["SessionManager"] = this.session;

            }
            catch (Exception)
            {
                
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                this.Response.Redirect("UsuarioManager.aspx");
            }
            catch (Exception _e)
            {
                string mensaje = _e.Message;
            }
        }

        public string encrypt(string txt)
        {
            SHA256 sha256 = SHA256Managed.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] stream = null;
            StringBuilder sb = new StringBuilder();
            stream = sha256.ComputeHash(encoding.GetBytes(txt));
            for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
            return sb.ToString();
        }
        
        protected void ValidarLogin(object sender, EventArgs e)
        {
            try
            {

                DataContext dcConsulta = new DcGeneralDataContext();

                Usuario user = null;

                Expression<Func<UTTT.Ejemplo.Linq.Data.Entity.Usuario, bool>>
                   predicate = c => c.strPass.Equals(encrypt(this.txtPass.Text.Trim())) && c.strNombreUsuario.Equals(this.txtNombre.Text.Trim());

                    predicate.Compile();

                    user = dcConsulta.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().Where(predicate).First();
                    

                if (user!= null)
                {
                    if (user.idSegCatStatus == 1 )
                    {
                        this.session.Pantalla = "~/Inicio.aspx";
                        Hashtable parametrosRagion = new Hashtable();
                        parametrosRagion.Add("idPersona", user.idSegCatPerfil);
                        parametrosRagion.Add("idUsuario", "0");
                        this.session.Parametros = parametrosRagion;
                        this.Session["SessionManager"] = this.session;
                        this.Response.Redirect(this.session.Pantalla, true);
                    }
                    else
                    {
                        this.lblMensaje.Text = "usuario tiene un status inactivo";
                        this.lblMensaje.Visible = true;
                    }

                }
                else
                {
                    this.lblMensaje.Text = "usuario o contraseña incorrectos";
                    this.lblMensaje.Visible = true;
                }
            }
            catch (Exception _e)
            {
                this.lblMensaje.Text = "usuario o contraseña incorrectos";
                this.lblMensaje.Visible = true;
            }
        }
    }
}