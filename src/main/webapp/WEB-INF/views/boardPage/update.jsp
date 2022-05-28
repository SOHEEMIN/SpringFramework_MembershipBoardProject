<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-24
  Time: 오전 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>passwordCheck.jsp</h2>
<form action="/board/update" method="post" name="updateForm">
    <input type="text" name="b_id" value="${boardUpdate.b_id}" class="form-control" readonly>
    <input type="text" name="${sessionScope.loginMemberId}" value="${sessionScope.loginMemberId}" class="form-control" readonly>
    <input type="text" name="boardTitle" value="${boardUpdate.boardTitle}" class="form-control">
    <textarea name="boardContents" cols="30" rows="10">${boardUpdate.boardContents}</textarea>
    <input type="button" class="btn btn-danger" onclick="updateForm.submit()" value="수정">
</form>
</body>
</html>
