<%@page import="dao.GoodsDao"%>
<%@page import="vo.Goods"%>
<%@page import="dao.CartItemDao"%>
<%@page import="vo.User"%>
<%@page import="util.StringUtil"%>
<%@page import="dto.GoodsReviewDto"%>
<%@page import="dao.GoodsReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 	
	int goodsNo = StringUtil.stringToInt(request.getParameter("goodsNo"));

	CartItemDao cartItemDao = CartItemDao.getInstance();	
	cartItemDao.deleteCartItem(goodsNo);

	response.sendRedirect("../order1/form1.jsp");

%>	