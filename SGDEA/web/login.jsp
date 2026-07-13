<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Iniciar Sesión - SGDEA</title>
        <link rel="stylesheet" href="css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style>
            *{margin: 0; padding: 0; box-sizing: border-box;}
            html, body{
                height: 100%;
                margin: 0;
                display: flex;
                flex-direction: column;
                background-color: #f0f7ff;
                font-family: Arial, sans-serif;
            }

            /* ✅ BARRA AZUL PRINCIPAL */
            .barra-superior {
                background-color: #1565c0;
                color: white;
                padding: 18px 30px;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 25px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                width: 100%;
            }

            /* ✅ RECUADRO Y ANIMACIÓN DEL LOGO: CARPETA QUE SE ABRE */
            .contenedor-logo {
                background-color: white;
                padding: 12px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                box-shadow: 0 2px 8px rgba(0,0,0,0.15);
            }
            .logo-animado {
                width: 65px;
                height: 65px;
                position: relative;
            }
            .base-carpeta {
                position: absolute;
                bottom: 0;
                left: 0;
                width: 100%;
                height: 72%;
                background-color: #1565c0;
                border-radius: 6px;
            }
            .solapa-carpeta {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 38%;
                background-color: #4fc3f7;
                border-bottom-right-radius: 8px;
                border-top-left-radius: 6px;
                transform-origin: top left;
                animation: abrirCarpeta 3s ease-in-out infinite;
            }
            .documento {
                position: absolute;
                bottom: 6px;
                left: 10px;
                width: 80%;
                height: 58%;
                background-color: white;
                border-radius: 3px;
                transform: translateY(12px);
                opacity: 0;
                animation: mostrarDocumento 3s ease-in-out infinite;
            }
            .detalle-doc {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 70%;
                height: 4px;
                background-color: #1565c0;
                border-radius: 2px;
                box-shadow: 0 8px 0 #1565c0, 0 16px 0 #1565c0;
            }

            @keyframes abrirCarpeta {
                0%, 20%, 80%, 100% { transform: rotate(0deg); }
                40%, 60% { transform: rotate(-32deg); }
            }
            @keyframes mostrarDocumento {
                0%, 20% { opacity: 0; transform: translateY(12px); }
                30%, 70% { opacity: 1; transform: translateY(0); }
                80%, 100% { opacity: 0; transform: translateY(12px); }
            }

            .letrero-bienvenida {
                font-size: 28px;
                font-weight: bold;
                letter-spacing: 1px;
            }

            /* ✅ ÁREA CENTRAL: TARJETA ANCHA PERO COMPACTA */
            .contenedor-login{
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 80px;
                padding: 25px 20px;
                flex: 1;
                width: 100%;
            }
            .tarjeta-login{
                background: white;
                padding: 30px 40px;
                border-radius: 18px;
                width: 500px; /* ✅ MISMO ANCHO QUE PEDISTE */
                box-shadow: 0 8px 20px rgba(21, 101, 192, 0.2);
            }
            .tarjeta-login h2{
                color: #1565c0;
                text-align: center;
                margin-bottom: 20px;
                font-weight: bold;
                font-size: 32px;
            }
            .input-field{margin-bottom: 18px;}
            .input-field label{color: #1565c0; font-size: 15px;}

            /* ✅ BOTÓN CON TEXTO PERFECTAMENTE CENTRADO */
            .btn-ingresar{
                background-color: #4fc3f7;
                width: 100%;
                border-radius: 25px;
                color: white;
                font-weight: bold;
                margin-top: 8px;
                padding: 10px 20px;
                font-size: 17px;
                border: none;
                display: flex;
                align-items: center;
                justify-content: center;
                text-align: center;
                line-height: 1.2;
            }
            .btn-ingresar:hover{background-color: #0288d1;}

            .olvido{
                text-align: center;
                margin-top: 15px;
            }
            .olvido a{color: #1565c0; text-decoration: none; font-size: 15px;}
            .ilustracion img{max-width: 450px;}
            .mensaje-error{
                background: #ffebee;
                color: #c62828;
                padding: 10px;
                border-radius: 8px;
                text-align: center;
                margin-bottom: 12px;
                font-size: 15px;
            }

            /* ✅ PIE DE PÁGINA SIEMPRE VISIBLE */
            .pie-pagina{
                background-color: #1565c0;
                color: white;
                padding: 15px 35px;
                text-align: left;
                font-size: 14px;
                width: 100%;
                margin-top: auto;
            }
        </style>
    </head>
    <body>
        <div class="barra-superior">
            <div class="contenedor-logo">
                <div class="logo-animado">
                    <div class="base-carpeta"></div>
                    <div class="solapa-carpeta"></div>
                    <div class="documento">
                        <div class="detalle-doc"></div>
                    </div>
                </div>
            </div>
            <div class="letrero-bienvenida">Bienvenido al SGDEA</div>
        </div>

        <div class="contenedor-login">
            <div class="tarjeta-login">
                <h2>Iniciar Sesión</h2>

                <% if(request.getParameter("error") != null) { %>
                <div class="mensaje-error">Usuario, contraseña o rol incorrectos</div>
                <% } %>

                <!-- ✅ SOLO AJUSTAMOS LOS NOMBRES PARA COINCIDIR CON TU TABLA Y SERVLET JAKARTA -->
                <form action="SvLogin" method="POST">
                    <div class="input-field">
                        <input type="email" name="email_usuario" id="email" required>
                        <label for="email">Usuario (Correo)</label>
                    </div>
                    <div class="input-field">
                        <input type="password" name="password" id="password" required>
                        <label for="password">Contraseña</label>
                    </div>
                    <div class="input-field">
                        <select name="id_rol" required>
                            <option value="" disabled selected>Seleccione su rol</option>
                            <option value="1">Administrador</option>
                            <option value="2">Funcionario</option>
                            <option value="3">Consulta</option>
                        </select>
                        <label>Rol</label>
                    </div>
                    <button type="submit" class="btn-ingresar">INGRESAR</button>
                </form>
                <div class="olvido">
                    <a href="recuperar_clave.jsp">¿Olvidó su contraseña?</a>
                </div>
            </div>
            <div class="ilustracion">
                <img src="imagenes/SGDEA.png" alt="Ilustración SGDEA">
            </div>
        </div>

        <div class="pie-pagina">
            Empresa Proyecto S.A | Calle 49 No. 56-15, Bogotá D.C | Tel: +57 123 2223333
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script>document.addEventListener('DOMContentLoaded', ()=>{M.FormSelect.init(document.querySelectorAll('select'));});</script>
    </body>
</html>