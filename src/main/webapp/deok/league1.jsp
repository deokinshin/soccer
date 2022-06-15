<%@page import="util.StringUtil"%>
<%@page import="vo.Club"%>
<%@page import="java.util.List"%>
<%@page import="dao.ClubDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>리그순위</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://webfontworld.github.io/NanumBarunGothic/NanumBarunGothic.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.0/assets/owl.carousel.min.css">
<style type="text/css">
	body {
  color: #666;
  font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
}
table {
  border-collapse: separate;
  border-spacing: 0;
  width: 100%;
}
th,
td {
  padding: 6px 15px;
  text-align: center;
  
}
th {
  background: #42444e;
  color: #111;
  text-align: center;
}
tr:first-child th:first-child {
  border-top-left-radius: 6px;
}
tr:first-child th:last-child {
  border-top-right-radius: 6px;
}
td {
  border-right: 1px solid #c6c9cc;
  border-bottom: 1px solid #c6c9cc;
}
td:first-child {
  border-left: 1px solid #c6c9cc;
}
tr:nth-child(even) td {
  background: #eaeaed;
}
tr:last-child td:first-child {
  border-bottom-left-radius: 6px;
}
tr:last-child td:last-child {
  border-bottom-right-radius: 6px;
}

	
</style>
</head>
<body>
<jsp:include page="../common/nav3.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>
<jsp:include page="../common/nav_home.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>
<div class="container">

      <%
	  
	  		int leagueNo = StringUtil.stringToInt(request.getParameter("leagueNo"));
	  		ClubDao clubDao = ClubDao.getInstance();
	  		List<Club> clubList = clubDao.getLeagueNoClubs(leagueNo);
	  %> 
	<div class="row p-2"  >
		<img alt="" src="../league/<%=leagueNo %>.jpg" style="height: 500px;  object-fit: contain;">
	</div>
	<div class="row">
		<form id="search-form" class="row" method="get" action="league1.jsp">
			<div class="col-1">
			<p>리그 선택</p>
			</div>
			<select class="form-control form-control-sm w-25 float-end" name="leagueNo" onchange="changeLeagueNo()">
				<option value="1" <%=leagueNo == 1 ? "selected" : "" %>> 프리미어리그</option>
				<option value="2" <%=leagueNo == 2 ? "selected" : "" %>> 프리메라리그</option>
				<option value="3" <%=leagueNo == 3 ? "selected" : "" %>> 세리에A</option>
				<option value="4" <%=leagueNo == 4 ? "selected" : "" %>> 분데스리가</option>
				
			</select>
			<input type="hidden" name="leagueNo"/>
		</form>
	
	</div>
  <div class="table-responsive">
    <table class="table">
      <thead>
        <tr>
          	<th scope="col">순위</th>
		    <th scope="col">구단이름</th>
		    <th scope="col">창단일</th>
		    <th scope="col">연고지</th>
		    <th scope="col">홈구장</th>
		    <th scope="col">감독</th>
		    <th scope="col">승</th>
		    <th scope="col">무</th>
		    <th scope="col">패</th>
			<th scope="col">승점</th>
        </tr>
      </thead>
      <tbody>
	  <%	
	  		for (Club club : clubList) {
	  			
	  %>
		    <tr>
			      <th scope="row"><%=club.getRank() %></th>
			      <td><img src="../club/<%=club.getClubNo() %>.png" width="32" height="32" alt="맨시티">  <a href="club.jsp?clubNo=<%=club.getClubNo() %>"><%=club.getName() %></a></td>
			      <td><%=club.getFoundingDate() %></td>
			      <td><%=club.getOintment() %></td>
			      <td><%=club.getClubHome() %></td>
			      <td><%=club.getClubCoach() %></td>
			      <td><%=club.getWin() %></td>
			      <td><%=club.getDraw() %></td>
			      <td><%=club.getDefeat() %></td>
			      <td><%=club.getPoint() %></td>
		    </tr>
		<%
	  		}
		%> 
      </tbody>
    </table>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
function changeLeagueNo() {
	document.querySelector("input[name=leagueNo]").value = document.querySelector("select[name=leagueNo]").value;
	
	document.getElementById("search-form").submit();
}
</script>
</body>
</html>