using System;
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
    public partial class DirecciónEmpresa : System.Web.UI.Page
    {
        private SessionManager session = new SessionManager();
        private int idUsuario = 0;
        private CatDireccion baseEntity;
        private DataContext dcG = new DcGeneralDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

            this.Response.Buffer = true;
            this.session = (SessionManager)this.Session["SessionManager"];
            this.idUsuario = this.session.Parametros["idUsuario"] != null ?
                int.Parse(this.session.Parametros["idUsuario"].ToString()) : 0;
            this.baseEntity = new Linq.Data.Entity.CatDireccion();

            if (!this.IsPostBack)
            {
                if (this.session.Parametros["baseEntity"] == null)
                {
                    this.session.Parametros.Add("baseEntity", this.baseEntity);
                }

                try
                {
                    this.baseEntity = dcG.GetTable<CatDireccion>().FirstOrDefault(c => c.id == idUsuario);

                    this.txtCalle.Text = this.baseEntity.strCalle;
                    this.txtColonia.Text = this.baseEntity.strColonia;
                    this.txtCP.Text = this.baseEntity.intCP.ToString();
                    this.txtMunicipio.Text = this.baseEntity.strMunicipio;
                    this.txtNumInt.Text = this.baseEntity.intNumInt.ToString();
                    this.txtNumExt.Text = this.baseEntity.intNumExt.ToString();

                }
                catch (Exception _e)
                {
                    this.txtCalle.Text = "";
                    this.txtColonia.Text = "";
                    this.txtMunicipio.Text = "";
                    this.txtCP.Text = "";
                    this.txtNumInt.Text = "";
                    this.txtNumExt.Text = "";
                }
            }
        }

        protected void Guardar_clic(object sender, EventArgs e)
        {
            String mensaje = "";

            if (!this.validar(ref mensaje))
            {
                this.lblMensaje.Text = mensaje;
                this.lblMensaje.Visible = true;


                return;
            }
            else
            {

                this.baseEntity = dcG.GetTable<CatDireccion>().FirstOrDefault(c => c.id == idUsuario);
                this.baseEntity.strCalle = this.txtCalle.Text.Trim();
                this.baseEntity.strColonia = this.txtColonia.Text.Trim();
                this.baseEntity.strMunicipio = this.txtMunicipio.Text.Trim();
                this.baseEntity.intCP = int.Parse(this.txtCP.Text.Trim());
                this.baseEntity.intNumInt = int.Parse(this.txtNumInt.Text.Trim());
                this.baseEntity.intNumExt = int.Parse(this.txtNumExt.Text.Trim());


                dcG.SubmitChanges();
                this.showMessage("Los datos de guardaron correctamente.");
                this.Response.Redirect("~/EmpresaPrincipal.aspx", false);
                return;
            }
        }

        protected void Cancelar_clic(object sender, EventArgs e)
        {
            try
            {
                this.Response.Redirect("EmpresaPrincipal.aspx");
            }
            catch (Exception _e)
            {
                string mensaje = _e.Message;
            }
        }

        public bool validar(ref String _mensaje)
        {

            int i = 0;
            if (int.TryParse(this.txtCP.Text.Trim(), out i) == false)
            {
                _mensaje = "El CP debe ser formato numerico";
                return false;
            }
            if (int.TryParse(this.txtNumInt.Text.Trim(), out i) == false)
            {
                _mensaje = "El Numero Interior debe ser formato numerico";
                return false;
            }
            if (int.TryParse(this.txtNumExt.Text.Trim(), out i) == false)
            {
                _mensaje = "El Numero Exterior debe ser formato numerico";
                return false;
            }

            if (this.txtCalle.Equals(String.Empty))
            {
                _mensaje = "El campo calle esta vacío";
                return false;
            }

            if (this.txtColonia.Equals(String.Empty))
            {
                _mensaje = "El campo colonia esta vacío";
                return false;
            }

            if (this.txtMunicipio.Equals(String.Empty))
            {
                _mensaje = "El campo Municipio esta vacío";
                return false;
            }

            return true;

        }


    }
}