<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión Documental - SGDEA</title>
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
            .mensaje{padding:10px; text-align:center; border-radius:8px; margin-bottom:15px;}
            .exito{background:#e8f5e9; color:#2e7d32;}
            .error{background:#ffebee; color:#c62828;}
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
            <span>SGDEA - Gestión Documental</span>
            <a href="pagina_principal.jsp" class="btn btn-volver">← Volver al Menú Principal</a>
        </div>
        <div class="contenedor">
            <% if(request.getParameter("exito_orden")!=null){ %>
            <div class="mensaje exito">✅ Documentos organizados por fecha cronológica correctamente</div>
            <% } %>
            <% if(request.getParameter("error_orden")!=null){ %>
            <div class="mensaje error">❌ Error al organizar los documentos</div>
            <% } %>
            <h4 class="titulo">Módulo de Gestión Documental</h4>
            <div class="contenedor-opciones">
                <div class="tarjeta-opcion">
                    <i class="material-icons">archive</i>
                    <h6>Archivar Documentos</h6>
                    <p>Guarda y clasifica documentos nuevos</p>
                    <a href="#" class="btn">INGRESAR</a>
                </div>
                <div class="tarjeta-opcion">
                    <i class="material-icons">swap_horiz</i>
                    <h6>Prestar Documentos</h6>
                    <p>Registra salidas y devoluciones</p>
                    <a href="#" class="btn">INGRESAR</a>
                </div>
                <div class="tarjeta-opcion">
                    <i class="material-icons">search</i>
                    <h6>Consultar Documentos</h6>
                    <p>Busca y visualiza archivos por filtros</p>
                    <a href="#" class="btn">INGRESAR</a>
                </div>
                <div class="tarjeta-opcion">
                    <i class="material-icons">sort_by_alpha</i>
                    <h6>Organizar Documentos</h6>
                    <p>Orden automático por fecha de registro</p>
                    <a href="SvOrganizarDocumentos" class="btn">EJECUTAR ORDEN</a>
                </div>
            </div>
        </div>
        <div class="pie-pagina">Empresa Proyectos S.A | Calle 49 No. 56-15, Bogotá D.C | Tel: +57 123 2223333</div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>