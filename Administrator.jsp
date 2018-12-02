<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="Wk" class="com.javaee.bean.Write_knowledge" scope="request">
    <jsp:setProperty property="*" name="Wk" />
</jsp:useBean>
<html>
<head>
<style type="text/css">body {background:url("images/首页/u6.jpg") no-repeat center 0}</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员发布消息</title>
</head>
<body>
<center>
<form action="" method=post>
<input name=add1 type="text" value="" maxlength="34"/>
<input type="submit" value="发布消息"/>
</form>
</center>
<%
request.setCharacterEncoding("UTF-8");
String G_k = request.getParameter("add1"); 
if (G_k == null) G_k = "";
if(!G_k.equals(""))
{
	String G = new String(G_k.getBytes("iso8859-1"),"UTF-8");
	Wk.writeKnowledge(G);
}

%>
</body>
</html>