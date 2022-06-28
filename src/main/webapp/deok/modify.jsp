<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.Player"%>
<%@page import="dao.PlayerDao"%>
<%@page import="util.MultipartRequest"%>
<%@page import="util.StringUtil"%>
<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="soccer/error/500.jsp"%>
<%
	
	User user = (User) session.getAttribute("LOGINED_USER");
	if (user.getNo() != 1) {
		throw new RuntimeException("관리자만 접근 가능합니다.");

	} 
	MultipartRequest mr = new MultipartRequest(request, "C:\\eclipse\\workspace-web\\soccer\\src\\main\\webapp\\player");
	int playerNo = StringUtil.stringToInt(mr.getParameter("playerNo"));
	String name = mr.getParameter("name");
	int ufNo = StringUtil.stringToInt(mr.getParameter("ufNo"));
	String nationality = mr.getParameter("nationality");
	String position = mr.getParameter("position");
	int goal = StringUtil.stringToInt(mr.getParameter("goal"));
	int clubNo = StringUtil.stringToInt(mr.getParameter("clubNo"));
	String dateStr = mr.getParameter("birth");
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Date birth = formatter.parse(dateStr);
	String fileName = mr.getFilename("upFile");
	String file = mr.getParameter("file");
		
	
	PlayerDao playerDao = PlayerDao.getInstance();
	Player player = playerDao.getPlayerNoPlayer(playerNo);
	if (player == null) {
		throw new RuntimeException("선수 정보가 존재하지 않습니다.");
	}
	
	player.setName(name);
	player.setUfNo(ufNo);
	player.setNationality(nationality);
	player.setPosition(position);
	player.setGoal(goal);
	player.setClubNo(clubNo);
	player.setBirth(birth);
	
	if (fileName == null) {
		
		player.setFileName(file);
	} else {
		
		player.setFileName(fileName);
	}
	
	
	playerDao.updatePlayer(player);
	
	response.sendRedirect("player.jsp?playerNo="+playerNo);
%>