<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>write</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2 class="display-4 fw-normal">save.jsp</h2>
    <div class="py-5 text-center">
        <h2>상세조회</h2><br>
        글번호: ${board.b_id}<br>
        글제목: ${board.boardTitle}<br>
        작성자: ${board.memberId}<br>
        글내용: ${board.boardContents}<br>
        조회수: ${board.boardHits}<br>
        작성일: ${board.boardCreatedDate}<br>
        <img src="${pageContext.request.contextPath}/upload/${board.boardFileName}" alt="" height="100" width="100">
        <button class="btn btn-primary" onclick="paging()">글 목록</button>
        <c:if test = "${sessionScope.loginMemberId eq board.memberId}">
            <button class="btn btn-primary" onclick="boardUpdate()">글 수정</button>
            <button class="btn btn-primary" onclick="boardDelete()">글 삭제</button>
        </c:if>
    </div>
</div>
</body>
<script>
    const paging = () => {
        location.href="/board/paging?page=${page}";
    }
    const boardUpdate = () => {
        location.href="/board/update?b_id=${board.b_id}";
    }
    const boardDelete = () => {
        location.href="/board/passWordCheck?b_id=${board.b_id}";
    }
</script>
</html>
