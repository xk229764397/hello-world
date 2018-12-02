package com.javaee.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class General_knowledge {
	private Connection con;

    // 获得数据库连接
    public General_knowledge() {
    	String Classforname = "com.mysql.cj.jdbc.Driver";
        String Servanddb = "jdbc:mysql://localhost:3306/sqltest"+"?serverTimezone=GMT%2B8";
        String user = "root";
        String pwd = "024111";
        try {
            Class.forName(Classforname);
            con = (Connection) DriverManager.getConnection(Servanddb, user, pwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public String getKnowledge() throws SQLException {
        try {
            Statement stmt = con.createStatement();
            ResultSet rst = stmt.executeQuery("select knowledge from general_knowledge");
            if (rst.next()) {
            	String k=rst.getString(1);
                rst.close();
                stmt.close();
                con.close();
                return k;
            } 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
