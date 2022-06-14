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
<jsp:include page="nav.jsp">
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
			<img alt="<%=club.getClubCoach() %>" src="coach/coach<%=club.getClubNo() %>.png" width="250" height="250">
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
			<img alt="<%=club.getName() %>" src="club/<%=club.getClubNo() %>.png" width="250" height="250">
		</div>
	<% 
  		}
	%>
	</div> 
	<div class="row p-5 mb-4 bg-light rounded-3" >
		<h3>골키퍼</h3>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp">
					<img alt="" src="player/103.png" class="card-img-top" width="100">
				</a>
				<div class="card-body">
					<h5 class="card-title">아 이 유 <strong class="text-success end">8</strong></h5>
				</div>
			</div>
		</div>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp">
					<img alt="" src="player/103.png" class="card-img-top" width="100">
				</a>
				<div class="card-body">
					<h5 class="card-title">아 이 유 <strong class="text-success end">8</strong></h5>
				</div>
			</div>
		</div>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp">
					<img alt="" src="player/103.png" class="card-img-top" width="100">
				</a>
				<div class="card-body">
					<h5 class="card-title">아 이 유 <strong class="text-success end">8</strong></h5>
				</div>
			</div>
		</div>
		
		<div class="col-3">
			<div class="card">
				<a href="player.jsp">
					<img alt="" src="player/103.png" class="card-img-top" width="100">
				</a>
				<div class="card-body">
					<h5 class="card-title">아 이 유 <strong class="text-success end">8</strong></h5>
				</div>
			</div>
		</div>
		
	</div>
	<div class="row p-5 mb-4 bg-light rounded-3" >
		<h3>수비수</h3>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp">
					<img alt="" src="player/103.png" class="card-img-top" width="100">
				</a>
				<div class="card-body">
					<h5 class="card-title">아 이 유 <strong class="text-success end">8</strong></h5>
				</div>
			</div>
		</div>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp">
					<img alt="" src="player/103.png" class="card-img-top" width="100">
				</a>
				<div class="card-body">
					<h5 class="card-title">아 이 유 <strong class="text-success end">8</strong></h5>
				</div>
			</div>
		</div>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp">
					<img alt="" src="player/103.png" class="card-img-top" width="100">
				</a>
				<div class="card-body">
					<h5 class="card-title">아 이 유 <strong class="text-success end">8</strong></h5>
				</div>
			</div>
		</div>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp">
					<img alt="" src="player/103.png" class="card-img-top" width="100">
				</a>
				<div class="card-body">
					<h5 class="card-title">아 이 유 <strong class="text-success end">8</strong></h5>
				</div>
			</div>
		</div>
		
	</div>
	<div class="row p-5 mb-4 bg-light rounded-3" >
		<h3>미드필더</h3>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp">
					<img alt="" src="player/103.png" class="card-img-top" width="100">
				</a>
				<div class="card-body">
					<h5 class="card-title">아 이 유 <strong class="text-success end">8</strong></h5>
				</div>
			</div>
		</div>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp">
					<img alt="" src="player/103.png" class="card-img-top" width="100">
				</a>
				<div class="card-body">
					<h5 class="card-title">아 이 유 <strong class="text-success end">8</strong></h5>
				</div>
			</div>
		</div>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp">
					<img alt="" src="player/103.png" class="card-img-top" width="100">
				</a>
				<div class="card-body">
					<h5 class="card-title">아 이 유 <strong class="text-success end">8</strong></h5>
				</div>
			</div>
		</div>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp">
					<img alt="" src="player/103.png" class="card-img-top" width="100">
				</a>
				<div class="card-body">
					<h5 class="card-title">아 이 유 <strong class="text-success end">8</strong></h5>
				</div>
			</div>
		</div>
	</div>
	<div class="row p-5 mb-4 bg-light rounded-3" >
		<h3>공격수</h3>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp">
					<img alt="" src="player/103.png" class="card-img-top" width="100">
				</a>
				<div class="card-body">
					<h5 class="card-title">아 이 유 <strong class="text-success end">8</strong></h5>
				</div>
			</div>
		</div>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp">
					<img alt="" src="player/103.png" class="card-img-top" width="100">
				</a>
				<div class="card-body">
					<h5 class="card-title">아 이 유 <strong class="text-success end">8</strong></h5>
				</div>
			</div>
		</div>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp">
					<img alt="" src="player/103.png" class="card-img-top" width="100">
				</a>
				<div class="card-body">
					<h5 class="card-title">아 이 유 <strong class="text-success end">8</strong></h5>
				</div>
			</div>
		</div>
		<div class="col-3">
			<div class="card">
				<a href="player.jsp">
					<img alt="" src="player/103.png" class="card-img-top" width="100">
				</a>
				<div class="card-body">
					<h5 class="card-title">아 이 유 <strong class="text-success end">8</strong></h5>
				</div>
			</div>
		</div>
	</div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>