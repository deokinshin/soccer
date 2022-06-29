<%@page import="vo.League"%>
<%@page import="dao.LeagueDao"%>
<%@page import="util.StringUtil"%>
<%@page import="vo.Club"%>
<%@page import="java.util.List"%>
<%@page import="dao.ClubDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="soccer/error/500.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>리그순위</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://webfontworld.github.io/NanumBarunGothic/NanumBarunGothic.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.0/assets/owl.carousel.min.css">
<link href="/soccer/favicon.ico" rel="icon" type="image/x-icon" />
<link href="league.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../common/nav3.jsp">
	<jsp:param name="menu" value="league"/>
</jsp:include>
<jsp:include page="../common/nav_home.jsp">
	<jsp:param name="menu" value="league"/>
</jsp:include>
<div class="container">

      <%
	  
	  		int leagueNo = StringUtil.stringToInt(request.getParameter("leagueNo"));
	  		ClubDao clubDao = ClubDao.getInstance();
	  		List<Club> clubList = clubDao.getLeagueNoClubs(leagueNo);
	  		LeagueDao leagueDao = LeagueDao.getInstance();
	  		League league = leagueDao.getLeagueNoLeague(leagueNo);
	  %> 
	<div class="row p-2"  >
		<figure class="snip1477">
			<img alt="" src="../league/<%=leagueNo %>.jpg" style="height: 500px;  object-fit: contain;">
			<div class="title">
				<div>
					<h2><%=league.getName() %></h2>
					<h4>League</h4>
				</div>
			</div>
			<figcaption>
				<p><%=league.getInformation() %></p>
			</figcaption>
			<a href="#"></a>
		</figure>
	</div>
	<div class="row">
		<form id="search-form" class="row" method="get" action="league1.jsp">
			<div class="col-1">
			<p>리그 선택
			
			</p>
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
			      <td><img src="../club/<%=club.getClubNo() %>.png" width="32" height="32" alt="<%=club.getName() %>">  <a href="club.jsp?clubNo=<%=club.getClubNo() %>"><%=club.getName() %></a></td>
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
<jsp:include page="../common/footer.jsp">
	<jsp:param name="menu" value="league"/>
</jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
function changeLeagueNo() {
	document.querySelector("input[name=leagueNo]").value = document.querySelector("select[name=leagueNo]").value;
	
	document.getElementById("search-form").submit();
}
$(".hover").mouseleave(
		  function () {
		    $(this).removeClass("hover");
		  }
		);
</script>
</body>
</html>