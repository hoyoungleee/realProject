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

form>button {
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
				<br /> <br />
				<h1>회원정보수정</h1>
			</div>
			<br /> <br />
			<div>
				<form method="post" action="" onsubmit="return validateForm(this);">
					<table style="margin-left: auto; margin-right: auto; text-align: center;">
						<tr>
							<td style="width: 110px;">이름</td>
							<td colspan="2"><input class="form-control" type="text"
								id="nickName" name="nickName" maxlength="20" /></td>
						</tr>
						<tr>
							<td style="width: 110px;">이름</td>
							<td colspan="2"><input class="form-control" type="text"
								id="userName" name="userName" maxlength="20" /></td>
						</tr>
						<tr>
							<td style="width: 110px;">나이</td>
							<td colspan="2"><input class="form-control" type="text"
								id="userAge" name="userAge" maxlength="20" /></td>
						</tr>
						<tr>
							<td style="width: 110px;">성별</td>
							<td colspan="2">

								<div class="form-group"
									style="text-align: center; margin: 0 auto;">
									<div class="btn-group">
										<label class="btn btn-primary "> <input type="radio"
											name="userGender" autocomplete="off" value="남자" checked />남자
										</label> <label class="btn btn-primary"> <input type="radio"
											name="userGender" autocomplete="off" value="여자" />여자
										</label>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td style="width: 110px;">이메일</td>
							<td colspan="2"><input class="form-control" type="email"
								id="userEmail" name="userEmail" maxlength="20" /></td>
						</tr>
						<tr>
							<td style="text-align: right" colspan="3"><input
								class="btn btn-primary float-right" type="submit" value="회원정보수정" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
		<br /><br />
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>

</body>
</html>