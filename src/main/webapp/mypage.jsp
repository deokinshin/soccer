<%@page import="vo.User"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");

	UserDao userDao = UserDao.getInstance();
	
	User user = (User) session.getAttribute("LOGINED_USER");
	
	user.setEmail(email);
	user.setTel(tel);
	user.setAddress(address);
	
	userDao.updateUser(user);
	
	response.sendRedirect("myinfo.jsp");
%>