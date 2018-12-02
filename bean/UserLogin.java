package com.javaee.bean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserLogin {
	private static UserInfo userInfo = new UserInfo();
    private Connection con;

    // 获得数据库连接
    public UserLogin() {
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

    // 获取已经注册的用户信息
    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    // 进行登录查询验证
    public boolean login(String name, String password) throws SQLException {
        try {
            Statement stmt = con.createStatement();
            ResultSet rst = stmt.executeQuery("select name, password from user_Info where name= '" + name + "' and password='" + password + "'");
            if (rst.next()) {
                rst.close();
                stmt.close();
                con.close();
                return true;
            } else {
                rst.close();
                stmt.close();
                con.close();
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static void main(String []args){
    	UserLogin ur= new UserLogin();
    	try {
			ur.login("wd","123");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	//System.out.println(userInfo.getName());
    }
}
