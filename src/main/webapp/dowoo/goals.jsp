
<%@page import="vo.Goal"%>
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
		int rankNo = StringUtil.stringToInt(request.getParameter("rank"));
		NewsDao newsDao = NewsDao.getInstance();
		List<Goal> goalList = newsDao.getRankNoLeague(rankNo);
	%>
	
	<table class="table">
		<thead>
			<tr>
				<th scope="col">순위</th>
				<th scope="col">이름</th>
				<th scope="col">나이</th>
				<th scope="col">국적</th>
				<th scope="col">팀</th>
				<th scope="col">득점수</th>
			</tr>
		</thead>
		<tbody>
		<%
			for (Goal goal : goalList) {
		%>
			<tr>
		      <th scope="row">1</th>
		      <td><%=goal.getPlayerName() %></td>
		      <td>Otto</td>
		      <td>@mdo</td>
		      <td>@mdo</td>
		      <td>@mdo</td>
		    </tr>
		<%
			}
		%>
			<tr>
		      <th scope="row">2</th>
		      <td>Mark</td>
		      <td>Otto</td>
		      <td>@mdo</td>
		      <td>@mdo</td>
		      <td>@mdo</td>
		    </tr>
			<tr>
		      <th scope="row">3</th>
		      <td>Mark</td>
		      <td>Otto</td>
		      <td>@mdo</td>
		      <td>@mdo</td>
		      <td>@mdo</td>
		    </tr>
			<tr>
		      <th scope="row">4</th>
		      <td>Mark</td>
		      <td>Otto</td>
		      <td>@mdo</td>
		      <td>@mdo</td>
		      <td>@mdo</td>
		    </tr>
   
 		</tbody>
	</table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>