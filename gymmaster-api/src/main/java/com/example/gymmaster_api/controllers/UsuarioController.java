package com.example.gymmaster_api.controllers;

import com.example.gymmaster_api.Conexion;
import com.example.gymmaster_api.dto.AccesoDTO;
import com.example.gymmaster_api.dto.UsuarioDTO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.*;

/**
 * Esta clase es para cualquier cosa relacionada con los usuarios
 */
@RestController
public class UsuarioController {

    public UsuarioController(){

    }


    /**
     * Crea un nuevo usuario.
     *
     * @param usuario Objeto UsuarioDTO que contiene los datos del usuario a crear.
     * @return ResponseEntity con el usuario creado si la operación fue exitosa,
     *         ResponseEntity con un mensaje de error si hubo un problema.
     * @throws SQLException Si hay un error al ejecutar la consulta SQL.
     */
    @PostMapping("/api/usuarios")
    ResponseEntity<?> crearUsuario(@RequestBody UsuarioDTO usuario) throws SQLException {
        Connection c = null;
        c = Conexion.obtenerConexion();

        PreparedStatement s = null;

        try {
            s = c.prepareStatement("insert into USUARIO (NOMBREUSUARIO , PASSWORDUSUARIO, NIVEL, XP) values (?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            s . setString(1,usuario.getNombreUsuario());
            s . setString(2,usuario.getPasswordUsuario());
            s . setInt(3,usuario.getNivel());
            s . setInt(4,usuario.getXp());
            s.executeUpdate();


            ResultSet generatedKeys = s.getGeneratedKeys();
            if (generatedKeys.next()){
                usuario.setUsuarioId(generatedKeys.getInt(1));
                return ResponseEntity.ok(usuario);
            }



        }catch (SQLException e ){
            System.out.println("consulta ko");
            throw new RuntimeException();
        }
        finally {
            if (s!=null) s.close();
            if (c!=null) c.close();
        }
        return ResponseEntity.badRequest().body("Fallo al crear usuario");
    }

    @PostMapping("/api/registrarse")
    ResponseEntity<?> resgistrarse(@RequestBody UsuarioDTO usuario) throws SQLException {
        Connection c = null;
        c = Conexion.obtenerConexion();

        PreparedStatement s = null;

        try {
            s = c.prepareStatement("insert into USUARIO (NOMBREUSUARIO , PASSWORDUSUARIO, NIVEL, XP) values (?,?,1,0)", Statement.RETURN_GENERATED_KEYS);
            s . setString(1,usuario.getNombreUsuario());
            s . setString(2,usuario.getPasswordUsuario());
            s.executeUpdate();


            ResultSet generatedKeys = s.getGeneratedKeys();
            if (generatedKeys.next()){
                usuario.setUsuarioId(generatedKeys.getInt(1));
                return ResponseEntity.ok(usuario);
            }



        }catch (SQLException e ){
            System.out.println("consulta ko");
            throw new RuntimeException();
        }
        finally {
            if (s!=null) s.close();
            if (c!=null) c.close();
        }
        return ResponseEntity.badRequest().body("Fallo al registrarse");
    }

    /**
     * Inicia sesión de usuario.
     *
     * @param accesoDTO Objeto AccesoDTO que contiene los datos de acceso del usuario.
     * @return ResponseEntity con el accesoDTO si las credenciales son válidas,
     *         ResponseEntity con un mensaje de error si las credenciales son inválidas o hubo un problema.
     * @throws SQLException Si hay un error al ejecutar la consulta SQL.
     */
    @PostMapping("/api/iniciar-sesion")
    ResponseEntity<?> iniciarSesion(@RequestBody AccesoDTO accesoDTO) throws SQLException {
        if (accesoDTO.getClaveAcceso() != null && accesoDTO.getNombreUsuario() != null) {
            Connection c = null;
            c = Conexion.obtenerConexion();

            PreparedStatement s = null;

            try {
                s = c.prepareStatement("select * from USUARIO where NOMBREUSUARIO like ? AND PASSWORDUSUARIO like ?");
                s . setString(1, accesoDTO.getNombreUsuario());
                s . setString(2, accesoDTO.getClaveAcceso());

                ResultSet res = s.executeQuery();

                if(res.next()){
                    UsuarioDTO usuario = new UsuarioDTO();
                    usuario.setUsuarioId(res.getInt("USUARIOID"));
                    usuario.setNombreUsuario(res.getString("NOMBREUSUARIO"));
                    usuario.setPasswordUsuario(res.getString("PASSWORDUSUARIO"));
                    usuario.setNivel(res.getInt("NIVEL"));
                    usuario.setXp(res.getInt("XP"));

                    if (usuario.getNombreUsuario().equals(accesoDTO.getNombreUsuario()) && usuario.getPasswordUsuario().equals(accesoDTO.getClaveAcceso())){
                        return ResponseEntity.ok(usuario);
                    }
                }
            }catch (SQLException e ){
                System.out.println("consulta ko");
                throw new RuntimeException();
            }
            finally {
                if (s!=null) s.close();
                if (c!=null) c.close();
            }
        }
        return ResponseEntity.badRequest().body("Fallo al iniciar sesión");
    }

    @GetMapping("/api/usuarios/{nombreUsuario}")
    ResponseEntity<?> obtenerUsuarioPorNombre(@PathVariable String nombreUsuario) throws SQLException {
        Connection c = null;
        c = Conexion.obtenerConexion();

        PreparedStatement s = null;

        try {
            s = c.prepareStatement("select * from USUARIO where NOMBREUSUARIO = ?");
            s.setString(1, nombreUsuario);

            ResultSet res = s.executeQuery();

            if (res.next()) {
                UsuarioDTO usuario = new UsuarioDTO();
                usuario.setUsuarioId(res.getInt("USUARIOID"));
                usuario.setNombreUsuario(res.getString("NOMBREUSUARIO"));
                usuario.setPasswordUsuario(res.getString("PASSWORDUSUARIO"));
                usuario.setNivel(res.getInt("NIVEL"));
                usuario.setXp(res.getInt("XP"));

                return ResponseEntity.ok(usuario);
            }

        } catch (SQLException e) {
            System.out.println("consulta ko");
            throw new RuntimeException();
        } finally {
            if (s != null) s.close();
            if (c != null) c.close();
        }
        return ResponseEntity.badRequest().body("Usuario no encontrado");
    }
}
