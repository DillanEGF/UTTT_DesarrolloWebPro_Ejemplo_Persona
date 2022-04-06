using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class CambiarPass : System.Web.UI.Page
    {
        private SessionManager session = new SessionManager();
        private int idUsuario = 0;
        private UTTT.Ejemplo.Linq.Data.Entity.Usuario baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();
        private int tipoAccion = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Response.Buffer = true;
            this.session = (SessionManager)this.Session["SessionManager"];
            this.idUsuario = this.session.Parametros["idUsuario"] != null ?
            int.Parse(this.session.Parametros["idUsuario"].ToString()) : 0;

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

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                DataContext dcGuardar = new DcGeneralDataContext();
                Usuario user = new Linq.Data.Entity.Usuario();

                if (this.txtPass.Text.Trim() == this.txtPass2.Text.Trim())
                {
                    user = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().First(c => c.id == idUsuario);
                    user.strPass = encrypt(this.txtPass.Text.Trim());

                    dcGuardar.SubmitChanges();
                    this.showMessage("La contraseña se modifico correctamente.");
                    this.Response.Redirect("~/Login.aspx", false);
                }
                else
                {
                    this.lblMensaje.Text = "Las contraseñas no coinciden";
                    this.lblMensaje.Visible = true;

                }

            }
            catch (Exception)
            {

                throw;
            }

        }

    }
}