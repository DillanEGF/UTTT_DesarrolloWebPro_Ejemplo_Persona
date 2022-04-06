<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuscarUsuario.aspx.cs" Inherits="UTTT.Ejemplo.Persona.RecuperarContraseñaForms.BuscarUsuario" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
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
                                    
                                    <h3>
                                    <asp:Label ID="lblAccion" runat="server" Text="Recuperar Contraseña" class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;" Font-Bold="True"></asp:Label>

                                    </h3>

                                    
                                    <asp:Label ID="lblMensaje" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>

                                    <div class="form-outline mt-5 mb-3">
                                        <asp:TextBox ID="txtNombre" runat="server" type="text" class="form-control form-control-lg" ></asp:TextBox>
                                        <label class="form-label">Nombre de Usuario</label>
                                    </div>

                                    <div class="pt-1 mb-4 row">
                                        <div class="col-3 offset-5">
                                            <asp:Button ID="Button1" runat="server" Text="Aceptar" class="btn btn-dark btn-lg btn-block" OnClick="btnAceptar_Click" type="button" />
                                        </div>
                                        <div class="col-2">
                                            <asp:Button ID="Button2" runat="server" Text="Cancelar" class="btn btn-light btn-lg btn-block" OnClick="btnCancelar_Click" type="button" CausesValidation="False" />
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
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>

