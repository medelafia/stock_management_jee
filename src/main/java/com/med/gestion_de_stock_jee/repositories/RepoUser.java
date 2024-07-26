package com.med.gestion_de_stock_jee.repositories;


import com.med.gestion_de_stock_jee.accessDB.AccessBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RepoUser {
    public boolean validate(String login , String password) {
        Connection connection = AccessBD.connexionDB() ;
        if(connection != null) {
            String sql = "SELECT * FROM users WHERE login=? AND password=?";
            try (PreparedStatement stmt = connection.prepareStatement(sql)){
                stmt.setString(1, login);
                stmt.setString(2, password);
                ResultSet res = stmt.executeQuery();
                if (res.next()) {
                    return true;
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }finally {
                try {
                    connection.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }

        }
        return false ;
    }
}
