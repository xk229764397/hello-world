<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.io.*"%>
<!--注册网页 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="info" class="com.javaee.bean.UserInfo" scope="request">
    <jsp:setProperty property="*" name="info" />
</jsp:useBean>
<jsp:useBean id="regist" class="com.javaee.bean.UserRegist"
    scope="request">
    <jsp:setProperty property="*" name="regist" />
</jsp:useBean>


<html>
<head>
    <title>注册</title>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href="data/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- 点击注册按钮对应的检查函数，检查用户输入是否为空、两次密码输入是否一致 -->
<script language="javascript">  
function register() {
	var filter=/^\w{5,15}$/;
	var name1=document.registerform.name.value;
	if (!filter.test(name1)) {
        window.alert("用户名只能是字母或数字，长度5-15个字符");
        document.registerform.name.focus();
        return false;
    }
	var pw1=document.registerform.password.value;
	if (!filter.test(pw1)) {
        window.alert("密码只能是字母或数字，长度5-15个字符");
        document.registerform.password.focus();
        return false;
    }
    if (document.registerform.password.value != document.registerform.repassword.value) {
        window.alert("两次密码不同，请重新输入");
        document.registerform.repassword.focus();
        return false;
    }
    return true;
}

</script>
</head>
<body>
<!--获取表单传递的用户输入信息，调用Javabean检查数据库中此用户是否以及注册 -->
<%

    /* request.setCharacterEncoding("UTF-8"); 
    response.setCharacterEncoding("UTF-8"); 
    response.setContentType("text/html; charset=utf-8");  */

    String name = request.getParameter("name"); 
    String password = request.getParameter("password");
    String repassword = request.getParameter("repassword");

    if (name == null) {
        name = "";
        if (password == null) {
            password = "";
            if (repassword == null) {
                repassword = "";                
            }
        }
    }

    boolean isSuccessRegist = false;

    if (password.equals(repassword) && !name.equals("") && !name.equals("账号") && !password.equals("") && !repassword.equals("")) 
    {
    	
      //  name=transFormat(name);
        regist.setUserInfo(info);
        if(regist.regist()==true)
        {
        	isSuccessRegist = true;
            response.sendRedirect("Login.jsp");
        }
        else{
        	%>
        	<script language="JavaScript">
        	window.alert("该账号已注册");
        	document.registerform.name.focus();
        	</script> 
        	<%
        }
    }
 %>

    <!-- main 注册显示界面-->
    <div class="main">
        <h1>
            注册
        </h1>
        <form action="" method=post name=registerform onSubmit="return register()">
            <input type="text" name="name" value="账号" onFocus="if (this.value == '账号') {this.value = '';}"required="">
            <input type="password" name="password" value="123456" onFocus="if (this.value == '123456') {this.value = '';}" required="">
            <input type="password" name="repassword" value="123456" onFocus="if (this.value == '123456') {this.value = '';}" required="">
            <input type="submit" value="注册" name="regist1">
        </form>
    </div>
</body>

</html>