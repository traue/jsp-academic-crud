package br.com.traue.academicsys.dao;

import br.com.traue.academicsys.model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public User authentication(String usuario, String senha) {
        User user = new User();

        String query = "SELECT uid, user "
                + "FROM user WHERE user = ? "
                + "and password = ?";

        try {
            PreparedStatement stm = ConnectionFctory.getConnection()
                    .prepareStatement(query);

            stm.setString(1, usuario);
            stm.setString(2, senha);

            ResultSet resultado = stm.executeQuery();

            while (resultado.next()) {
                user.setIdUsuario((resultado.getInt("uid")));
                user.setUserName(resultado.getString("user"));
                user.setAutenticado(true);
            }

            return user;

        } catch (SQLException ex) {
            return null;
        }
    }
}
