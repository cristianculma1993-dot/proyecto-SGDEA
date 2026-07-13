package servlets; // Asegúrate que esté en el paquete "servlets"

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
import jakarta.servlet.http.HttpSession;

@WebServlet("/SvLogin")
public class SvLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // ✅ RECIBIMOS LOS DATOS COINCIDENTES CON TU TABLA
        String correo = request.getParameter("email_usuario");
        String clave = request.getParameter("password");
        String rolStr = request.getParameter("id_rol");

        System.out.println("--- VALORES RECIBIDOS ---");
        System.out.println("Correo: " + correo);
        System.out.println("Clave: " + clave);
        System.out.println("Rol: " + rolStr);

        if (correo == null || clave == null || rolStr == null || correo.trim().isEmpty()) {
            System.out.println("⚠️ FALTAN DATOS");
            response.sendRedirect("login.jsp?error=1");
            return;
        }

        int idRol = Integer.parseInt(rolStr);
        Conexion conexion = new Conexion();
        Connection con = conexion.conectar();

        try {
            String sql = "SELECT * FROM usuarios WHERE email_usuario = ? AND password = ? AND id_rol = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, clave);
            ps.setInt(3, idRol);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                System.out.println("✅ USUARIO ENCONTRADO!");
                HttpSession miSesion = request.getSession(true);
                miSesion.setAttribute("nombre", rs.getString("nombre"));
                miSesion.setAttribute("id_rol", idRol);
                response.sendRedirect("pagina_principal.jsp");
            } else {
                System.out.println("❌ NO HAY COINCIDENCIA");
                response.sendRedirect("login.jsp?error=1");
            }
            con.close();
        } catch (Exception e) {
            System.out.println("❌ ERROR EN CONSULTA: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=1");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}