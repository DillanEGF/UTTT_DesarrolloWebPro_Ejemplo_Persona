<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.UsuarioManager" %>

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
                                    <div class="d-flex align-items-center mb-3 pb-1">
                                        
                                        <span class="h1 fw-bold mb-0">Usuario</span>
                                    </div>
                                    <asp:Label ID="lblAccion" runat="server" Text="Agregar" class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;" Font-Bold="True"></asp:Label>
                                    
                                    <asp:Label ID="lblMensaje" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>

                                    <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtNombre" runat="server" type="text" class="form-control form-control-lg" ></asp:TextBox>
                                        <label class="form-label">Nombre de Usuario</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombre" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtPass" runat="server" type="password" class="form-control form-control-lg" ></asp:TextBox>
                                        <label class="form-label" >Contraseña</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtPass"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <div class="input-group-prepend">
                                            <div class="form-outline mb-4">
                                                
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <div>
                                                        <label class="form-label col-2" >Status</label>
                                                        <asp:DropDownList ID="ddlStatus" runat="server" Width="210px" class="btn btn-secondary dropdown-toggle"></asp:DropDownList>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlStatus" EventName="SelectedIndexChanged"/>
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <div class="input-group-prepend">
                                            <div class="form-outline mb-4">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <div>
                                                        <label class="form-label col-2" >Perfil </label>
                                                        <asp:DropDownList ID="ddlPerfil" runat="server" Width="210px" class="btn btn-secondary dropdown-toggle"></asp:DropDownList>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlPerfil" EventName="SelectedIndexChanged"/>
                                                </Triggers>
                                            </asp:UpdatePanel>
                                                
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <div class="input-group-prepend">
                                            <div class="form-outline mb-4">
                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                <ContentTemplate>
                                                    <div>
                                                        <label class="form-label col-2" >Empleado</label>
                                                        <asp:DropDownList ID="ddlEmpleado" runat="server" Width="210px" class="btn btn-secondary dropdown-toggle"></asp:DropDownList>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlEmpleado" EventName="SelectedIndexChanged"/>
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="pt-1 mb-4 row">
                                        <div class="col-3">
                                            <asp:Button ID="Button1" runat="server" Text="Agregar" class="btn btn-primary btn-lg btn-block" OnClick="btnAceptar_Click" type="button" />
                                        </div>
                                        <div class="col-3">
                                            <asp:Button ID="Button2" runat="server" Text="Cancelar" class="btn btn-danger btn-lg btn-block" OnClick="btnCancelar_Click" type="button" CausesValidation="False" />
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
