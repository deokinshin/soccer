<%@page import="vo.NewsLikeUser"%>
<%@page import="vo.News"%>
<%@page import="dao.NewsDao"%>
<%@page import="util.StringUtil"%>
<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	User user = (User) session.getAttribute("LOGINED_USER");
	if (user == null) {
		throw new RuntimeException("뉴스 추천은 로그인후 사용가능한 서비스입니다.");
	}
	
	int newsNo = StringUtil.stringToInt(request.getParameter("no"));
	int currentPage = StringUtil.stringToInt(request.getParameter("page"), 1);
	
	NewsDao newsDao = NewsDao.getInstance();
	News news = newsDao.getArticleByNO(newsNo);
	
	if (news == null) {
		throw new RuntimeException("뉴스가 존재하지 않습니다.");
	}
	
	NewsLikeUser newsLikeUser = newsDao.getNewsLikeUser(newsNo, user.getNo());
	if (newsLikeUser != null ) {
		throw new RuntimeException("이미 추천한 뉴스는 다시 추천할 수 없습니다.");
	}
	
	
	// 게시글에 대한 추천정보를 데이터베이스에 추가시킨다.
	newsLikeUser = new NewsLikeUser(news.getNewsNo(), user.getNo());
	newsDao.insertNewsLikeUser(newsLikeUser);
		
	// 게시글의 추천자 수를 1증가시키고 변경내용을 데이터베이스 반영시킨다.
	news.setNewsLikeCount(news.getNewsLikeCount() + 1);
	newsDao.updateNews(news);
	
	// 재요청 URL을 응답으로 보낸다.
	response.sendRedirect("article.jsp?no=" + newsNo + "&page=" + currentPage);
	
%>