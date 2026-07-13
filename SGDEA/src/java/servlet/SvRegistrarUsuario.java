package servlets;

import conexion.Conexion;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SvRegistrarUsuario")
public class SvRegistrarUsuario extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("email_usuario");
        String clave = request.getParameter("password");
        int idRol = Integer.parseInt(request.getParameter("id_rol"));
        Conexion conexion = new Conexion();
        Connection con = conexion.conectar();
        try {
            // ✅ VALIDAMOS QUE NO HAYA DUPLICADOS
            String sqlVerificar = "SELECT * FROM usuarios WHERE email_usuario = ?";
            PreparedStatement psVerificar = con.prepareStatement(sqlVerificar);
            psVerificar.setString(1, correo);
            ResultSet rs = psVerificar.executeQuery();
            if(rs.next()){
                response.sendRedirect("registrar_usuario.jsp?error=1");
                return;
            }
            // ✅ REGISTRAMOS SI NO HAY DUPLICADO
            String sqlInsert = "INSERT INTO usuarios (nombre, email_usuario, password, id_rol) VALUES (?, ?, ?, ?)";
            PreparedStatement psInsert = con.prepareStatement(sqlInsert);
            psInsert.setString(1, nombre);
            psInsert.setString(2, correo);
            psInsert.setString(3, clave);
            psInsert.setInt(4, idRol);
            psInsert.executeUpdate();
            response.sendRedirect("registrar_usuario.jsp?exito=1");
            con.close();
        } catch (Exception e) {
            System.out.println("Error registrando usuario: " + e.getMessage());
            response.sendRedirect("registrar_usuario.jsp?error=1");
        }
    }
}