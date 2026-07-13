package servlets;

import conexion.Conexion;
import vo.UsuarioVO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// ✅ NOMBRE EXACTO SIN LETRAS DE MÁS
@WebServlet("/SvConsultarUsuarios")
public class SvConsultarUsuarios extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String buscar = request.getParameter("buscar");
        String filtroRolStr = request.getParameter("filtro_rol");
        int filtroRol = 0;
        if (filtroRolStr != null && !filtroRolStr.isEmpty()) {
            filtroRol = Integer.parseInt(filtroRolStr);
        }

        List<UsuarioVO> listaUsuarios = new ArrayList<>();
        Connection conn = null;

        try {
            Conexion con = new Conexion();
            conn = con.conectar();

            String sql = "SELECT id_usuario, nombre, email_usuario, id_rol, password, estado FROM usuarios WHERE 1=1 ";
            if (buscar != null && !buscar.trim().isEmpty()) {
                sql += " AND (nombre LIKE ? OR email_usuario LIKE ?) ";
            }
            if (filtroRol > 0) {
                sql += " AND id_rol = ? ";
            }
            sql += " ORDER BY nombre ASC";

            PreparedStatement ps = conn.prepareStatement(sql);
            int parametro = 1;

            if (buscar != null && !buscar.trim().isEmpty()) {
                ps.setString(parametro++, "%" + buscar + "%");
                ps.setString(parametro++, "%" + buscar + "%");
            }
            if (filtroRol > 0) {
                ps.setInt(parametro++, filtroRol);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UsuarioVO u = new UsuarioVO(
                    rs.getInt("id_usuario"),
                    rs.getString("email_usuario"),
                    rs.getInt("id_rol"),
                    rs.getString("nombre"),
                    rs.getString("password"),
                    rs.getString("estado")
                );
                listaUsuarios.add(u);
            }

            request.setAttribute("listaUsuarios", listaUsuarios);
            request.getRequestDispatcher("consultar_usuarios.jsp").forward(request, response);

        } catch (Exception e) {
            System.err.println("Error en consulta: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (SQLException e) {}
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}