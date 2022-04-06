<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CambiarPass.aspx.cs" Inherits="UTTT.Ejemplo.Persona.CambiarPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <section class="vh-100" style="background-color: rgba(7, 33, 86, 0.89);">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;">
                    <div class="row g-0">
                        <div class="col-md-6 col-lg-5 d-none d-md-block mt-5">
                            <img src="Images/img.jpg" alt="login form" class="img-fluid"/>
                        </div>
                        <div class="col-md-6 col-lg-7 d-flex align-items-center">
                            <div class="card-body p-4 p-lg-5 text-black">

                                <form runat="server">


                                    <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Cambiar contraseña</h5>

                                    <div class="form-outline mb-4">
                                    <asp:Label ID="lblMensaje" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>

                                        <asp:TextBox ID="txtPass" runat="server" type="password" class="form-control form-control-lg" ></asp:TextBox>
                                        <label class="form-label" for="form2Example27">Escribe tu nueva contraseña</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtPass"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtPass2" runat="server" type="password" class="form-control form-control-lg" ></asp:TextBox>
                                        <label class="form-label" for="form2Example27">Confirma tu contraseña</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtPass2"></asp:RequiredFieldValidator>

                                    </div>

                                    <div class="pt-1 mb-4 row">
                                        <div class="col-3 offset-5">
                                            <asp:Button ID="Button1" runat="server" Text="Ingresar" class="btn btn-dark btn-lg btn-block" type="button" OnClick="btnAceptar_Click" />
                                        </div>
                                        <div class="col-2 offset-1">
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
</section>
</body>
</html>
