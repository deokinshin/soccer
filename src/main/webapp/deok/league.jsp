<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="soccer/error/500.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>리그선택창</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://webfontworld.github.io/NanumBarunGothic/NanumBarunGothic.css" rel="stylesheet">
<link href="/soccer/favicon.ico" rel="icon" type="image/x-icon" />


<style type="text/css">
	.container1 {
	  display: flex;
	  width: 100%;
	  padding: 4% 2%;
	  box-sizing: border-box;
	  height: 100vh;
	 }
	  
	.box {
	  flex: 1;
	  overflow: hidden;
	  transition: .5s;
	  margin: 0 2%;
	  box-shadow: 0 20px 30px rgba(0,0,0,.1);
	  line-height: 0;
	}
	
	.box > img {
	  width: 200%;
	  height: calc(100% - 10vh);
	  object-fit: cover; 
	  transition: .5s;
	}
	
	.box > span {
	  font-size: 3.8vh;
	  display: block;
	  text-align: center;
	  height: 10vh;
	  line-height: 2.6;
	  font-family: 'NanumBarunGothic';
	  font-weight:700;
	}
	
	.box:hover { flex: 1 1 50%; }
	.box:hover > img {
	  width: 100%;
	  height: 100%;
	}

	h1,h3 {
		font-family: 'GmarketSansBold';
	}
	@font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	} 
</style>
</head>
<body>
<jsp:include page="../common/nav3.jsp">
	<jsp:param name="menu" value="league"/>
</jsp:include>
<jsp:include page="../common/nav_home.jsp">
	<jsp:param name="menu" value="league"/>
</jsp:include>
<div class="container1">
	<div class="box" style=" cursor: pointer;" onclick="location.href='league1.jsp?leagueNo=1';">
	
	 	<h1>프리미어리그</h1>
		<img src="../league/epl.jpg">
	</div >
	<div class="box" style=" cursor: pointer;" onclick="location.href='league1.jsp?leagueNo=2';">
	  	<h1>라리가</h1>
	  	<img src="../league/laliga.jpg">
	</div>
	<div class="box" style=" cursor: pointer;" onclick="location.href='league1.jsp?leagueNo=3';">
	  	<h1>세리에A</h1>
	  	<img src="../league/serieA.jpg">
	</div>
	<div class="box" style=" cursor: pointer;" onclick="location.href='league1.jsp?leagueNo=4';">
	  	<h1>분데스리가</h1>
	  	<img src="../league/bundesliga.jpg">
	</div>
</div>
<jsp:include page="../common/footer.jsp">
	<jsp:param name="menu" value="league"/>
</jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>