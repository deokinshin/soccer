<%@page import="vo.User"%>
<%@page import="vo.CartItem"%>
<%@page import="dao.CartItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User user = (User) session.getAttribute("LOGINED_USER");

	if (user == null) {
		response.sendRedirect("../loginform.jsp?fail=deny");
		return;
	}	
	
	String value = request.getParameter("itemNo");
	int itemNo = Integer.parseInt(value);
	
	CartItemDao cartItemDao = CartItemDao.getInstance();
	
	CartItem item = cartItemDao.getCartItemByItemNo(itemNo);
	
	if (item == null) {
		response.sendRedirect("list.jsp?fail=invalid");
		return;
	}
	
	if (user.getNo() != item.getUserNo()) {
		response.sendRedirect("list.jsp?fail=deny");
		return;
	}	
	
	cartItemDao.deleteCartItem(itemNo);
	
	response.sendRedirect("list.jsp");
	
%>