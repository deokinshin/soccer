<%@page import="vo.Player"%>
<%@page import="dao.PlayerDao"%>
<%@page import="java.util.List"%>
<%@page import="vo.Club"%>
<%@page import="dao.ClubDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="soccer/error/500.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>선수 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/soccer/favicon.ico" rel="icon" type="image/x-icon" />
<link href="form.css" rel="stylesheet"/>
</head>
<body>
<div class="container">
	<div class="row">
			<h1>선수 추가</h1>
	</div>

	<form method="post" action="playeradd.jsp" enctype="multipart/form-data" onsubmit="return submitModifyForm()">
	
		<div class="row input-container">
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="text" name="name" />
						<label>선수이름</label> 
					</div>
				</div>
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="text" name="ufNo" />
						<label>등번호</label> 
					</div>
				</div>
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="text" name="nationality" />
						<label>국적</label> 
					</div>
				</div>
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="text" name="goal" />
						<label>골</label> 
					</div>
				</div>
				<div class="col-xs-6">
					<label>클럽</label> 
					<%
						ClubDao clubDao = ClubDao.getInstance();
						List<Club> clubList = clubDao.getAllClubs();
						
						
					%>
					<div class="styled-input wide">
						<select class="form-select" name="clubNo">
							<option value="" selected="selected" disabled="disabled"> 선택하세요</option>
							<%
								for (Club club : clubList) {
									
							%>
							<option value="<%=club.getClubNo() %>"> <%=club.getName() %></option>
							<%
								}
							%>
						</select>
					</div>
				</div>
				<div class="col-xs-6">
					<label>포지션</label> 
					<div class="styled-input wide">
						<select class="form-select" name="position">
							<option value="" selected="selected" disabled="disabled"> 선택하세요</option>
							<option value="공격수"> 공격수</option>
							<option value="수비수"> 수비수</option>
							<option value="미드필더"> 미드필더</option>
							<option value="골키퍼"> 골키퍼</option>
						</select>
					</div>
				</div>
				<div class="col-xs-6">
					<label>생년월일</label> 
					<div class="styled-input wide">
						<input type="date" class="form-control" name="birth">
					</div>
				</div>
				<div class="col-xs-12">
					<label>사진</label> 
					<div class="styled-input wide">
						<input type="file" class="form-control mb-2" name="upFile" onchange="readURL(this);" />
						<img alt="미리보기" id="preview" style="width: 200px; height: 200px">
					</div>
				</div>
				
				
				<div class="col-12 text-end mb-3">
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			
		</div>
	</form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	function submitModifyForm() {
		let nameField = document.querySelector("input[name=name]");
		if (nameField.value === '') {
			alert("이름은 필수입력값입니다.");
			nameField.focus();
			return false;
		}
		let ufNoField = document.querySelector("input[name=ufNo]");
		if (ufNoField.value === '') {
			alert("등번호는 필수입력값입니다.");
			ufNoField.focus();
			return false;
		}
		let nationalityField = document.querySelector("input[name=nationality]");
		if (nationalityField.value === '') {
			alert("국적 필수입력값입니다.");
			nationalityField.focus();
			return false;
		}
		let clubField = document.querySelector("select[name=clubNo]");
		if (clubField.value === '') {
			alert("클럽은 필수입력값입니다.");
			clubField.focus();
			return false;
		}
		let birthField = document.querySelector("input[name=birth]");
		if (birthField.value === '') {
			alert("생일은 필수입력값입니다.");
			birthField.focus();
			return false;
		}
		return true;
	}
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
		    	document.getElementById('preview').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('preview').src = "";
		}
	}
</script>
</body>
</html>