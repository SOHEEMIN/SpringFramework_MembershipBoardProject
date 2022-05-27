<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-18
  Time: 오후 5:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        .container {
            max-width: 500px;
        }
    </style>
</head>
<body>
<div class="container">

    <h2 class="display-4">login.jsp</h2>
    <div class="py-5 text-center">
        <form action="/member/login" method="post">
            <input type="text" name="memberId" placeholder="memberId">
            <input type="password" name="memberPassword" placeholder="memberPassword" >
            <input type="submit" value="로그인">

        </form>
    </div>
</div>
</body>
</html>
