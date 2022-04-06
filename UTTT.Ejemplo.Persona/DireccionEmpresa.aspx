<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DireccionEmpresa.aspx.cs" Inherits="UTTT.Ejemplo.Persona.DirecciónEmpresa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
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
                                <h2>
                                    <a href="EmpresaPrincipal.aspx" class="text-black">
                                            <i class="bi bi-arrow-left-circle-fill"></i>
                                    </a>
                                </h2>
                                
                                <form runat="server">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                    
                                    <div class="d-flex align-items-center mt-5 mb-3 pb-1">
                                        <span class="h1 fw-bold mb-0">Direccion</span>
                                    </div>
                                    
                                    <asp:Label ID="lblMensaje" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
                                    <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtCalle" runat="server" type="text" class="form-control form-control-lg" ></asp:TextBox>
                                        <label class="form-label">Calle</label>
                                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtCalle"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtColonia" runat="server" type="text" class="form-control form-control-lg" ></asp:TextBox>                                      
                                        <label class="form-label" >Colonia</label>
                                        <asp:RequiredFieldValidator ID="rfvTel" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtColonia"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtMunicipio" runat="server" type="text" class="form-control form-control-lg" ></asp:TextBox>                                      
                                        <label class="form-label" >Municipio</label>
                                       <asp:RegularExpressionValidator ID="revNombre" runat="server" onpaste="return false" ControlToValidate="txtMunicipio" ErrorMessage="*Solo se permite el uso letras y espacios" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtMunicipio"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <div class="row">   
                                            <div class="col-4">
                                                <asp:TextBox ID="txtCP" runat="server" type="text" class="form-control form-control-lg" MaxLength="8"></asp:TextBox>                                      
                                                <label class="form-label" >CP</label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtCP"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCP" ErrorMessage="Solo se permiten numeros" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                                                
                                                
                                            </div>
                                            <div class="col-4">
                                                <asp:TextBox ID="txtNumInt" runat="server" type="text" class="form-control form-control-lg" MaxLength="8"></asp:TextBox>                                      
                                                <label class="form-label" >Número Interior</label>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNumInt" ErrorMessage="Solo se permiten numeros" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>

                                            </div>
                                            <div class="col-4">
                                                <asp:TextBox ID="txtNumExt" runat="server" type="text" class="form-control form-control-lg" MaxLength="8" ></asp:TextBox>                                      
                                                <label class="form-label" >Número Exterior</label>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtNumExt" ErrorMessage="Solo se permiten numeros" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>

                                            </div>
                                    </div>
                                        </div>

                                    <div class="pt-1 mb-4 row">
                                        <div class="col-3 offset-6">
                                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" class="btn btn-outline-dark btn-lg" OnClick="Guardar_clic" type="button" />
                                        </div>
                                        <div class="col-3 ">
                                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" class="btn btn-outline-danger btn-lg" OnClick="Cancelar_clic" type="button" CausesValidation="False" />
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
