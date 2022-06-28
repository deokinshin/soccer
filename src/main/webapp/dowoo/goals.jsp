
<%@page import="vo.Player"%>
<%@page import="dao.NewsDao"%>
<%@page import="java.util.List"%>
<%@page import="util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GOALS</title>
<link href="/soccer/favicon.ico" rel="icon" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>     
	table, th, td {       
		border: 1px solid #bcbcbc;      
	}
	table {              
	}
	th {
		text-align:center;
	}
	td {
		text-align: center;
		vertical-align: middle;
	}
</style>
<body>

<jsp:include page="../common/nav3.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>
<jsp:include page="../common/nav_home.jsp">
	<jsp:param name="menu" value="goal"/>
</jsp:include>
<div class="container">
	<%
		NewsDao newsDao = NewsDao.getInstance();
		List<Player> playerList1 = newsDao.getRankNoLeague(1);
		List<Player> playerList2 = newsDao.getRankNoLeague(2);
		List<Player> playerList3 = newsDao.getRankNoLeague(3);
		List<Player> playerList4 = newsDao.getRankNoLeague(4);
	%>
	<div class ="container">	
		<h5><strong>프리미어리그 시즌 종합 골 랭킹</strong></h5>
	<table class="table">
		<colgroup>
			<col width="5%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
		</colgroup>
			<thead>
				<tr>
					<th scope="col">순위</th>
					<th scope="col">이름</th>
					<th scope="col">팀</th>
					<th scope="col">생년월일</th>
					<th scope="col">국적</th>
					<th scope="col">득점수</th>
				</tr>
			</thead>
			<tbody>
			<%
				for (Player player : playerList1) {
			%>
				<tr>
			      <th scope="row" style="vertical-align: middle;"><%=player.getRank() %></th>
			      <td>
			      	<div class="card" style="height: 240px; width: 150px; text-align: center;" onclick="location.href='../deok/player.jsp?playerNo=<%=player.getPlayerNo() %>';" >
	 					 <img src="../player/<%=player.getPlayerNo() %>.png" style="height: 180px; width: 150px; object-fit: contain" class="card-img-top" alt="...">
	 					 <div class="card-body">
	 					 	<p class="card-text"><strong><%=player.getName() %></strong></p>
						 </div>
					</div>
			      </td>
			      <td  onclick="location.href='../deok/club.jsp?clubNo=<%=player.getClub().getClubNo() %>';"><%=player.getClub().getName() %></td>
			      <td><%=player.getBirth() %></td>
			      <td><%=player.getNationality() %></td>
			      <td><%=player.getGoal() %></td>
			    </tr>
			<%
				}
			%>   
	 		</tbody>
	</table>
	</div>
	<br>
	<div class ="container">	
		<h5><Strong>라리가 시즌 종합 골 랭킹</Strong></h5>
	<table class="table">
		<colgroup>
			<col width="5%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
		</colgroup>
			<thead>
				<tr>
					<th scope="col">순위</th>
					<th scope="col">이름</th>
					<th scope="col">팀</th>
					<th scope="col">생년월일</th>
					<th scope="col">국적</th>
					<th scope="col">득점수</th>
				</tr>
			</thead>
			<tbody>
			<%
				for (Player player : playerList2) {
			%>
				<tr>
			      <th scope="row"><%=player.getRank() %></th>
			      <td>
			      	<div class="card" style="height: 240px; width: 150px; text-align: center;" onclick="location.href='../deok/player.jsp?playerNo=<%=player.getPlayerNo() %>';" >
	 					 <img src="../player/<%=player.getPlayerNo() %>.png" style="height: 180px; width: 150px; object-fit: contain" class="card-img-top" alt="...">
	 					 <div class="card-body">
	 					 	<p class="card-text"><strong><%=player.getName() %></strong></p>
						 </div>
					</div>
			      </td>
			      <td  onclick="location.href='../deok/club.jsp?clubNo=<%=player.getClub().getClubNo() %>';"><%=player.getClub().getName() %></td>
			      <td><%=player.getBirth() %></td>
			      <td><%=player.getNationality() %></td>
			      <td><%=player.getGoal() %></td>
			    </tr>
			<%
				}
			%>   
	 		</tbody>
	</table>
	</div>
	<br>
	<div class ="container">	
		<h5><Strong>세리에A 시즌 종합 골 랭킹</Strong></h5>
	<table class="table">
		<colgroup>
			<col width="5%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
		</colgroup>
			<thead>
				<tr>
					<th scope="col">순위</th>
					<th scope="col">이름</th>
					<th scope="col">팀</th>
					<th scope="col">생년월일</th>
					<th scope="col">국적</th>
					<th scope="col">득점수</th>
				</tr>
			</thead>
			<tbody>
			<%
				for (Player player : playerList3) {
			%>
				<tr>
			      <th scope="row"><%=player.getRank() %></th>
			      <td>
			      	<div class="card" style="height: 230px; width: 150px; text-align: center;" onclick="location.href='../deok/player.jsp?playerNo=<%=player.getPlayerNo() %>';" >
	 					 <img src="../player/<%=player.getPlayerNo() %>.png" style="height: 180px; width: 150px; object-fit: contain" class="card-img-top" alt="...">
	 					 <div class="card-body">
	 					 	<p class="card-text"><strong><%=player.getName() %></strong></p>
						 </div>
					</div>
			      </td>
			      <td  onclick="location.href='../deok/club.jsp?clubNo=<%=player.getClub().getClubNo() %>';"><%=player.getClub().getName() %></td>
			      <td><%=player.getBirth() %></td>
			      <td><%=player.getNationality() %></td>
			      <td><%=player.getGoal() %></td>
			    </tr>
			<%
				}
			%>   
	 		</tbody>
	</table>
	</div>
	<br>
	<div class ="container">	
		<h5><Strong>분데스리가 시즌 종합 골 랭킹</Strong></h5>
	<table class="table">
		<colgroup>
			<col width="5%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
		</colgroup>
			<thead>
				<tr>
					<th scope="col">순위</th>
					<th scope="col">이름</th>
					<th scope="col">팀</th>
					<th scope="col">생년월일</th>
					<th scope="col">국적</th>
					<th scope="col">득점수</th>
				</tr>
			</thead>
			<tbody>
			<%
				for (Player player : playerList4) {
			%>
				<tr>
			      <th scope="row"><%=player.getRank() %></th>
			      <td>
					<div class="card" style="height: 210px; width: 150px; text-align: center;" onclick="location.href='../deok/player.jsp?playerNo=<%=player.getPlayerNo() %>';">
	 					 <img src="../player/<%=player.getPlayerNo() %>.png" style="height: 180px; width: 150px; object-fit: contain" class="card-img-top" alt="...">
	 					 <div class="card-body">
	 					 	<p class="card-text"><strong><%=player.getName() %></strong></p>
						 </div>
					</div>
			      </td>
			      <td  onclick="location.href='../deok/club.jsp?clubNo=<%=player.getClub().getClubNo() %>';"><%=player.getClub().getName() %></td>
			      <td><%=player.getBirth() %></td>
			      <td><%=player.getNationality() %></td>
			      <td><%=player.getGoal() %></td>
			    </tr>
			<%
				}
			%>   
	 		</tbody>
	</table>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>