<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Respuesta PQRS - SGDEA</title>
        <link rel="stylesheet" href="css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style>
            *{margin: 0; padding: 0; box-sizing: border-box;}
            body{font-family: Arial, sans-serif; background-color: #f5f7fa;}

            /* ✅ MISMA CABECERA QUE TODAS LAS PANTALLAS */
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
            .btn-volver{background-color: #42a5f5; border-radius: 20px; padding: 0 12px; color: white;}
            .btn-volver:hover{background-color: #1565c0;}

            .contenedor{padding: 40px 20px; max-width: 1100px; margin: 0 auto;}
            .titulo{color: #1565c0; font-weight: bold; margin-bottom: 15px; text-align: center; font-size: 26px;}

            /* ✅ ESTILO DEL SEMÁFORO */
            .semaf-pqrs {
                display: flex;
                justify-content: center;
                gap: 10px;
                margin-bottom: 35px;
            }
            .semaforo {
                width: 18px;
                height: 18px;
                border-radius: 50%;
                display: inline-block;
            }
            .rojo {background-color: #F44336;}
            .amarillo {background-color: #FFC107;}
            .verde {background-color: #4CAF50;}

            .contenedor-opciones{display: flex; justify-content: center; gap: 25px; flex-wrap: wrap;}
            .tarjeta-opcion{
                background: white;
                width: 250px;
                padding: 30px 20px;
                border-radius: 12px;
                text-align: center;
                box-shadow: 0 3px 10px rgba(0,0,0,0.1);
                transition: transform 0.2s ease;
            }
            .tarjeta-opcion:hover{transform: translateY(-5px);}
            .tarjeta-opcion i{font-size: 45px; color: #1565c0; margin-bottom: 12px;}
            .tarjeta-opcion h6{color: #1565c0; font-weight: bold; margin-bottom: 10px; font-size: 16px;}
            .tarjeta-opcion p{font-size: 13px; color: #555; margin-bottom: 15px;}
            .tarjeta-opcion .btn{background-color: #42a5f5; border-radius: 20px; font-size: 13px;}
            .tarjeta-opcion .btn:hover{background-color: #1565c0;}

            .pie-pagina{
                background-color: #1565c0;
                color: white;
                padding: 15px 35px;
                font-size: 14px;
                margin-top: 30px;
            }
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
        %>

        <div class="cabecera">
            <span>SGDEA - Respuesta PQRS</span>
            <a href="pagina_principal.jsp" class="btn btn-volver">← Volver al Menú Principal</a>
        </div>

        <div class="contenedor">
            <h4 class="titulo">Módulo Peticiones, Quejas y Reclamos</h4>

            <!-- ✅ SEMÁFORO DE ESTADOS INCLUIDO -->
            <div class="semaf-pqrs">
                <span class="semaforo rojo" title="Vencido"></span>
                <span class="semaforo amarillo" title="Por vencer"></span>
                <span class="semaforo verde" title="A tiempo"></span>
            </div>

            <div class="contenedor-opciones">
                <div class="tarjeta-opcion">
                    <i class="material-icons">add_comment</i>
                    <h6>Registrar PQRS</h6>
                    <p>Ingresa una nueva solicitud</p>
                    <a href="#" class="btn">Ingresar</a>
                </div>

                <div class="tarjeta-opcion">
                    <i class="material-icons">person_add</i>
                    <h6>Asignar Responsable</h6>
                    <p>Designa quién atenderá el caso</p>
                    <a href="#" class="btn">Ingresar</a>
                </div>

                <div class="tarjeta-opcion">
                    <i class="material-icons">reply</i>
                    <h6>Registrar Respuesta</h6>
                    <p>Guarda la solución al usuario</p>
                    <a href="#" class="btn">Ingresar</a>
                </div>

                <div class="tarjeta-opcion">
                    <i class="material-icons">visibility</i>
                    <h6>Ver Estados</h6>
                    <p>Consulta tiempos y vencimientos</p>
                    <a href="#" class="btn">Ingresar</a>
                </div>

                <div class="tarjeta-opcion">
                    <i class="material-icons">history</i>
                    <h6>Historial PQRS</h6>
                    <p>Revisa todos los casos atendidos</p>
                    <a href="#" class="btn">Ingresar</a>
                </div>
            </div>
        </div>

        <div class="pie-pagina">
            Empresa Proyectos S.A | Calle 49 No. 56-15, Bogotá D.C | Tel: +57 123 2223333
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>