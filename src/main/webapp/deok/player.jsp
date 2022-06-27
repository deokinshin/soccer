<%@page import="vo.User"%>
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
<link href="/soccer/favicon.ico" rel="icon" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<style>
      .span2 {
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
      .name {
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
    h1,h3,h5 {
		font-family: 'GmarketSansBold';
	}
	@font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
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
	<div class="p-3">
		<h1>선수 상세 정보</h1>
	</div>
	<hr>
	<div class="row shadow-lg p-3 mb-5 bg-body rounded">
		<div class="col-4">
			<a href="">
				<img alt="" src="../player/<%=player.getFileName() %>" style="height: 400px; width: 300px; object-fit: contain" class="img-thumbnail">
			</a>
		</div>
		<div class="col-6 m-3">
			
				
            <div class="row">
              	<div class="col-6 p-5">
              		<div>
                  		<span class="name"> 이름 </span> 
              		</div>
              		<div class="mb-3">
                  		<span class="span2">  <%=player.getName() %></span>
              		</div>
              		<hr>
              		<div>
                  		 <span class="name">출생일 </span> 
              		</div>
              		<div class="mb-3">
                  		 <span class="span2">  <%=player.getBirth() %></span>
              		</div>
              		<hr>
              		<div>
                  		 <span class="name">국적 </span>
              		</div>
              		<div>
                  		  <span class="span2">  <%=player.getNationality() %></span>
              		</div>
              	</div>
              	<div class="col-6 p-5">
              		<div>
                  			<span class="name">등번호 </span> 
              		</div>
              		<div class="mb-3">
                  			<span class="span2">  <%=player.getUfNo() %></span>
              		</div>
              		<hr>
              		<div>
              		
                  			<span class="name">득점 </span> 
              		</div>
              		<div>
              		
                  			<span class="span2">  <%=player.getGoal() %></span>
              		</div>
              		<hr>
              		<div>
              		
                  			<span class="name">포지션 </span> 
              		</div>
              		<div>
              		
                  			<span class="span2">  <%=player.getPosition() %></span>
              		</div>
            	</div>
          	
		</div>
		<hr>	
	</div>
	<%
		User user = (User) session.getAttribute("LOGINED_USER");
		if (user == null) {
	%>	
	
	<%
		} else if(user.getNo() == 1){	
	%>
	<div class="col-12 text-end mb-3">
		<button type="button" class="btn btn-outline-secondary" onclick="location.href='modifyform.jsp?playerNo=<%=playerNo %>'">선수수정</button>
		<button type="button" class="btn btn-outline-secondary" onclick="location.href='delete.jsp?playerNo=<%=playerNo %>'">선수삭제</button>
	</div>
	<%
		}
	%>
</div>
	<div class="row p-4 mb-4 bg-light rounded-3" >
		<h3 class="mb-3">소속팀 다른<%=player.getPosition() %>
			<button type="button" class="btn btn-outline-secondary float-end" onclick="location.href='list.jsp'">다른선수 보기</button>
		</h3>
		
		
	<%
		List<Player> playerList = playerDao.getClubNoPlayer(player.getClubNo());
		for (Player players : playerList) {
			
			
			if (players.getPosition().equals(player.getPosition()) && players.getPlayerNo() != player.getPlayerNo()) {
	%>
		<div class="col-3 mb-3">
			<div class="card">
				<a href="player.jsp?playerNo=<%=players.getPlayerNo() %>">
					<img alt="" src="../player/<%=players.getFileName() %>" class="card-img-top" width="200px" height="300px">
				</a>
				<div class="card-body">
					<h5 class="card-title"><%=players.getName() %> <strong class="text-success end"><%=players.getUfNo() %></strong></h5>
				</div>
			</div>
		</div>
	<%
				
			}
		}
	%>	
		
	</div> 
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>