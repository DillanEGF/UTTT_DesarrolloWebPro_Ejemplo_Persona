<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DireccionPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.DireccionPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

    <title></title>
</head>
<body>
    <div class="container mt-3">
        <div class="row">
            <div class="col">
                <ul class="nav nav-pills">
                <li class="nav-item">
                    <a class="nav-link active" href="Inicio.aspx">Logo</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Operaciones</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Consultar</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Procesos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled">Configuración</a>
                </li>
            </ul>
            </div>
            <div class="col">
                <ul class="nav justify-content-end">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Cajas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Notificaciones</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Usuario</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Perfil</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="Login.aspx">Cerrar sesión</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            
        </div>
    </div>
    <hr />
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;">
                    <div class="row g-0">
                        <div class="col-md-12 col-lg-12 d-flex align-items-center">
                            <div class="card-body p-4 p-lg-5 text-black">
                                <h2>
                                    <a href="Inicio.aspx" class="text-black">
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
                                        <asp:TextBox ID="txtNombre" runat="server" type="text" class="form-control form-control-lg" ></asp:TextBox>
                                        <label class="form-label">Nombre de Empresa</label>
                                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtTelefono" runat="server" type="text" class="form-control form-control-lg" MaxLength="10" onkeypress="return validarNum(val);" ></asp:TextBox>                                      
                                        <label class="form-label" >Telefono</label>
                                        <asp:RequiredFieldValidator ID="rfvTel" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtTelefono"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Solo se permiten numeros" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtEmail" runat="server" type="email" class="form-control form-control-lg" ></asp:TextBox>                                      
                                        <label class="form-label" >Email</label>
                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                                    </div>

                                    <hr />

                                    <div class="d-flex align-items-center mt-3 mb-5 pb-1">
                                        <span class="h4 fw-light mb-0">Dirección&nbsp;&nbsp;&nbsp; </span>
                                        &nbsp;<asp:Button ID="Button1" runat="server" Text="Editar" class="btn btn-outline-dark" type="button" />

                                    </div>

                                    <div class="form-outline mb-4">
                                        <asp:Label ID="lblCalle" class="form-label" runat="server" Text=""></asp:Label>
                                        <label class="form-label" >Calle</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <asp:Label ID="lblColonia" class="form-label" runat="server" Text=""></asp:Label>
                                        <label class="form-label" >Colonia</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <asp:Label ID="lblMunicipio" class="form-label" runat="server" Text=""></asp:Label>
                                        <label class="form-label" >Municipio</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <div class="row">   
                                            <div class="col-4">
                                                <asp:Label ID="lblCP" class="form-label" runat="server" Text=""></asp:Label>
                                                <label class="form-label" >CP</label>
                                            </div>
                                            <div class="col-4">
                                                <asp:Label ID="lblNumInt" class="form-label" runat="server" Text=""></asp:Label>
                                                <label class="form-label" >Número Interior</label>
                                            </div>
                                            <div class="col-4">
                                                <asp:Label ID="lblNumExt" class="form-label" runat="server" Text=""></asp:Label>
                                                <label class="form-label" >Número Exterior</label>
                                            </div>
                                        </div>
                                    </div>
                                    <hr />


                                    <div class="pt-1 mb-4 row">
                                        <div class="col-3 offset-8">
                                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" class="btn btn-outline-success btn-lg" type="button" />
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
