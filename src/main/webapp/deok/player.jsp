<%@page import="util.StringUtil"%>
<%@page import="vo.Player"%>
<%@page import="java.util.List"%>
<%@page import="dao.PlayerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>선수</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<style>
	ul {
        list-style-type: none;
      }
      li:before {
        content: "\f105";
        font-family: FontAwesome;
        margin-left: -1.0em;
        margin-right: 0.5em;
      }
</style>
</head>
<body>
<jsp:include page="../common/nav_home.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>
<div class="container">
	<%
	  
	  	int playerNo = StringUtil.stringToInt(request.getParameter("playerNo"));
	  	PlayerDao playerDao = PlayerDao.getInstance();
	  	Player player = playerDao.getPlayerNoPlayer(playerNo);
	  		
	  	
	  			
	%>
	<div class="row shadow-lg p-3 mb-5 bg-body rounded">
		<div class="col-4">
			<a href="">
				<img alt="" src="../player/<%=player.getPlayerNo() %>.png" style="height: 400; width: 300; object-fit: contain" class="img-thumbnail">
			</a>
		</div>
		<div class="col-6 m-3">
			
				
            <div class="row">
              	<div class="col-6">
                	<ul class="p-3">
                  		<li style="list-style: none;" class="p-3"><i class="bi bi-chevron-right"></i> <strong>이름: </strong> <span>  <%=player.getName() %></span></li>
                  		<li style="list-style: none;" class="p-3"><i class="bi bi-chevron-right"></i> <strong>출생일: </strong> <span>  <%=player.getBirth() %></span></li>
                  		<li style="list-style: none;" class="p-3"><i class="bi bi-chevron-right"></i> <strong>국적: </strong> <span>  <%=player.getNationality() %></span></li>
               		</ul>
              	</div>
              		<div class="col-6">
                		<ul class="p-3">
                  			<li style="list-style: none;" class="p-3"><i class="bi bi-chevron-right"></i> <strong>등번호: </strong> <span>  <%=player.getUfNo() %></span></li>
                  			<li style="list-style: none;" class="p-3"><i class="bi bi-chevron-right"></i> <strong>득점: </strong> <span>  <%=player.getGoal() %></span></li>
                		</ul>
              		</div>
            	</div>
          	
		</div>
	</div>
		
		
</div> 

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>