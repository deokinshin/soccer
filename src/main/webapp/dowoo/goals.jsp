
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
<body>

<jsp:include page="../common/nav3.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>
<jsp:include page="../common/nav_news.jsp">
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
		<h5>프리미어리그 시즌 종합 골 랭킹</h5>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">순위</th>
				<th scope="col">이름</th>
				<th scope="col">생년월일</th>
				<th scope="col">국적</th>
				<th scope="col">팀</th>
				<th scope="col">득점수</th>
			</tr>
		</thead>
		<tbody>
		<%
			for (Player player : playerList1) {
		%>
			<tr>
		      <th scope="row"><%=player.getRank() %></th>
		      <td onclick="location.href='../deok/player.jsp?playerNo=<%=player.getPlayerNo() %>';"><%=player.getName() %></td>
		      <td><%=player.getBirth() %></td>
		      <td><%=player.getNationality() %></td>
		      <td><%=player.getClub().getName() %></td>
		      <td><%=player.getGoal() %></td>
		    </tr>
		<%
			}
		%>   
 		</tbody>
	</table>
	</div>
	<div class ="container">	
		<h5>라리가 시즌 종합 골 랭킹</h5>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">순위</th>
				<th scope="col">이름</th>
				<th scope="col">생년월일</th>
				<th scope="col">국적</th>
				<th scope="col">팀</th>
				<th scope="col">득점수</th>
			</tr>
		</thead>
		<tbody>
		<%
			for (Player player : playerList2) {
		%>
			<tr>
		      <th scope="row"><%=player.getRank() %></th>
		      <td onclick="location.href='../deok/player.jsp?playerNo=<%=player.getPlayerNo() %>';"><%=player.getName() %></td>
		      <td><%=player.getBirth() %></td>
		      <td><%=player.getNationality() %></td>
		      <td><%=player.getClub().getName() %></td>
		      <td><%=player.getGoal() %></td>
		    </tr>
		<%
			}
		%>   
 		</tbody>
	</table>
	</div>
	<div class ="container">	
		<h5>세리에A 시즌 종합 골 랭킹</h5>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">순위</th>
				<th scope="col">이름</th>
				<th scope="col">생년월일</th>
				<th scope="col">국적</th>
				<th scope="col">팀</th>
				<th scope="col">득점수</th>
			</tr>
		</thead>
		<tbody>
		<%
			for (Player player : playerList3) {
		%>
			<tr>
		      <th scope="row"><%=player.getRank() %></th>
		      <td onclick="location.href='../deok/player.jsp?playerNo=<%=player.getPlayerNo() %>';"><%=player.getName() %></td>
		      <td><%=player.getBirth() %></td>
		      <td><%=player.getNationality() %></td>
		      <td><%=player.getClub().getName() %></td>
		      <td><%=player.getGoal() %></td>
		    </tr>
		<%
			}
		%>   
 		</tbody>
	</table>
	</div>
	<div class ="container">	
		<h5>분데스리가 시즌 종합 골 랭킹</h5>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">순위</th>
				<th scope="col">이름</th>
				<th scope="col">생년월일</th>
				<th scope="col">국적</th>
				<th scope="col">팀</th>
				<th scope="col">득점수</th>
			</tr>
		</thead>
		<tbody>
		<%
			for (Player player : playerList4) {
		%>
			<tr>
		      <th scope="row"><%=player.getRank() %></th>
		      <td onclick="location.href='../deok/player.jsp?playerNo=<%=player.getPlayerNo() %>';"><%=player.getName() %></td>
		      <td><%=player.getBirth() %></td>
		      <td><%=player.getNationality() %></td>
		      <td><%=player.getClub().getName() %></td>
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