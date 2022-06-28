<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
nav>a {
	cursor: default;
	pointer-events: none;
}

nav>a>img {
	cursor: pointer;
	pointer-events: auto;
}

nav {
	margin: auto;
}
</style>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark"
	style="boarder: 3px solid white;">
	<a class="navbar-brand" href="./main.jsp"><img src="image/logo.png"
		alt="로고이미지" width=40% /></a>
	<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
		data-bs-target="#mynavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="mynavbar">
		<ul class="navbar-nav me-auto">
			<li class="nav-item"><a class="nav-link" href="#horror">공포</a></li>
			<li class="nav-item"><a class="nav-link" href="#love">멜로</a></li>
			<li class="nav-item"><a class="nav-link" href="#criminal">범죄영화</a></li>
			<li class="nav-item"><a class="nav-link" href="#comedy">코메디</a></li>
			<li class="nav-item"><a class="nav-link" href="#interest">맞춤추천</a></li>
			<li class="nav-item"><a class="nav-link" href="#visitCount">조회수순</a></li>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%
			Object id = session.getAttribute("userID");
			String userID = (String)id;
			if (userID == null) {
			%>
			<li class="nav-item"><a class="nav-link" href="./login.do">로그인</a></li>
			<%
			} else {
			%>
			<li class="nav-item"><a class="nav-link" href="./logout.do">로그아웃</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" role="button"
				data-bs-toggle="dropdown">마이페이지</a>
				<ul class="dropdown-menu">
				<% if(userID.equals("admin")){ %>
					<li><a class="dropdown-item" href="#">관리자 페이지</a></li>
				</ul>
				<%} else{%>
					<li><a class="dropdown-item" href="./memberEdit.jsp">개인정보수정</a></li>
					<li><a class="dropdown-item" href="./delete.jsp">회원탈퇴</a></li>
				</ul>
				<%} %>
			<%
			}
			%>
		</ul>
		<form class="d-flex">
			<input class="form-control me-2" type="text" placeholder="영화명을 검색하세욘">
			<button class="btn btn-primary" type="button">Search</button>
		</form>
	</div>
</nav>




