<%@page import="util.PasswordUtil"%>
<%@page import="vo.User"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // 요청파라미터값을 조회한다.
   String id = request.getParameter("id");
   String password = request.getParameter("password");
   
   UserDao userDao = UserDao.getInstance();
   
   // 아이디로 사용자정보를 조회한다.
   User savedUser = userDao.getUserById(id);
   if (savedUser == null) {
      response.sendRedirect("loginform.jsp?fail=invalid");
      return;
   }
   
   // 로그인창에서 입력한 비밀번호를 암호화한다.
   String secretPassword = PasswordUtil.generateSecretPassword(id, password);
   
   // 비밀번호가 일치하는지 확인한다.
   if (!savedUser.getPassword().equals(secretPassword)) {
      response.sendRedirect("loginform.jsp?fail=invalid");
      return;
   }
   
   // 세션객체에 사용자정보를 저장한다.
   session.setAttribute("LOGINED_USER", savedUser);
   
   // 재요청URL을 응답으로 보낸다.
   response.sendRedirect("home.jsp");
%>