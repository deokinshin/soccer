<%@page import="vo.Player"%>
<%@page import="java.util.List"%>
<%@page import="vo.Pagination"%>
<%@page import="dao.PlayerDao"%>
<%@page import="util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>선수 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;700&display=swap');


*,
*:before,
*:after {
  box-sizing: border-box;
}

body,
h1,
h2,
h3,
h4,
p,
ul,
ol,
li,
figure,
figcaption,
blockquote,
dl,
dd {
  margin: 0;
}

body {
  scroll-behavior: smooth;
  line-height: 1.5;
  background-color: #FFF;
}

img {
  display: block;
  width: 330px;
  height: 330px;
}

a {
  color: inherit;
  font-weight: bold;
}

input,
button,
textarea,
select {
  font: inherit;
}

button {
  border: 1px solid;
  background-color: transparent;
}

// The code

body {
  font-family: "DM Sans", sans-serif;
}

.responsive-container {
  max-width: 1080px;
  width: 90%;
  margin-left: auto;
  margin-right: auto;
}

.link-button {
  display: flex;
  align-items: center;
  background-color: #000;
  border-radius: 0.375rem;
  padding: 0.5em 1.25em;
  color: #fff;
  i {
    font-size: 1.25rem;
    margin-left: 0.5rem;
  }
}

.logo {
  font-size: 1.25rem;
  font-weight: 700;
}

main {
  padding-top: 2rem;
  padding-bottom: 6rem;
}

.grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 2rem;
}

.grid-column {
  display: flex;
  flex-direction: column;
  & > * + * {
    margin-top: 2rem;
  }
}

.player {
  border-radius: 0.25rem;
  text-decoration: none;
  font-weight: 400; 
  transition: .15s ease;
  overflow: hidden;
  &:hover, &:focus {
    outline: none;
    box-shadow: 0 0 0 0.25rem pink;
    .product-content {
      border-color: transparent;
    }
  }
}

.player-image {
  border-radius: 0.25rem 0.25rem 0 0;
  overflow: hidden;
}

.player-content {
  padding: 1rem;
  border-left: 1px solid #dedede;
  border-right: 1px solid #dedede;
  border-bottom: 1px solid #dedede;
  border-radius: 0 0 0.25rem 0.25rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
  transition: .15s ease;
  background-color: #FFF;
}

.player-action {
  color: #000;
  width: 2.5rem;
  height: 2.5rem;
  border-radius: .25rem;
  font-size: 1.25rem;
  border: none;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: .15s ease;
  &:hover {
    background-color: #ebebeb;
  }
}

.player-info {
  display: flex;
  flex-direction: column;
}

.player-name {
  font-size: 1.125rem;
  line-height: 1.25;
}

.player-club {
  margin-top: .25rem;
}

.credits {
  display: flex;
  flex-direction: column;
  justify-content: center;
  text-align: center;
  margin-top: 10rem;
  color: #777;
  font-size: .875rem;
  a {
    display: block;
  }
}

@media all and (max-width: 600px) {
  .grid {
    display: grid;
    grid-template-columns: repeat(1, 1fr);
    gap: 1.5rem;
  }

  .grid-column {
    & > * + * {
      margin-top: 1.5rem;
    }
  }
}
</style>
</head>
<body>
<%
	int currentPage = StringUtil.stringToInt(request.getParameter("page"), 1); // 없으면 1
	int rows = StringUtil.stringToInt(request.getParameter("rows"), 9); // 없으면 9
	
	PlayerDao playerDao = PlayerDao.getInstance();
	
	int totalRows = playerDao.getTotalRows();

	
	Pagination pagination = new Pagination(rows, totalRows, currentPage);
	List<Player> playerList = playerDao.getPlayers(pagination.getBeginIndex(), pagination.getEndIndex());
	
	
%>
<div class="responsive-container">
	<div class="grid mb-3">
	<%
		for (Player player : playerList) {
	%>
		<div class="grid-column">
			<a class="player" href="player.jsp?playerNo=<%=player.getPlayerNo() %>">
				<div class="player-image">
					<img src="../player/<%=player.getFileName() %>" />
				</div>
				<div class="player-content">
					<div class="player-info">
						<h2 class="player-name"><%=player.getName() %></h2>
						<p class="player-club"><%=player.getClub().getName() %></p>
					</div>
						<p><%=player.getPosition() %></p>
				</div>
			</a>
		</div>
	<%
		}	
	%>
	</div>
	<div class="row justify-content-center p-3">
			<div class="col-2">
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
					<form id="player-form" class="row g-3" method="get" action="list.jsp">
						<input type="hidden" name="page" />
					</form>
				</div>
			</div>
	</div>
</div>
 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

	function clickPageNo(pageNo) {
		document.querySelector("input[name=page]").value = pageNo;
		document.getElementById("player-form").submit();
	}

</script>
</body>
</html>