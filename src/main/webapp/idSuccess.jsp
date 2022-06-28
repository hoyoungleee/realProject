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
	t
}

footer {
	color: white;
}
</style>
<script>
	function windowClose(){
		close();
	}
</script>
</head>
<body>
<div class="container-fluid" style="text-align: center;">
<h3>사용할 수 있는 아이디 입니다.</h3> <h3>그대로 회원가입을 진행해주세요.</h3>
<button type="button" class="btn btn-primary" onclick="windowClose();">닫기</button>
</div>

<footer>
	<jsp:include page="layout/footer.jsp"/>
</footer>
</body>
</html>