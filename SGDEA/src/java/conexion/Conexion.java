package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private static final String URL = "jdbc:mysql://localhost:3306/sgdea?useSSL=false&serverTimezone=UTC";
    private static final String USUARIO = "root";
    private static final String CLAVE = "Colombia2026*"; // 👈 Pon tu contraseña aquí
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";

    public Connection conectar() {
        Connection con = null;
        try {
            Class.forName(DRIVER);
            con = DriverManager.getConnection(URL, USUARIO, CLAVE);
            System.out.println("✅ CONEXIÓN EXITOSA A LA BASE");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("❌ ERROR DE CONEXIÓN: " + e.getMessage());
        }
        return con;
    }
}