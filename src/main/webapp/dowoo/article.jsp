<%@page import="vo.League"%>
<%@page import="java.util.List"%>
<%@page import="dao.NewsDao"%>
<%@page import="util.StringUtil"%>
<%@page import="vo.News"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NEWS</title>
<link href="soccer.ico" rel="icon" type="image/x-icon" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">


</head>
<body>
<jsp:include page="../common/nav_news.jsp">
	<jsp:param name="menu" value="news"/>
</jsp:include>
<div class="container">
	<%
		int newsNo = StringUtil.stringToInt(request.getParameter("newsNo"));
		int leagueNo = StringUtil.stringToInt(request.getParameter("leagueNo"));
		
		NewsDao newsDao = NewsDao.getInstance();
		
		List<News> newsList = newsDao.getLeagueNoNews(leagueNo);
		List<News> newsList2 = newsDao.getArticleNByNews(newsNo);
	%>
	
	<div class="row">
		<form id="article-form" class="row" method="get" action="article.jsp">
			<div class="col-1">
			<p>리그 선택</p>
			</div>
			<select class="form-control form-control-sm w-25 float-end" name="leagueNo" onchange="changeNewsNo()">
				<option value="1" <%=leagueNo == 1 ? "selected" : "" %>> 프리미어리그</option>
				<option value="2" <%=leagueNo == 2 ? "selected" : "" %>> 프리메라리그</option>
				<option value="3" <%=leagueNo == 3 ? "selected" : "" %>> 세리에A</option>
				<option value="4" <%=leagueNo == 4 ? "selected" : "" %>> 분데스리가</option>
				
			</select>
			<input type="hidden" name="leagueNo"/>
		</form>
	
	</div>
	
	<div>
		<h1><%=newsNo %></h1>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
function changeLeagueNo() {
	document.querySelector("input[name=leagueNo]").value = document.querySelector("select[name=leaugeNo]").value;
	
	document.getElementById("article-form").submit();
}
</script>
</body>
</html>