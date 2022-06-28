<%@page import="vo.NewsReply"%>
<%@page import="dao.NewsDao"%>
<%@page import="util.StringUtil"%>
<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	User user = (User) session.getAttribute("LOGINED_USER");
	if (user == null) {
		throw new RuntimeException("로그인 후 댓글 수정이 가능합니다.");
	}
	
	int newsNo = StringUtil.stringToInt(request.getParameter("no"));
	int replyNo = StringUtil.stringToInt(request.getParameter("replyNo"));
	
	NewsDao newsDao = NewsDao.getInstance();
	NewsReply newsReply = newsDao.getReplyNo(replyNo);
	
	if (newsReply == null) {
		throw new RuntimeException("댓글이 존재하지 않습니다. ");
	}
	
	if (newsReply.getUserNo() != user.getNo()) {
		throw new RuntimeException("다른 사용자의 댓글은 수정할 수 없습니다. ");
	}
	
	String content = request.getParameter("content");
	
	newsReply.setContent(content);
	
	newsDao.updateNewsReply(newsReply);
	
	response.sendRedirect("article.jsp?no="+newsNo);
%>
