<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="UTTT.Ejemplo.Persona.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <div class="container pt-3">
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
    <div class="container">
        <div class="row"></div>
        <div class="d-flex align-items-center mb-3 pb-1"> 
        <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
        <span class="h1 fw-bold mb-0">Inicio</span>
    </div>
    </div>

    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;">
                    <div class="row g-0">
                        <div class="col-md-10 d-flex align-items-around">
                            <div class="card-body text-black">

                                <form runat="server">

                                    <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Accesos Directos</h5>

                                    <div class="pt-1 row">
                                        <div class="col-3 offset-1">
                                            <asp:Button ID="DatosEmpresa" runat="server" class="btn btn-dark btn-lg btn-block" OnClick="DatosEmpresa_clic" Text="Datos de Empresa" />
                                        </div>
                                        <div class="col-2 offset-2">
                                            <asp:Button ID="Empleados" runat="server" class="btn btn-dark btn-lg btn-block" OnClick="Empleados_clic" Text="Empleados" />
                                        </div>
                                        <div class="col-2 offset-2">
                                            <asp:Button ID="Usuarios" runat="server" class="btn btn-dark btn-lg btn-block" OnClick="Usuarios_clic" Text="Usuarios" />
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

    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
