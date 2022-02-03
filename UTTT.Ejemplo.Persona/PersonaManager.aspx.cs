#region Using

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using System.Data.Linq;
using System.Linq.Expressions;
using System.Collections;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;
using System.Net.Mail;
using System.Net;

#endregion

namespace UTTT.Ejemplo.Persona
{
    public partial class PersonaManager : System.Web.UI.Page
    {
        #region Variables

        private SessionManager session = new SessionManager();
        private int idPersona = 0;
        private UTTT.Ejemplo.Linq.Data.Entity.Persona baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();
        private int tipoAccion = 0;

        #endregion

        #region Eventos

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                this.Response.Buffer = true;
                this.session = (SessionManager)this.Session["SessionManager"];
                this.idPersona = this.session.Parametros["idPersona"] != null ?
                    int.Parse(this.session.Parametros["idPersona"].ToString()) : 0;
                if (this.idPersona == 0)
                {
                    this.baseEntity = new Linq.Data.Entity.Persona();
                    this.tipoAccion = 1;
                }
                else
                {
                    this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Persona>().First(c => c.id == this.idPersona);
                    this.tipoAccion = 2;
                }

                if (!this.IsPostBack)
                {
                    if (this.session.Parametros["baseEntity"] == null)
                    {
                        this.session.Parametros.Add("baseEntity", this.baseEntity);
                    }
                    List<CatSexo> lista = dcGlobal.GetTable<CatSexo>().ToList();
                    CatSexo catTemp = new CatSexo();
                    catTemp.id = -1;
                    catTemp.strValor = "Seleccionar";
                    lista.Insert(0, catTemp);
                    this.ddlSexo.DataTextField = "strValor";
                    this.ddlSexo.DataValueField = "id";
                    this.ddlSexo.DataSource = lista;
                    this.ddlSexo.DataBind();

                    this.ddlSexo.SelectedIndexChanged += new EventHandler(ddlSexo_SelectedIndexChanged);
                    this.ddlSexo.AutoPostBack = true;
                    if (this.idPersona == 0)
                    {
                        this.lblAccion.Text = "Agregar";
                    }
                    else
                    {
                        this.lblAccion.Text = "Editar";
                        this.txtNombre.Text = this.baseEntity.strNombre;
                        this.txtAPaterno.Text = this.baseEntity.strAPaterno;
                        this.txtAMaterno.Text = this.baseEntity.strAMaterno;
                        this.txtClaveUnica.Text = this.baseEntity.strClaveUnica;
                        this.setItem(ref this.ddlSexo, baseEntity.CatSexo.strValor);
                        this.txtCURP.Text = this.baseEntity.strCURP;
                    }                
                }

            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al cargar la página");
                this.Response.Redirect("~/PersonaPrincipal.aspx", false);
            }

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                ///Validaciones
                if (!Page.IsValid)
                {
                    return;
                }
                DataContext dcGuardar = new DcGeneralDataContext();
                UTTT.Ejemplo.Linq.Data.Entity.Persona persona = new Linq.Data.Entity.Persona();
                if (this.idPersona == 0)
                {
                    persona.strClaveUnica = this.txtClaveUnica.Text.Trim();
                    persona.strNombre = this.txtNombre.Text.Trim();
                    persona.strAMaterno = this.txtAMaterno.Text.Trim();
                    persona.strAPaterno = this.txtAPaterno.Text.Trim();
                    persona.strCURP = this.txtCURP.Text.Trim();
                    persona.idCatSexo = int.Parse(this.ddlSexo.Text);

                    //if (int.Parse(this.ddlSexo.Text) > -1)
                    //{
                    //    persona.idCatSexo = int.Parse(this.ddlSexo.Text);
                    //}
                    //else
                    //{
                    //    this.showMessage("Selecciona un sexo");
                    //}

                    //Aquí se validan los datos desde el código
                    String mensaje = "";

                    if (!this.validar(persona, ref mensaje))
                    {
                        this.lblMensaje.Text = mensaje;
                        this.lblMensaje.Visible = true;
                        return;
                    }
                    
                    
                    dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().InsertOnSubmit(persona);
                    dcGuardar.SubmitChanges();
                    this.showMessage("El registro se agrego correctamente.");
                    this.Response.Redirect("~/PersonaPrincipal.aspx", false);
                    
                }
                if (this.idPersona > 0)
                {
                    persona = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().First(c => c.id == idPersona);
                    persona.strClaveUnica = this.txtClaveUnica.Text.Trim();
                    persona.strNombre = this.txtNombre.Text.Trim();
                    persona.strAMaterno = this.txtAMaterno.Text.Trim();
                    persona.strAPaterno = this.txtAPaterno.Text.Trim();
                    persona.strCURP = this.txtCURP.Text.Trim();
                    persona.idCatSexo = int.Parse(this.ddlSexo.Text);
                    dcGuardar.SubmitChanges();
                    this.showMessage("El registro se edito correctamente.");
                    this.Response.Redirect("~/PersonaPrincipal.aspx", false);
                }
            }
            catch (Exception _e)
            {
                //this.showMessageException(_e.Message);
                String body =
                "<body>  " +
                "<h1>Mensaje De Excepcion</h1>" +
                "Hola prof. Este es mi mensaje de excepcion" +
                "<h3>Se ha producido una excepcion en la ejecución de la aplicación</h3" +
                "<br></br>" +
                "<h4>Att: Dillan Esain Gomez Flores 8IDGS-G1</h4>" +
                "</body>";

                SendEmail(body);
            
            }
        }

        public static void SendEmail(string Body)
        {
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();

            mail.From = new MailAddress("eisan34@gmail.com");

            mail.To.Add("esaindg@gmail.com");
            mail.Subject = "Error en el programa";
            mail.IsBodyHtml = true;
            mail.Body = Body;

            SmtpClient smtp = new SmtpClient();

            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587; //465;  //25; 
            smtp.Credentials = new NetworkCredential("eisan34@gmail.com", "DillanShippuden");
            smtp.EnableSsl = true;
            try
            {
                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                throw new Exception("No se ha podido enviar el email", ex.InnerException);
            }
            finally
            {
                smtp.Dispose();
            }

        }

        

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {              
                this.Response.Redirect("~/PersonaPrincipal.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }

        protected void ddlSexo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                int idSexo = int.Parse(this.ddlSexo.Text);
                Expression<Func<CatSexo, bool>> predicateSexo = c => c.id == idSexo;
                predicateSexo.Compile();
                List<CatSexo> lista = dcGlobal.GetTable<CatSexo>().Where(predicateSexo).ToList();
                CatSexo catTemp = new CatSexo();            
                this.ddlSexo.DataTextField = "strValor";
                this.ddlSexo.DataValueField = "id";
                this.ddlSexo.DataSource = lista;
                this.ddlSexo.DataBind();
            }
            catch (Exception)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }

        #endregion

        #region Metodos

        public void setItem(ref DropDownList _control, String _value)
        {
            foreach (ListItem item in _control.Items)
            {
                if (item.Value == _value)
                {
                    item.Selected = true;
                    break;
                }
            }
            _control.Items.FindByText(_value).Selected = true;
        }

        #endregion

        public bool validar(UTTT.Ejemplo.Linq.Data.Entity.Persona _persona, ref String _mensaje)
        {
            if (_persona.idCatSexo == -1)
            {
                _mensaje = "Seleccione un tipo de sexo";
                return false;
            }

            int i = 0;
            if (int.TryParse(_persona.strClaveUnica, out i ) == false)
            {
                _mensaje = "La clave única debe ser formato numerico";
                return false;
            }

            if (int.Parse(_persona.strClaveUnica) < 1 || int.Parse(_persona.strClaveUnica) > 999)
            {
                _mensaje = "La clave única deber estar en el rango entre 1-999";
                return false;
            }

            if (_persona.strNombre.Equals(String.Empty))
            {
                _mensaje = "El Nombre esta vacío";
                return false;
            }

            if (_persona.strNombre.Length > 50 || _persona.strAPaterno.Length > 50 || _persona.strAMaterno.Length > 50)
            {
                _mensaje = "El número máximo de caracteres permitidos en Nombre, A Paterno y A Materno es 50";
                return false;
            }

            return true;





        }
    }
}