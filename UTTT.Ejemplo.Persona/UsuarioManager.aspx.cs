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
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class UsuarioManager : System.Web.UI.Page
    {
        #region Variables

        private SessionManager session = new SessionManager();
        private int idUsuario = 0;
        private UTTT.Ejemplo.Linq.Data.Entity.Usuario baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();
        private int tipoAccion = 0;
        String mensaje = "";

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                this.Response.Buffer = true;
                this.session = (SessionManager)this.Session["SessionManager"];
                this.idUsuario = this.session.Parametros["idUsuario"] != null ?
                int.Parse(this.session.Parametros["idUsuario"].ToString()) : 0;

                if (this.idUsuario <= 0)
                {
                    this.baseEntity = new Linq.Data.Entity.Usuario();
                    this.tipoAccion = 1;
                }
                else
                {
                    this.baseEntity = dcGlobal.GetTable<Usuario>().First(c => c.id == this.idUsuario);
                    this.tipoAccion = 2;
                }

                if (!this.IsPostBack)
                {
                    if (this.session.Parametros["baseEntity"] == null)
                    {
                        this.session.Parametros.Add("baseEntity", this.baseEntity);
                    }
                    List<SegCatStatus> lista = dcGlobal.GetTable<SegCatStatus>().ToList();
                    this.ddlStatus.DataTextField = "strValor";
                    this.ddlStatus.DataValueField = "id";

                    List<Perfil> listaP = dcGlobal.GetTable<Perfil>().ToList();
                    this.ddlPerfil.DataTextField = "strNombre";
                    this.ddlPerfil.DataValueField = "idPerfil";

                    List<EmpEmpleado> listaE = dcGlobal.GetTable<EmpEmpleado>().ToList();
                    this.ddlEmpleado.DataTextField = "strNombre";
                    this.ddlEmpleado.DataValueField = "id";

                    if (this.idUsuario <= 0)
                    {
                        this.lblAccion.Text = "Agregar";
                        SegCatStatus statusTemp = new SegCatStatus();
                        statusTemp.id = -1;
                        statusTemp.strValor = "Seleccionar";
                        lista.Insert(0, statusTemp);
                        this.ddlStatus.DataSource = lista;
                        this.ddlStatus.DataBind();

                        Perfil perfilTemp = new Perfil();
                        perfilTemp.idPerfil = -1;
                        perfilTemp.strNombre = "Seleccionar";
                        listaP.Insert(0, perfilTemp);
                        this.ddlPerfil.DataSource = listaP;
                        this.ddlPerfil.DataBind();

                        EmpEmpleado empTemp = new EmpEmpleado();
                        empTemp.id = -1;
                        empTemp.strNombre = "Seleccionar";
                        listaE.Insert(0, empTemp);
                        this.ddlEmpleado.DataSource = listaE;
                        this.ddlEmpleado.DataBind();
                    }
                    else
                    {
                        this.lblAccion.Text = "Editar";
                        this.txtNombre.Text = this.baseEntity.strNombreUsuario;
                        this.txtPass.Text = this.baseEntity.strPass;
                        this.ddlStatus.DataSource = lista;
                        this.ddlStatus.DataBind();
                        this.setItem(ref this.ddlStatus, baseEntity.SegCatStatus.strValor);

                        this.ddlPerfil.DataSource = listaP;
                        this.ddlPerfil.DataBind();
                        this.setItem(ref this.ddlPerfil, baseEntity.Perfil.strNombre);

                        this.ddlEmpleado.DataSource = listaE;
                        this.ddlEmpleado.DataBind();
                        this.setItem(ref this.ddlEmpleado, baseEntity.EmpEmpleado.strNombre);
                    }
                    this.ddlStatus.SelectedIndexChanged += new EventHandler(ddlStatus_SelectedIndexChanged);
                    this.ddlStatus.AutoPostBack = true;
                }

            }
            catch (Exception _e)
            {

            }

        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                int id = int.Parse(this.ddlStatus.Text);
                Expression<Func<SegCatStatus, bool>> predicateStatus = c => c.id == id;
                predicateStatus.Compile();
                List<SegCatStatus> lista = dcGlobal.GetTable<SegCatStatus>().Where(predicateStatus).ToList();
                CatSexo catTemp = new CatSexo();
                this.ddlStatus.DataTextField = "strValor";
                this.ddlStatus.DataValueField = "id";
                this.ddlStatus.DataSource = lista;
                this.ddlStatus.DataBind();
            }
            catch (Exception)
            {
                this.showMessage("Ha ocurrido un error inesperado");
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
                UTTT.Ejemplo.Linq.Data.Entity.Usuario usuario = new Linq.Data.Entity.Usuario();
                if (this.idUsuario <= 0)
                {
                    usuario.strNombreUsuario = this.txtNombre.Text.Trim();
                    usuario.strPass = encrypt(this.txtPass.Text.Trim());
                    usuario.idSegCatStatus = int.Parse(this.ddlStatus.Text);
                    usuario.idSegCatPerfil = int.Parse(this.ddlPerfil.Text);
                    usuario.idEmpEmpleado = int.Parse(this.ddlEmpleado.Text);

                    if (usuario.idEmpEmpleado<0)
                    {
                        usuario.idEmpEmpleado = null;
                    }

                    //Aquí se validan los datos desde el código
                    

                    if (!this.validar(usuario, ref mensaje))
                    {
                        this.lblMensaje.Text = mensaje;
                        this.lblMensaje.Visible = true;
                        return;
                    }

                    if (validarUsuario(usuario))
                    {
                        dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().InsertOnSubmit(usuario);
                        dcGuardar.SubmitChanges();
                        this.showMessage("El registro se agrego correctamente.");
                        if (idUsuario==0)
                        {
                            this.Response.Redirect("~/Login.aspx", false);
                        }
                        else
                        {
                            this.Response.Redirect("~/UsuarioPrincipal.aspx", false);
                        }
                        

                    }
                    else
                    {
                        this.lblMensaje.Text = "Este usuario ya esta registrado";
                        this.lblMensaje.Visible = true;
                        return;
                    }



                }
                if (this.idUsuario > 0)
                {
                    usuario = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().First(c => c.id == idUsuario);
                    usuario.strNombreUsuario = this.txtNombre.Text.Trim();
                    usuario.strPass = encrypt(this.txtPass.Text.Trim());
                    usuario.idSegCatStatus = int.Parse(this.ddlStatus.Text);
                    usuario.idSegCatPerfil = int.Parse(this.ddlPerfil.Text);
                    usuario.idEmpEmpleado = int.Parse(this.ddlEmpleado.Text);

                    if (!this.validar(usuario, ref mensaje))
                    {
                        this.lblMensaje.Text = mensaje;
                        this.lblMensaje.Visible = true;
                        return;
                    }
                    else
                    {
                        
                        dcGuardar.SubmitChanges();
                        this.showMessage("El registro se edito correctamente.");
                        this.Response.Redirect("~/Inicio.aspx", false);
                    }


                }
            }
            catch (Exception _e)
            {
                this.showMessageException(_e.Message);

            }
        }

        public bool validarUsuario(Usuario user)
        {
            bool resp = false;

            DataContext datos = new DcGeneralDataContext();

            try
            {
                if (datos.GetTable<Usuario>().First(c => c.strNombreUsuario == user.strNombreUsuario) != null)
                {
                    resp = false;
                }
            }
            catch (Exception)
            {
                resp = true;
            }

            
            return resp;
        }

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

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.idUsuario == 0)
                {
                    this.Response.Redirect("~/Login.aspx", false);
                }
                else if (this.idUsuario < 0 || this.idUsuario > 0)
                {
                    this.Response.Redirect("~/UsuarioPrincipal.aspx", false);
                }
            }


            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
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

        public bool validar(UTTT.Ejemplo.Linq.Data.Entity.Usuario _usuario, ref String _mensaje)
        {
            if (_usuario.idSegCatStatus == -1)
            {
                _mensaje = "Seleccione un status";
                return false;
            }


            if (_usuario.idSegCatPerfil == -1)
            {
                _mensaje = "Seleccione un perfil";
                return false;
            }

            if (_usuario.strNombreUsuario.Equals(String.Empty))
            {
                _mensaje = "El Nombre esta vacío";
                return false;
            }

            if (_usuario.strPass.Equals(String.Empty))
            {
                _mensaje = "La clave esta vacía";
                return false;
            }

            return true;

        }
    }
}