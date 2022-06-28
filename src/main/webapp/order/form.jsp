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
<title>Bootstrap demo</title>
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
                background-color: #333;
                color: #333;
            }
            tbody tr:nth-child(even) {         
                background-color: #ddd;
            }
            tfoot td {                          
                font-weight: bolder;
            }
</style>
</head>
<body>
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
                </tr>
            <%
            	}
            %>  
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="4">총구매금액</td>
                    <td><%=decFormat.format(totalCost) %>원</td>
                </tr>
            </tfoot>
        </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js">

</script>
</body>
</html>