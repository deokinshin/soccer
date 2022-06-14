<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>리그선택창</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../common/nav_home.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>

<div class="container shadow-lg p-3 mb-5 bg-body rounded">
	<div class="row mb-3">
		<div class="col-4">
			<a href="league1.jsp?leagueNo=1" >
				<img alt="" src="../league/epl.png" style="height: 300px; width: 300px; object-fit: contain" class="rounded mx-auto d-block" >
			</a>
		</div>
		<div class="col-4">
			<a href="league1.jsp?leagueNo=2" >
				<img alt="" src="../league/laliga.png" style="height: 300px; width: 300px; object-fit: contain" class="rounded mx-auto d-block">
			</a>
		
		</div>

	</div> 
	<div class="row mb-3">
		<div class="col-4">
			<a href="league1.jsp?leagueNo=3" >
				<img alt="" src="../league/serieA.png" style="height: 300px; width: 300px; object-fit: contain" class="rounded mx-auto d-block">
			</a>
		</div>
		<div class="col-4">
			<a href="league1.jsp?leagueNo=4" >
				<img alt="" src="../league/bundesliga.png" style="height: 300px; width: 300px; object-fit: contain" class="rounded mx-auto d-block">
			</a>
		
		</div>

	</div> 
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>