<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="soccer/error/500.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>입력 완료</title>
<link href="favicon.ico" rel="icon" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../common/nav3.jsp">
   <jsp:param name="menu" value="player" />
</jsp:include>

<jsp:include page="../common/nav_home.jsp">
   <jsp:param name="menu" value="player"/>
</jsp:include>

<div class="container">
	<div class="p-5 mb-4 bg-light rounded-3">
		<div class="container-fluid py-3">
			<h1 class="display-5 fw-bold">선수입력완료</h1>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>