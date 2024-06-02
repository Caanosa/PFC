package com.example.gymmaster_api.dto;

import java.util.List;

public class RutinaDTO {
    private int id_rutina;
    private String nombre_rutina;
    private List<DiaDTO> dias_semana;

    public RutinaDTO() {
    }

    public RutinaDTO(int id_rutina, String nombre_rutina, List<DiaDTO> dias_semana) {
        this.id_rutina = id_rutina;
        this.nombre_rutina = nombre_rutina;
        this.dias_semana = dias_semana;
    }

    public int getId_rutina() {
        return id_rutina;
    }

    public void setId_rutina(int id_rutina) {
        this.id_rutina = id_rutina;
    }

    public String getNombre_rutina() {
        return nombre_rutina;
    }

    public void setNombre_rutina(String nombre_rutina) {
        this.nombre_rutina = nombre_rutina;
    }

    public List<DiaDTO> getDias_semana() {
        return dias_semana;
    }

    public void setDias_semana(List<DiaDTO> dias_semana) {
        this.dias_semana = dias_semana;
    }


}
