<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="css/indexCss.css">
<head>
<meta charset="UTF-8">
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

input[type="submit"] {
	height: 70px;
	background-color: hotpink;
}

#loginForm {
	text-align: center;
	margin: auto;
}

</style>
<title>Media World</title>
<script>
	function validateForm(fm) {
		if (!fm.idInput.value) {
			alert("아이디를 입력하세요.");
			fm.idInput.focus();
			return false;
		}
		if (!fm.pwdInput.value) {
			alert("패스워드를 입력하세요.");
			fm.pwdInput.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp" />
	</header>
	<div class="container-fluid" id="b">
		<div id="loginForm">
			<div>
			<br /> <br /> <br /> <br />
				<h1>로그인</h1>
			</div>
			 <br /> <br /> <br /> <br />
			<div>
				<form method="post" action="" onsubmit="return validateForm(this);">
					<table style="margin-left:auto;margin-right:auto;">
						<tr>
							<td><input type="text" name="idInput" placeholder="아이디를 입력"
								size=15 /><br /> <input type="password" name="pwdInput"
								placeholder="패스워드를 입력" size=15 /></td>
							<td><input type="submit" value="로그인하기" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>