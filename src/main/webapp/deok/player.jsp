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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<style>
      span {
      	    -webkit-text-size-adjust: 100%;
		    font: normal 14px Helvetica,Arial,sans-serif;
		    list-style-type: none;
		    letter-spacing: normal;
		    word-spacing: normal;
		    white-space: normal;
		    box-sizing: inherit;
		    -webkit-font-smoothing: antialiased;
		    font-family: Gotham Narrow SSm A,Gotham Narrow SSm B,sans-serif;
		    font-weight: 700;
		    color: #2f3133;
		    text-transform: uppercase;
		    font-size: 24px;
		    line-height: .92;
		    padding-left: 0;
		    padding-right: 0;
      }
      strong {
      	    -webkit-text-size-adjust: 100%;
		    font: normal 14px Helvetica,Arial,sans-serif;
		    list-style-type: none;
		    letter-spacing: normal;
		    word-spacing: normal;
		    white-space: normal;
		    box-sizing: inherit;
		    -webkit-font-smoothing: antialiased;
		    font-size: 13px;
		    line-height: 1.23;
		    color: #696b6d;
		    padding-bottom: 8px;
		    padding-left: 0;
		    padding-right: 0;
      }
</style>
</head>
<body>
<jsp:include page="../common/nav3.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>
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
				<img alt="" src="../player/<%=player.getPlayerNo() %>.png" style="height: 400px; width: 300px; object-fit: contain" class="img-thumbnail">
			</a>
		</div>
		<div class="col-6 m-3">
			
				
            <div class="row">
              	<div class="col-6 p-5">
              		<div>
                  		<strong> 이름 </strong> 
              		</div>
              		<div class="mb-3">
                  		<span>  <%=player.getName() %></span>
              		</div>
              		<hr>
              		<div>
                  		 <strong>출생일 </strong> 
              		</div>
              		<div class="mb-3">
                  		 <span>  <%=player.getBirth() %></span>
              		</div>
              		<hr>
              		<div>
                  		 <strong>국적 </strong>
              		</div>
              		<div>
                  		  <span>  <%=player.getNationality() %></span>
              		</div>
              	</div>
              	<div class="col-6 p-5">
              		<div>
                  			<strong>등번호 </strong> 
              		</div>
              		<div class="mb-3">
                  			<span>  <%=player.getUfNo() %></span>
              		</div>
              		<hr>
              		<div>
              		
                  			<strong>득점 </strong> 
              		</div>
              		<div>
              		
                  			<span>  <%=player.getGoal() %></span>
              		</div>
              		<hr>
              		<div>
              		
                  			<strong>포지션 </strong> 
              		</div>
              		<div>
              		
                  			<span>  <%=player.getPosition() %></span>
              		</div>
            	</div>
          	
		</div>
		<hr>	
	</div>
		
</div> 
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>