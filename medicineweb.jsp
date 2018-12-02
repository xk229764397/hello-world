 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.javaee.bean.Write_history" %>
<!--主网页 -->
<jsp:useBean id="Gk" class="com.javaee.bean.General_knowledge" scope="request">
    <jsp:setProperty property="*" name="Gk" />
</jsp:useBean>
<jsp:useBean id="Sm" class="com.javaee.bean.Search_medicine" scope="request">
    <jsp:setProperty property="*" name="Sm" />
</jsp:useBean>
<!DOCTYPE html>
<html>
  <head>
    <title>首页</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/首页/styles.css" type="text/css" rel="stylesheet"/>
    <style type="text/css">a {text-decoration: none}</style>
    <script src="resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="resources/scripts/prototypePre.js"></script>
    <script src="data/document.js"></script>
    <script src="resources/scripts/prototypePost.js"></script>
    <script src="files/首页/data.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
    </script>
  </head>
  <body>
    <div id="base" class="">

      <!-- Unnamed (图像) 药品推荐区域背景-->
      <div id="u0" class="ax_default image">
        <img id="u0_img" class="img " src="images/首页/u0.jpg"/>
        <!-- Unnamed () -->
        <div id="u1" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (图像) 左上角区域的网站名商标-->
      <div id="u2" class="ax_default image">
        <img id="u2_img" class="img " src="images/首页/u2.png"/>
        <!-- Unnamed () -->
        <div id="u3" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) 药品分类标签-->
      <div id="u4" class="ax_default _标题2">
        <div id="u4_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u5" class="text">
          <p><span>药品分类</span></p>
        </div>
      </div>

      <!-- Unnamed (图像) 主网站下方小常识区域-->
      <div id="u6" class="ax_default image">
        <img id="u6_img" class="img " src="images/首页/u6.jpg"/>
        <!-- Unnamed () -->
        <div id="u7" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

		<%
			String G_k=Gk.getKnowledge();
			String G_k_fifty="",G_k_last="";
			if(G_k.length()>15){
				 G_k_fifty=G_k.substring(0,15);
				 G_k_last=G_k.substring(15,G_k.length());
			}
			else  G_k_fifty=G_k;
		%>
      <!-- Unnamed (矩形) 获取管理员输入的小常识-->
      <div id="u8" class="ax_default _标题2">
        <div id="u8_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u9" class="text">
          <p><span>小常识:<%=G_k_fifty %></span></p>
          <%if(!G_k_last.equals("")){%>
          <p><span><%=G_k_last %></span></p>
          <%} %>
        </div>
      </div>

      <!-- Unnamed (下拉列表框) 用户选择要输入的是症状、药品、还是疾病-->
      <div id="u10" class="ax_default droplist">
        <select id="u10_input">
          <option value="症状">症状</option>
          <option value="药品">药品</option>
          <option value="疾病">疾病</option>
        </select>
      </div>

	  <form action="" method=post>
      <!-- Unnamed (文本框(单行)) 用户输入文本框-->
      <div id="u11" class="ax_default text_field">
        <input id="u11_input" name=search1 type="text" value=""/>
      </div>

      <!-- Unnamed (HTML按钮) 搜索按钮-->
      <div id="u12" class="ax_default html_button">
        <input id="u12_input" type="submit" value="搜索" onClick="search()"/>
      </div>
	  </form>
	  
      <!-- Unnamed (矩形) 首页最上方一行灰色区域-->
      <div id="u13" class="ax_default box_2">
        <div id="u13_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u14" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (HTML按钮) 注册按钮-->
      <div id="u15" class="ax_default html_button">
        <a href="Register.jsp"><font size="6" color="blue">注册</font></a>
      </div>

      <!-- Unnamed (HTML按钮) 登录按钮-->
      <div id="u16" class="ax_default html_button">
        <a href="Login.jsp"><font size="6" color="blue">登录</font></a>
      </div>
	  
	  <%
		request.setCharacterEncoding("UTF-8");
		String st0=request.getParameter("search1"); 
		String st="";
		String m_imformation="";
		int key=0;
		  if(st0==null) st0="";
		  if(!st0.equals("")) 
			{
			  st=new String(st0.getBytes("iso8859-1"),"UTF-8");
			  session.setAttribute("m",st);
			  Write_history W_h = new Write_history(); 
			  W_h.writeFileByLines(st);
			  m_imformation = Sm.getMedicine(st);
			  if(m_imformation==null) m_imformation="";
			  if(!m_imformation.equals("")){
				  for(key=0;key<m_imformation.length();key++)
				  {
					  if(m_imformation.charAt(key)=='@') break;
				  }
			  }
			  
			}
		%>
	  <!-- Unnamed (文本框(多行)) 获取点击搜索按钮之后得到的信息并且显示在主页中心-->
      <div id="u17" class="ax_default text_area">
      	<%=m_imformation.substring(0,key) %>
      	<%if(!m_imformation.equals("")) {%>
        <br><a href="medicine_imformation.jsp"><font color="blue">更多信息</font></a>
        <%} %>
      </div>
       
      </div>

  </body>
</html>

