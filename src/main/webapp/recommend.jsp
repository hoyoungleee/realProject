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
<div class="container-fluid">
  <h1>회원가입을 진심으로 축하드립니다!</h1>
  <p>시작 전, 관심있는 영화의 카테고리를 알려주세요!</p>
    <form action="/recommend.do">
    <div class="form-check">
      <input type="radio" class="form-check-input" id="radio1" name="interest" value="horror">
      <label class="form-check-label" for="radio1">무서운영화</label>
    </div>
    <div class="form-check">
      <input type="radio" class="form-check-input" id="radio2" name="interest" value="love">
      <label class="form-check-label" for="radio2">멜로영화</label>
    </div>
	<div class="form-check">
      <input type="radio" class="form-check-input" id="radio3" name="interest" value="criminal">
      <label class="form-check-label" for="radio2">범죄영화</label>
    </div>
    <div class="form-check">
      <input type="radio" class="form-check-input" id="radio4" name="interest" value="comedy">
      <label class="form-check-label" for="radio2">웃긴영화</label>
    </div>
    <button type="submit" class="btn btn-primary mt-3">취향기억하기</button>
  </form>
</div>


<footer class="fixed-bottom">
	<jsp:include page="layout/footer.jsp"/>
</footer>
</body>
</html>