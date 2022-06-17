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
<title>GOODS STORE</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="goods" />
</jsp:include>
<div class="container">
	<div class="row">
		<div class="col">
			<h1 class="fs-4 border p-2">GOODS</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
		<%
			int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
			
			GoodsDao goodsDao = GoodsDao.getInstance();
			Goods good = goodsDao.getGoodsByNo(goodsNo);
			
			GoodsReviewDao goodsReviewDao = GoodsReviewDao.getInstance();
			List<GoodsReviewDto> reviews = goodsReviewDao.getgoodsReviewDtos(goodsNo);
		%>
			<p>상품 상세정보를 확인하세요.</p>
			<table class="table">
				<colgroup>
					<col style="width: 10%;">
					<col style="width: 40%;">
					<col style="width: 10%;">
					<col style="width: 40%;">
				</colgroup>
				<tbody>
					<tr>
						<th>번호</th>
						<td><%=good.getGoodsNo()%></td>
						<th>이름</th>
						<td><%=good.getGoodsName()%></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><%=good.getGoodsPrice()%> 원</td>
					</tr>
				</tbody>
			</table>
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
									<a href="../review/delete.jsp" class="btn btn-outline-secondary btn-sm">X</a>
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