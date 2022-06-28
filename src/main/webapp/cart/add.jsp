<%@page import="java.io.PrintWriter"%>
<%@page import="util.StringUtil"%>
<%@page import="dao.CartItemDao"%>
<%@page import="vo.CartItem"%>
<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션에서 로그인된 사용자 정보 조회하기
	User user = (User) session.getAttribute("LOGINED_USER");
	if (user == null) {
		response.sendRedirect("../loginform.jsp?fail=deny");
		return;
	}
	
	int goodsNo = StringUtil.stringToInt(request.getParameter("goodsNo"));
	
	CartItem cartItem = new CartItem();
	cartItem.setGoodsNo(goodsNo);
	cartItem.setUserNo(user.getNo());
	cartItem.setCartItemQuantity(1);
	
	CartItemDao cartItemDao = CartItemDao.getInstance();
	cartItemDao.mergeCartItem(cartItem);

	
	response.sendRedirect("../goods/detail.jsp?cartadd=YES&goodsNo="+goodsNo);

%>