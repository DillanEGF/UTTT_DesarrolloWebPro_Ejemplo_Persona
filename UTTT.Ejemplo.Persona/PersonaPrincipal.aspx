<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaPrincipal" Debug="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>

            <div class="row mt-4">
                <h1><span class="badge badge-pill badge-primary">Persona</span></h1>
            </div>

            <div class="input-group-sm mb-3 mt-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-sm">Nombre:</span>
                    <ajax:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" CompletionInterval="100" EnableCaching="false" MinimumPrefixLength="2" ServiceMethod="txtNombre_TextChanged" TargetControlID="txtNombre"></ajax:AutoCompleteExtender>
                    <asp:TextBox ID="txtNombre" runat="server" ViewStateMode="Disabled" AutoPostBack="true"></asp:TextBox>
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" ViewStateMode="Disabled" class="btn-dark"/>
                </div>        
            </div>

            <div class="input-group-sm mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-sm">Sexo:</span>
                    <div>
                        <asp:DropDownList ID="ddlSexo" runat="server" Width="210px" class="btn btn-secondary dropdown-toggle"></asp:DropDownList>
                    </div>
                </div>               
            </div>
            
            
           

            <div>
            </div>

            <div>

        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" class="btn btn-outline-primary mb-3"
            OnClick="btnAgregar_Click" ViewStateMode="Disabled" />

            </div>

            <div class="row justify-content-md-center">
               <div>
                   <h4><span class="badge badge-pill badge-light">Detalle</span></h4>
               </div>
                
            </div>

            <div>

                <asp:GridView ID="dgvPersonas" runat="server"
                    AllowPaging="True" AutoGenerateColumns="False" DataSourceID="DataSourcePersona"
                    Width="1067px" CellPadding="3" GridLines="Horizontal"
                    OnRowCommand="dgvPersonas_RowCommand" BackColor="White"
                    BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
                    ViewStateMode="Disabled">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="strClaveUnica" HeaderText="Clave Unica"
                            ReadOnly="True" SortExpression="strClaveUnica" />
                        <asp:BoundField DataField="strNombre" HeaderText="Nombre" ReadOnly="True"
                            SortExpression="strNombre" />
                        <asp:BoundField DataField="strAPaterno" HeaderText="APaterno" ReadOnly="True"
                            SortExpression="strAPaterno" />
                        <asp:BoundField DataField="strAMaterno" HeaderText="AMaterno" ReadOnly="True"
                            SortExpression="strAMaterno" />
                        <asp:BoundField DataField="CatSexo" HeaderText="Sexo"
                            SortExpression="CatSexo" />
                        <asp:BoundField DataField="strCURP" HeaderText="CURP"
                            SortExpression="strCURP" />
                        <asp:TemplateField HeaderText="Editar">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ID="imgEditar" CommandName="Editar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/editar_16x16.png" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="50px" />

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Eliminar" Visible="True">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ID="imgEliminar" CommandName="Eliminar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/eliminar_16x16.png" OnClientClick="javascript:return confirm('¿Está seguro de querer eliminar el registro seleccionado?', 'Mensaje de sistema')" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Direccion">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ID="imgDireccion" CommandName="Direccion" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/info_16x16.png" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="50px" />

                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#0066ff" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#bccbfe" ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>

            </div>
            <asp:LinqDataSource ID="DataSourcePersona" runat="server"
                ContextTypeName="UTTT.Ejemplo.Linq.Data.Entity.DcGeneralDataContext"
                OnSelecting="DataSourcePersona_Selecting"
                Select="new (strNombre, strAPaterno, strCURP, strAMaterno, CatSexo, strClaveUnica,id)"
                TableName="Persona" EntityTypeName="">
            </asp:LinqDataSource>
        </form>
    </div>

</body>
</html>
