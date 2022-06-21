<%@page import="vo.Goods"%>
<%@page import="java.util.List"%>
<%@page import="dao.GoodsDao"%>
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
<jsp:include page="common/nav.jsp">
   <jsp:param name="menu" value="home"/>
</jsp:include>
<div id="carouselExampleCaptions" class="carousel slide mb-3" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/slide/real.jpg" class="d-block w-100" height="500" alt="real">
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <div class="carousel-item">
      <img src="images/slide/ramos.jpg" class="d-block w-100" height="500" alt="ramos">
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <div class="carousel-item">
      <img src="images/slide/chelsea.jpg" class="d-block w-100" height="500" alt="chelsea">
      <div class="carousel-caption d-none d-md-block">
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
<div class="container" style="min-width: 800px; max-width: 800px;">
	<div class="row ">
	
		<%
			GoodsDao goodsDao = GoodsDao.getInstance();
			List<Goods> goodsList = goodsDao.getAllGoods();
			
			for (Goods goods : goodsList) {
			
		%>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/epl/<%=goods.getClubNo() %>/<%=goods.getGoodsNo() %>.JPG" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small><%=goods.getGoodsName() %></small></p>
					<p class="card-text"><strong><%=goods.getGoodsPrice() %> </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
					<img src="images/detail/membership.jpg" class="card-img" />
				</div>
			</div>
		</div>
		<%
			}
		%>
		
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>