package com.javaee.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Search_medicine {
	private Connection con;

    // 获得数据库连接
    public Search_medicine() {
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
    
    public String getMedicine(String medicine) throws SQLException {
        try {
        	String sql = "select * from k_jiankewang where CommonName like ?;";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, "%"+medicine+"%");

			ResultSet rst = ps.executeQuery();

            if (rst.next()) {
            	String k=rst.getString(6);
            	//System.out.println(k);
            	return k;
            } 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static void main(String []args) throws SQLException
    {
    	Search_medicine Sm = new Search_medicine();
    	Sm.getMedicine("强力枇杷");
    }
}
