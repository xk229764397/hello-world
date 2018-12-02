package com.javaee.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Write_knowledge {
	private Connection con;

    // 获得数据库连接
    public Write_knowledge() {
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
    
    public void writeKnowledge(String G_k) throws SQLException {
        try {
            Statement stmt = con.createStatement();
            stmt.execute("delete from general_knowledge");
            String reg = "insert into general_knowledge values(?)";       
    	    PreparedStatement pstmt = con.prepareStatement(reg);
    	    pstmt.setString(1, G_k);
    	    pstmt.execute();
    	    pstmt.close();
            stmt.close();
            con.close();
        	}catch (Exception e) {
                e.printStackTrace();
            }
    }
    
    public static void main(String args[])
    {
    	Write_knowledge Wk = new Write_knowledge();
    	try {
			Wk.writeKnowledge("天冷了");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
