<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="org.ciotc.gateway.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="zh">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="refresh" content="10" />
    <link rel="shortcut icon" href="favicon.png">

    <title>网关配置</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/theme.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body role="document">


    <div class="container" role="main">  
    <h1>网关Web控制台</h1>
	<form action="manage.jsp" method="get">
	<%  
	if(!GWManager.getInstance().running){
	%>
	启动网关<input type="submit" value="启动" name="start"><br />
	<%} else {%>
	停止网关<input type="submit" value="停止" name="stop"><br />
	<%}%>
	</form>
	
	<% if(GWManager.getInstance().running){
		long runTime = System.currentTimeMillis() - GWManager.getInstance().startTime;
	%>
	<h2>网关服务器运行状态</h2>
	<ul>
	    <li>运行时间：<%=runTime/1000 %>s</li>
       <%
       HashMap<String,String> stat = ConnectionManager.getInstance().status();
       Set<String> keys = stat.keySet();
       for(String key : keys){
       %>
       <li><%=key %> &nbsp; <%=stat.get(key) %></li>
       <% 
       }
		}
       %>  	
	</ul>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>