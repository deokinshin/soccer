<%@page import="vo.News"%>
<%@page import="vo.Pagination"%>
<%@page import="java.util.List"%>
<%@page import="dao.NewsDao"%>
<%@page import="util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/soccer/error/500.jsp" %>
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
<jsp:include page="../common/nav_home.jsp">
	<jsp:param name="menu" value="news"/>
</jsp:include>
<div class="contaniner">

	<div class="row">
		<div class="col">
		<%
			int currentPage = StringUtil.stringToInt(request.getParameter("page"),1);
			int rows = StringUtil.stringToInt(request.getParameter("rows"),5);
			
			NewsDao newsDao = NewsDao.getInstance();
			
			int totalrows = newsDao.getTotalRows();
			
			Pagination pagination = new Pagination(rows, totalrows, currentPage);
			
			List<News> newsList = newsDao.getNews(pagination.getBeginIndex(), pagination.getEndIndex());
		%>
		
		<%
			for (News news : newsList) {
		%>
		<div class="container" style=" cursor: pointer;" onclick="location.href='article.jsp?no=<%=news.getNewsNo() %>';">
			<div class="card mb-2" style="max-width: 100%;">
		  		<div class="row g-0">
		    		<div class="col-md-4">
		    			<div class ="card h-100">
		      				<img src="../news/<%=news.getNewsNo() %>.png" class="img-fluid rounded-start" style="width:100%" alt="<%=news.getNewsName() %>">
		    			</div>
		    		</div>
		   			 <div class="col-md-8">
		      			<div class="card-body">
		        			<h5 class="card-title"><strong><%=news.getNewsName() %></strong></h5>
		        			<p class="card-text"><%=news.getNewsTitle() %></p>
		       				<p class="card-text-bottom"><small class="text-muted"><%=news.getNewsCreatedDate() %></small></p>
		      			</div>
		    		</div>
		  		</div>
			</div>
		</div>
		<%
			}
		%>
			<div class="row">
			<div class="col-5"></div>
				<div class="col-3" style= "padding: 5px; margin-left: 100px">
					<nav>
						<ul class="pagination">
							<li class="page-item">
								<a class="page-link <%=pagination.getCurrentPage() == 1 ? "disabled" : "" %>" href="javascript:clickPageNo(<%=pagination.getCurrentPage() - 1 %>)">??????</a>
							</li>
					<%
						for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
					%>
							<li class="page-item">
								<a class="page-link <%=pagination.getCurrentPage() == num ? "active" : "" %>" href="javascript:clickPageNo(<%=num %>)"><%=num %></a>
							</li>
					<%
						}
					%>
							<li class="page-item">
								<a class="page-link <%=pagination.getCurrentPage() == pagination.getTotalPages() ? "disabled" : "" %>" href="javascript:clickPageNo(<%=pagination.getCurrentPage() + 1 %>)">??????</a>
							</li>
						</ul>
					</nav>
					<div class="col">
						<form id="news-form" class="row g-3" method="get" action="news.jsp">
							<input type="hidden" name="page" />
						</form>
					</div>
				</div>
			</div>
		</div>
</div>
<div class="container justify-content-center">
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

	function clickPageNo(pageNo) {
		document.querySelector("input[name=page]").value = pageNo;
		document.getElementById("news-form").submit();
	}

</script>
</body>
</html>