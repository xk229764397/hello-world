package com.javaee.bean;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UserRegist {
	private static UserInfo userInfo = new UserInfo();
    private Connection con;

    // 获得数据库连接
    public UserRegist() {
        String Classforname = "com.mysql.cj.jdbc.Driver";
        String Servanddb = "jdbc:mysql://localhost:3306/sqltest"+"?serverTimezone=GMT%2B8";
        String user = "root";
        String pwd = "024111";
        try {
            Class.forName(Classforname);
           con =  (Connection)DriverManager.getConnection(Servanddb, user, pwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 设置待注册的用户信息
    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    // 进行注册
    public boolean regist() throws SQLException  {
        String reg1 = "select name from user_info";
        PreparedStatement pstmt1 = con.prepareStatement(reg1);
    	ResultSet rs = pstmt1.executeQuery();
    	boolean real=true;
    	while(rs.next())
    	{
    		String namet=rs.getString(1);
    		if(namet.equals(userInfo.getName())) real=false;    	
    	}
    	if(real==true)
    	{
    	String reg = "insert into user_info values(?,?)";       
	    PreparedStatement pstmt = con.prepareStatement(reg);
	    //pstmt.setString(1, transFormat(userInfo.getName()));
	    pstmt.setString(1, userInfo.getName());
	    pstmt.setString(2, userInfo.getPassword());
	    pstmt.execute();
    	}
    	else return false;
		return true;
            
    }

    String transFormat(String s) {
        try {
            byte[] b = s.getBytes("iso-8859-1");
            s = new String(b);
        } catch (UnsupportedEncodingException e) {
            System.out.println(e.toString());
        }
        return s;
    }
    
    public static void main(String []args)  {
    	UserRegist ur= new UserRegist();
    	try {
			ur.regist();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	//System.out.println(userInfo.getName());
    }
}
