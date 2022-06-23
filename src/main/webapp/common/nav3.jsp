<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String menu = request.getParameter("menu");

	// 세션객체에 저장된 사용자정보를 조회한다.
	User user = (User) session.getAttribute("LOGINED_USER");
%>
<nav style=background-color:white;>
	<div class="container">
    	<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between ">
	      <a class="navbar-brand" href="/soccer/home.jsp"><img src="/soccer/common/logo.jpg" width="160px" height="65px"/></a>
	      <%
	      	if (user != null) {
	      %>
	      	<span class="navbar-text" style="color:black"><strong class="text-black"><%=user.getName() %></strong>님 환영합니다.</span>
	      <%
	      	}
	      %>
	      
	      <%
	      	if (user == null) {
	      %>
	      	<div class="col-md-3 text-end">
	        <button type="button" class="btn btn-outline-secondary me-2" onclick="location.href='loginform.jsp'">Login</button>
	        <button type="button" class="btn btn-outline-secondary" onclick="location.href='registerform.jsp'">Sign-up</button>
	      </div>
	      <%
	      	} else {
	      %>
	      	<button type="button" class="btn btn-outline-secondary" onclick="location.href='logout.jsp'">Logout</button>
	      <%
	      	}
	      %>
      	</header>
	</div>
</nav>

