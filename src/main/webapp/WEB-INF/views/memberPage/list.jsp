<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<h2>list.jsp</h2>
<div class="container">
    <table class="table">
        <tr>
            <th>회원번호</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>이메일</th>
            <th>전화번호</th>
            <th>프로필 사진</th>
        </tr>
        <c:forEach items="${memberList}" var="member">
            <tr>
                <td>${member.m_id}</td>
                <td>${member.memberId}</td>
                <td>${member.memberPassword}</td>
                <td>${member.memberName}</td>
                <td>${member.memberEmail}</td>
                <td>${member.memberMobile}</td>
                <td><img src="${pageContext.request.contextPath}/upload/${member.memberProfileName}" alt="" height="30" width="30"></td>
                <td><a href="/member/delete?m_id=${member.m_id}">삭제</a> </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
