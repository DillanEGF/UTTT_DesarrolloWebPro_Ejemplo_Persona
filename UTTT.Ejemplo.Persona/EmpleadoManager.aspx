<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpleadoManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.EmpleadoManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;">
                    <div class="row g-0">
                        <div class="col-md-12 col-lg-12 d-flex align-items-center">
                            <div class="card-body p-4 p-lg-5 text-black">
                                <form runat="server">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                                    <div class="d-flex align-items-center mt-5 mb-4 pb-1">
                                        <span class="h1 fw-bold mb-0">Empleado</span>
                                    </div>
                                    <asp:Label ID="lblAccion" runat="server" Text="Agregar" class="fw-bold mb-3 pb-3" style="letter-spacing: 1px;" Font-Bold="True"></asp:Label>

                                    <asp:Label ID="lblMensaje" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>

                                    <hr />

                                    <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtNombre" runat="server" type="text" class="form-control form-control-lg" ></asp:TextBox>
                                        <label class="form-label">Nombre</label>
                                        <asp:RegularExpressionValidator ID="revNombre" runat="server" onpaste="return false" ControlToValidate="txtNombre" ErrorMessage="*Solo se permite el uso letras y espacios" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombre" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtApellidoP" runat="server" type="text" class="form-control form-control-lg" ></asp:TextBox>
                                        <label class="form-label">Apellido Paterno</label>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" onpaste="return false" ControlToValidate="txtApellidoP" ErrorMessage="*Solo se permite el uso letras y espacios" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtApellidoP" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                                    </div>

                                     <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtapellidoM" runat="server" type="text" class="form-control form-control-lg" ></asp:TextBox>
                                        <label class="form-label">Apellido Materno</label>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" onpaste="return false" ControlToValidate="txtApellidoM" ErrorMessage="*Solo se permite el uso letras y espacios" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtApellidoM" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                                    </div>

                                     <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtCURP" runat="server" type="text" class="form-control form-control-lg" ></asp:TextBox>
                                        <label class="form-label">CURP</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCURp" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="revCURP" runat="server" ControlToValidate="txtCURP" ErrorMessage="*La CURP es incorrecta" ValidationExpression="^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)"></asp:RegularExpressionValidator>
                                    </div>

                                     <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtNSS" runat="server" type="text" class="form-control form-control-lg" ></asp:TextBox>
                                        <label class="form-label">NSS</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtNSS" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                                    </div>

                                     <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtTelefono" MaxLength="8" runat="server" type="text" class="form-control form-control-lg" ></asp:TextBox>
                                        <label class="form-label">Telefono</label>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Solo se permiten numeros" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                                    </div>

                                     <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtEmail" runat="server" type="text" class="form-control form-control-lg" ></asp:TextBox>
                                        <label class="form-label">Email</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                                    </div>                        

                                    <div class="row">

                                    <div class="form-outline mb-4 col-5">
                                        <div class="input-group-prepend">
                                            <div class="form-outline mb-4">

                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                        <div>
                                                            <label class="form-label col-2">Sexo</label>
                                                            <asp:DropDownList ID="ddlSexo" runat="server" Width="210px" class="btn btn-secondary dropdown-toggle"></asp:DropDownList>
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="ddlSexo" EventName="SelectedIndexChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-outline mb-4 col-7"  >
                                        <div class="input-group-prepend">
                                            <div class="form-outline mb-4">

                                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                    <ContentTemplate>
                                                        <div>
                                                            <label class="form-label col-3">EstadoCivil</label>
                                                            <asp:DropDownList ID="ddlEstadocivil" runat="server" Width="210px" class="btn btn-secondary dropdown-toggle"></asp:DropDownList>
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="ddlEstadocivil" EventName="SelectedIndexChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>

                                            </div>
                                        </div>
                                    </div>

                                    </div>


                                    <div class="row">
                                    <div class="form-outline mb-4 col-5">
                                        <div class="input-group-prepend">
                                            <div class="form-outline mb-4">

                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <div>
                                                            <label class="form-label col-2">Puesto</label>
                                                            <asp:DropDownList ID="ddlPuesto" runat="server" Width="210px" class="btn btn-secondary dropdown-toggle"></asp:DropDownList>
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="ddlPuesto" EventName="SelectedIndexChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-outline mb-4 col-7">
                                        <div class="input-group-prepend">
                                            <div class="form-outline mb-4">

                                               <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                    <ContentTemplate>
                                                        <div>
                                                            <label class="form-label col-3">Departamento</label>
                                                            <asp:DropDownList ID="ddlDepto" runat="server" Width="210px" class="btn btn-secondary dropdown-toggle"></asp:DropDownList>
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="ddlDepto" EventName="SelectedIndexChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>

                                            </div>
                                        </div>
                                    </div>

                                    </div>

                                    <div class="row">

                                    <div class="form-outline mb-4 col-5 offset-2">
                                        <div class="input-group-prepend">
                                            <div class="form-outline mb-4">

                                               <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                    <ContentTemplate>
                                                        <div>
                                                            <label class="form-label col-3">Direccion</label>
                                                            <asp:DropDownList ID="ddlDireccion" runat="server" Width="210px" class="btn btn-secondary dropdown-toggle"></asp:DropDownList>
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="ddlDireccion" EventName="SelectedIndexChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>

                                            </div>
                                        </div>
                                    </div>

                                        </div>

                                    


                                    <div class="pt-1 mb-4 row">
                                        <div class="col-3">
                                            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" class="btn btn-primary btn-lg btn-block" OnClick="btnAceptar_Click" type="button" />
                                        </div>
                                        <div class="col-3">
                                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" class="btn btn-danger btn-lg btn-block" OnClick="btnCancelar_Click" type="button" CausesValidation="False" />
                                        </div>
                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
