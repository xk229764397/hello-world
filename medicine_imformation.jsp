<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--药品介绍页面 -->
<jsp:useBean id="Sm" class="com.javaee.bean.Search_medicine" scope="request">
    <jsp:setProperty property="*" name="Sm" />
</jsp:useBean>
<!DOCTYPE html>
<html>
  <head>
    <title>药品介绍</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/药品介绍/styles.css" type="text/css" rel="stylesheet"/>
    <script src="resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="resources/scripts/prototypePre.js"></script>
    <script src="data/document.js"></script>
    <script src="resources/scripts/prototypePost.js"></script>
    <script src="files/药品介绍/data.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
    </script>
  </head>
  <body>
    <div id="base" class="">

      <!-- Unnamed (图像) 显示药品图像区域-->
      <div id="u45" class="ax_default image">
        <img id="u45_img" class="img " src="images/药品介绍/u44.png"/>
        </div>
      </div>
      
		<%
		int key1=0,key2=0;
		String medicine=(String)session.getAttribute("m"); 
		String m_imformation=Sm.getMedicine(medicine);
		if(m_imformation==null) m_imformation="";
		%>
		
      <!-- Unnamed (文本框(多行)) 显示药品信息区域-->
      <div id="u47" class="ax_default text_area">
        <textarea cols="65" rows="32"  readonly=true>
        <% 
        	  if(!m_imformation.equals("")){
				  for(key1=0;key1<m_imformation.length();key1++)
				  {
					  if(m_imformation.charAt(key1)=='@')
					  {%>
<%=m_imformation.substring(key2,key1)%>
		<%	  key2=key1+1;
					  }
				  }
		      }
        %>
        
        </textarea>
      </div>
    </div>
  </body>
</html>
