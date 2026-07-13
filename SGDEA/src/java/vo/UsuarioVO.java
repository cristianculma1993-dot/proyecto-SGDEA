package vo;

public class UsuarioVO {
    private int id_usuario;
    private String email_usuario;
    private int id_rol;
    private String nombre;
    private String password;
    private String estado;

    // Constructor completo
    public UsuarioVO(int id_usuario, String email_usuario, int id_rol, String nombre, String password, String estado) {
        this.id_usuario = id_usuario;
        this.email_usuario = email_usuario;
        this.id_rol = id_rol;
        this.nombre = nombre;
        this.password = password;
        this.estado = estado;
    }

    // Getters y Setters completos
    public int getIdUsuario() { return id_usuario; }
    public void setIdUsuario(int id_usuario) { this.id_usuario = id_usuario; }

    public String getEmailUsuario() { return email_usuario; }
    public void setEmailUsuario(String email_usuario) { this.email_usuario = email_usuario; }

    public int getIdRol() { return id_rol; }
    public void setIdRol(int id_rol) { this.id_rol = id_rol; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }
}
    

