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
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class EmpresaPrincipal : System.Web.UI.Page
    {
        private SessionManager session = new SessionManager();
        private int idUsuario = 0;
        private int idPerfil = 0;
        private Perfil p;
        private DatosEmpresa baseEntity;
        private DataContext dcG = new DcGeneralDataContext();

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
                    this.p = dcG.GetTable<Linq.Data.Entity.Perfil>().First(c => c.idPerfil == this.idPerfil);

                    if (!(this.p.strNombre == "Administrador"))
                    {
                        this.btnGuardar.Enabled = false;
                        this.Button1.Enabled = false;
                        this.txtEmail.Enabled = false;
                        this.txtNombre.Enabled = false;
                        this.txtTelefono.Enabled = false;

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



            this.Response.Buffer = true;
            this.session = (SessionManager)this.Session["SessionManager"];
            this.idUsuario = this.session.Parametros["idUsuario"] != null ?
                int.Parse(this.session.Parametros["idUsuario"].ToString()) : 0;
            this.baseEntity = new Linq.Data.Entity.DatosEmpresa();

            if (!this.IsPostBack)
            {
                if (this.session.Parametros["baseEntity"] == null)
                {
                    this.session.Parametros.Add("baseEntity", this.baseEntity);
                }

                try
                {


                    this.baseEntity = dcG.GetTable<DatosEmpresa>().FirstOrDefault(c => c.id == 2);

                    this.txtNombre.Text = this.baseEntity.strNombre;
                    this.txtTelefono.Text = this.baseEntity.intNumTelefono;
                    this.txtEmail.Text = this.baseEntity.strEmail;
                    var idDir = this.baseEntity.idCatDireccion;

                    CatDireccion dir = dcG.GetTable<CatDireccion>().Where(c => c.id == this.baseEntity.idCatDireccion).First();
                    this.lblCalle.Text = dir.strCalle;
                    this.lblColonia.Text = dir.strColonia;
                    this.lblMunicipio.Text = dir.strMunicipio;
                    this.lblCP.Text = dir.intCP.ToString();
                    this.lblNumInt.Text = dir.intNumInt.ToString();
                    this.lblNumExt.Text = dir.intNumExt.ToString();
                }
                catch (Exception _e)
                {
                    this.lblCalle.Text = "";
                    this.lblColonia.Text = "";
                    this.lblMunicipio.Text = "";
                    this.lblCP.Text = "";
                    this.lblNumInt.Text = "";
                    this.lblNumExt.Text = "";
                }
            }
            this.Response.Buffer = true;
        }

        protected void cancelar(object sender, EventArgs e)
        {
            this.Response.Buffer = true;
            this.session = (SessionManager)this.Session["SessionManager"];
            this.session.Pantalla = "~/Inicio.aspx";
            this.Response.Redirect(this.session.Pantalla, false);
        }

            protected void editar_clic(object sender, EventArgs e)
        {
            try
            {
                this.baseEntity = dcG.GetTable<DatosEmpresa>().FirstOrDefault(c => c.id == 2);

                CatDireccion dir = dcG.GetTable<CatDireccion>().Where(c => c.id == this.baseEntity.idCatDireccion).First();

                Hashtable parametrosRagion = new Hashtable();
                parametrosRagion.Add("idUsuario", dir.id.ToString());
                this.session.Parametros = parametrosRagion;
                this.Session["SessionManager"] = this.session;
                this.session.Pantalla = String.Empty;
                this.session.Pantalla = "~/DireccionEmpresa.aspx";
                this.Response.Redirect(this.session.Pantalla, false);
            }
            catch (Exception _e)
            {
                string error = _e.Message;
            }
            
        }

        protected void Guardar_clic(object sender, EventArgs e)
        {

            String mensaje = "";

            if (!this.validar(baseEntity, ref mensaje))
            {
                this.lblMensaje.Text = mensaje;
                this.lblMensaje.Visible = true;

                this.baseEntity = dcG.GetTable<DatosEmpresa>().FirstOrDefault(c => c.id == 2);
                this.baseEntity.strNombre = this.txtNombre.Text.Trim();
                this.baseEntity.intNumTelefono = this.txtTelefono.Text.Trim();
                this.baseEntity.strEmail = this.txtEmail.Text.Trim();

                dcG.SubmitChanges();
                this.showMessage("Los datos de guardaron correctamente.");
                this.Response.Redirect("~/EmpresaPrincipal.aspx", false);

                return;
            }
            else
            {
                this.lblMensaje.Text = "Datos incorrectos";
                this.lblMensaje.Visible = true;
                return;
            }
            

        }

        public bool validar(DatosEmpresa _empresa, ref String _mensaje)
        {

            int i = 0;
            if (int.TryParse(_empresa.intNumTelefono, out i) == false)
            {
                _mensaje = "El telefono debe ser formato numerico";
                return false;
            }

            if (_empresa.strNombre.Equals(String.Empty))
            {
                _mensaje = "El Nombre esta vacío";
                return false;
            }

            if (_empresa.strEmail.Equals(String.Empty))
            {
                _mensaje = "El email esta vacío";
                return false;
            }

            return true;

        }





    }
}