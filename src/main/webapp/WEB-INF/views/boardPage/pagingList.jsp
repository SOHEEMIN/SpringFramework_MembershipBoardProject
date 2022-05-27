<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        .container {
            max-width: 1000px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <table class="table">
        <tr>
            <th>글번호</th>
            <th>제 목</th>
            <th>글쓴이</th>
            <th>글내용</th>
            <th>조회수</th>
            <th>작성일</th>
        </tr>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.b_id}</td>
                <td><a href="/board/detail?page=${paging.page}&b_id=${board.b_id}">${board.boardTitle}</a></td>
                <td>${board.memberId}</td>
                <td>${board.boardContents}</td>
                <td>${board.boardHits}</td>
                <td>${board.boardCreatedDate}</td>
                <td><img src="${pageContext.request.contextPath}/upload/${board.boardFileName}" alt="" height="100" width="100"></td>

            </tr>
        </c:forEach>
    </table>
</div>
<div class="container">
    <ul class="pagination justify-content-center">
        <c:choose>
            <c:when test="${paging.page<=1}">
                <li class="page-item disabled">
                    <a class="page-link">[이전]</a>
                </li>
            </c:when>
        <c:otherwise>
            <li class="page-item">
                <a class="page-link" href="/board/paging?page=${paging.page-1}">[이전]</a>
            </li>
        </c:otherwise>
        </c:choose>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <c:when test="${i eq paging.page}">
                    <li class="page-item active">
                        <a class="page-link">${i}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/paging?page=${i}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link">[다음]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/paging?page=${paging.page+1}">[다음]</a>
                </li
            </c:otherwise>
        </c:choose>
    </ul>
    <p2>되는거니</p2>
</div>
</body>
</html>
