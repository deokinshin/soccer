<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
		String menu = request.getParameter("menu");
   %>
    
<nav class="navbar navbar light bg-light">
	<div class="container">
		<a class="navbar-brand" href="/soccer2/home.jsp">
   			<img src="images/soccer_logo.jpg" alt="로고" width="150" height="70">	
		</a>
	</div>
	
</nav>
<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark mb-5">
	<div class="container">		
		<div class ="navbar-toggler">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" 
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse justify-content-center" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link <%="news".equals(menu) ? "active" : "" %>" aria-current="page" href="/soccer2/news.jsp">NEWS</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%="goal".equals(menu) ? "active" : "" %>" aria-current="page" href="/soccer2/goals.jsp">GOALS</a>
				</li>
			</ul>
		</div>
		<!-- 
			네비바 드롭다운으로 페이지 이동
		 -->
		<ul class="nav nav-tabs">
			<li class="nav-item dropdown">
   			 	<a class="navbar-toggler-icon" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"></a>
    			<ul class="dropdown-menu">
      				<li><a class="dropdown-item" href="/soccer2/home.jsp">홈</a></li>
     				<li><a class="dropdown-item" href="/soccer2/league.jsp">리그</a></li>
      				<li><a class="dropdown-item" href="/soccer2/home.jsp">굿즈</a></li>
      				<li><hr class="dropdown-divider"></li>
      				<li><a class="dropdown-item" href="/soccer2/news.jsp">뉴스</a></li>
    			</ul>
  			</li>
  		</ul>
	</div>
</nav>