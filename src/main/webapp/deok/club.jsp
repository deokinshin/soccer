<%@page import="vo.User"%>
<%@page import="vo.Player"%>
<%@page import="dao.PlayerDao"%>
<%@page import="vo.Club"%>
<%@page import="java.util.List"%>
<%@page import="dao.ClubDao"%>
<%@page import="util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="soccer/error/500.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>클럽</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/soccer/favicon.ico" rel="icon" type="image/x-icon" />


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
<div class="container mb-3">

	
	<div class="p-3">
	<%
		User user = (User) session.getAttribute("LOGINED_USER");
		if (user == null) {
	%>	
			
		<h1>팀 정보</h1>
	<%
		} else if(user.getNo() == 1){	
	%>
		<h1>팀 정보
		
			<button type="submit" class="btn btn-outline-secondary float-end" onclick="location.href='playerform.jsp'">선수등록</button>
		</h1>
	<%
		} else if(user.getNo() != 1){
			
		
	%>
		<h1>팀 정보</h1>
		
	<%
		}
	%>
	</div>	
	
	<hr>
	<div class="row p-5 mb-4 rounded-3" style="background: #ECE9E6">
	<%
		int clubNo = StringUtil.stringToInt(request.getParameter("clubNo"));
		ClubDao clubDao = ClubDao.getInstance();
		List<Club> clubList = clubDao.getClubNoClubs(clubNo);
		
  		for (Club club : clubList) {
		
	%>
		<div class="col-3">
			<img alt="<%=club.getClubCoach() %>" src="../coach/coach<%=club.getClubNo() %>.png" style="object-fit: cover;" width="250px" height="300px">
		</div>
		<div class="col-3">
			<div>
                <span class="name"> 클럽명 </span> 
            </div>
			<div>
                <span class="span2"> <%=club.getName() %> </span> 
            </div>
            <hr>
			<div>
				<span class="name"> 감독 </span> 
            </div>
            <div class="mb-3">
                <span class="span2">  <%=club.getClubCoach() %></span>
            </div>
            <hr>
            <div>
				<span class="name"> 구장 </span> 
            </div>
            <div class="mb-3">
                <span class="span2">  <%=club.getClubHome() %></span>
            </div>
			
		</div>
		<div class="col-3">
			<div>
				<span class="name"> 순위 </span> 
            </div>
          	<div class="mb-3">
               	<span class="span2">  <%=club.getRank() %></span>
           	</div>
           	<hr>
			<div>
				<span class="name"> 승 </span> 
           	</div>
           	<div class="mb-3">
               	<span class="span2">  <%=club.getWin() %></span>
           	</div>
           	<hr>
			<div>
				<span class="name"> 무 </span> 
           	</div>
           	<div class="mb-3">
               	<span class="span2">  <%=club.getDraw() %></span>
           	</div>
           	<hr>
			<div>
				<span class="name"> 패 </span> 
           	</div>
           	<div class="mb-3">
               	<span class="span2">  <%=club.getDefeat() %></span>
           	</div>
		</div>
		<div class="col-3">
			<img alt="<%=club.getName() %>" src="../club/<%=club.getClubNo() %>.png" width="250px" height="300px" >
		</div>
			
	               
	</div>

	<% 
  		}
	%>
	<div class="p-3">
		<h1>스쿼드</h1>
	</div>	
	<hr>
	<div class="row p-4 mb-4 bg-light rounded-3" >
		<h3 class="mb-3">골키퍼</h3>
	<%
		PlayerDao playerDao = PlayerDao.getInstance();
		List<Player> playerList = playerDao.getClubNoPlayer(clubNo);
		for (Player player : playerList) {
			if (player.getPosition().equals("골키퍼")) {
	%>
		<div class="col-3 mb-3">
			<div class="card">
				<a href="player.jsp?playerNo=<%=player.getPlayerNo() %>">
					<img alt="" src="../player/<%=player.getFileName() %>" class="card-img-top" width="200px" height="300px">
				</a>
				<div class="card-body">
					<h5 class="card-title"><%=player.getName() %> <strong class="text-success end"><%=player.getUfNo() %></strong></h5>
				</div>
			</div>
		</div>
	<%
				
			}
		}
	%>	
		
	</div>
	
	<div class="row p-4 mb-4 bg-light rounded-3" >
		<h3 class="mb-3">수비수</h3>
	<%
		playerList = playerDao.getClubNoPlayer(clubNo);
		for (Player player : playerList) {
			if (player.getPosition().equals("수비수")) {
	%>
		<div class="col-3 mb-3">
			<div class="card">
				<a href="player.jsp?playerNo=<%=player.getPlayerNo() %>">
					<img alt="" src="../player/<%=player.getFileName() %>" class="card-img-top" width="200px" height="300px">
				</a>
				<div class="card-body">
					<h5 class="card-title"><%=player.getName() %> <strong class="text-success end"><%=player.getUfNo() %></strong></h5>
				</div>
			</div>
		</div>
	<%
				
			}
		}
	%>	
	</div>
	<div class="row p-4 mb-4 bg-light rounded-3" >
		<h3 class="mb-3">미드필더</h3>
	<%
		playerList = playerDao.getClubNoPlayer(clubNo);
		for (Player player : playerList) {
			if (player.getPosition().equals("미드필더")) {
	%>
		<div class="col-3 mb-3">
			<div class="card">
				<a href="player.jsp?playerNo=<%=player.getPlayerNo() %>">
					<img alt="" src="../player/<%=player.getFileName() %>" class="card-img-top" width="200px" height="300px">
				</a>
				<div class="card-body">
					<h5 class="card-title"><%=player.getName() %> <strong class="text-success end"><%=player.getUfNo() %></strong></h5>
				</div>
			</div>
		</div>
	<%
				
			}
		}
	%>	
	</div>
	<div class="row p-4 mb-4 bg-light rounded-3" >
		<h3 class="mb-3">공격수</h3>
	<%
		playerList = playerDao.getClubNoPlayer(clubNo);
		for (Player player : playerList) {
			if (player.getPosition().equals("공격수")) {
	%>
		<div class="col-3 mb-3">
			<div class="card">
				<a href="player.jsp?playerNo=<%=player.getPlayerNo() %>">
					<img alt="" src="../player/<%=player.getFileName() %>" class="card-img-top" width="200px" height="300px">
				</a>
				<div class="card-body">
					<h5 class="card-title"><%=player.getName() %> <strong class="text-success end"><%=player.getUfNo() %></strong></h5>
				</div>
			</div>
		</div>
	<%
				
			}
		}
	%>	
	</div>
	
</div>
<jsp:include page="../common/footer.jsp">
	<jsp:param name="menu" value="club"/>
</jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>