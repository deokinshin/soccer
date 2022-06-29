<%@page import="vo.User"%>
<%@page import="util.StringUtil"%>
<%@page import="dto.GoodsReviewDto"%>
<%@page import="dao.GoodsReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	User user = (User) session.getAttribute("LOGINED_USER");
	if (user == null) {
		throw new RuntimeException("게시글 삭제는 로그인 후 사용가능한 서비스입니다.");
	}
	
	int reviewNo = StringUtil.stringToInt(request.getParameter("reviewNo"));
	int goodsNo = StringUtil.stringToInt(request.getParameter("goodsNo"));
	
	GoodsReviewDao goodsReviewDao = GoodsReviewDao.getInstance();
	GoodsReviewDto review = goodsReviewDao.getReviewNoReview(reviewNo);
	
	if (review == null) {
		throw new RuntimeException("게시글 정보가 존재하지 않습니다.");
	}
	
	if (review.getUserNo() != user.getNo()) {
		throw new RuntimeException("다른 사용자가 작성한 게시글은 삭제할 수 업습니다.");
	}	
	
	review.setReviewDeletes("Y");
	
	goodsReviewDao.updateReview(review);
	
	response.sendRedirect("detail.jsp?goodsNo="+goodsNo);
%>	