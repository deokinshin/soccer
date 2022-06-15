<%@page import="util.PasswordUtil"%>
<%@page import="vo.User"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 요청파라미터로 전달된 폼입력값을 조회한다.
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	
	UserDao userDao = UserDao.getInstance();

	// 아이디로 사용자정보를 조회해서 동일한 아이디로 저장된 사용자 정보가 있는지 확인한다.
	User savedUser = userDao.getUserById(id);
	if (savedUser != null) {
		// 오류원인: fail=id, 중복이발생한 아이디: id=hong 정보를 재요청URL에 쿼리스트링에서 추가해서
		// registerform.jsp에서 오류 정보를 표시할 때 활용할 수 있게 함.
		response.sendRedirect("registerform.jsp?fail=id&id=" + id);
		return;
	}
	// 이메일로 사용자정보를 조회해서 동일한 이메일로 저장된 사용자 정보가 있는지 확인한다.
	savedUser = userDao.getUserByEmail(email);
	if (savedUser != null) {
		response.sendRedirect("registerform.jsp?fail=email&email=" + email);
	}
	
	String secretPassword = PasswordUtil.generateSecretPassword(id, password);
	
	// User객체를 생성해서 사용자정보를 저장한다.
	User user = new User();
	user.setId(id);
	user.setPassword(secretPassword);
	user.setName(name);
	user.setEmail(email);
	user.setTel(tel);
	user.setAddress(address);
	
	// 사용자정보를 데이터베이스에 저장시킨다.
	userDao.insertUser(user);
	
	// 재요청URL을 응답으로 보낸다.
	response.sendRedirect("complete.jsp");
%>