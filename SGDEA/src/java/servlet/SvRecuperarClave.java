package servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SvRecuperarClave")
public class SvRecuperarClave extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String correo = request.getParameter("correo");
        
        if (correo != null && !correo.trim().isEmpty()) {
            response.sendRedirect("recuperar_clave.jsp?exito=1");
        } else {
            response.sendRedirect("recuperar_clave.jsp?error=1");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

} // ✅ ESTA ÚLTIMA LLAVE CIERRA LA CLASE, ES OBLIGATORIA