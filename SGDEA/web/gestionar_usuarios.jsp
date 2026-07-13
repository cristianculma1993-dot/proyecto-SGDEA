<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión de Usuarios - SGDEA</title>
        <link rel="stylesheet" href="css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style>
            *{margin: 0; padding: 0; box-sizing: border-box;}
            body{font-family: Arial, sans-serif; background-color: #f5f7fa;}
            .cabecera{background-color: #1565c0; color: white; padding: 12px 25px; display: flex; justify-content: space-between; align-items: center; font-size: 18px; font-weight: bold;}
            .btn-volver{background-color: #42a5f5; border-radius: 20px; padding: 0 12px; color: white;}
            .btn-volver:hover{background-color: #1565c0;}
            .contenedor{padding: 40px 20px; max-width: 1100px; margin: 0 auto;}
            .titulo{color: #1565c0; font-weight: bold; margin-bottom: 35px; text-align: center; font-size: 26px;}
            .contenedor-opciones{display: flex; justify-content: center; gap: 25px; flex-wrap: wrap;}
            .tarjeta-opcion{background: white; width: 260px; padding: 35px 25px; border-radius: 12px; text-align: center; box-shadow: 0 3px 10px rgba(0,0,0,0.1); transition: transform 0.2s ease;}
            .tarjeta-opcion:hover{transform: translateY(-5px);}
            .tarjeta-opcion i{font-size: 50px; color: #1565c0; margin-bottom: 15px;}
            .tarjeta-opcion h6{color: #1565c0; font-weight: bold; margin-bottom: 10px; font-size: 17px;}
            .tarjeta-opcion p{font-size: 14px; color: #555; margin-bottom: 20px; line-height: 1.4;}
            .tarjeta-opcion .btn{background-color: #42a5f5; border-radius: 20px; font-size: 14px; font-weight: bold;}
            .tarjeta-opcion .btn:hover{background-color: #1565c0;}
            .pie-pagina{background-color: #1565c0; color: white; padding: 15px 35px; font-size: 14px; margin-top: 30px;}
        </style>
    </head>
    <body>
        <%
            String nombre = (String) session.getAttribute("nombre");
            Integer idRol = (Integer) session.getAttribute("id_rol");
            if(nombre == null || idRol == null){response.sendRedirect("login.jsp"); return;}
        %>
        <div class="cabecera">
            <span>SGDEA - Gestión de Usuarios</span>
            <a href="pagina_principal.jsp" class="btn btn-volver">← Volver al Menú Principal</a>
        </div>
        <div class="contenedor">
            <h4 class="titulo">Administración de Cuentas de Usuario</h4>
            <div class="contenedor-opciones">
                <div class="tarjeta-opcion">
                    <i class="material-icons">person_add</i>
                    <h6>Registrar Usuario</h6>
                    <p>Crea cuentas nuevas y asigna permisos</p>
                    <a href="registrar_usuario.jsp" class="btn">INGRESAR</a>
                </div>
                <div class="tarjeta-opcion">
                    <i class="material-icons">edit</i>
                    <h6>Editar Usuario</h6>
                    <p>Modifica datos, contraseña o cambia roles</p>
                    <a href="#" class="btn">INGRESAR</a>
                </div>
                <div class="tarjeta-opcion">
                    <i class="material-icons">manage_accounts</i>
                    <h6>Administrar Cuentas</h6>
                    <p>Activa, desactiva o elimina cuentas</p>
                    <a href="#" class="btn">INGRESAR</a>
                </div>
            </div>
        </div>
        <div class="pie-pagina">Empresa Proyectos S.A | Calle 49 No. 56-15, Bogotá D.C | Tel: +57 123 2223333</div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>