<%@page import="util.StringUtil"%>
<%@page import="dto.GoodsReviewDto"%>
<%@page import="dao.GoodsReviewDao"%>
<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User user = (User) session.getAttribute("LOGINED_USER");

	int goodsNo = StringUtil.stringToInt(request.getParameter("goodsNo"));
	String content = request.getParameter("content");
	GoodsReviewDao goodsReviewDao = GoodsReviewDao.getInstance();
	
	GoodsReviewDto review = new GoodsReviewDto();
	
	review.setGoodsNo(goodsNo);
	review.setReviewCountent(content);
	review.setUserName(user.getName());
	review.setUserNo(user.getNo());
	
	goodsReviewDao.insertReview(review);
	
	response.sendRedirect("detail.jsp?goodsNo="+goodsNo);

%>