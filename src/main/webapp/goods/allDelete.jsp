<%@page import="dao.CartItemDao"%>
<%@page import="vo.User"%>
<%@page import="util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 	
	int goodsNo = StringUtil.stringToInt(request.getParameter("goodsNo"));

	User user = (User) session.getAttribute("LOGINED_USER");
	if (user == null) {
		response.sendRedirect("../loginform.jsp?fail=deny");
		return;
	}

	CartItemDao cartItemDao = CartItemDao.getInstance();	
	cartItemDao.userNoDelete(user.getNo());

	response.sendRedirect("../goods/goods.jsp");

%>	