<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpresaPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.EmpresaPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"/>
    <title></title>
    <script type="text/javascript">
        function $validarNum(val) {
            //función encargada de validar la inserción de numeros en un textBox
            var regex = new RegExp("^[0-9]+$");
            var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
            if (!regex.test(key)) {
                event.preventDefault();
                return false;
            }
        }
    </script>
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
                                    
                                </h2>
                                
                                <form runat="server">

                                    <asp:Button OnClick="cancelar" runat="server" class="btn btn-dark" Text="regresar"/>

                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                    
                                    <div class="d-flex align-items-center mt-5 mb-3 pb-1">
                                        <span class="h1 fw-bold mb-0">Datos de Empresa</span>
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
                                        &nbsp;<asp:Button ID="Button1" runat="server" Text="Editar" class="btn btn-outline-dark " OnClick="editar_clic" type="button" />

                                    </div>

                                    <div class="form-outline mb-4">
                                        <label class="form-label" >Calle:</label>&nbsp;
                                        <asp:Label ID="lblCalle" class="form-label" runat="server" Text=""></asp:Label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <label class="form-label" >Colonia:</label>&nbsp;
                                        <asp:Label ID="lblColonia" class="form-label" runat="server" Text=""></asp:Label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <label class="form-label" >Municipio:</label>&nbsp;
                                        <asp:Label ID="lblMunicipio" class="form-label" runat="server" Text=""></asp:Label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <div class="row">   
                                            <div class="col-4">
                                                <label class="form-label" >CP:</label>&nbsp;
                                                <asp:Label ID="lblCP" class="form-label" runat="server" Text=""></asp:Label>
                                            </div>
                                            <div class="col-4">
                                                <label class="form-label" >Número Interior:</label>&nbsp;
                                                <asp:Label ID="lblNumInt" class="form-label" runat="server" Text=""></asp:Label>
                                            </div>
                                            <div class="col-4">
                                                <label class="form-label" >Número Exterior:</label>&nbsp;
                                                <asp:Label ID="lblNumExt" class="form-label" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <hr />


                                    <div class="pt-1 mb-4 row">
                                        <div class="col-3 offset-8">
                                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" class="btn btn-outline-success btn-lg" OnClick="Guardar_clic" type="button" />
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
