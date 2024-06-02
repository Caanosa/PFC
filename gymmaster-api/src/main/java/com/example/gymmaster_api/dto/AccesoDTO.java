package com.example.gymmaster_api.dto;

/**
 * Clase AccesoDTO que representa los datos de acceso de un usuario.
 */
public class AccesoDTO {
    //Declaracion de variables
    private String nombreUsuario;
    private String claveAcceso;

    /**
     * Construcyor vacio
     */
    public AccesoDTO() {
    }

    /**
     *
     * @param nombreUsuario
     * @param claveAcceso
     */
    public AccesoDTO(String nombreUsuario, String claveAcceso) {
        this.nombreUsuario = nombreUsuario;
        this.claveAcceso = claveAcceso;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getClaveAcceso() {
        return claveAcceso;
    }

    public void setClaveAcceso(String claveAcceso) {
        this.claveAcceso = claveAcceso;
    }


    @Override
    public String toString() {
        return "AccesoDTO{" +
                "nombreUsuario='" + nombreUsuario + '\'' +
                ", claveAcceso='" + claveAcceso + '\'' +
                '}';
    }
}
