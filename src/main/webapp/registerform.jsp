<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="favicon.ico" rel="icon" type="image/x-icon" />
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
			<h1>회원가입</h1>
	</div>
		<%
			// 요청파라미터에서 오류 원인을 조회한다
			// 오류 원인은 "id" 혹은 "email" 중 하나다.
			String fail = request.getParameter("fail");
		%>
			<!--
				동일한 아이디로 가입된 사용자가 있는 경우 아래 내용을 출력한다.
				registerform.jsp?fail=id&id=hong-gd
			-->
		<%
			if ("id".equals(fail)) {
				String duplicatedId =  request.getParameter("id");
		%>
			<div class="alert alert-danger">
				<strong>회원가입 실패</strong> [<%=duplicatedId %>]은 이미 사용중인 아이디 입니다.
			</div>
		<%
			}
		%>
			<!--
				동일한 이메일로 가입된 사용자가 있는 경우 아래 내용을 출력한다.
				registerform.jsp?fail=email&email=hong-gd@gmail.com
			-->
		<%
			if ("email".equals(fail)) {
				String duplictedEmail = request.getParameter("email");
		%>
			<div class="alert alert-danger">
				<strong>회원가입 실패</strong> [<%=duplictedEmail %>]은 이미 사용중인 이메일입니다.
			</div>
		<%
			}
		%>
	
	<form method="post" action="register.jsp">	
		<div class="row input-container">
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="text" name="id" onkeyup="idCheck();" />
						<label>아이디</label> 
						<div id="id-helper" class="form-text text-bold"></div>
					</div>
				</div>
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="password" name="password" />
						<label>비밀번호</label> 
					</div>
				</div>
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="text" name="name" />
						<label>이름</label> 
					</div>
				</div>
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="text" name="email" onkeyup="emailCheck();"/>
						<label>이메일</label> 
						<div id="email-helper" class="form-text text-bold"></div>
					</div>
				</div>
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="text" name="tel" />
						<label>전화번호</label> 
					</div>
				</div>
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="text" name="address" />
						<label>주소</label> 
					</div>
				</div>
				
				<div class="col-12 text-end mb-3">
					<a href="home.jsp" class="btn btn-light">취소</a>
					<button type="submit" class="btn btn-secondary">회원가입</button>
				</div>		
		</div>
	</form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
//아이디, 이메일 유효성 및 중복검사 체크여부를 저장하는 변수
let isIdChecked = false;
let isEmailChecked = false;

function idCheck() {
	let idHelperElement = document.querySelector("#id-helper")		
	let idElement = document.querySelector("input[name=id]");		
	let idValue = idElement.value;									
	
	let classList = idHelperElement.classList;		
	classList.remove("text-danger", "text-success");
	
	if (idValue === "") {
		classList.add("text-danger");								
		idHelperElement.textContent = "아이디는 필수입력값입니다.";		
		isIdChecked = false;
		return;			
	}
	if (idValue.length < 3) {
		classList.add("text-danger");
		idHelperElement.textContent = "아이디는 3글자 이상 20글자 이하로 작성합니다.";
		isIdChecked = false;
		return;
	}
	if (idValue.length > 20) {
		classList.add("text-danger");
		idHelperElement.textContent = "아이디는 3글자 이상 20글자 이하로 작성합니다.";
		isIdChecked = false;
		return;
	}
	
	// XHR객체로 서버와 HTTP 통신하기
	let xhr = new XMLHttpRequest();				
	xhr.onreadystatechange = function() {		
		if (xhr.readyState === 4 && xhr.status === 200) {
			let jsonText = xhr.responseText;		
			let result = JSON.parse(jsonText);			
			if (result.exist) {
				classList.add("text-danger");
				idHelperElement.textContent = "사용할 수 없는 아이디 입니다.";
				isIdChecked = false;
			} else {
				classList.add("text-success");
				idHelperElement.textContent = "사용가능한 아이디입니다.";
				isIdChecked = true;
			}
		}
	}
	xhr.open("GET", 'idcheck.jsp?id=' + idValue);	
	xhr.send();									
}

function emailCheck() {
	console.log("emailCheck() is running");
	
}

function submitRegisterForm() {
	let idField = document.querySelector("input[name=id]");
	if (idField.value === '') {
		alert("아이디는 필수입력값입니다.");
		idField.focus();
		return false;
	}
	
	if (!isIdChecked) {
		alert("유효한 아이디가 아니거나 사용할 수 없는 아이디 입니다.");
		idField.focus();
		return false;
	}
	
	let passwordField = document.querySelector("input[name=password]");
	if (passwordField.value === '') {
		alert("비밀번호는 필수입력값입니다.");
		passwordField.focus();
		return false;
	}
	let nameField = document.querySelector("input[name=name]");
	if (nameField.value === '') {
		alert("이름은 필수입력값입니다.");
		nameField.focus();
		return false;
	}
	let emailField = document.querySelector("input[name=email]");
	if (emailField.value === '') {
		alert("이메일은 필수입력값입니다.");
		emailField.focus();
		return false;
	}
	
	return true;
}
</script>
</body>
</html>