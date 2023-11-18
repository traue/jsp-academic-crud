package br.sisacademico.dao;

import br.sisacademico.model.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {

    public Usuario autentica(String usuario, String senha) {
        Usuario user = new Usuario();

        String query = "SELECT idUsuario, usuario "
                + "FROM usuario WHERE usuario = ? "
                + "and senha = ?";

        try {
            PreparedStatement stm = ConnectionFctory.getConnection()
                    .prepareStatement(query);

            stm.setString(1, usuario);
            stm.setString(2, senha);

            ResultSet resultado = stm.executeQuery();

            while (resultado.next()) {
                user.setIdUsuario((resultado.getInt("idUsuario")));
                user.setUserName(resultado.getString("usuario"));
                user.setAutenticado(true);
            }

            return user;

        } catch (SQLException ex) {
            return null;
        }
    }
}
