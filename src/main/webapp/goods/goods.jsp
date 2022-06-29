<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.Pagination"%>
<%@page import="util.StringUtil"%>
<%@page import="java.util.List"%>
<%@page import="vo.Goods"%>
<%@page import="dao.GoodsDao"%>
<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GOODS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../common/nav3.jsp">
   <jsp:param name="menu" value="goods"/>
</jsp:include>

<jsp:include page="../common/nav_home.jsp">
	<jsp:param name="menu" value="goods"/>
</jsp:include>
<div class="container">
<div id="carouselExampleCaptions" class="carousel slide mb-3" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="../images/slide/real.jpg" class="d-block w-100" height="500" alt="real">
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <div class="carousel-item">
      <img src="../images/slide/ramos.jpg" class="d-block w-100" height="500" alt="ramos">
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <div class="carousel-item">
      <img src="../images/slide/chelsea.jpg" class="d-block w-100" height="500" alt="chelsea">
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
</div>
<div class="container" style="min-width: 800px; max-width: 800px;">
	<div class="row ">
		
		<%
		 User user = (User) session.getAttribute("LOGINED_USER");
		
         
         int currentPage = StringUtil.stringToInt(request.getParameter("page"),1);
         int rows = 8;
         
         GoodsDao goodsDao = GoodsDao.getInstance();
         
         int totalrows = goodsDao.getTotalRowsCount();
         
         Pagination pagination = new Pagination(rows, totalrows, currentPage);
			
         List<Goods> goodsList = goodsDao.getGoods(pagination.getBeginIndex(), pagination.getEndIndex());
         

         DecimalFormat decFormat = new DecimalFormat("###,###");
         
         for (Goods goods : goodsList) {
          	 

      %>
   
   
      <div class="col-3 mb-3">
      
      	<a href="detail.jsp?goodsNo=<%=goods.getGoodsNo() %>" class="text-decoration-none text-dark">
	         <div class="card">
	            <img src="../images/<%=goods.getClubNo() %>/<%=goods.getGoodsNo() %>.JPG" class="card-img-top" style=" cursor: pointer;" onclick="location.href='detail.jsp';"/>
	            <div class="card-body">
	               <p class="card-text"><small><strong>soccer.com</strong></small></p>
	               <p class="card-text"><small><%=goods.getGoodsName() %></small></p>
	               <p class="card-text"><strong><%=decFormat.format(goods.getGoodsPrice()) %> </strong>원</p>
	               <h5 class="card-title"><small>membership price</small></h5>
	            </div>
	         </div>
         </a>
      </div>
      <%
         }
      %>
      
      
		
	</div>
	<div class="row">
      <div class="col-4"></div>
      <div class="col-4">
         <nav>
            <ul class="pagination">
               <li class="page-item">
                  <a class="page-link <%=pagination.getCurrentPage() == 1 ? "disabled" : "" %>" href="javascript:clickPageNo(<%=pagination.getCurrentPage() - 1 %>)">이전</a>
               </li>
         <%
            for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
         %>
               <li class="page-item">
                  <a class="page-link <%=pagination.getCurrentPage() == num ? "active" : "" %>" href="javascript:clickPageNo(<%=num %>)"><%=num %></a>
               </li>
         <%
            }
         %>
               <li class="page-item">
                  <a class="page-link <%=pagination.getCurrentPage() == pagination.getTotalPages() ? "disabled" : "" %>" href="javascript:clickPageNo(<%=pagination.getCurrentPage() + 1 %>)">다음</a>
               </li>
            </ul>
         </nav>
         <div class="col-4">
            <form id="goods" class="row g-3" method="get" action="goods.jsp">
               <input type="hidden" name="page" />
               
            </form>
         </div>
      </div>
      <div class="col-4">
      </div>
   </div>
	
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

   function clickPageNo(pageNo) {
      document.querySelector("input[name=page]").value = pageNo;
      document.getElementById("goods").submit();
   }

</script>
</body>
</html>