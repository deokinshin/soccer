<%@page import="dao.PlayerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.Player"%>
<%@page import="java.util.Date"%>
<%@page import="util.StringUtil"%>
<%@page import="util.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	MultipartRequest mr = new MultipartRequest(request, "C:\\eclipse\\workspace-web\\soccer\\src\\main\\webapp\\player");	

	String name = mr.getParameter("name");
	int ufNo = StringUtil.stringToInt(mr.getParameter("ufNo"));
	String nationality = mr.getParameter("nationality");
	String position = mr.getParameter("position");
	int goal = StringUtil.stringToInt(mr.getParameter("goal"));
	int clubNo = StringUtil.stringToInt(mr.getParameter("clubNo"));
	// 생년월일 데이터 타입으로 변환
	String dateStr = mr.getParameter("birth");
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Date birth = formatter.parse(dateStr);
	
	String fileName = mr.getFilename("upFile");
	
	Player player = new Player();
	player.setName(name);
	player.setUfNo(ufNo);
	player.setNationality(nationality);
	player.setPosition(position);
	player.setGoal(goal);
	player.setClubNo(clubNo);
	player.setBirth(birth);
	player.setFileName(fileName);
	
	PlayerDao playerDao = PlayerDao.getInstance();
	playerDao.insertPlayer(player);
	
	response.sendRedirect("complete.jsp");

%>