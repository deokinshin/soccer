<%@page import="dao.GoodsDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.CartItemDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.CartItemDao"%>
<%@page import="dao.OrderDao"%>
<%@page import="vo.Order"%>
<%@page import="util.StringUtil"%>
<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>장바구니</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
            table {
                border-collapse: collapse;      
                width: 100%;                    
            }
            td, th {
                border: 1px solid #333;     
                padding: 8px;                
                text-align: left;             
            }
            thead th {
            	border: 1px solid #333;                          
                background-color: #333;
                color: #ddd;
            }
            thead tr {
            	border: 1px solid #333;
            	background-color: #333;
                color: #ddd;
            }
            tbody tr:nth-child(even) {
            	border: 1px solid #333;         
                background-color: #ddd;
            }
            tfoot td {
            	border: 1px solid #333;                          
                font-weight: bolder;
            }
            tr {
            	border: 1px solid #333;
            }
</style>
</head>
<body>

<jsp:include page="../common/nav3.jsp">
   <jsp:param name="menu" value="goods"/>
</jsp:include>

<jsp:include page="../common/nav_home.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>

<div class="container">
	<%
		 User user = (User) session.getAttribute("LOGINED_USER");
		 if (user == null) {
			response.sendRedirect("../loginform.jsp?fail=deny");
			return;
		 }
		 
		 int userNo = user.getNo();
		 CartItemDao cartItemDao = CartItemDao.getInstance();
		 List<CartItemDto> cartItemDtos = cartItemDao.getCartItemsByUserNo(userNo);
		 
		 
     %>
     
     <h1>구매하기</h1>
    
        <h3>장바구니</h3>
        <table class="table">
            <thead>
                <tr>
                    <th>상품번호</th>
                    <th>이름</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>구매가격</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <%
            int totalCost = 0;
            DecimalFormat decFormat = new DecimalFormat("###,###");
            	for(CartItemDto cartItemDto : cartItemDtos) {    
            		totalCost += cartItemDto.getGoodsPrice()*cartItemDto.getCartItemQuantity();
            %>
                <tr>
                	<td><%=cartItemDto.getGoodsNo() %></td>
                	<td><%=cartItemDto.getGoodsName() %></td>
                	<td><%=decFormat.format(cartItemDto.getGoodsPrice()) %></td>
                	<td><%=cartItemDto.getCartItemQuantity() %></td>
                	<td><%=decFormat.format(cartItemDto.getGoodsPrice()*cartItemDto.getCartItemQuantity()) %></td>
                	<td>
                		<div style=" text-align: center;">
    					<button type="button" class="btn btn-outline-dark btn-sm" style=" display: inline-block;" onclick="location.href='../goods/delete.jsp?goodsNo=<%=cartItemDto.getGoodsNo()%>';">X</button>
    					</div>
    				</td>
                </tr>
            <%
            	}
            %>  
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5">총구매금액</td>
                    <td><%=decFormat.format(totalCost) %>원</td>
                </tr>
            </tfoot>
        </table>
        
        <!-- Button trigger modal -->
    <div class="d-grid gap-2">
	<button type="button" class="btn btn-dark mb-3" data-bs-toggle="modal" data-bs-target="#exampleModal">
  		구매하기
	</button>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
    	<div class="modal-content">
      	<div class="modal-header">
        	<h5 class="modal-title" id="exampleModalLabel">알림</h5>
        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      	</div>
      	<div class="modal-body">
        	상품을 구매하시겠습니까?
      	</div>
      	<div class="modal-footer">
        	<button type="button" class="btn btn-light" data-bs-dismiss="modal" onclick="location.href='complete1.jsp';">예</button>
        	<button type="button" class="btn btn-dark" onclick="location.href='../goods/goods.jsp';">아니오</button>
      	</div>
    	</div>
  	</div>
	</div>
	</div>
<jsp:include page="../common/footer.jsp">
	<jsp:param name="menu" value="league"/>
</jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js">

</script>
</body>
</html>