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
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
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
		if (!fm.userID.value) {
			alert("중복체크 하세요.");
			fm.userID.focus();
			return false;
		}
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

	$('#userID').focusout(function(){
		let userId = $('#userID').val(); //userID에 입력되는 값
		
		$.ajax({
			url : "./idCheck.do",
			type : "post",
			data : {userId: userId},
			dataType : 'json',
			success : function(result){
				if(result == 0){
					$("#checkId").html('사용할 수 없는 아이디입니다.');
					$("#checkId").attr('color','red');
					$("#submit").attr('disabled','true');
				} else{
					$("#checkId").html('사용할 수 있는 아이디입니다.');
					$("#checkId").attr('color','green');
					$("#submit").attr('disabled','false');
				}
			},
			error : function(){
				alert("서버요청실패");
			}
		})
	})

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
				<h1>회원가입</h1>
			</div>
			<br /> <br />
			<div>
				<form method="post" action="./regist.do" onsubmit="return validateForm(this);">
					<table style="margin-left: auto; margin-right: auto; text-align: center;">
						<tr>
							<td style="width: 110px;">아이디</td>
							<td><input class="form-control" type="text" id="userID"
								name="userID" maxlength="20" placeholder="아이디를 입력"/></td>
							<td style="">
								<font id="checkId" size="2"></font>
							</td>
						</tr>
						<tr>
							<td style="width: 110px;">비밀번호</td>
							<td colspan="2"><input class="form-control" type="password"
								id="userPassword1" name="userPassword1" maxlength="20" placeholder="비밀번호 입력"/></td>
						</tr>
						<tr>
							<td style="width: 110px;">비밀번호확인</td>
							<td colspan="2"><input class="form-control" type="password"
								id="userPassword2" name="userPassword2" maxlength="20" placeholder="같은비번 입력"/></td>
						</tr>
						<tr>
							<td style="width: 110px;">이름</td>
							<td colspan="2"><input class="form-control" type="text"
								id="userName" name="userName" maxlength="20" placeholder="실제이름을 입력" /></td>
						</tr>
						<tr>
							<td style="width: 110px;">이메일</td>
							<td colspan="2"><input class="form-control" type="email"
								id="userEmail" name="userEmail" maxlength="30" placeholder="유효한 이메일을 입력"/></td>
						</tr>
						<tr>
							<td style="text-align: right" colspan="3"><input
								class="btn btn-primary float-right" id="submit" type="submit" value="회원가입" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
		<br /><br />
	<footer class="fixed-bottom">
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>

</body>
</html>