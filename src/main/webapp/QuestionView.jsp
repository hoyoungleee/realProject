<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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
div{
	text-align: center;
}
table{
	border: white;
}
footer {
	color: white;
}
</style>
<meta charset="UTF-8">
<title>건의 게시판</title>
</head>
<body>
<h2>건의 게시판 - 상세 보기(View)</h2>

<table border="1" width="90%">
    <colgroup>
        <col width="15%"/> <col width="35%"/>
        <col width="15%"/> <col width="*"/>
    </colgroup> 
    <tr>
        <td>번호</td> <td>${ dto.idx}</td>
        <td>작성자ID</td> <td>${dto.userID }</td>
    </tr>
    <tr>
        <td>작성일</td> <td>${ dto.postdate}</td>
        <td></td> <td></td>
    </tr>
    <tr>
        <td>제목</td>
        <td colspan="3">${dto.title }</td>
    </tr>
    <tr>
        <td>내용</td>
        <td colspan="3" height="100">${ dto.content}</td>
    </tr> 
    <tr>
        <td>첨부파일</td>
        <!-- 
        첨부된 파일이 있는 경우에는 파일명과 다운로드 링크를 출력한다.
        다운로드가 완료되면 카운트 하기위해 idx(일련번호)를 파라미터로 받는다.
         -->
        <td>            
			<c:if test="${ not empty dto.ofile}">
			${ dto.ofile}
			<a href="./download.do?ofile=${ dto.ofile}&sfile=${ dto.sfile}&idx=${ dto.idx}">
				[다운로드]
			</a>
			</c:if>

        </td>
         <td></td>
        <td></td>
    </tr> 
    <tr>
        <td colspan="4" align="center">
            
            <button type="button" class="btn btn-primary" onclick="location.href='./QuestionList.do';">
                목록 바로가기
            </button>
        </td>
    </tr>
</table>
</body>
</html>
