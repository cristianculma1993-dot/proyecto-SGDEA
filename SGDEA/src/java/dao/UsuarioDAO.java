package dao;

import conexion.Conexion;
import vo.UsuarioVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {

    public UsuarioVO validarAcceso(String correo, String clave, int rol) {
        // ✅ MENSAJES PARA VER QUÉ SE BUSCA
        System.out.println("=== VALORES RECIBIDOS ===");
        System.out.println("Correo: |" + correo + "|");
        System.out.println("Clave: |" + clave + "|");
        System.out.println("Rol: |" + rol + "|");
        System.out.println("=========================");

        UsuarioVO usuario = null;
        Connection conn = null;

        // ✅ CONSULTA CORREGIDA: QUITA ESPACIOS Y VALIDA ESTADO
        String sql = "SELECT * FROM usuarios WHERE TRIM(email_usuario) = ? AND TRIM(password) = ? AND id_rol = ? AND estado = '1'";

        try {
            Conexion con = new Conexion();
            conn = con.conectar();

            if (conn == null) {
                System.err.println("❌ NO SE PUDO CONECTAR A LA BASE");
                return null;
            }

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, clave);
            ps.setInt(3, rol);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                System.out.println("✅ USUARIO ENCONTRADO CORRECTAMENTE");
                usuario = new UsuarioVO(
                    rs.getInt("id_usuario"),
                    rs.getString("email_usuario"),
                    rs.getInt("id_rol"),
                    rs.getString("nombre"),
                    rs.getString("password"),
                    rs.getString("estado")
                );
            } else {
                System.out.println("❌ NO HAY COINCIDENCIA EN LA BASE");
            }

            rs.close();
            ps.close();

        } catch (SQLException e) {
            System.err.println("❌ ERROR EN CONSULTA: " + e.getMessage());
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("❌ ERROR AL CERRAR CONEXIÓN: " + e.getMessage());
            }
        }
        return usuario;
    }
}