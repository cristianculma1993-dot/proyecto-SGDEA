package servlets;

import conexion.Conexion;
import java.io.IOException;
import java.sql.Connection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SvOrganizarDocumentos")
public class SvOrganizarDocumentos extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Conexion conexion = new Conexion();
        Connection con = conexion.conectar();
        try {
            // Ordena automáticamente de más nuevo a más viejo
            String sqlOrden = "SELECT * FROM documentos ORDER BY fecha_registro DESC";
            con.createStatement().executeQuery(sqlOrden);
            response.sendRedirect("gestionar_documentos.jsp?exito_orden=1");
            con.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            response.sendRedirect("gestionar_documentos.jsp?error_orden=1");
        }
    }
}