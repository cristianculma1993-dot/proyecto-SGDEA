<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recuperar Contraseña - SGDEA</title>
        <link rel="stylesheet" href="css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style>
            *{margin: 0; padding: 0; box-sizing: border-box;}
            body{background-color: #f0f7ff; font-family: Arial, sans-serif;}
            .barra-sgdea {
                background-color: #1565c0;
                color: white;
                padding: 18px 35px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-size: 24px;
                font-weight: bold;   
            }
            .contenedor-recuperar{
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 75vh;
                padding: 20px;
            }
            .tarjeta-recuperar{
                background: white;
                padding: 40px 35px;
                border-radius: 15px;
                width: 420px;
                box-shadow: 0 5px 15px rgba(21, 101, 192, 0.2);
            }
            .tarjeta-recuperar h4{
                color: #1565c0;
                text-align: center;
                margin-bottom: 15px;
                font-weight: bold;
            }
            .tarjeta-recuperar p{
                text-align: center;
                color: #555;
                margin-bottom: 25px;
                font-size: 14px;
            }
            /* ✅ AJUSTE PARA QUE NO SE MEZCLE LA ETIQUETA */
            .input-field label {
                transform: translateY(-10px) scale(0.8);
                transform-origin: 0 0;
                color: #1565c0;
            }
            .btn-enviar{
                background-color: #42a5f5;
                width: 100%;
                border-radius: 25px;
                color: white;
                font-weight: bold;
                margin-top: 10px;
            }
            .btn-enviar:hover{background-color: #1565c0;}
            .volver{
                text-align: center;
                margin-top: 20px;
            }
            .volver a{color: #1565c0; text-decoration: none; font-size: 14px;}
            .mensaje-aviso{
                text-align: center;
                padding: 10px;
                margin-bottom: 15px;
                border-radius: 8px;
            }
            .exito{background: #e8f5e9; color: #2e7d32;}
            .error{background: #ffebee; color: #c62828;}
        </style>
    </head>
    <body>
        <div class="barra-sgdea">
            <span>SGDEA</span>
            <div class="enlaces-superior">
                <a href="login.jsp" style="color:white; text-decoration:none;">Volver al Inicio</a>
            </div>
        </div>

        <div class="contenedor-recuperar">
            <div class="tarjeta-recuperar">
                <h4>Recuperar Contraseña</h4>
                <p>Ingresa el correo electrónico con el que te registraste. Te enviaremos instrucciones para restablecer tu contraseña.</p>

                <% if(request.getParameter("exito") != null) { %>
                <div class="mensaje-aviso exito">✅ Si el correo existe, recibirás las instrucciones en breve</div>
                <% } %>
                <% if(request.getParameter("error") != null) { %>
                <div class="mensaje-aviso error">❌ Ocurrió un error, intenta nuevamente</div>
                <% } %>

                <form action="SvRecuperarClave" method="POST">
                    <div class="input-field">
                        <input type="email" name="correo" id="correo" required class="validate">
                        <label for="correo">Correo Electrónico Registrado</label>
                    </div>
                    <button type="submit" class="btn btn-enviar">ENVIAR SOLICITUD</button>
                </form>
                <div class="volver">
                    <a href="login.jsp">← Ya recordaste tu contraseña? Inicia sesión</a>
                </div>
            </div>
        </div>
    </body>
</html>