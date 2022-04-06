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

namespace UTTT.Ejemplo.Persona
{
    public partial class Inicio : System.Web.UI.Page
    {
        private SessionManager session = new SessionManager();
        int idPerfil = 0;
        private Perfil baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                this.Response.Buffer = true;
                this.session = (SessionManager)this.Session["SessionManager"];

                this.idPerfil = this.session.Parametros["idPersona"] != null ?
                int.Parse(this.session.Parametros["idPersona"].ToString()) : 0;

                if (idPerfil == 0)
                {
                    idPerfil = int.Parse(this.session.Parametros["idPerfil"].ToString());
                }
                if (idPerfil != 0)
                {
                    this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Perfil>().First(c => c.idPerfil == this.idPerfil);

                    if (!(this.baseEntity.strNombre == "Administrador"))
                    {
                        this.Usuarios.Enabled = false;
                        this.Empleados.Enabled = false;

                        Hashtable parametrosRagion = new Hashtable();
                        parametrosRagion.Add("idPerfil", idPerfil);
                        this.session.Parametros = parametrosRagion;
                        this.Session["SessionManager"] = this.session;
                    }
                }
            }
            catch (Exception)
            {

            }
            

            





        }

        protected void DatosEmpresa_clic(object sender, EventArgs e)
        {
            try
            {

                Hashtable parametrosRagion = new Hashtable();
                parametrosRagion.Add("idPerfil", this.session.Parametros["idPersona"]);
                this.Session["SessionManager"] = this.session;
                this.session.Pantalla = String.Empty;
                this.session.Pantalla = "~/EmpresaPrincipal.aspx";
                this.Response.Redirect(this.session.Pantalla, false);
            }
            catch (Exception _e)
            {
                throw _e;
            }
        }

        protected void Empleados_clic(object sender, EventArgs e)
        {
            try
            {
                Hashtable parametrosRagion = new Hashtable();
                this.session.Parametros = parametrosRagion;
                this.Session["SessionManager"] = this.session;
                this.session.Pantalla = String.Empty;
                this.session.Pantalla = "~/EmpleadoPrincipal.aspx";
                this.Response.Redirect(this.session.Pantalla, false);
            }
            catch (Exception _e)
            {
                throw _e;
            }
        }

        protected void Usuarios_clic(object sender, EventArgs e)
        {
            try
            {
                Hashtable parametrosRagion = new Hashtable();
                this.session.Parametros = parametrosRagion;
                this.Session["SessionManager"] = this.session;
                this.session.Pantalla = String.Empty;
                this.session.Pantalla = "~/UsuarioPrincipal.aspx";
                this.Response.Redirect(this.session.Pantalla, false);
            }
            catch (Exception _e)
            {
                throw _e;
            }
        }


    }
}