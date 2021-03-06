<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SOCCER</title>
<link href="favicon.ico" rel="icon" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<jsp:include page="/common/nav3.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>

<style>
	#footer {
		padding : 50px 0px 0px 0px;
		text-align: center;
		clear: both;
		width: 100%;
		height: 185px;
		background-color: #212529;
		color: #a9a9a9;
	}
</style>

</head>

<body>

<jsp:include page="common/nav_home.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>
<div>
<div class="container" style="width:1296; height:500;">

	<div style="float:left; box-shadow: 0px 0px 10px #000;">
		<img src="/soccer/images/matchuplogo.jpg" width="60px" height="500px">
	</div>
	
	<div style="float:left; box-shadow: 0px 0px 10px #000;">
		<img src="/soccer/images/matchup.jpg" width="343px" height="500px">
	</div>

<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel"  style="width: 850px; hegiht:500px; float:right; box-shadow: 0px 0px 20px #000;">
	<div class="carousel-indicators">
	  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
	  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
	</div>
	<div class="carousel-inner" style="width: 850px; height: 500px;">
	    <div class="carousel-item active">
	    	<a href="http://localhost/soccer/dowoo/article.jsp?no=1">
	      	<img src="/soccer/news/1.png" class="d-block w-100" height="500px" alt="news1"></a>
	      	<div class="carousel-caption d-none d-md-block">
	      	 	<h5>??????????????? ????????? ?????? ????????????, ???????????? 1-0???</h5>
	      	 	<p></p>
	     	</div>
	    </div>
	    <div class="carousel-item">
	    	<a href="http://localhost/soccer/dowoo/article.jsp?no=2">
	      	<img src="/soccer/news/2.png" class="d-block w-100" height="500px" alt="news2"></a>
	      	<div class="carousel-caption d-none d-md-block">
	        <h5>????????? MVP ????????????, 9??? ???????????? ?????? ?????? ????????????.</h5>
	        <p></p>
	     	 </div>
	    </div>
	    <div class="carousel-item">
	      <a href="http://localhost/soccer/dowoo/article.jsp?no=3">
	      <img src="/soccer/news/3.png" class="d-block w-100" height="500px" alt="news3"></a>
	      <div class="carousel-caption d-none d-md-block">
	        <h5>??????"????????? ????????????.????????????.??????????????????"</h5>
	      </div>
	    </div>
		 </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
	</div>

<div class="container" style="width:1270; height:500; padding: 30px 0px 50px 0px; float:left ">
	<div style="float:left; box-shadow: 0px 0px 10px #000;">
		<a href="http://localhost/soccer/deok/player.jsp?playerNo=144">
		<img src="/soccer/images/mvp.jpg"  width="404px" height="670px"></a>
	</div>
	
	<div id="carouselExampleCaptions2" class="carousel slide" data-bs-ride="carousel"  style="width: 404px; hegiht:670px; float:left; box-shadow: 0px 0px 10px #000; margin: 0px 0px 0px 42px">
		<div class="carousel-indicators">
		  <button type="button" data-bs-target="#carouselExampleCaptions2" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		  <button type="button" data-bs-target="#carouselExampleCaptions2" data-bs-slide-to="1" aria-label="Slide 2"></button>
		  <button type="button" data-bs-target="#carouselExampleCaptions2" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  <button type="button" data-bs-target="#carouselExampleCaptions2" data-bs-slide-to="3" aria-label="Slide 4"></button>
		</div>
		<div class="carousel-inner" style="width: 404px; height: 670px;">
	    <div class="carousel-item active">
	      <a href="http://localhost/soccer/goods/detail.jsp?goodsNo=9">
	      <img src="/soccer/images/uniform/home/rmd.jpg" class="d-block w-100" height="670px" alt="goods1"></a>
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	    <div class="carousel-item">
	   	 <a href="http://localhost/soccer/goods/detail.jsp?goodsNo=1">
	      <img src="/soccer/images/uniform/home/mancity.jpg" class="d-block w-100" height="670px" alt="goods2"></a>
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	    <div class="carousel-item">
	    <a href="http://localhost/soccer/goods/detail.jsp?goodsNo=18">
	      <img src="/soccer/images/uniform/home/acm.jpg" class="d-block w-100" height="670px" alt="goods3"></a>
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	    <div class="carousel-item">
	    <a href="http://localhost/soccer/goods/detail.jsp?goodsNo=26">
	      <img src="/soccer/images/uniform/home/bay.jpg" class="d-block w-100" height="670px" alt="goods4"></a>
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions2" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions2" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	
	<div id="carouselExampleCaptions3" class="carousel slide" data-bs-ride="carousel"  style="width: 404px; hegiht:670px; float:left; box-shadow: 0px 0px 10px #000; margin: 0px 0px 0px 42px">
		<div class="carousel-indicators">
		  <button type="button" data-bs-target="#carouselExampleCaptions3" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		  <button type="button" data-bs-target="#carouselExampleCaptions3" data-bs-slide-to="1" aria-label="Slide 2"></button>
		  <button type="button" data-bs-target="#carouselExampleCaptions3" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  <button type="button" data-bs-target="#carouselExampleCaptions3" data-bs-slide-to="3" aria-label="Slide 4"></button>
		</div>
		<div class="carousel-inner" style="width: 404px; height: 670px;">
	    <div class="carousel-item active">
	    <a href="http://localhost/soccer/goods/detail.jsp?goodsNo=10">
	      <img src="/soccer/images/uniform/away/rmd.jpg" class="d-block w-100" height="670px" alt="goods1"></a>
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	    <div class="carousel-item">
	    <a href="http://localhost/soccer/goods/detail.jsp?goodsNo=2">
	      <img src="/soccer/images/uniform/away/mancity.jpg" class="d-block w-100" height="670px" alt="goods2"></a>
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	    <div class="carousel-item">
	    <a href="http://localhost/soccer/goods/detail.jsp?goodsNo=17">
	      <img src="/soccer/images/uniform/away/acm.jpg" class="d-block w-100" height="670px" alt="goods3"></a>
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	    <div class="carousel-item">
	    <a href="http://localhost/soccer/goods/detail.jsp?goodsNo=25">
	      <img src="/soccer/images/uniform/away/bay.jpg" class="d-block w-100" height="670px" alt="goods4"></a>
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions3" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions3" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
</div>
</div>
</div>

<jsp:include page="/common/footer.jsp">
	<jsp:param name="menu" value="club"/>
</jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>