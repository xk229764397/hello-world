<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<html>
  <head>
    <title>个人空间</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/个人空间/styles.css" type="text/css" rel="stylesheet"/>
    <script src="resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="resources/scripts/prototypePre.js"></script>
    <script src="data/document.js"></script>
    <script src="resources/scripts/prototypePost.js"></script>
    <script src="files/个人空间/data.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
    </script>
  </head>
  <body>
    <div id="base" class="">

      <!-- Unnamed (矩形) -->
      <div id="u18" class="ax_default box_2">
        <div id="u18_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u19" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u20" class="ax_default _标题1">
        <div id="u20_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u21" class="text">
        <%String name=(String)session.getAttribute("name"); 
        if (name == null) name = "";
        if(name.equals("")) response.sendRedirect("Falseweb.jsp");
        %>
          <p><span><h><%=name%></h> 的 个 人 空 间</span></p>
        </div>
      </div>

      <!-- Unnamed (HTML按钮) -->
      <div id="u22" class="ax_default html_button">
        <h1>历史记录</h1>
      </div>
		<%
		File file = new File("D:\\eclipse javaEE\\my\\WebContent\\history.txt");  
        BufferedReader reader = null;
        if(file.exists())
        try {
            reader = new BufferedReader(new FileReader(file));  
            String tempString = null;  
            int line = 1;  
            // 一次读入一行，直到读入null为文件结束                 
		%>
      <!-- Unnamed (文本框(多行)) -->
      <div id="u23" class="ax_default text_area">
        <%
        while ((tempString = reader.readLine()) != null) {  
            // 显示行号  
        	//out.println("line " + line + ": " + tempString+"\n");%>
        	<p><%=line %>:   <%=tempString %></p>
        	<%line++;  
            }
            reader.close();  
        } catch (IOException e) {  
            e.printStackTrace();  
        } finally {  
            if (reader != null) {  
                try {  
                    reader.close();  
                } catch (IOException e1) {  
                }  
            }  
        }  %>
      </div>
    </div>
  </body>
</html>

