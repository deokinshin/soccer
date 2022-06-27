<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
		String menu = request.getParameter("menu");
   %>
    
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
		<div class="collapse navbar-collapse justify-content-around" id="navbarNav">
			<ul class="navbar-nav justify-content-around">
				<li class="nav-item">
					<a class="nav-link <%="league".equals(menu) ? "active" : "" %>" aria-current="page" href="/soccer/deok/league.jsp">LEAGUE</a>
				</li>
				<li class="nav-item">

					<a class="nav-link <%="goods".equals(menu) ? "active" : "" %>" aria-current="page" href="/soccer/goods.jsp">GOODS</a>

				</li>
				<li class="nav-item">
					<a class="nav-link <%="news".equals(menu) ? "active" : "" %>" aria-current="page" href="/soccer/dowoo/news.jsp">NEWS</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%="player".equals(menu) ? "active" : "" %>" aria-current="page" href="/soccer/deok/list.jsp">PLAYER</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%="goal".equals(menu) ? "active" : "" %>" aria-current="page" href="/soccer/dowoo/goals.jsp">GOALS</a>
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
      				<li><a class="dropdown-item" href="/soccer/home.jsp">홈</a></li>
     				<li><a class="dropdown-item" href="/soccer/deok/league.jsp">리그</a></li>
      				<li><a class="dropdown-item" href="/soccer/goods/goods.jsp">굿즈</a></li>
      				<li><a class="dropdown-item" href="/soccer/dowoo/news.jsp">뉴스</a></li>
      				<li><a class="dropdown-item" href="/soccer/deok/list.jsp">플레이어</a></li>
      				<li><a class="dropdown-item" href="/soccer/dowoo/goals.jsp">골</a></li>
    			</ul>
  			</li>
  		</ul>
	</div>
</nav>