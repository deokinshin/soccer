<%@page import="dao.NewsDao"%>
<%@page import="vo.NewsReply"%>
<%@page import="util.StringUtil"%>
<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	User user = (User)session.getAttribute("LOGINED_USER");

	int newsNo = StringUtil.stringToInt(request.getParameter("no"));
	String content = request.getParameter("content");
	
	NewsDao newsDao = NewsDao.getInstance();
	
	NewsReply newsReply = new NewsReply();
	
	newsReply.setNewsNo(newsNo);
	newsReply.setContent(content);
	newsReply.setUserId(user.getId());
	newsReply.setUserNo(user.getNo());
	
	newsDao.insertNewsReply(newsReply);
	
	response.sendRedirect("article.jsp?no="+ newsNo);

%>