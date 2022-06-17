<%@page import="vo.User"%>
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
<title>Goods</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="book" />
</jsp:include>
<div class="container">
	<div class="row">
		<div class="col">
			<h1 class="fs-4 border p-2">상품 목록</h1>
		</div>
	</div>
	<div class="row">
		<div class="col">
		<%
		// 로그인된 사용자정보 조회
			// 로그인 상태에 따라서 바로구매, 장바구니 버튼을 활성화 비활성화 한다.
			User user = (User) session.getAttribute("LOGINED_USER");
				
			GoodsDao goodsDao = GoodsDao.getInstance();			
			
			int rows = 5;
			
			int pages = 5;
			
			int records = goodsDao.getTotalRowsCount();
			
			int totalPages = (int) (Math.ceil((double) records/rows));		
			
			int totalBlocks = (int) (Math.ceil((double) totalPages/pages));	
			
			int currentPage = Integer.parseInt(request.getParameter("page"));
			
			if (currentPage <= 0 || currentPage > totalPages) {
				response.sendRedirect("list.jsp?page=1");
				return;
			}
			
			int currentBlock = (int) (Math.ceil((double) currentPage/pages));	
			
			int beginPage = (currentBlock - 1)* pages + 1;
			int endPage = (currentBlock == totalBlocks ? totalPages : currentBlock*pages); 			
			
			
			int beginIndex = (currentPage - 1)*rows + 1;
			int endIndex = currentPage*rows;
			
			
			List<Goods> goods = goodsDao.getGoods(beginIndex, endIndex);
		%>
			<p>상품 목록을 확인해보세요.</p>
			<table class="table">
				<colgroup>
					<col width="6%" />
					<col width="*" />
					<col width="12%" />
					<col width="12%" />
					<col width="15%" />
					<col width="15%" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>저자</th>
						<th>출판사</th>
						<th class="text-end pe-3">가격</th>
						<th class="text-center"></th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
				<%
				for (Goods good : goods) {
				%>
					<tr>
						<td><%=good.getGoodsNo() %></td>
						<td><a href="detail.jsp?goodsNo=<%=good.getGoodsNo() %>"><%=good.getGoodsName() %></a></td>
						<td><%=good.getClubNo() %></td>
						<td class="text-end pe-3">
							<small>(<%=good.getGoodsPrice() %> 원)</small></td>
						<td class="text-center">
							<a href="../order/buy.jsp?bookNo=<%=good.getGoodsNo() %>" class="btn btn-sm <%=user == null ? "btn-outline-secondary disabled" : "btn-outline-primary" %>">바로구매</a>
							<a href="../cart/add.jsp?bookNo=<%=good.getGoodsNo() %>" class="btn btn-sm <%=user == null ? "btn-outline-secondary disabled" : "btn-outline-primary" %>">장바구니</a>
						</td>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item">
						<a class="page-link <%=currentPage <= 1 ? "disabled" : "" %>" href="list.jsp?page=<%=currentPage - 1 %>">이전</a>
					</li>
					
				<%
					for (int num = beginPage; num <= endPage; num++) {
				%>
					<li class="page-item <%=currentPage == num ? "active" : "" %>">
						<a class="page-link" href="list.jsp?page=<%=num %>"><%=num %></a>
					</li>
				<%
					}
				%>
				
					<li class="page-item">
						<a class="page-link <%=currentPage >= totalPages ? "disabled" : "" %>" href="list.jsp?page=<%=currentPage + 1 %>">다음</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>