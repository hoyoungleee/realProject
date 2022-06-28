<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Media World</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="css/indexCss.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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
	background-color: black;
}

#topButton {
	position: fixed;
	bottom: 30px;
	right: 30px;
	z-index: 999;
	outline: none;
	color: #333;
	cursor: pointer;
	padding: 15px 20px;
	border-radius: 100px;
}

#myModal {
	color: black;
}
</style>

</head>
<body>
	<div class="container-fluid">
		<!-- Header-->
		<header id="header" class="bg-dark py-5">
			<jsp:include page="layout/header.jsp" />

			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">한 영화 다양한 관점</h1>
				<p class="lead fw-normal text-white-50 mb-0">영화광들아 모여라. 니생각 내생각
					나눠보자!</p>
			</div>
		</header>
		<section>
			<div id="interest">
				<h2>당신의 관심에 딱 맞춘 영화</h2>
			</div>
			<div class="card" style="width: 200px">
				<img class="card-img-top" src="./image/클레멘타인.jpeg" alt="영화썸네일">
				<div class="card-body">
					<h4 class="card-title" style="color: black;">클래멘타인</h4>
					<p class="card-text" style="color: black;">5천만 국민의 관심을 받은 영화</p>
					<div style="text-align: right">
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#myModal">상세보기</button>
					</div>
				</div>
			</div>
	</div>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->

				<div class="row">
					<div class="col-1"></div>
					<div class="col-11">
						<h4 class="modal-title">클레멘타인</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-1">
					</div>
					<div class="col-4">
						<img alt="영화포스터" src="./image/클레멘타인.jpeg"
							style="max-width: 200px;">
					</div>
					<div class="col-1"></div>
					<div class="col-5">처참한 완성도와 무리한 마케팅 덕분에 컬트적인 인기가 있다. 최야성 제작,
						김두영 감독의 전작 주글래 살래처럼 필름의 질이나 촬영 기술부터가 수준이 떨어져서, 대부분의 장면은 기껏해야 일일
						드라마 수준의 영상을 보여줄 뿐이다. 캐릭터, 개연성, 연출, 전개, 설정까지 하나도 빠지지 않고 처참한 완성도를
						자랑한다.</div>
					<div class="col-1"></div>
				</div>
				<hr />
				<% Object id = session.getAttribute("userID");
				String userID = (String)id;
				if (userID != null) { %>
				<!-- Modal body -->
				<div class="modal-body">
					<div class="row">
						<form id="wrtFrm" >
							작성할 내용(최대 40자까지 가능): &nbsp; <input type="text" name="comment"
								id="comment" maxlength="40" size="40" /> 
							<div class="form-check">
								<input type="radio" class="form-check-input" id="radio1"
									name="score" value="1.0"> <label
									class="form-check-label" for="radio1">평점 1</label>
							</div>
							<div class="form-check">
								<input type="radio" class="form-check-input" id="radio2"
									name="score" value="2.0"> <label
									class="form-check-label" for="radio2">평점 2</label>
							</div>
							<div class="form-check">
								<input type="radio" class="form-check-input" id="radio3"
									name="score" value="3.0"> <label
									class="form-check-label" for="radio3">평점 3</label>
							</div>
							<div class="form-check">
								<input type="radio" class="form-check-input" id="radio4"
									name="score" value="4.0"> <label
									class="form-check-label" for="radio4">평점 4</label>
							</div>
							<div class="form-check">
								<input type="radio" class="form-check-input" id="radio5"
									name="score" value="5.0"> <label
									class="form-check-label" for="radio5">평점 5</label>
							</div>
							<input id="formbutton" type = "button" onclick = "return writeComment();" value = "후기작성" />
						</form>
					</div>
					<div >
					<%@ include file="./board/list.jsp"%>
					</div>
				</div>
				<%} %>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>

	<div id="visitCount">
		<h2>다른사람들이 주목하는 핫한 영화</h2>
	</div>
	</div>
	<div class="card" style="width: 200px">
		<img class="card-img-top" src="./image/클레멘타인.jpeg" alt="영화썸네일">
		<div class="card-body">
			<h4 class="card-title" style="color: black;">클래멘타인</h4>
			<p class="card-text" style="color: black;">5천만 국민이 주목하는 영화</p>
			<div style="text-align: right">
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#myModal">상세보기</button>
			</div>
		</div>
	</div>
	</div>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->

				<div class="row">
					<div class="col-12">
						<h4 class="modal-title">클레멘타인</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<img alt="영화포스터" src="./image/클레멘타인.jpeg"
							style="max-width: 200px;">
					</div>
					<div class="col-2"></div>
					<div class="col-6">처참한 완성도와 무리한 마케팅 덕분에 컬트적인 인기가 있다. 최야성 제작,
						김두영 감독의 전작 주글래 살래처럼 필름의 질이나 촬영 기술부터가 수준이 떨어져서, 대부분의 장면은 기껏해야 일일
						드라마 수준의 영상을 보여줄 뿐이다. 캐릭터, 개연성, 연출, 전개, 설정까지 하나도 빠지지 않고 처참한 완성도를
						자랑한다.</div>
				</div>
				<hr />

				<!-- Modal body -->
				<div class="modal-body">
					<div>
						<input type="text" name="comment" id="comment" />
					</div>
					<%@ include file="./board/list.jsp"%>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>


	<div id="horror">
		<h2>무서운 영화</h2>
	</div>
	</div>
	<div class="card" style="width: 200px">
		<img class="card-img-top" src="./image/클레멘타인.jpeg" alt="영화썸네일">
		<div class="card-body">
			<h4 class="card-title" style="color: black;">클래멘타인</h4>
			<p class="card-text" style="color: black;">5천만 국민을 공포에 떨게한 영화</p>
			<div style="text-align: right">
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#myModal">상세보기</button>
			</div>
		</div>
	</div>
	</div>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->

				<div class="row">
					<div class="col-12">
						<h4 class="modal-title">클레멘타인</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<img alt="영화포스터" src="./image/클레멘타인.jpeg"
							style="max-width: 200px;">
					</div>
					<div class="col-2"></div>
					<div class="col-6">처참한 완성도와 무리한 마케팅 덕분에 컬트적인 인기가 있다. 최야성 제작,
						김두영 감독의 전작 주글래 살래처럼 필름의 질이나 촬영 기술부터가 수준이 떨어져서, 대부분의 장면은 기껏해야 일일
						드라마 수준의 영상을 보여줄 뿐이다. 캐릭터, 개연성, 연출, 전개, 설정까지 하나도 빠지지 않고 처참한 완성도를
						자랑한다.</div>
				</div>
				<hr />

				<!-- Modal body -->
				<div class="modal-body">
					<div>
						<input type="text" name="comment" id="comment" />
					</div>
					<%@ include file="./board/list.jsp"%>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>

	<div id="love">
		<h2>사랑 영화</h2>
	</div>
	</div>
	<div class="card" style="width: 200px">
		<img class="card-img-top" src="./image/클레멘타인.jpeg" alt="영화썸네일">
		<div class="card-body">
			<h4 class="card-title" style="color: black;">클래멘타인</h4>
			<p class="card-text" style="color: black;">5천만 국민이 사랑한 영화</p>
			<div style="text-align: right">
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#myModal">상세보기</button>
			</div>
		</div>
	</div>
	</div>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->

				<div class="row">
					<div class="col-12">
						<h4 class="modal-title">클레멘타인</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<img alt="영화포스터" src="./image/클레멘타인.jpeg"
							style="max-width: 200px;">
					</div>
					<div class="col-2"></div>
					<div class="col-6">처참한 완성도와 무리한 마케팅 덕분에 컬트적인 인기가 있다. 최야성 제작,
						김두영 감독의 전작 주글래 살래처럼 필름의 질이나 촬영 기술부터가 수준이 떨어져서, 대부분의 장면은 기껏해야 일일
						드라마 수준의 영상을 보여줄 뿐이다. 캐릭터, 개연성, 연출, 전개, 설정까지 하나도 빠지지 않고 처참한 완성도를
						자랑한다.</div>
				</div>
				<hr />

				<!-- Modal body -->
				<div class="modal-body">
					<div>
						<input type="text" name="comment" id="comment" />
					</div>
					<%@ include file="./board/list.jsp"%>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>

	<div id="criminal">
		<h2>범죄 영화</h2>
	</div>
	</div>
	<div class="card" style="width: 200px">
		<img class="card-img-top" src="./image/클레멘타인.jpeg" alt="영화썸네일">
		<div class="card-body">
			<h4 class="card-title" style="color: black;">클래멘타인</h4>
			<p class="card-text" style="color: black;">5천만 국민의 마음을 훔쳐간 영화</p>
			<div style="text-align: right">
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#myModal">상세보기</button>
			</div>
		</div>
	</div>
	</div>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->

				<div class="row">
					<div class="col-12">
						<h4 class="modal-title">클레멘타인</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<img alt="영화포스터" src="./image/클레멘타인.jpeg"
							style="max-width: 200px;">
					</div>
					<div class="col-2"></div>
					<div class="col-6">처참한 완성도와 무리한 마케팅 덕분에 컬트적인 인기가 있다. 최야성 제작,
						김두영 감독의 전작 주글래 살래처럼 필름의 질이나 촬영 기술부터가 수준이 떨어져서, 대부분의 장면은 기껏해야 일일
						드라마 수준의 영상을 보여줄 뿐이다. 캐릭터, 개연성, 연출, 전개, 설정까지 하나도 빠지지 않고 처참한 완성도를
						자랑한다.</div>
				</div>
				<hr />

				<!-- Modal body -->
				<div class="modal-body">
					<div>
						<input type="text" name="comment" id="comment" />
					</div>
					<%@ include file="./board/list.jsp"%>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>

	<div id="comedy">
		<h2>웃긴 영화</h2>
	</div>
	</div>
	<div class="card" style="width: 200px">
		<img class="card-img-top" src="./image/클레멘타인.jpeg" alt="영화썸네일">
		<div class="card-body">
			<h4 class="card-title" style="color: black;">클래멘타인</h4>
			<p class="card-text" style="color: black;">5천만 국민을 웃긴 영화</p>
			<div style="text-align: right">
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#myModal">상세보기</button>
			</div>
		</div>
	</div>
	</div>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->

				<div class="row">
					<div class="col-12">
						<h4 class="modal-title">클레멘타인</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<img alt="영화포스터" src="./image/클레멘타인.jpeg"
							style="max-width: 200px;">
					</div>
					<div class="col-2"></div>
					<div class="col-6">처참한 완성도와 무리한 마케팅 덕분에 컬트적인 인기가 있다. 최야성 제작,
						김두영 감독의 전작 주글래 살래처럼 필름의 질이나 촬영 기술부터가 수준이 떨어져서, 대부분의 장면은 기껏해야 일일
						드라마 수준의 영상을 보여줄 뿐이다. 캐릭터, 개연성, 연출, 전개, 설정까지 하나도 빠지지 않고 처참한 완성도를
						자랑한다.</div>
				</div>
				<hr />

				<!-- Modal body -->
				<div class="modal-body">
					<div>
						<form action="" onsubmit="return validate(this);">
							<input type="text" name="comment" id="comment1" /> <input
								type="text" name="comment" id="comment2" /> <input type="text"
								name="comment" id="comment3" />

						</form>
					</div>
					<%@ include file="./board/list.jsp"%>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
	<a href="#header"><button class="btn btn-primary" type="button" id="topButton" style="color:white;">맨위로가기</button></a>
	</section>
	<br />
	<br />
	<br />
	<br />
	<!-- Footer-->
	<footer>
		<jsp:include page="layout/footer.jsp" />
	</footer>
	<script>
function writeComment(){
	
	var fm = document.getElementById('wrtFrm');
		if(fm.comment.value == ""){
			alert("댓글내용을 입력하세요");
			fm.comment.focus();
			return false;
		}
		if(fm.score.value == ""){
			alert("내용을 입력하세요");
			fm.score.focus();
			return false;
		}
	var queryString = $('#wrtFrm').serialize();
	$.ajax({
	    url: './commentWrite.do',
	    type: 'post',
	    data: {"폼 데이터 변수 이름": queryString},
	    success: function (data) {
		    	const reFresh = document.getElementByID("formbutton");
		    	reFresh.addEventListener("click", function() {

					
		    	});
	        }
	});

}
</script>
	
</body>
</html>
