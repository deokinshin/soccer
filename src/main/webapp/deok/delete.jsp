<%@page import="vo.Player"%>
<%@page import="dao.PlayerDao"%>
<%@page import="util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//User user = (User) session.getAttribute("LOGINED_USER");
	//if (user.getNo() == 1) {
	//	throw new RuntimeException("관리자만 접근 가능합니다.");

	//} 
	int playerNo = StringUtil.stringToInt(request.getParameter("playerNo"));
	int currentPage = StringUtil.stringToInt(request.getParameter("page"), 1);
	
	PlayerDao playerDao = PlayerDao.getInstance();	
	Player player = playerDao.getPlayerNoPlayer(playerNo);
	if (player == null) {
		throw new RuntimeException("선수 정보가 존재하지 않습니다.");
	}
	
	
	playerDao.deletedPlayer(playerNo);
	
	// 게시글목록을 재요청하는 URL을 응답으로 보낸다.
	response.sendRedirect("club.jsp?clubNo=" + player.getClubNo());
	
%>