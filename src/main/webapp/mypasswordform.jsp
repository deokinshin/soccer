<%@page import="vo.User"%>
<%@page import="dao.UserDao"%>
<%@page import="util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/soccer/favicon.ico" rel="icon" type="image/x-icon" />

<style type="text/css">
	body {
    background-color: #444442;
    padding-top: 85px;
	}
	
	h1 {
	    font-family: 'Poppins', sans-serif, 'arial';
	    font-weight: 600;
	    font-size: 72px;
	    color: white;
	    text-align: center;
	}
	
	h4 {
	    font-family: 'Roboto', sans-serif, 'arial';
	    font-weight: 400;
	    font-size: 20px;
	    color: #9b9b9b;
	    line-height: 1.5;
	}
	
	/* ///// inputs /////*/
	
	input:focus ~ label, textarea:focus ~ label, input:valid ~ label, textarea:valid ~ label {
	    font-size: 0.75em;
	    color: #999;
	    top: -5px;
	    -webkit-transition: all 0.225s ease;
	    transition: all 0.225s ease;
	}
	
	.styled-input {
	    float: left;
	    width: 293px;
	    margin: 1rem 0;
	    position: relative;
	    border-radius: 4px;
	}
	
	@media only screen and (max-width: 768px){
	    .styled-input {
	        width:100%;
	    }
	}
	
	.styled-input label {
	    color: #999;
	    padding: 1.3rem 30px 1rem 30px;
	    position: absolute;
	    top: 10px;
	    left: 0;
	    -webkit-transition: all 0.25s ease;
	    transition: all 0.25s ease;
	    pointer-events: none;
	}
	
	.styled-input.wide { 
	    width: 650px;
	    max-width: 100%;
	}
	
	input,
	textarea {
	    padding: 30px;
	    border: 0;
	    width: 100%;
	    font-size: 1rem;
	    background-color: #2d2d2d;
	    color: white;
	    border-radius: 4px;
	}
	
	input:focus,
	textarea:focus { outline: 0; }
	
	input:focus ~ span,
	textarea:focus ~ span {
	    width: 100%;
	    -webkit-transition: all 0.075s ease;
	    transition: all 0.075s ease;
	}
	
	textarea {
	    width: 100%;
	    min-height: 15em;
	}
	
	.input-container {
	    width: 650px;
	    max-width: 100%;
	    margin: 20px auto 25px auto;
	}
	
	.submit-btn {
	    float: right;
	    padding: 7px 35px;
	    border-radius: 60px;
	    display: inline-block;
	    background-color: #4b8cfb;
	    color: white;
	    font-size: 18px;
	    cursor: pointer;
	    box-shadow: 0 2px 5px 0 rgba(0,0,0,0.06),
	              0 2px 10px 0 rgba(0,0,0,0.07);
	    -webkit-transition: all 300ms ease;
	    transition: all 300ms ease;
	}
	
	.submit-btn:hover {
	    transform: translateY(1px);
	    box-shadow: 0 1px 1px 0 rgba(0,0,0,0.10),
	              0 1px 1px 0 rgba(0,0,0,0.09);
	}
	
	@media (max-width: 767px) {
	    .submit-btn {
	        width:100%;
	        float: none;
	        text-align:center;
	    }
	}
	
	input[type=checkbox] + label {
	  color: #ccc;
	  font-style: italic;
	} 
	
	input[type=checkbox]:checked + label {
	  color: #f00;
	  font-style: normal;
	}
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<h1>비밀번호 변경</h1>
			<div class="col-xs-6 mb-4" align="center">
				<p style="color:yellow;"><strong>변경할 비밀번호를 입력하세요.</strong></p>
			</div>
		</div>
	<%
		String fail = request.getParameter("fail");
	%>
	<%
		if("invalid".equals(fail)) {
	%>
			<div class="col-xs-6 mb-4" align="center">
				<p style="color:red;"><strong>현재비밀번호가 맞지 않습니다.</strong>
			</div>
	<%
		}
	%>

	<form method="post" action="mypassword.jsp" onsubmit="return changePasswordFrom()">
	
		<div class="row input-container">	
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="password" name="password" />
						<label>현재 비밀번호</label> 
					</div>
			</div>
			<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="password" name="changePassword" />
						<label>변경할 비밀번호</label> 
				</div>
			<div class="col-12 text-end">
				<a href="myinfo.jsp" class="btn btn-light">취소</a>
				<button type="submit" class="btn btn-secondary">수정</button>
			</div>
		</div>
	</div>
	</form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	function changePasswordFrom() {
		let passwordField = document.querySelector("input[name=password]");
		if (idField.value === '') {
			alert("현재 비밀번호를 입력하세요.");
			passwordField.focus();
			return false;
		}
		let changePasswordField = document.querySelector("input[name=changePassword]");
		if (passwordField.value === '') {
			alert("변경할 비밀번호를 입력하세요.");
			changePasswordField.focus();
			return false;
		}
		return true;
	}
</script>
</body>
</html>