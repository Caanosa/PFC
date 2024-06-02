package com.example.gymmaster_api.dto;

import java.util.List;

public class DiaDTO {

    private int id_dia;
    private String nombre_dia;
    private List<EjercicioDTO> ejercicios;

    public DiaDTO() {
    }

    public DiaDTO(int id_dia, String nombre_dia, List<EjercicioDTO> ejercicios) {
        this.id_dia = id_dia;
        this.nombre_dia = nombre_dia;
        this.ejercicios = ejercicios;
    }

    public int getId_dia() {
        return id_dia;
    }

    public void setId_dia(int id_dia) {
        this.id_dia = id_dia;
    }

    public String getNombre_dia() {
        return nombre_dia;
    }

    public void setNombre_dia(String nombre_dia) {
        this.nombre_dia = nombre_dia;
    }

    public List<EjercicioDTO> getEjercicios() {
        return ejercicios;
    }

    public void setEjercicios(List<EjercicioDTO> ejercicios) {
        this.ejercicios = ejercicios;
    }
}
