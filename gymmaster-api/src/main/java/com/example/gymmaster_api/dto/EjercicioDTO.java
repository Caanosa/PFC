package com.example.gymmaster_api.dto;

public class EjercicioDTO {
    private int id_ejercicio;
    private String nombre_ejercicio;
    private double peso_ejercicio;
    private int series_ejercicio;
    private int repeticiones_ejercicio;

    public EjercicioDTO() {
    }

    public EjercicioDTO(int id_ejercicio, String nombre_ejercicio, double peso_ejercicio, int series_ejercicio, int repeticiones_ejercicio) {
        this.id_ejercicio = id_ejercicio;
        this.nombre_ejercicio = nombre_ejercicio;
        this.peso_ejercicio = peso_ejercicio;
        this.series_ejercicio = series_ejercicio;
        this.repeticiones_ejercicio = repeticiones_ejercicio;
    }

    public int getId_ejercicio() {
        return id_ejercicio;
    }

    public void setId_ejercicio(int id_ejercicio) {
        this.id_ejercicio = id_ejercicio;
    }

    public String getNombre_ejercicio() {
        return nombre_ejercicio;
    }

    public void setNombre_ejercicio(String nombre_ejercicio) {
        this.nombre_ejercicio = nombre_ejercicio;
    }

    public double getPeso_ejercicio() {
        return peso_ejercicio;
    }

    public void setPeso_ejercicio(double peso_ejercicio) {
        this.peso_ejercicio = peso_ejercicio;
    }

    public int getSeries_ejercicio() {
        return series_ejercicio;
    }

    public void setSeries_ejercicio(int series_ejercicio) {
        this.series_ejercicio = series_ejercicio;
    }

    public int getRepeticiones_ejercicio() {
        return repeticiones_ejercicio;
    }

    public void setRepeticiones_ejercicio(int repeticiones_ejercicio) {
        this.repeticiones_ejercicio = repeticiones_ejercicio;
    }
}
