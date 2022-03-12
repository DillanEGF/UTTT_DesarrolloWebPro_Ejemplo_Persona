<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaManager" Debug="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>

    <script type="text/javascript">
        function validarNum(val) {
            //función encargada de validar la inserción de numeros en un textBox
            var regex = new RegExp("^[0-9]+$");
            var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
            if (!regex.test(key)) {
                event.preventDefault();
                return false;
            }
        }

        function val() {
            var claveUnica;
            claveUnica = document.getElementById("txtClaveUnica").value;
            if (claveUnica == "") {
                alert("campo vacio");
            }

        }

        $("").bind('keypress', function (event) {


        });

        function validarAlfa(val) {
            var regex = new RegExp("^[a-zA-Z0-9]+$");
            var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
            if (!regex.test(key)) {
                event.preventDefault();
                return false;
            }
        }

        function validarLet(val) {
            //función encargada de validar letras y espacios
            var regex = new RegExp("^[a-zA-Z ]+$");
            var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
            if (!regex.test(key)) {
                event.preventDefault();
                return false;
            }
        }
    </script>
</head>
<body>
    <div class="container">

        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div class="row justify-content-md-center">
                <div class="col col-lg-6 col-md-6 col-sm-12">
                    <div class="card mt-4">
                        <div class="card-header">
                            <h1><span class="card card-title badge badge-pill badge-primary">Persona</span></h1>
                        </div>

                        <div class="card-body">
                            <div class="row justify-content-center">
                                <div class="">
                                    <asp:Label ID="lblAccion" runat="server" Text="Agregar" Font-Bold="True"></asp:Label>
                                </div>
                            </div>
                            
                            <div>
                                    <div class="input-group-sm mb-3 mt-4">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Sexo:</span>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <div>
                                                        <asp:DropDownList ID="ddlSexo" runat="server" Width="200px" class="btn btn-secondary dropdown-toggle" ></asp:DropDownList>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlSexo" EventName="SelectedIndexChanged"/>
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                            </div>

                            <div class="justify-content-md-center mt-4">
                                <div>
                                    <div class="input-group-sm mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Clave Unica:</span>
                                            <asp:TextBox ID="txtClaveUnica" runat="server" Width="249px" onpaste="return false" pattern=".{1,3}" MaxLength="3" onkeypress="return validarNum(val);"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div>
                                        <asp:RequiredFieldValidator ID="rfvClaveUnica" runat="server" ControlToValidate="txtClaveUnica" ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="rvClaveUnica" runat="server" ControlToValidate="txtClaveUnica" ErrorMessage="*La Clave Unica debe estar entre 1 y 999" MaximumValue="999" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                                    </div>
                                </div>

                                <div>
                                    <div class="input-group-sm mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Nombre:</span>
                                            <asp:TextBox ID="txtNombre" runat="server" Width="249px" ViewStateMode="Disabled" onpaste="return false" onkeypress="return validarLet(val);"></asp:TextBox>                                            
                                        </div>
                                    </div>
                                    <div>
                                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" onpaste="return false" ControlToValidate="txtNombre" ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revNombre" runat="server" onpaste="return false" ControlToValidate="txtNombre" ErrorMessage="*Solo se permite el uso letras y espacios" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div>
                                    <div class="input-group-sm mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">A Paterno:</span>
                                            <asp:TextBox ID="txtAPaterno" runat="server" Width="249px" ViewStateMode="Disabled" onpaste="return false" onkeypress="return validarLet(val);"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div>
                                        <asp:RequiredFieldValidator ID="rfvAPaterno" runat="server" ControlToValidate="txtAPaterno" ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>                                        
                                        <asp:Label ID="lblMensaje" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
                                        <asp:RegularExpressionValidator ID="revAPaterno" runat="server" ControlToValidate="txtAPaterno" ErrorMessage="*Solo se permite el uso letras y espacios" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div>
                                    <div class="input-group-sm mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">A Materno:</span>
                                            <asp:TextBox ID="txtAMaterno" runat="server" Width="248px" onpaste="return false" ViewStateMode="Disabled" onkeypress="return validarLet(val);"></asp:TextBox>                                            
                                        </div>
                                    </div>
                                    <div>
                                        <asp:RequiredFieldValidator ID="rfvAMaterno" runat="server" onpaste="return false" ControlToValidate="txtAMaterno" ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revAMaterno" runat="server" ControlToValidate="txtAMaterno" ErrorMessage="*Solo se permite el uso letras y espacios" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div>
                                    <div class="input-group-sm mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">CURP:</span>
                                            <asp:TextBox runat="server" Width="248px" onpaste="return false" ViewStateMode="Disabled" ID="txtCURP" MaxLength="18" onkeypress="return validarAlfa(val);"></asp:TextBox>                                           
                                        </div>
                                    </div>
                                    <div>
                                        <asp:RequiredFieldValidator ID="rfvCURP" runat="server" ControlToValidate="txtCURP" ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revCURP" runat="server" ControlToValidate="txtCURP" ErrorMessage="*La CURP es incorrecta" ValidationExpression="^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div>
                                    <div class="input-group-sm mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Fecha N:</span>
                                            <asp:TextBox runat="server" Width="248px" onpaste="return false" ViewStateMode="Disabled" ID="TxtFechaNacimiento" MaxLength="18"></asp:TextBox>                                           
                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Images/Calendario_16x16.png" ImageAlign="Bottom" CausesValidation="false"/>
                                            <ajax:CalendarExtender ID="CalendarExtender1" PopupButtonID="ImageButton1" TargetControlID="TxtFechaNacimiento" runat="server" Format="dd/MM/yyyy"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-3 offset-6">
                                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" class="btn btn-outline-danger" OnClick="btnCancelar_Click" ViewStateMode="Disabled" CausesValidation="False" />
                                </div>
                                <div class="col-3">
                                    <asp:Button ID="btnAceptar" runat="server" class="btn btn-primary" Text="Aceptar" OnClick="btnAceptar_Click" ViewStateMode="Disabled" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
