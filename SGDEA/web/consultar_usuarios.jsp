<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Usuarios - SGDEA</title>
        <link rel="stylesheet" href="css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style>
            body{background-color: #f0f7ff; font-family: Arial, sans-serif;}
            .contenedor{max-width: 900px; margin: 30px auto; padding: 25px; background: white; border-radius: 15px; box-shadow: 0 5px 15px rgba(21,101,192,0.2);}
            h4{color: #1565c0; text-align: center; margin-bottom: 20px;}
            .btn-buscar{background-color: #42a5f5;}
            .btn-buscar:hover{background-color: #1565c0;}
            table{margin-top: 20px;}
            th{background-color: #1565c0; color: white;}
            .volver{margin-top: 15px; display: inline-block;}
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
            // ✅ SOLO ADMINISTRADOR PUEDE ENTRAR
            if(idRol != 1){
                response.sendRedirect("pagina_principal.jsp");
                return;
            }
        %>

        <div class="contenedor">
            <h4>Consulta de Usuarios del Sistema</h4>
            <form action="SvConsultarUsuarios" method="GET" class="row">
                <div class="input-field col s12 m6">
                    <input type="text" name="buscar" id="buscar" placeholder="Buscar por nombre o correo">
                    <label for="buscar">Término de búsqueda</label>
                </div>
                <div class="input-field col s12 m4">
                    <select name="filtro_rol">
                        <option value="0">Todos los roles</option>
                        <option value="1">Administrador</option>
                        <option value="2">Funcionario</option>
                        <option value="3">Consulta</option>
                    </select>
                    <label>Filtrar por Rol</label>
                </div>
                <div class="col s12 m2">
                    <button type="submit" class="btn btn-buscar">Buscar</button>
                </div>
            </form>

            <table class="striped centered responsive-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre Completo</th>
                        <th>Correo</th>
                        <th>Rol</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        java.util.List<vo.UsuarioVO> lista = (java.util.List<vo.UsuarioVO>) request.getAttribute("listaUsuarios");
                        if(lista != null && !lista.isEmpty()){
                            for(vo.UsuarioVO u : lista){
                                String rol = "";
                                switch(u.getIdRol()){
                                    case 1: rol = "Administrador"; break;
                                    case 2: rol = "Funcionario"; break;
                                    case 3: rol = "Consulta"; break;
                                }
                                String estado = u.getEstado().equals("1") ? "Activo" : "Inactivo";
                    %>
                    <tr>
                        <td><%= u.getIdUsuario() %></td>
                        <td><%= u.getNombre() %></td>
                        <td><%= u.getEmailUsuario() %></td>
                        <td><%= rol %></td>
                        <td><%= estado %></td>
                    </tr>
                    <% 
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="5" class="center">No se encontraron usuarios o realiza una búsqueda</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <div class="volver">
                <a href="pagina_principal.jsp" class="btn">← Volver al Inicio</a>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script>document.addEventListener('DOMContentLoaded', ()=>{M.FormSelect.init(document.querySelectorAll('select'));});</script>
    </body>
</html>