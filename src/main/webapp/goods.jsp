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
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/epl/man/_home.JPG" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 맨시티 홈 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
					<img src="images/detail/membership.jpg" class="card-img" />
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/epl/man/_away.JPG" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 맨시티 어웨이 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/epl/liv/_home.JPG" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 리버풀 홈 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/epl/liv/_away.JPG" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 리버풀 어웨이 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/epl/che/_home.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 첼시 홈 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/epl/che/_away.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 첼시 어웨이 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/epl/tot/_home.JPG" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 토트넘 홈 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/epl/tot/_away.JPG" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 토트넘 어웨이 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/laliga/rmd/_home.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 레알마드리드 홈 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/laliga/rmd/_away.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 레알마드리드 어웨이 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/laliga/bar/_home.JPG" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 바르셀로나 홈 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/laliga/bar/_away.JPG" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 바르셀로나 어웨이 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/laliga/atm/_home.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 아틀레티코 마드리드 홈 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/laliga/atm/_away.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 아틀레티코 마드리드 어웨이 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/laliga/sev/_home.JPG" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 세비야 홈 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/laliga/sev/_away.JPG" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 세비야 어웨이 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/seria/acm/_home.JPG" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 AC밀란 홈 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/seria/acm/_away.JPG" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 AC밀란 어웨이 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/seria/int/_home.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 인터밀란 홈 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/seria/int/_away.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 인터밀란 어웨이 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/seria/nap/_home.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 나폴리 홈 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/seria/nap/_away.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 나폴리 어웨이 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/seria/juv/_home.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 유벤투스 홈 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/seria/juv/_away.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 유벤투스 어웨이 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/bundesliga/bay/_home.JPG" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 뮌헨 홈 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/bundesliga/bay/_away.JPG" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 뮌헨 어웨이 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/bundesliga/dor/_home.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 도르트문트 홈 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/bundesliga/dor/_third.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 도르트문트 써드 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/bundesliga/rev/_home.JPG" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 레버쿠젠 홈 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/bundesliga/rev/_away.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 레버쿠젠 어웨이 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/bundesliga/rai/_home.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 라이프치히 홈 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/bundesliga/rai/_away.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small><strong>soccer.com</strong></small></p>
					<p class="card-text"><small>21-22 라이프치히 어웨이 유니폼</small></p>
					<p class="card-text"><strong>109,000 </strong>원</p>
					<h5 class="card-title"><small>membership price</small></h5>
				</div>
			</div>
		</div>
		
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>