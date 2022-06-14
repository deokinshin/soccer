<%@page import="util.StringUtil"%>
<%@page import="vo.Club"%>
<%@page import="java.util.List"%>
<%@page import="dao.ClubDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>리그순위</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="nav.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>
<div class="container">
	<table class="table">
	  	<thead>
    		<tr>
			    <th scope="col">순위</th>
			    <th scope="col">구단이름</th>
			    <th scope="col">창단일</th>
			    <th scope="col">연고지</th>
			    <th scope="col">홈구장</th>
			    <th scope="col">감독</th>
			    <th scope="col">승</th>
			    <th scope="col">무</th>
			    <th scope="col">패</th>
				<th scope="col">승점</th>
    		</tr>
	  	</thead>
	  	<tbody>
	  <%
	  
	  		int leagueNo = StringUtil.stringToInt(request.getParameter("leagueNo"));
	  		ClubDao clubDao = ClubDao.getInstance();
	  		List<Club> clubList = clubDao.getLeagueNoClubs(leagueNo);
	  		
	  		for (Club club : clubList) {
	  			
	  %>
		    <tr>
			      <th scope="row"><%=club.getRank() %></th>
			      <td><img src="club/<%=club.getClubNo() %>.png" width="32" height="32" alt="맨시티"><a href="club.jsp?clubNo=<%=club.getClubNo() %>"><%=club.getName() %></a></td>
			      <td><%=club.getFoundingDate() %></td>
			      <td><%=club.getOintment() %></td>
			      <td><%=club.getClubHome() %></td>
			      <td><%=club.getClubCoach() %></td>
			      <td><%=club.getWin() %></td>
			      <td><%=club.getDraw() %></td>
			      <td><%=club.getDefeat() %></td>
			      <td><%=club.getPoint() %></td>
		    </tr>
		<%
	  		}
		%>
	  	</tbody>
	</table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>