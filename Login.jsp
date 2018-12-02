<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--登录网页 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="info" class="com.javaee.bean.UserInfo" scope="request">
    <jsp:setProperty property="*" name="info" />
</jsp:useBean>
<jsp:useBean id="login" class="com.javaee.bean.UserLogin"
    scope="request">
    <jsp:setProperty property="*" name="login" />
</jsp:useBean>

<html>
<head>
    <title>登录</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href="data/style.css" rel="stylesheet" type="text/css" media="all" />
    
<!--点击登录按钮对应的检查函数，检查用户输入是否为空  -->
<script language="javascript">  
function login() {
    var filter=/^\w{5,15}$/;
	var name1=document.form.name.value;
	if (!filter.test(name1)) {
        window.alert("用户名只能是字母或数字，长度5-15个字符");
        document.form.name.focus();
        return false;
    }
    var pw1=document.form.password.value;
    if (!filter.test(pw1)) {
        window.alert("密码只能是字母或数字，长度5-15个字符");
        document.form.password.focus();
        return false;
    }
    return true;
}

</script>
</head>
<body>
<!--获取表单传递的用户输入信息，调用Javabean检查数据库中是否有此用户 -->
<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");

    if (name == null) {
        name = "";
        if (password == null) {
            password = "";
        }
    }

    boolean isSuccessLogin = false;

    if (!name.equals("") && !password.equals("") && !name.equals("账号")) {
        login.setUserInfo(info);
        isSuccessLogin = login.login(name,password);
        if (isSuccessLogin) {
        	session.setAttribute("name",name);       	
            response.sendRedirect("medicine2.jsp");
        }
        else{
        	%>
        	<script language="JavaScript">
        	window.alert("该账号不存在");
        	document.form.name.focus();
        	</script> 
        	<%
        }
        isSuccessLogin = false;
    }

 %>

    <!-- main 登录显示界面-->
    <div class="main">
        <h1>
            登录
        </h1>
        <form action="" method=post name=form onSubmit="return login()">
            <input type="text" name="name" value="账号" onFocus="if (this.value == '账号') {this.value = '';}"required="">
            <input type="password" name="password" value="123456" onFocus="if (this.value == '123456') {this.value = '';}" required="">
            <input type="submit" value="登录" name="login1">
        </form>
    </div>
</body>

</html>