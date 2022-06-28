<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="css/indexCss.css">
<style type="text/css">
body {
	background-color: black;
	color: white;
	height: 100%;
	width: 100%;
}

table {
	background-color: white;
}

footer {
	color: white;
}
</style>
<title>Media World-admin</title>
</head>
<body>
	<div class="container-fluid">
		<header>
			<jsp:include page="../layout/adminheader.jsp" />
		</header>
		<div>
			<h1>어드민 페이지</h1>
		</div>
		<div style="text-align: center;">
				<div class="row">
					<div class="col-9 pt-3">
						<h3>작성된 댓글 관리</h3>
						<!-- 검색 -->
						<div class="row">
							<form method="get">
								<div class="input-group ms-auto" style="width: 400px;">
									<select name="searchField" class="form-control">
										<option value="rownum">글번호</option>
										<option value="content">내용</option>
										<option value="name">작성자</option>
									</select> <input type="text" name="searchWord" class="form-control"
										placeholder="Search" style="width: 200px;">
									<button class="btn btn-success" type="submit">검색</button>
								</div>
							</form>
						</div>
						<!-- 게시판 리스트 -->
						<div class="row mt-3 mx-1">
							<table class="table table-bordered table-hover table-striped">
								<thead>
									<tr class="text-center">
										<th>번호</th>
										<th>작성자</th>
										<th>작성내용</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty boardLists }">
											<!-- 리스트에 저장된 게시물이 없을 때 출력부분 -->
											<tr>
												<td colspan="6" align="center">등록된 게시물이 없습니다^^*</td>
											</tr>
										</c:when>
										<c:otherwise>
											<!-- 출력할 게시물이 있는경우 실행. 리스트 컬렉션에 저장된 게시물의
		갯수만큼 반복하여 목록을 출력함. -->
											<c:forEach items='${boardLists }' var="row" varStatus="loop">
												<tr align="center">
													<td>
														<!-- 
            	가상번호 계산하기
            	=> 게시물갯수 - (((페이지번호-1) * 페이지당 게시물수) + 해당루프의 index)
            	참고로 varStatus속성의 index는 0부터 시작한다.
            		
            		전체게시물의 갯수가 5개일때
            		1페이지: 5-(((1-1) * 2) + 0) = 5
            		2페이지: 5-(((2-1) * 2) + 0) = 3
            	 --> ${map.totalCount -(((map.pageNum-1) * map.pageSize) + loop.index) }
													</td>
													<td>${row.name }</td>
													<td>${row.content }</td>
													<td>${row.postdate }</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
							</table>
						</div>
						<!-- 각종버튼 -->
						<div class="row">
							<div class="col d-flex justify-content-end">
								<button type="button" class="btn btn-primary"
									onclick="location.href='../BoardSkin/writeT.do';">삭제하기</button>
							</div>
						</div>
						<!-- 페이지 번호 -->
						<div class="row mt-3">
							<div class="col">${map.pagingImg }</div>
						</div>
					</div>
				</div>
		</div>
	</div>
	<footer>
		<jsp:include page="../layout/footer.jsp" />
	</footer>
</body>
</html>