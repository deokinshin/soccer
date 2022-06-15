<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>리그선택창</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://webfontworld.github.io/NanumBarunGothic/NanumBarunGothic.css" rel="stylesheet">

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
 
</style>
</head>
<body>
<jsp:include page="../common/nav3.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>
<jsp:include page="../common/nav_home.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>
<div class="container1">
	<div class="box" style=" cursor: pointer;" onclick="location.href='league1.jsp?leagueNo=1';">
	
	 	<span>프리미어리그</span>
		<img src="../league/epl.jpg">
	</div >
	<div class="box" style=" cursor: pointer;" onclick="location.href='league1.jsp?leagueNo=2';">
	  	<span>라리가</span>
	  	<img src="../league/laliga.jpg">
	</div>
	<div class="box" style=" cursor: pointer;" onclick="location.href='league1.jsp?leagueNo=3';">
	  	<span>세리에A</span>
	  	<img src="../league/serieA.jpg">
	</div>
	<div class="box" style=" cursor: pointer;" onclick="location.href='league1.jsp?leagueNo=4';">
	  	<span>분데스리가</span>
	  	<img src="../league/bundesliga.jpg">
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>