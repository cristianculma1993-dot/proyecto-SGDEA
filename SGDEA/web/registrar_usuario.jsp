<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registrar Usuario - SGDEA</title>
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
            .barra-superior {
                background-color: #1565c0;
                color: white;
                padding: 18px 30px;
                text-align: center;
                font-size: 22px;
                font-weight: bold;
            }
            .contenedor-registro {
                display: flex;
                align-items: center;
                justify-content: center;
                flex: 1;
                padding: 25px 20px;
            }
            .tarjeta {
                background: white;
                padding: 30px 40px;
                border-radius: 18px;
                width: 500px;
                box-shadow: 0 8px 20px rgba(21,101,192,0.2);
            }
            .tarjeta h4 {
                color: #1565c0;
                text-align: center;
                margin-bottom: 20px;
                font-weight: bold;
            }
            .input-field {margin-bottom: 16px;}
            .input-field label {color: #1565c0;}
            .btn-registrar {
                background-color: #4fc3f7;
                width: 100%;
                border-radius: 25px;
                color: white;
                font-weight: bold;
                padding: 10px;
                border: none;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-top: 5px;
            }
            .btn-registrar:hover {background-color: #0288d1;}
            .volver {text-align: center; margin-top: 15px;}
            .volver a {color: #1565c0; text-decoration: none;}
            .mensaje {
                padding: 10px;
                border-radius: 8px;
                text-align: center;
                margin-bottom: 12px;
            }
            .exito {background: #e8f5e9; color: #2e7d32;}
            .error {background: #ffebee; color: #c62828;}
            .pie-pagina {
                background-color: #1565c0;
                color: white;
                padding: 15px 35px;
                font-size: 14px;
                margin-top: auto;
            }
        </style>
    </head>
    <body>
        <div class="barra-superior">Registrar Nuevo Usuario - SGDEA</div>

        <div class="contenedor-registro">
            <div class="tarjeta">
                <h4>Datos del Usuario</h4>

                <% if(request.getParameter("exito")!=null){ %>
                <div class="mensaje exito">✅ Usuario registrado correctamente</div>
                <% } %>
                <% if(request.getParameter("error")!=null){ %>
                <div class="mensaje error">❌ Correo ya registrado o datos inválidos</div>
                <% } %>

                <!-- ✅ RUTA EXACTA AL SERVLET -->
                <form action="SvRegistrarUsuario" method="POST">
                    <div class="input-field">
                        <input type="text" name="nombre" id="nombre" required>
                        <label for="nombre">Nombre Completo</label>
                    </div>
                    <div class="input-field">
                        <input type="email" name="email_usuario" id="email_usuario" required>
                        <label for="email_usuario">Correo Electrónico</label>
                    </div>
                    <div class="input-field">
                        <input type="password" name="password" id="password" required minlength="6">
                        <label for="password">Contraseña</label>
                    </div>
                    <div class="input-field">
                        <select name="id_rol" required>
                            <option value="" disabled selected>Seleccione Rol</option>
                            <option value="1">Administrador</option>
                            <option value="2">Funcionario</option>
                            <option value="3">Consulta</option>
                        </select>
                        <label>Rol de Usuario</label>
                    </div>
                    <button type="submit" class="btn-registrar">REGISTRAR USUARIO</button>
                </form>
                <div class="volver"><a href="login.jsp">← Volver a Iniciar Sesión</a></div>
            </div>
        </div>

        <div class="pie-pagina">
            Empresa Proyecto S.A | Calle 49 No. 56-15, Bogotá D.C | Tel: +57 123 2223333
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script>document.addEventListener('DOMContentLoaded', ()=>{M.FormSelect.init(document.querySelectorAll('select'));});</script>
    </body>
</html>