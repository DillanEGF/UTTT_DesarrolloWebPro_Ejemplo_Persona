<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.UsuarioPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"/>
    <title></title>
</head>
<body>
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-12">
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

                                    <div class="d-flex align-items-center mt-5 mb-4 pb-1">
                                        <span class="h1 fw-bold mb-0">Usuarios</span>
                                    </div>

                                    <asp:Label ID="lblMensaje" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>

                                    <hr />

                                    <div class="form-outline mb-4 mt-4">
                                        <div class="d-flex">
                                            <label class="form-label">Nombre de Usuario&nbsp;&nbsp; </label>
                                            &nbsp;<asp:TextBox ID="txtNombre" runat="server" type="text" class="form-control"></asp:TextBox>

                                            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" class="btn btn-outline-dark col-2" type="button" />
                                        </div>

                                    </div>

                                    <div class="pt-1 mb-4 row">
                                        <div class="col-3">
                                            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" class="btn btn-outline-primary btn-lg" type="button" />
                                        </div>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <div class="input-group-prepend">
                                            <div class="form-outline mb-4">

                                                <div class="row justify-content-md-center">
                                                    <div>
                                                        <h4><span class="badge badge-pill badge-light">Lista</span></h4>
                                                    </div>

                                                </div>

                                                <div>

                                                    <asp:GridView ID="dgvUsuarios" runat="server"
                                                        AllowPaging="True" AutoGenerateColumns="False" DataSourceID="DataSourceUsuario"
                                                        Width="1000px" CellPadding="3" GridLines="Horizontal"
                                                        OnRowCommand="dgvUsuarios_RowCommand" BackColor="White"
                                                        BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
                                                        ViewStateMode="Disabled">
                                                        <AlternatingRowStyle BackColor="#F7F7F7" />
                                                        <Columns>
                                                            <asp:BoundField DataField="strNombreUsuario" HeaderText="Nombre" ReadOnly="True"
                                                                SortExpression="strNombreUsuario" />
                                                            <asp:BoundField DataField="strPass" HeaderText="Password" ReadOnly="True"
                                                                SortExpression="strApellidoP" />
                                                            <asp:BoundField DataField="Perfil" HeaderText="Perfil" ReadOnly="True"
                                                                SortExpression="Perfil" />
                                                            <asp:BoundField DataField="SegCatStatus" HeaderText="Status"
                                                                SortExpression="SegCatStatus" />
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

                                                            <%--<asp:TemplateField HeaderText="Direccion">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton runat="server" ID="imgDireccion" CommandName="Direccion" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/info_16x16.png" />
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" Width="50px" />

                                                            </asp:TemplateField>--%>
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
                                                <asp:LinqDataSource ID="DataSourceUsuario" runat="server"
                                                    ContextTypeName="UTTT.Ejemplo.Linq.Data.Entity.DcGeneralDataContext"
                                                    OnSelecting="DataSourceUsuario_Selecting"
                                                    Select="new (strNombreUsuario, strPass, Perfil, SegCatStatus,id)"
                                                    TableName="Usuario" EntityTypeName="">
                                                </asp:LinqDataSource>
                                            </div>
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
