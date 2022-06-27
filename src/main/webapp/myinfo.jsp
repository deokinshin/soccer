<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내 정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/soccer/favicon.ico" rel="icon" type="image/x-icon" />
<jsp:include page="/common/nav3.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>
</head>
<body>
<jsp:include page="common/nav_home.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>
	<%
		User user = (User) session.getAttribute("LOGINED_USER");
	%>
<div class="container">
	<h3>내 정보
	<button type="submit" class="btn btn-outline-secondary float-end" onclick="location.href='/soccer/mypasswordform.jsp'">비밀번호 변경</button>
	<button type="submit" class="btn btn-outline-secondary float-end me-2" onclick="location.href='/soccer/mypageform.jsp'">정보 수정</button>
	
	</h3>
	<hr>
      <div class="col-3">
         <div>
                <span class="name"> 아이디 </span> 
            </div>
         <div>
                <span class="span2"> <%=user.getId() %> </span> 
            </div>
            <hr>
         <div>
            <span class="name"> 이름 </span> 
            </div>
            <div class="mb-3">
                <span class="span2">  <%=user.getName() %></span>
            </div>
            <hr>
            <div>
            <span class="name"> 이메일 </span> 
            </div>
            <div class="mb-3">
                <span class="span2">  <%=user.getEmail() %></span>
                <hr>
            </div>
            <div>
            <span class="name"> 전화번호 </span> 
            </div>
            <div class="mb-3">
                <span class="span2">  <%=user.getTel() %></span>
                <hr>
            </div>
            <div>
            <span class="name"> 주소 </span> 
            </div>
            <div class="mb-3">
                <span class="span2">  <%=user.getAddress() %></span>
                <hr>
            </div>
            
           
   
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>