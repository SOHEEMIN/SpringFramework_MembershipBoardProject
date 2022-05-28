
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="container">
    <h2 class="display-4 fw-normal">saveFile.jsp</h2>
    <div class="py-5 text-center">
        <form action="/board/saveFile" method="post" enctype="multipart/form-data">
            <input class="form-control mb-2" type="text" name="boardMemberId" value="${sessionScope.loginMemberId}" readonly>
            <input class="form-control mb-2" type="text" name="boardTitle" placeholder="제목">
            <textarea class="form-control mb-2" name="boardContents" rows="5" cols="10"></textarea>
            첨부파일: <input type="file" name="boardFile">
            <input class="btn btn-primary" type="submit" value="글작성">
        </form>

    </div>
</div>
</body>
</html>
