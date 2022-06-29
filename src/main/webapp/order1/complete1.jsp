<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../common/nav3.jsp">
   <jsp:param name="menu" value="goods"/>
</jsp:include>

<jsp:include page="../common/nav_home.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>

<div class="container">
	<div class="p-5 mb-4 bg-light rounded-3">
		<div class="container-fluid py-3">
			<h1 class="display-5 fw-bold">구매 완료</h1>
			<p class="fs-4">구매가 완료되었습니다.</p>
			<a href="../goods/goods.jsp" class="btn btn-primary btn-lg">계속 쇼핑하기</a>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>