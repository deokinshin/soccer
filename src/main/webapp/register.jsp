<%@page import="util.PasswordUtil"%>
<%@page import="vo.User"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	
	UserDao userDao = UserDao.getInstance();

	User savedUser = userDao.getUserById(id);
	if (savedUser != null) {

		response.sendRedirect("registerform.jsp?fail=id&id=" + id);
		return;
	}

	savedUser = userDao.getUserByEmail(email);
	if (savedUser != null) {
		response.sendRedirect("registerform.jsp?fail=email&email=" + email);
	}
	
	String secretPassword = PasswordUtil.generateSecretPassword(id, password);
	
	
	User user = new User();
	user.setId(id);
	user.setPassword(secretPassword);
	user.setName(name);
	user.setEmail(email);
	user.setTel(tel);
	user.setAddress(address);
	
	
	userDao.insertUser(user);
	

	response.sendRedirect("complete.jsp");
%>