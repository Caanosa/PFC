package com.example.gymmaster_api.controllers;

import com.example.gymmaster_api.Conexion;
import com.example.gymmaster_api.dto.DiaDTO;
import com.example.gymmaster_api.dto.EjercicioDTO;
import com.example.gymmaster_api.dto.RutinaDTO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@RestController
public class RutinaController {


    /**
     *
     * @return
     * @throws SQLException
     */
    @GetMapping("api/gymmaster/rutinas")
    ResponseEntity<?> devolverRutinas() throws SQLException {
        Connection c = null;
        c = Conexion.obtenerConexion();

        PreparedStatement s = null;

        try {
            s = c.prepareStatement("select * from RUTINA");
            ResultSet res = s.executeQuery();

            s = c.prepareStatement("select * from DIA");
            ResultSet res2 = s.executeQuery();


            List<RutinaDTO> rutinas = new ArrayList<>();
            List<DiaDTO> dias = new ArrayList<>();
            List<EjercicioDTO> ejercicios = new ArrayList<>();
            while (res.next()){
                while (res2.next()){
                    s = c.prepareStatement("select * from EJERCICIO INNER JOIN INCLUIR ON EJERCICIO.ID_EJERCICIO = INCLUIR.ID_EJERCICIO WHERE INCLUIR.ID_DIA = ?");
                    s.setInt(1,res2.getInt("ID_DIA"));
                    ResultSet res3 = s.executeQuery();
                    while (res3.next()){
                        ejercicios.add(new EjercicioDTO(res3.getInt("ID_EJERCICIO"), res3.getString("NOMBRE_EJERCICIO"), res3.getDouble("PESO_EJERCICIO"), res3.getInt("SERIES_EJERCICIO"), res3.getInt("REPETICIONES_EJERCICIO")));
                    }
                    dias.add(new DiaDTO(res2.getInt("ID_DIA"), res2.getString("NOMBRE_DIA"), ejercicios));
                }
                rutinas.add(new RutinaDTO(res.getInt("ID_RUTINA"), res.getString("NOMBRE_RUTINA"), dias));
            }

            return ResponseEntity.ok(rutinas);

        }catch (SQLException e ){
            System.out.println("consulta ko");
            return ResponseEntity.badRequest().body("No se pudo devolver la consulta");
        }
        finally {
            if (s!=null) s.close();
            if (c!=null) c.close();
        }

    }
}
