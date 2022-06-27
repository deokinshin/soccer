<%@page import="util.StringUtil"%>
<%@page import="dto.GoodsReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.GoodsReviewDao"%>
<%@page import="vo.Goods"%>
<%@page import="dao.GoodsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GOODS DETAIL</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../common/nav3.jsp">
	<jsp:param name="menu" value="goods" />
</jsp:include>

<jsp:include page="../common/nav_home.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>

<div class="container">
	<div class="row mb-3">
		<div class="col">
			<h1 class="fs-4 border p-2">상품 상세페이지 입니다.</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">

		<%
			// localhost/soccer2/goods/detail.jsp?goodsNo=100
			
			int goodsNo = StringUtil.stringToInt(request.getParameter("goodsNo"));
			
			GoodsDao goodsDao = GoodsDao.getInstance();
			Goods goods = goodsDao.getGoodsByNo(goodsNo);
			
			GoodsReviewDao goodsReviewDao = GoodsReviewDao.getInstance();
			List<GoodsReviewDto> reviews = goodsReviewDao.getgoodsReviewDtos(goodsNo);
			
		%>  		
			<div class="img mb-3">		
				<img src="../images/<%=goods.getClubNo() %>/<%=goods.getGoodsNo() %>.JPG" alt="<%=goods.getGoodsNo() %>" style="width: 700px; height: 600px; float: left;"/>
			</div>
				<table class="table" style="width: 400px; float: none;">				
					<tbody>
						<tr>
							<th>번호</th>
							<td><%=goods.getGoodsNo()%></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><%=goods.getGoodsName()%></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><%=goods.getGoodsPrice()%> 원</td>
						</tr>
					</tbody>
				</table>
				
				<button type="button" class="btn btn-outline-primary btn-lg" onclick="location.href='../cart/add.jsp?goodsNo=<%=goodsNo%>';">장바구니 담기</button>
				<button class="btn btn-primary btn-lg" type="submit">바로 구매</button>
				
				<div class="accordion mb-3" id="accordionExample">
  						<div class="accordion-item">
    						<h2 class="accordion-header" id="headingOne">
    						<style>
    							#accordion-header{
    							width:600px;
    							margin:auto;
    							}
    							#headingOne{
        						width:fit-content;
        						margin:auto;
    							}
   							</style>
     				 			<button class="accordion-button justify-content-center" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"">
        							상세페이지 펼쳐보기
      				 			</button>
    						</h2>
   		 			<div id="collapseOne" style="text-align:center;" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      					<% 
							for(int i=1; i<=11; i++) {
						%>
					<div class="image-container" style="overflow: hidden; text-align: center; align-items: center;">
						<img src="../images/detail/<%=goods.getClubNo() %>/<%=i%>.JPG">
					</div>
				<% 
					}
				%>
				
				</div>
				
    				</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="card-body">
				<form class="row g-3">
					<div class="col-11">
						<textarea rows="2" class="form-control" placeholder="리뷰를 작성해주세요."></textarea>
					</div>
					<div class="col-1">
						<button type="submit" class="btn btn-outline-secondary w-100 h-100">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col">
		<%
		if (reviews.isEmpty()) {
		%>
			<div class="card mb-2">
				<div class="card-body">
					<p>등록된 리뷰가 없습니다.</p>
				</div>
			</div>
		<%
		} else {
				for (GoodsReviewDto review : reviews) {
		%>
					<div class="card mb-2">
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<h6><%=review.getUserName() %></h6>
								<span><%=review.getReviewCreatedDate() %></span>
							</div>
							<div class="row">
								<div class="col-11">
									<p class="mb-0"><%=review.getReviewCountent() %></p>
								</div>
								<div class="col-1 text-end">
									<a href="../goods/delete.jsp" class="btn btn-outline-secondary btn-sm">X</a>
								</div>
							</div>
						</div>
					</div>
		<%	
				}
			}
		%>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>