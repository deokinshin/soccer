<%@page import="vo.Player"%>
<%@page import="dao.PlayerDao"%>
<%@page import="util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>선수 정보 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/soccer/favicon.ico" rel="icon" type="image/x-icon" />
<link href="form.css" rel="stylesheet"/>

</head>
<body>
<div class="container">
	<div class="row">
			<h1>선수 추가</h1>
	</div>
	<%
  		int playerNo = StringUtil.stringToInt(request.getParameter("playerNo"));
		PlayerDao playerDao = PlayerDao.getInstance();
		Player player = playerDao.getPlayerNoPlayer(playerNo);
		
	
	%>
	<form method="post" action="modify.jsp" enctype="multipart/form-data" onsubmit="return submitModifyForm()">
		<input type="hidden" name="playerNo" value="<%=playerNo %>" />
		<div class="row input-container">
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="text" name="name" value="<%=player.getName() %>"/>
						<label>선수이름</label> 
					</div>
				</div>
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="text" name="ufNo" value="<%=player.getUfNo() %>" />
						<label>등번호</label> 
					</div>
				</div>
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="text" name="nationality" value="<%=player.getNationality() %>"/>
						<label>국적</label> 
					</div>
				</div>
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="text" name="goal" value="<%=player.getGoal() %>"/>
						<label>골</label> 
					</div>
				</div>
				<div class="col-xs-6">
					<label>클럽</label> 
					<div class="styled-input wide">
						<select class="form-select" name="clubNo" >
							<option value="1" <%=player.getClubNo()==1 ? "selected" : "" %>> 맨시티</option>
							<option value="2" <%=player.getClubNo()==2 ? "selected" : "" %>> 리버풀</option>
							<option value="3" <%=player.getClubNo()==3 ? "selected" : "" %>> 첼시</option>
							<option value="4" <%=player.getClubNo()==4 ? "selected" : "" %>> 토트넘</option>
							<option value="5" <%=player.getClubNo()==5 ? "selected" : "" %>> 레알마드리드</option>
							<option value="6" <%=player.getClubNo()==6 ? "selected" : "" %>> 바르셀로나</option>
							<option value="7" <%=player.getClubNo()==7 ? "selected" : "" %>> AT 마드리드</option>
							<option value="8" <%=player.getClubNo()==8 ? "selected" : "" %>> 세비야</option>
							<option value="9" <%=player.getClubNo()==9 ? "selected" : "" %>> AC 밀란</option>
							<option value="10" <%=player.getClubNo()==10 ? "selected" : "" %>> 인테르나치오날레 밀라노</option>
							<option value="11" <%=player.getClubNo()==11 ? "selected" : "" %>> 나폴리</option>
							<option value="12" <%=player.getClubNo()==12 ? "selected" : "" %>> 유벤투스</option>
							<option value="13" <%=player.getClubNo()==13 ? "selected" : "" %>> 바이에른 뮌헨</option>
							<option value="14" <%=player.getClubNo()==14 ? "selected" : "" %>> 도르트문트</option>
							<option value="15" <%=player.getClubNo()==15 ? "selected" : "" %>> 레버쿠젠</option>
							<option value="16" <%=player.getClubNo()==16 ? "selected" : "" %>> 라이프치히</option>
						</select>
					</div>
				</div>
				<div class="col-xs-6">
					<label>포지션</label> 
					<div class="styled-input wide">
						<select class="form-select" name="position">
							<option value="공격수" <%=player.getPosition().equals("공격수") ? "selected" : ""%>> 공격수</option>
							<option value="수비수" <%=player.getPosition().equals("수비수") ? "selected" : ""%>> 수비수</option>
							<option value="미드필더" <%=player.getPosition().equals("미드필더") ? "selected" : ""%>> 미드필더</option>
							<option value="골키퍼" <%=player.getPosition().equals("골키퍼") ? "selected" : ""%>> 골키퍼</option>
						</select>
					</div>
				</div>
				<div class="col-xs-6">
					<label>생년월일</label> 
					<div class="styled-input wide">
						<input type="date" class="form-control" name="birth" value="<%=player.getBirth() %>">
					</div>
				</div>
				<div class="col-xs-12">
					<label>사진</label> 
					<div class="styled-input wide">
						<input type="file" class="form-control mb-2" name="upFile" onchange="readURL(this);"/>
						<img alt="미리보기" src="../player/<%=player.getFileName() %>" style="width: 200px; height: 200px"  id="preview">
						<input type="hidden" name="file" value="<%=player.getFileName() %>" />
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
		let birthField = document.querySelector("input[name=birth]");
		if (birthField.value === '') {
			alert("생일은 필수입력값입니다.");
			birthField.focus();
			return false;
		}
		let clubField = document.querySelector("input[name=clubNo]");
		if (clubField.value === '') {
			alert("클럽은 필수입력값입니다.");
			clubField.focus();
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