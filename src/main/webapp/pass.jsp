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
</head>
<body>
<header>
	<jsp:include page="layout/header.jsp"/>
</header>
<div class="container-fluid" style="text-align: center;">
<h1>회원자격검증</h1>
<form action="./pass.do" onsubmit="return validate(this);">
	<input type="password" placeholder="기존 비밀번호를 입력하세요">
	<input type="submit" name="pass" id="pass" />
</form>
</div>
<footer>
	<jsp:include page="layout/footer.jsp"/>
</footer>
</body>
</html>