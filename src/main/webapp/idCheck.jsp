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
#checkBtn{
	background-color: hotpink;
	color: white;
}
</style>
<script>
	function idvalidate(fm){
		if(!fm.userID.value){
			alert("아이디를 입력하세요!")
			fm.userID.focus();
			return false;
		}
	}
</script>
</head>
<body>
<br /><br />
<div class="container">
	<div style="text-align: center; margin: auto;">
		<form action="./idCheck.do" method="post" onsubmit="idvalidate(this);">
			<input type="text" name="userID" placeholder="확인할 아이디 입력"/>
			<input type="submit" id="checkBtn" class="btn" value="중복확인버튼">
		</form>	
	</div>
</div>
<br /><br /><br />
<footer>
	<jsp:include page="layout/footer.jsp"/>
</footer>
</body>
</html>