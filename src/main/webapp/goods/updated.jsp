<%@page import="dto.GoodsReviewDto"%>
<%@page import="dao.GoodsReviewDao"%>
<%@page import="util.StringUtil"%>
<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User user = (User) session.getAttribute("LOGINED_USER");
	if (user == null) {
	throw new RuntimeException("게시글 수정은 로그인 후 사용가능한 서비스 입니다.");
	}
	int reviewNo = StringUtil.stringToInt(request.getParameter("reviewNo"));
	
	GoodsReviewDao goodsReviewDao = GoodsReviewDao.getInstance();
	GoodsReviewDto review = goodsReviewDao.getReviewNoReview(reviewNo);
	
	if (review == null) {
		throw new RuntimeException("게시글 정보가 존재하지 않습니다.");
	}
	
	if (review.getUserNo() != user.getNo()) {
		throw new RuntimeException("다른 사용자가 작성한 게시글은 수정할 수 업습니다.");
	}	
	
	

%>