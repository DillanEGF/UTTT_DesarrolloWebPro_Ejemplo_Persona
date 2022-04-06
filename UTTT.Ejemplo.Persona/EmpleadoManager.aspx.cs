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
    public partial class EmpleadoManager : System.Web.UI.Page
    {
        #region Variables

        private SessionManager session = new SessionManager();
        private int idUsuario = 0;
        private UTTT.Ejemplo.Linq.Data.Entity.EmpEmpleado baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();
        private int tipoAccion = 0;

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                this.Response.Buffer = true;
                this.session = (SessionManager)this.Session["SessionManager"];
                this.idUsuario = this.session.Parametros["idUsuario"] != null ?
                int.Parse(this.session.Parametros["idUsuario"].ToString()) : 0;

                if (this.idUsuario == 0)
                {
                    this.baseEntity = new Linq.Data.Entity.EmpEmpleado();
                    this.tipoAccion = 1;
                }
                else
                {
                    this.baseEntity = dcGlobal.GetTable<EmpEmpleado>().First(c => c.id == this.idUsuario);
                    this.tipoAccion = 2;
                }

                if (!this.IsPostBack)
                {
                    if (this.session.Parametros["baseEntity"] == null)
                    {
                        this.session.Parametros.Add("baseEntity", this.baseEntity);
                    }
                    List<CatSexo> lista = dcGlobal.GetTable<CatSexo>().ToList();
                    this.ddlSexo.DataTextField = "strValor";
                    this.ddlSexo.DataValueField = "idSexo";

                    List<CatEstadoCivil> listaP = dcGlobal.GetTable<CatEstadoCivil>().ToList();
                    this.ddlEstadocivil.DataTextField = "strValor";
                    this.ddlEstadocivil.DataValueField = "id";

                    List<OrgCatPuesto> listaE = dcGlobal.GetTable<OrgCatPuesto>().ToList();
                    this.ddlPuesto.DataTextField = "strValor";
                    this.ddlPuesto.DataValueField = "id";

                    List<CatDireccion> listaD = dcGlobal.GetTable<CatDireccion>().ToList();
                    this.ddlDireccion.DataTextField = "strCalle";
                    this.ddlDireccion.DataValueField = "id";

                    List<OrgCatDepto> listaDep = dcGlobal.GetTable<OrgCatDepto>().ToList();
                    this.ddlDepto.DataTextField = "strValor";
                    this.ddlDepto.DataValueField = "id";

                    if (this.idUsuario == 0)
                    {
                        this.lblAccion.Text = "Agregar";
                        CatSexo sexoTmp = new CatSexo();
                        sexoTmp.idSexo = -1;
                        sexoTmp.strValor = "Seleccionar";
                        lista.Insert(0, sexoTmp);
                        this.ddlSexo.DataSource = lista;
                        this.ddlSexo.DataBind();

                        CatEstadoCivil estadoTmp = new CatEstadoCivil();
                        estadoTmp.id = -1;
                        estadoTmp.strValor = "Seleccionar";
                        listaP.Insert(0, estadoTmp);
                        this.ddlEstadocivil.DataSource = listaP;
                        this.ddlEstadocivil.DataBind();

                        OrgCatPuesto puestoTmp = new OrgCatPuesto();
                        puestoTmp.id = -1;
                        puestoTmp.strValor = "Seleccionar";
                        listaE.Insert(0, puestoTmp);
                        this.ddlPuesto.DataSource = listaE;
                        this.ddlPuesto.DataBind();

                        CatDireccion direccionTmp = new CatDireccion();
                        direccionTmp.id = -1;
                        direccionTmp.strCalle = "Seleccionar";
                        listaD.Insert(0, direccionTmp);
                        this.ddlDireccion.DataSource = listaD;
                        this.ddlDireccion.DataBind();

                        OrgCatDepto deptoTmp = new OrgCatDepto();
                        deptoTmp.id = -1;
                        deptoTmp.strValor = "Seleccionar";
                        listaDep.Insert(0, deptoTmp);
                        this.ddlDepto.DataSource = listaDep;
                        this.ddlDepto.DataBind();


                    }
                    else
                    {
                        this.lblAccion.Text = "Editar";
                        this.txtNombre.Text = this.baseEntity.strNombre;
                        this.txtApellidoP.Text = this.baseEntity.strApellidoP;
                        this.txtapellidoM.Text = this.baseEntity.strApellidoM;
                        this.txtCURP.Text = this.baseEntity.strCURP;
                        this.txtNSS.Text = this.baseEntity.strNSS;
                        this.txtTelefono.Text = this.baseEntity.intTelefono.ToString();
                        this.txtEmail.Text = this.baseEntity.strEmail;

                        this.ddlSexo.DataSource = lista;
                        this.ddlSexo.DataBind();
                        this.setItem(ref this.ddlSexo, baseEntity.CatSexo.strValor);

                        this.ddlEstadocivil.DataSource = listaP;
                        this.ddlEstadocivil.DataBind();
                        this.setItem(ref this.ddlEstadocivil, baseEntity.CatEstadoCivil.strValor);

                        this.ddlPuesto.DataSource = listaE;
                        this.ddlPuesto.DataBind();
                        this.setItem(ref this.ddlPuesto, baseEntity.OrgCatPuesto.strValor);

                        this.ddlDireccion.DataSource = listaD;
                        this.ddlDireccion.DataBind();
                        this.setItem(ref this.ddlDireccion, baseEntity.CatDireccion.strCalle);

                        this.ddlDepto.DataSource = listaDep;
                        this.ddlDepto.DataBind();
                        this.setItem(ref this.ddlDepto, baseEntity.OrgCatDepto.strValor);
                    }
                    
                }

            }
            catch (Exception _e)
            {
                this.showMessageException(_e.Message);

            }

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            String mensaje = "";
            try
            {
                ///Validaciones
                if (!Page.IsValid)
                {
                    return;
                }

                DataContext dcGuardar = new DcGeneralDataContext();
                UTTT.Ejemplo.Linq.Data.Entity.EmpEmpleado emp = new Linq.Data.Entity.EmpEmpleado();
                if (this.idUsuario == 0)
                {
                    emp.strNombre = this.txtNombre.Text.Trim();
                    emp.strApellidoP = this.txtApellidoP.Text.Trim();
                    emp.strApellidoM = this.txtapellidoM.Text.Trim();
                    emp.strCURP = this.txtCURP.Text.Trim();
                    emp.strNSS = this.txtNSS.Text.Trim();
                    emp.strEmail = this.txtEmail.Text.Trim();
                    emp.intTelefono = int.Parse(this.txtTelefono.Text.Trim());

                    emp.idCatSexo = int.Parse(this.ddlSexo.Text);
                    emp.idCatEstadoCivil = int.Parse(this.ddlEstadocivil.Text);
                    emp.idOrgCatPuesto = int.Parse(this.ddlPuesto.Text);
                    emp.idCatDireccion = int.Parse(this.ddlDireccion.Text);
                    emp.idOrgCatDepto = int.Parse(this.ddlDepto.Text);

                    //Aqui se deja vacio un campo de los ddl
                    //if (emp.idEmpEmpleado < 0)
                    //{
                    //    emp.idEmpEmpleado = null;
                    //}

                    //Aquí se validan los datos desde el código
                    

                    if (!this.validar(emp, ref mensaje))
                    {
                        this.lblMensaje.Text = mensaje;
                        this.lblMensaje.Visible = true;
                        return;
                    }
                    else
                    {
                        dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.EmpEmpleado>().InsertOnSubmit(emp);
                        dcGuardar.SubmitChanges();
                        this.showMessage("El registro se agrego correctamente.");
                        this.Response.Redirect("~/EmpleadoPrincipal.aspx", false);
                    }



                }

                if (this.idUsuario > 0)
                {
                    
                        emp = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.EmpEmpleado>().First(c => c.id == idUsuario);
                        emp.strNombre = this.txtNombre.Text.Trim();
                        emp.strApellidoP = this.txtApellidoP.Text.Trim();
                        emp.strApellidoM = this.txtapellidoM.Text.Trim();
                        emp.strCURP = this.txtCURP.Text.Trim();
                        emp.strEmail = this.txtEmail.Text.Trim();
                        emp.strNSS = this.txtNSS.Text.Trim();
                        emp.intTelefono = int.Parse(this.txtTelefono.Text.Trim());

                        emp.idCatSexo = int.Parse(this.ddlSexo.Text);
                        emp.idCatEstadoCivil = int.Parse(this.ddlEstadocivil.Text);
                        emp.idCatDireccion = int.Parse(this.ddlDireccion.Text);
                        emp.idOrgCatPuesto = int.Parse(this.ddlPuesto.Text);
                        emp.idOrgCatDepto = int.Parse(this.ddlDepto.Text);


                    if (!this.validar(emp, ref mensaje))
                    {
                        this.lblMensaje.Text = mensaje;
                        this.lblMensaje.Visible = true;
                        return;
                    }
                    else
                    {

                        dcGuardar.SubmitChanges();
                        this.showMessage("El registro se edito correctamente.");
                        this.Response.Redirect("~/EmpleadoPrincipal.aspx", false);

                    }


                }
            }
            catch (Exception _e)
            {
                this.showMessageException(_e.Message);

            }
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
                    this.Response.Redirect("~/EmpleadoPrincipal.aspx", false);
                }
                else if (this.idUsuario > 0)
                {
                    this.Response.Redirect("~/EmpleadoPrincipal.aspx", false);
                }
            }


            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }
        public bool validar(UTTT.Ejemplo.Linq.Data.Entity.EmpEmpleado _emp, ref String _mensaje)
        {
            if (_emp.idCatSexo == -1)
            {
                _mensaje = "Seleccione un sexo";
                return false;
            }


            if (_emp.idCatEstadoCivil == -1)
            {
                _mensaje = "Seleccione un estado civil";
                return false;
            }

            if (_emp.idOrgCatPuesto == -1)
            {
                _mensaje = "Seleccione un puesto";
                return false;
            }

            if (_emp.idCatDireccion == -1)
            {
                _mensaje = "Seleccione una dirección";
                return false;
            }

            if (_emp.idOrgCatDepto == -1)
            {
                _mensaje = "Seleccione un departamento";
                return false;
            }

            if (_emp.strNombre.Equals(String.Empty))
            {
                _mensaje = "El Nombre esta vacío";
                return false;
            }

            if (_emp.strApellidoP.Equals(String.Empty))
            {
                _mensaje = "El apellido P esta vacía";
                return false;
            }

            if (_emp.strApellidoM.Equals(String.Empty))
            {
                _mensaje = "El apellido M esta vacía";
                return false;
            }

            if (_emp.strCURP.Equals(String.Empty))
            {
                _mensaje = "El CURP esta vacío";
                return false;
            }

            if (_emp.strNSS.Equals(String.Empty))
            {
                _mensaje = "El NSS esta vacío";
                return false;
            }

            if (_emp.intTelefono.Equals(String.Empty))
            {
                _mensaje = "El Telefono esta vacío";
                return false;
            }

            if (_emp.strEmail.Equals(String.Empty))
            {
                _mensaje = "El Email esta vacío";
                return false;
            }

            return true;

        }
    }
}