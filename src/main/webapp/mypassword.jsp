<%@page import="util.PasswordUtil"%>
<%@page import="dao.UserDao"%>
<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String password = request.getParameter("password");
	User user = (User) session.getAttribute("LOGINED_USER");
	UserDao userDao = UserDao.getInstance();
	String changePassword = request.getParameter("changePassword");
	
	// 아이디로 사용자정보를 조회한다.
	   User savedUser = userDao.getUserById(user.getId());
	   if (savedUser == null) {
	      response.sendRedirect("mypasswordform.jsp?fail=invalid");
	      return;
	   }
	   
	   // 로그인창에서 입력한 비밀번호를 암호화한다.
	   String secretPassword = PasswordUtil.generateSecretPassword(user.getId(), password);
	   
	   // 비밀번호가 일치하는지 확인한다.
	   if (!savedUser.getPassword().equals(secretPassword)) {
	      response.sendRedirect("mypasswordform.jsp?fail=invalid");  
	      return;
	   } 
	   
	   String secretchangePassword = PasswordUtil.generateSecretPassword(user.getId(), changePassword);
	   
	   user.setPassword(secretchangePassword);
	   
	   userDao.updateUserPassword(user);
	   
	   response.sendRedirect("myinfo.jsp");
	   
%>