<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <script src="../common/jQuery/jquery-3.6.0.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="css/indexCss.css">
<title>Media World</title>
<style>
body {
	background-color: black;
	color: white;
	height: 100%;
	width: 100%;
}

footer {
	color: white;
}
</style>
<script type="text/javascript">
	let footer = document.getElementsByTagName("footer");
	footer.className = "fixed-bottom";
</script>
</head>
<body>
<!-- <header> -->
<%-- 	<jsp:include page="layout/header.jsp"/> --%>
<!-- </header> -->
<div class="container-fluid" style="text-align: center;">
<br /><br /><br /><br /><br /><br /><br />
<h1>회원가입을 축하합니다. 시작하려면 로그인하기를 눌러주세요.</h1>
<br /><br /><br />
<button type="button" class="btn btn-primary" onclick="location.href='./login.jsp'">로그인하기</button>
</div>
<footer>
	<jsp:include page="layout/footer.jsp"/>
</footer>
</body>
</html>