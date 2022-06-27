<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.nav-item {
	list-style-type: none; float: left; margin-left: 125px;
}
.navbar-nav {
	list-style-type: none; float: left; margin-left: 125px;
}
</style>    
   <%
		String menu = request.getParameter("menu");
   %>
  
<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark mb-5">
	<div class="container ">		
		<div class ="navbar-toggler ">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" 
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav justify-content-around nav-item" id="nvab">
				<li class="nav-item" id="nvab">
					<a class="nav-link <%="league".equals(menu) ? "active" : "" %>" aria-current="page" href="/soccer/deok/league.jsp">LEAGUE</a>
				</li>
				<li class="nav-item" id="nvab">
					<a class="nav-link <%="goods".equals(menu) ? "active" : "" %>" aria-current="page" href="/soccer/goods.jsp">GOODS</a>
				</li>
				<li class="nav-item" id="nvab">
					<a class="nav-link <%="news".equals(menu) ? "active" : "" %>" aria-current="page" href="/soccer/dowoo/news.jsp">NEWS</a>
				</li>
				<li class="nav-item" id="nvab">
					<a class="nav-link <%="player".equals(menu) ? "active" : "" %>" aria-current="page" href="/soccer/deok/list.jsp">PLAYER</a>
				</li>
				<li class="nav-item" id="nvab">
					<a class="nav-link <%="goal".equals(menu) ? "active" : "" %>" aria-current="page" href="/soccer/dowoo/goals.jsp">GOALS</a>
				</li>
			</ul>
		</div>
		<!--  
			네비바 드롭다운으로 페이지 이동
		 -->

	</div>
</nav>