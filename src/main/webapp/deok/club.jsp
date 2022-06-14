<%@page import="vo.Player"%>
<%@page import="dao.PlayerDao"%>
<%@page import="vo.Club"%>
<%@page import="java.util.List"%>
<%@page import="dao.ClubDao"%>
<%@page import="util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>클럽</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../common/nav_home.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>
<div class="container mb-3">
	<div class="row p-5 mb-4 bg-light rounded-3" >
	<%
		int clubNo = StringUtil.stringToInt(request.getParameter("clubNo"));
		ClubDao clubDao = ClubDao.getInstance();
		List<Club> clubList = clubDao.getClubNoClubs(clubNo);
		
  		for (Club club : clubList) {
		
	%>
		<div class="col-3">
			<img alt="<%=club.getClubCoach() %>" src="../coach/coach<%=club.getClubNo() %>.png" width="250" height="250">
		</div>
		<div class="col-2">
			<dl>
               <dt><%=club.getName() %></dt>
           	</dl>
			<dl>
               <dt>감독</dt>
               <dd><%=club.getClubCoach() %></dd>
           	</dl>
           	<dl>
               <dt>구장</dt>
               <dd><%=club.getClubHome() %></dd>
           	</dl>	
			
		</div>
		<div class="col">
			<div class="col-3">
			
				<dl>
	               <dt>순위</dt>
	               <dd><%=club.getRank() %></dd>
	
	           	</dl>
			</div>
			<div class="col-3">
				<dl>
	               <dt>승</dt>
	               <dd><%=club.getWin() %></dd>
	           	</dl>
			
			</div>
			<div class="col-3">
	           	<dl>
	               <dt>무</dt>
	               <dd><%=club.getDraw() %></dd>
	           	</dl>	
			
			</div>
			<div class="col-3">
	           	<dl>
	               <dt>패</dt>
	               <dd><%=club.getDefeat() %></dd>
	           	</dl>	
			
			</div>
		</div>
		<div class="col-3">
			<img alt="<%=club.getName() %>" src="../club/<%=club.getClubNo() %>.png" width="250" height="250">
		</div>
	<% 
  		}
	%>
	</div> 
	
	<div class="row p-5 mb-4 bg-light rounded-3" >
		<h3>골키퍼</h3>
	<%
		PlayerDao playerDao = PlayerDao.getInstance();
		List<Player> playerList = playerDao.getClubNoPlayer(clubNo);
		for (Player player : playerList) {
			if (player.getPosition().equals("골키퍼")) {
	%>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp?playerNo=<%=player.getPlayerNo() %>">
					<img alt="" src="../player/<%=player.getPlayerNo() %>.png" class="card-img-top" width="200px" height="300px">
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
	<div class="row p-5 mb-4 bg-light rounded-3" >
		<h3>수비수</h3>
	<%
		playerList = playerDao.getClubNoPlayer(clubNo);
		for (Player player : playerList) {
			if (player.getPosition().equals("수비수")) {
	%>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp?playerNo=<%=player.getPlayerNo() %>">
					<img alt="" src="../player/<%=player.getPlayerNo() %>.png" class="card-img-top" width="200px" height="300px">
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
	<div class="row p-5 mb-4 bg-light rounded-3" >
		<h3>미드필더</h3>
	<%
		playerList = playerDao.getClubNoPlayer(clubNo);
		for (Player player : playerList) {
			if (player.getPosition().equals("미드필더")) {
	%>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp?playerNo=<%=player.getPlayerNo() %>">
					<img alt="" src="../player/<%=player.getPlayerNo() %>.png" class="card-img-top" width="200px" height="300px">
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
	<div class="row p-5 mb-4 bg-light rounded-3" >
		<h3>공격수</h3>
	<%
		playerList = playerDao.getClubNoPlayer(clubNo);
		for (Player player : playerList) {
			if (player.getPosition().equals("공격수")) {
	%>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp?playerNo=<%=player.getPlayerNo() %>">
					<img alt="" src="../player/<%=player.getPlayerNo() %>.png" class="card-img-top" width="200px" height="300px">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>