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
<jsp:include page="common/nav3.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>
<style>
</style>
</head>
<jsp:include page="common/nav_home.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>

<div class="container" style="width:1296; height:500;">

<div style="float:left;">
	<img src="/soccer/images/matchuplogo.jpg" width="60px" height="500px">
</div>

<div style="float:left;">
	<img src="/soccer/images/matchup.jpg" width="343px" height="500px">
</div>

<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel"  style="width: 850px; hegiht:500px; float:right;">
	<div class="carousel-indicators">
	  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
	  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
	</div>
	<div class="carousel-inner" style="width: 850px; height: 500px;">
	    <div class="carousel-item active">
	      	<img src="images/news1.jpg" class="d-block w-100" height="500px" alt="news1">
	      	<div class="carousel-caption d-none d-md-block">
	      	 	<h5>First slide label</h5>
	      	 	<p>Some representative placeholder content for the first slide.</p>
	     	</div>
	    </div>
	    <div class="carousel-item">
	      	<img src="images/news2.jpg" class="d-block w-100" height="500px" alt="news2">
	      	<div class="carousel-caption d-none d-md-block">
	        <h5>Second slide label</h5>
	        <p>Some representative placeholder content for the second slide.</p>
	     	 </div>
	    </div>
	    <div class="carousel-item">
	      <img src="images/news1.jpg" class="d-block w-100" height="500px" alt="news3">
	      <div class="carousel-caption d-none d-md-block">
	        <h5>Third slide label</h5>
	        <p>Some representative placeholder content for the third slide.</p>
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

<div class="container" style="width:1296; height:500; padding: 30px 0px 0px 0px; float:left">
	<div style="float:left;">
		<a href="http://localhost/soccer/deok/player.jsp?playerNo=144">
		<img src="images/mvp.jpg"  width="404px" height="670px"></a>
	</div>
<div id="carouselExampleCaptions2" class="carousel slide" data-bs-ride="carousel"  style="width: 850px; hegiht:670px; float:right;">
<div class="carousel-indicators">
  <button type="button" data-bs-target="#carouselExampleCaptions2" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
  <button type="button" data-bs-target="#carouselExampleCaptions2" data-bs-slide-to="1" aria-label="Slide 2"></button>
  <button type="button" data-bs-target="#carouselExampleCaptions2" data-bs-slide-to="2" aria-label="Slide 3"></button>
</div>
<div class="carousel-inner" style="width: 850px; height: 670px;">
    <div class="carousel-item active">
      <img src="images/news1.jpg" class="d-block w-100" height="670px" alt="goods1">
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <div class="carousel-item">
      <img src="images/news2.jpg" class="d-block w-100" height="670px" alt="goods">
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <div class="carousel-item">
      <img src="images/news1.jpg" class="d-block w-100" height="670px" alt="goods3">
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
	</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>