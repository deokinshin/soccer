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
	      <div>
	      <div style= "padding:10px 10px 0px 0px; float:left;">
	      	<span class="navbar-text" style="color:black"><strong class="text-black"><%=user.getName() %></strong>님 환영합니다.</span>
	      </div>
	      <%
	      	}
	      %>
	      
	      <%
	      	if (user == null) {
	      %>
	      	<div class="col-md-3 text-end">
	        <button type="button" class="btn btn-outline-secondary me-2" onclick="location.href='/soccer/loginform.jsp'">Login</button>
	        <button type="button" class="btn btn-outline-secondary" onclick="location.href='/soccer/registerform.jsp'">Sign-up</button>
	        </div>
	      <%
	      	} else {
	      %>
	      	<div class="text-end" style="float:right">
	      	<img src="/soccer/images/cart.png" width="40px" height="40px" style="margin-right:10px; marign-left:10px">
	        <button type="button" class="btn btn-outline-secondary" onclick="location.href='/soccer/myinfo.jsp'">MyPage</button>
	      	<button type="button" class="btn btn-outline-secondary me-2" onclick="location.href='/soccer/logout.jsp'">Logout</button>
      		</div>
	      <%
	      	}
	      %>     
	      </div> 
      	</header>
	</div>
</nav>

