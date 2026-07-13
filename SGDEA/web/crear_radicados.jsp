<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Crear Radicados - SGDEA</title>
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
            .tarjeta-opcion{background: white; width: 250px; padding: 30px 20px; border-radius: 12px; text-align: center; box-shadow: 0 3px 10px rgba(0,0,0,0.1); transition: transform 0.2s ease;}
            .tarjeta-opcion:hover{transform: translateY(-5px);}
            .tarjeta-opcion i{font-size: 45px; color: #1565c0; margin-bottom: 12px;}
            .tarjeta-opcion h6{color: #1565c0; font-weight: bold; margin-bottom: 10px; font-size: 16px;}
            .tarjeta-opcion p{font-size: 13px; color: #555; margin-bottom: 15px;}
            .tarjeta-opcion .btn{background-color: #42a5f5; border-radius: 20px; font-size: 13px;}
            .tarjeta-opcion .btn:hover{background-color: #1565c0;}
            .pie-pagina{background-color: #1565c0; color: white; padding: 15px 35px; font-size: 14px; margin-top: 30px;}
        </style>
    </head>
    <body>
        <div class="cabecera">
            <span>SGDEA - Crear Radicados</span>
            <a href="pagina_principal.jsp" class="btn btn-volver">← Volver</a>
        </div>
        <div class="contenedor">
            <h4 class="titulo">Módulo de Radicación</h4>
            <div class="contenedor-opciones">
                <div class="tarjeta-opcion">
                    <i class="material-icons">add_circle</i>
                    <h6>Generar Radicado</h6>
                    <p>Crea un número único automático</p>
                    <a href="#" class="btn">Ingresar</a>
                </div>
                <div class="tarjeta-opcion">
                    <i class="material-icons">attach_file</i>
                    <h6>Asociar Documento</h6>
                    <p>Vincula el radicado a tu archivo</p>
                    <a href="#" class="btn">Ingresar</a>
                </div>
                <div class="tarjeta-opcion">
                    <i class="material-icons">list</i>
                    <h6>Consultar Radicados</h6>
                    <p>Ver listado de todos los generados</p>
                    <a href="#" class="btn">Ingresar</a>
                </div>
                <div class="tarjeta-opcion">
                    <i class="material-icons">print</i>
                    <h6>Imprimir Radicado</h6>
                    <p>Genera la hoja de constancia</p>
                    <a href="#" class="btn">Ingresar</a>
                </div>
                <div class="tarjeta-opcion">
                    <i class="material-icons">verified_user</i>
                    <h6>Firma Digital</h6>
                    <p>Firma el documento adjunto</p>
                    <a href="#" class="btn">Ingresar</a>
                </div>
            </div>
        </div>
        <div class="pie-pagina">Empresa Proyectos S.A | Calle 49 No. 56-15, Bogotá D.C | Tel: +57 123 2223333</div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>