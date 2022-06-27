<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String menu = request.getParameter("menu");

	User user = (User) session.getAttribute("LOGINED_USER");
%>
<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark ">
	<div class="container">
		<a class="navbar-brand" href="/soccer/home.jsp">SOCCER.COM</a>
		<button class="navbar-toggler" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarNav"
			aria-controls="navbarNav" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-center" id="navbarNav">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a class="nav-link <%="league".equals(menu) ? "active" : "" %>" aria-current="page" href="/soccer/deok/league.jsp">LEAGUE</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%="goods".equals(menu) ? "active" : "" %>" aria-current="page" href="/soccer/goods/goods.jsp">GOODS</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%="news".equals(menu) ? "active" : "" %>" aria-current="page" href="/soccer/dowoo/news.jsp">NEWS</a>
				</li>
			</ul>
			
			<%
				if (user != null) {
			%>
					<span class="navbar-text"><strong class="text-white"><%=user.getName() %></strong>님 환영합니다.</span>
			<%	
				}
			%>
			
			<ul class="navbar-nav">
			<%
				if (user != null) {
			%>
					<li class="nav-item">
						<a class="nav-link <%="cart".equals(menu) ? "active" : "" %>" aria-current="page" href="/soccer2/cart/list.jsp">장바구니</a>
					</li>				
					<li class="nav-item">
						<a class="nav-link" aria-current="page" href="/soccer2/logout.jsp">로그아웃</a>
					</li>				
			<%
				} else {
			%>
					<li class="nav-item">
						<a class="nav-link <%="login".equals(menu) ? "active" : "" %>" aria-current="page" href="/soccer/loginform.jsp">로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link <%="register".equals(menu) ? "active" : "" %>" aria-current="page" href="/soccer/registerform.jsp">회원가입</a>
					</li>
			<%	
				}
			%>
			</ul>
		</div>
	</div>
</nav>