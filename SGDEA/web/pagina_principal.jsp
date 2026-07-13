<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SGDEA - Sistema de Gestión Documental</title>
        <link rel="stylesheet" href="css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style>
            *{margin: 0; padding: 0; box-sizing: border-box;}
            body{font-family: Arial, sans-serif; background-color: #f5f7fa;}

            .cabecera{
                background-color: #1565c0;
                color: white;
                padding: 12px 25px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-size: 18px;
                font-weight: bold;
            }
            .datos-usuario{display: flex; align-items: center; gap: 15px; font-size: 14px; font-weight: normal;}
            .btn-salir{background-color: #d32f2f; border-radius: 20px; padding: 0 12px; color: white;}
            .btn-salir:hover{background-color: #b71c1c;}

            .contenedor-general{display: flex; min-height: calc(100vh - 50px);}
            .menu-lateral{
                background-color: #42a5f5;
                width: 220px;
                padding: 20px 0;
                color: white;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }
            .menu-superior, .menu-inferior{display: flex; flex-direction: column;}
            .menu-lateral h5{padding: 0 20px 15px; font-weight: bold; border-bottom: 1px solid rgba(255,255,255,0.3); margin-bottom: 10px;}
            .menu-opcion{
                display: flex;
                align-items: center;
                gap: 10px;
                padding: 12px 20px;
                cursor: pointer;
                font-size: 14px;
            }
            .menu-opcion:hover{background-color: #1565c0;}
            .menu-opcion i{font-size: 18px;}

            .contenido-principal{flex: 1; padding: 30px;}
            .titulo-seccion{color: #1565c0; font-weight: bold; margin-bottom: 25px; text-align: center;}
            .contenedor-tarjetas{display: flex; justify-content: center; gap: 25px; flex-wrap: wrap;}

            .tarjeta{
                background: white;
                width: 260px;
                padding: 30px 20px;
                border-radius: 12px;
                text-align: center;
                box-shadow: 0 3px 10px rgba(0,0,0,0.1);
                transition: transform 0.2s ease;
            }
            .tarjeta:hover{transform: translateY(-5px);}
            .tarjeta i{font-size: 45px; color: #1565c0; margin-bottom: 12px;}
            .tarjeta h6{color: #1565c0; font-weight: bold; margin-bottom: 10px; font-size: 15px;}
            .tarjeta p{font-size: 13px; color: #555; margin-bottom: 15px;}
            .tarjeta .btn{background-color: #42a5f5; border-radius: 20px; font-size: 13px;}
            .tarjeta .btn:hover{background-color: #1565c0;}

            .semaf-pqrs {display: flex; justify-content: center; gap: 8px; margin: 10px 0;}
            .semaforo {width: 18px; height: 18px; border-radius: 50%; display: inline-block;}
            .rojo {background-color: #F44336;}
            .amarillo {background-color: #FFC107;}
            .verde {background-color: #4CAF50;}
        </style>
    </head>
    <body>
        <%
            String nombre = (String) session.getAttribute("nombre");
            Integer idRol = (Integer) session.getAttribute("id_rol");

            if(nombre == null || idRol == null){
                response.sendRedirect("login.jsp");
                return;
            }

            String rolNombre = "";
            switch(idRol){
                case 1: rolNombre = "Administrador"; break;
                case 2: rolNombre = "Funcionario"; break;
                case 3: rolNombre = "Consulta"; break;
            }
        %>

        <div class="cabecera">
            <span>Empresa Proyectos S.A. | SGDEA - Sistema de Gestión Documental y Expedientes</span>
            <div class="datos-usuario">
                <i class="material-icons left">person</i>
                <%= nombre %> | <%= rolNombre %>
                <a href="SvCerrarSesion" class="btn btn-salir right">Cerrar Sesión</a>
            </div>
        </div>

        <div class="contenedor-general">
            <div class="menu-lateral">
                <div class="menu-superior">
                    <h5>SGDEA</h5>
                    <div class="menu-opcion">
                        <i class="material-icons">home</i> Inicio - Mi tarea
                    </div>
                    <div class="menu-opcion">
                        <i class="material-icons">person</i> Usuario
                    </div>
                    <div class="menu-opcion">
                        <i class="material-icons">people</i> Consultar
                    </div>
                    <div class="menu-opcion">
                        <i class="material-icons">description</i> Archivar
                    </div>
                    <div class="menu-opcion">
                        <i class="material-icons">print</i> Puntuar electrónico
                    </div>
                    <div class="menu-opcion">
                        <i class="material-icons">search</i> Consultar tableros
                    </div>
                    <% if(idRol == 1) { %>
                    <div class="menu-opcion">
                        <i class="material-icons">admin_panel_settings</i> Administrar permisos
                    </div>
                    <% } %>
                </div>

                <div class="menu-inferior">
                    <div class="menu-opcion">
                        <i class="material-icons">settings</i> Configuración
                    </div>
                    <div class="menu-opcion">
                        <i class="material-icons">search</i> Búsqueda General
                    </div>
                </div>
            </div>

            <div class="contenido-principal">
                <h4 class="titulo-seccion">Módulos del Sistema</h4>
                <div class="contenedor-tarjetas">

                    <% if(idRol == 1 || idRol == 2) { %>
                    <div class="tarjeta">
                        <i class="material-icons">edit_note</i>
                        <h6>Crear Radicados</h6>
                        <p>Genera radicados internos con firma digital</p>
                        <!-- ✅ ENLACE CORREGIDO A TU ARCHIVO -->
                        <a href="crear_radicados.jsp" class="btn">Ingresar</a>
                    </div>
                    <% } %>

                    <% if(idRol == 1 || idRol == 2) { %>
                    <div class="tarjeta">
                        <i class="material-icons">sms</i>
                        <h6>Respuesta PQRS</h6>
                        <div class="semaf-pqrs">
                            <span class="semaforo rojo" title="Vencido"></span>
                            <span class="semaforo amarillo" title="Por vencer"></span>
                            <span class="semaforo verde" title="A tiempo"></span>
                        </div>
                        <p>Estados: Vencido / Por vencer / A tiempo</p>
                        <!-- ✅ ENLACE CORREGIDO A TU ARCHIVO -->
                        <a href="respuesta_pqrs.jsp" class="btn">Ingresar</a>
                    </div>
                    <% } %>

                    <% if(idRol == 1 || idRol == 2) { %>
                    <div class="tarjeta">
                        <i class="material-icons">folder_open</i>
                        <h6>Gestión Documental</h6>
                        <p>Archivar | Prestar | Consultar | Organizar</p>
                        <!-- ✅ ENLACE CORREGIDO A TU ARCHIVO -->
                        <a href="gestionar_documentos.jsp" class="btn">Ingresar</a>
                    </div>
                    <% } %>

                    <% if(idRol == 1) { %>
                    <div class="tarjeta">
                        <i class="material-icons">groups</i>
                        <h6>Gestión de Usuarios</h6>
                        <p>Registra, edita y administra cuentas</p>
                        <!-- ✅ ENLACE CORREGIDO AL MENÚ COMPLETO -->
                        <a href="gestionar_usuarios.jsp" class="btn">Ingresar</a>
                    </div>
                    <% } %>

                    <% if(idRol == 1 || idRol == 2 || idRol == 3) { %>
                    <div class="tarjeta">
                        <i class="material-icons">search</i>
                        <h6>Consulta y Reportes</h6>
                        <p>Busca usuarios y genera reportes</p>
                        <a href="consultar_usuarios.jsp" class="btn">Ingresar</a>
                    </div>
                    <% } %>

                </div>
            </div>
        </div>
    </body>
</html>