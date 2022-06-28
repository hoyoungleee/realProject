<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="../common/jQuery/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
	function validateForm(fm) {

		if (!fm.userPassword1.value) {
			alert("비밀번호를 입력하세요.");
			fm.userPassword1.focus();
			return false;
		}
		if (!fm.userPassword2.value) {
			alert("확인용 비밀번호를 입력하세요.");
			fm.userPassword1.focus();
			return false;
		}
		if (fm.userPassword1.value != fm.userPassword2.value) {
			alert("패스워드와 확인용 패스워드가 동일하지않습니다.");
			fm.userPassword1.focus();
			return false;
		}

		if (!fm.userName.value) {
			alert("이름을 입력하세요.");
			fm.userName.focus();
			return false;
		}
		if (!fm.userEmail.value) {
			alert("이메일을 입력하세요.");
			fm.userEmail.focus();
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
				<form method="post" action="./memberEdit.do"
					onsubmit="return validateForm(this);">
					<table
						style="margin-left: auto; margin-right: auto; text-align: center;">
						<tr>
							<td style="width: 110px;">비밀번호변경</td>
							<td colspan="2"><input class="form-control" type="password"
								id="userPassword1" name="userPassword1" maxlength="20"
								placeholder="비밀번호 입력" /></td>
						</tr>
						<tr>
							<td style="width: 110px;">비밀번호확인</td>
							<td colspan="2"><input class="form-control" type="password"
								id="userPassword2" name="userPassword2" maxlength="20"
								placeholder="같은비번 입력" /></td>
						</tr>
						<tr>
							<td style="width: 110px;">이름</td>
							<td colspan="2"><input class="form-control" type="text"
								id="userName" name="userName" maxlength="20"
								placeholder="실제이름을 입력" /></td>
						</tr>
						<tr>
							<td style="width: 110px;">이메일</td>
							<td colspan="2"><input class="form-control" type="email"
								id="userEmail" name="userEmail" maxlength="30"
								placeholder="유효한 이메일을 입력" /></td>
						</tr>
						<tr>
							<td style="width: 110px;">추천카테고리</td>
							<td colspan="2">
								<div class="form-check">
									<input type="radio" class="form-check-input" id="radio1"
										name="interest" value="horror"> <label
										class="form-check-label" for="radio1">무서운영화</label>
								</div>
								<div class="form-check">
									<input type="radio" class="form-check-input" id="radio2"
										name="interest" value="love"> <label
										class="form-check-label" for="radio2">멜로영화</label>
								</div>
								<div class="form-check">
									<input type="radio" class="form-check-input" id="radio3"
										name="interest" value="criminal"> <label
										class="form-check-label" for="radio3">범죄영화</label>
								</div>
								<div class="form-check">
									<input type="radio" class="form-check-input" id="radio4"
										name="interest" value="comedy"> <label
										class="form-check-label" for="radio4">웃긴영화</label>
								</div>
							</td>
						</tr>
						<tr>
							<td style="text-align: right" colspan="3"><input
								class="btn btn-primary float-right" id="submit" type="submit"
								value="정보수정" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>

	<footer>
		<jsp:include page="layout/footer.jsp" />
	</footer>
</body>
</html>