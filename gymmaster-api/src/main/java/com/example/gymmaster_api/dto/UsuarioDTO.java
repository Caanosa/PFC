package com.example.gymmaster_api.dto;

/**
 * Clase UsuarioDTO que representa los datos de un usuario.
 */
public class UsuarioDTO {
    //Declaracion de variables
    private int usuarioId;

    private String nombreUsuario;

    private String passwordUsuario;
    private int nivel;
    private int xp;

    /**
     * Constructor vacio
     */
    public UsuarioDTO() {
    }

    public UsuarioDTO(int usuarioId, String nombreUsuario, String passwordUsuario, int nivel, int xp) {
        this.usuarioId = usuarioId;
        this.nombreUsuario = nombreUsuario;
        this.passwordUsuario = passwordUsuario;
        this.nivel = nivel;
        this.xp = xp;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getPasswordUsuario() {
        return passwordUsuario;
    }

    public void setPasswordUsuario(String passwordUsuario) {
        this.passwordUsuario = passwordUsuario;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public int getXp() {
        return xp;
    }

    public void setXp(int xp) {
        this.xp = xp;
    }

}
