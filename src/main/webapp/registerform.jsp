<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커뮤니티 게시판</title>
<link href="favicon.ico" rel="icon" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="common/nav3.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>
<jsp:include page="common/nav_home.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>

<div class="container mb-5">
	<div class="row">
		<div class="col">
			<h1 class="fs-4 border p-2">회원가입</h1>
		</div>
	</div>
	<div class="row">
		<div class="col">
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
			<p>아이디, 비밀번호, 이름, 이메일, 성별를 입력하세요</p>
			<!-- 
				<form>태그에서 onsubmit 이벤트가 발생하면 submitRegisterForm() 함수가 실행된다.
				submitRegisterForm()함수가 true를 반환하면 <form>태그내의 폼 입력값이 서버(register.jsp)로 제출된다.
				submitRegisterForm()함수가 false를 반환하면 <form>태그내의 폼 입력값이 서버(register.jsp)로 제출되지 않는다.
			 -->
			<form class="border bg-light p-3" method="post" action="register.jsp" onsubmit="return submitRegisterForm()">
				<div class="row g-3">
					<div class="col-6">
						<label class="form-label">아이디</label>
						<input type="text" class="form-control" name="id" onkeyup="idCheck();">
						<div id="id-helper" class="form-text text-bold"></div>
					</div>
					<div class="col-6">
						<label class="form-label">비밀번호</label>
						<input type="password" class="form-control" name="password">
					</div>
					<div class="col-6">
						<label class="form-label">이름</label>
						<input type="text" class="form-control" name="name">
					</div>
					<div class="col-6">
						<label class="form-label">이메일</label>
						<input type="text" class="form-control" name="email" onkeyup="emailCheck();">
						<div id="email-helper" class="form-text  text-bold"></div>
					</div>
					<div class="col-6">
						<label class="form-label">전화번호</label>
						<input type="text" class="form-control" name="tel" onkeyup="telCheck();">
						<div id="tel-helper" class="form-text  text-bold"></div>
					</div>
					<div class="col-6">
						<label class="form-label">주소</label>
						<input type="text" class="form-control" name="address" onkeyup="addressCheck();">
						<div id="address-helper" class="form-text  text-bold"></div>
					</div>
					<div class="col-12 text-end">
						<a href="home.jsp" class="btn btn-secondary">취소</a>
						<button type="submit" class="btn btn-primary">회원가입</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	// 아이디, 이메일 유효성 및 중복검사 체크여부를 저장하는 변수
	let isIdChecked = false;
	let isEmailChecked = false;

	function idCheck() {
		let idHelperElement = document.querySelector("#id-helper")		// 아이디 속성값이 id-helper인 엘리먼트를 조회한다.
		let idElement = document.querySelector("input[name=id]");		// input엘리먼트 중에서 name 속성값이 id인 엘리먼트를 조회한다.
		let idValue = idElement.value;									// 조회된 input엘리먼트에 입력된 값을 조회한다.
		
		let classList = idHelperElement.classList;			// idHelper엘리먼트의 클래스 속성값을 전부 저장하고 있는 객체를 획득한다.
		classList.remove("text-danger", "text-success");	// 클래스 속성값을 가지고 있는 객체에서 "texty-danger"와 "text-success"를 삭제한다.
		
		if (idValue === "") {
			classList.add("text-danger");									// 클래스 속성값을 가지고 있는 객체에 "text-danger"를 추가한다.
			idHelperElement.textContent = "아이디는 필수입력값입니다.";		// idHelper엘리먼트의 텍스트컨텐츠를 변경한다.
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
		let xhr = new XMLHttpRequest();					// 요청과 응답을 담당하는 XMLHttpRequest객체 생성하기
		xhr.onreadystatechange = function() {			// XHR객체는 readyState값이 변할 때마다 onreadystatechange 이벤트를 발생한다.
			if (xhr.readyState === 4 && xhr.status === 200) {
				let jsonText = xhr.responseText;			// jsonText -> '{"exist":true}' <--- 텍스트
				let result = JSON.parse(jsonText);			// result   ->  {exist:true}	<--- 자바스크립트 객체
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
		xhr.open("GET", 'idcheck.jsp?id=' + idValue);	// XHR객체를 초기화한다.(요청방식, 요청URL을 지정한다.)
		xhr.send();										// 서버로 요청을 보낸다.
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