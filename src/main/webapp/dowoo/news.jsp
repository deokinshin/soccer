<%@page import="vo.News"%>
<%@page import="vo.Pagination"%>
<%@page import="java.util.List"%>
<%@page import="dao.NewsDao"%>
<%@page import="util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NEWS</title>
<link href="soccer.ico" rel="icon" type="../image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../common/nav_news.jsp">
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
		<div class="container" style=" cursor: pointer;" onclick="location.href='newsDetail.jsp';">
			<div class="card mb-2" style="max-width: 100%;">
		  		<div class="row g-0">
		    		<div class="col-md-4">
		      			<img src="../News/<%=news.getNewsNo() %>.png" class="img-fluid rounded-start" style="width:100%" alt="<%=news.getNewsName() %>">
		    		</div>
		   			 <div class="col-md-8">
		      			<div class="card-body">
		        			<h5 class="card-title"><strong><%=news.getNewsName() %></strong></h5>
		        			<p class="card-text"><%=news.getNewsTitle() %></p>
		       				<p class="card-text"><small class="text-muted"><%=news.getNewsCreatedDate() %></small></p>
		      			</div>
		    		</div>
		  		</div>
			</div>
		</div>
		<%
			}
		%>
	</div>
</div>
<div class="row">
	<div class="col-4">
		<nav>
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<a class="page-link <%=pagination.getCurrentPage() == 1 ? "disabled" : "" %>" href="javascript:clickPageNo(<%=pagination.getCurrentPage() - 1 %>)">이전</a>
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
					<a class="page-link<%=pagination.getCurrentPage() == pagination.getTotalPages() ? "disabled" : "" %>" href="javascript:clickPageNo(<%=pagination.getCurrentPage() + 1 %>)">다음</a>
				</li>
		 	</ul>
		</nav>
		<div class="col-4">
			<form id="news-form" class="row g-3" method="get" action="news.jsp">
				<input type="hidden" name="page" />
				<input type="hidden" name="rows" />
			</form>
		</div>
	</div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	function changeRows() {
		document.querySelector("input[name=page]").value = 1;
		document.getElementById("news-form").submit();
	}
	
	function clickPageNo(pageNo) {
		document.querySelector("input[name=page]").value = pageNo;
		document.getElementById("news-form").submit();
	}
	
	function searchKeyword() {
		document.querySelector("input[name=page]").value = 1;
		document.getElementById("news-form").submit();
	}
</script>
</body>
</html>