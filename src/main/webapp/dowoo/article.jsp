<%@page import="vo.NewsLikeUser"%>
<%@page import="vo.User"%>
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
<link href="/soccer/favicon.ico" rel="icon" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">


</head>

<body>
<jsp:include page="../common/nav3.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>
<jsp:include page="../common/nav_news.jsp">
	<jsp:param name="menu" value="news"/>
</jsp:include>
<div class="container">
	<%
		int newsNo = StringUtil.stringToInt(request.getParameter("no"));
		int leagueNo = StringUtil.stringToInt(request.getParameter("leagueNo"));
		int currentPage = StringUtil.stringToInt(request.getParameter("page"),1);
		
		NewsDao newsDao = NewsDao.getInstance();
		News news = newsDao.getArticleByNO(newsNo);
		
		news.setNewsViewCount(news.getNewsViewCount() + 1);
		newsDao.updateNews(news);
		
		List<News> newsList = newsDao.getLeagueNoNews(leagueNo);
		
	%>
	<div class="container">
		<div class=row>
			<div class=col>
			<div style="padding:10px">
				<h1 class="text-start"><%=news.getNewsName() %></h1>
				<h5>좋아요<span class="badge bg-secondary"><%=news.getNewsLikeCount() %></span>
					싫어요<span class="badge bg-secondary"><%=news.getNewsDislikeCount() %></span>
				</h5>	
				<small class="text-end">입력 <%=news.getNewsCreatedDate() %></small>
				<hr>
			</div>
			</div>		
		</div>
	</div>
	<div class ="container" style="min-width: 800px; max-width:1000px">
		<span class="border">
			<img src="../news/<%=newsNo %>.png" class="img-fluid rounded-start" style="width:100%" alt="<%=news.getNewsName() %>">
		</span>
		<P><%=news.getNewsTitle() %></P>
		<h5><%=news.getNewsContent1() %></h5>
		<br>
		<h5><%=news.getNewsContent2() %></h5>
		
	</div>
</div>
			<%
				User user =(User) session.getAttribute("LOGINED_USER");
				boolean isDisabled = true;
				
				isDisabled = true;
			
				if (user != null) {
					NewsLikeUser newsLikeUser = newsDao.getNewsLikeUser(news.getNewsNo(), user.getNo());
					
					if (newsLikeUser == null){
						isDisabled = false;
					}
				}
			%>
<div class="container justify-content: center;">
	<div class ="row">
		<div class ="col-2">
			<div class="card text-center" style="width: 25rem;">
			  <div class="card-body">
			    <h4 class="card-title; text-align: center;">이 기사가 마음에 드시나요?</h4>
			    <p class="card-text">그렇다면 좋아요 또는 싫어요를 눌러주세요</p>
			    <a href="like.jsp?no=<%=newsNo %>&page=<%=currentPage %>" class="btn btn-light float-center <%=isDisabled ? "disabled" : "" %>">좋아요</a>
				<a href="dislike.jsp?no=<%=newsNo %>&page=<%=currentPage %>" class="btn btn-light float-center <%=isDisabled ? "disabled" : "" %>">싫어요</a>
			  </div>
			</div>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>