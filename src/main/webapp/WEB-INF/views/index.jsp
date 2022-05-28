<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index.jsp</title>
</head>
<body>
    <h2>index.jsp(목록)</h2>
    <a href="/member/saveFile">회원가입</a><br>
<%--    <a href="/member/findAll">회원목록</a>--%>
    <a href="/member/login">로그인</a>
    <a href="/board/saveFile">글작성</a>
    <a href="/board/paging">글목록</a>
    <a href="/member/logout">로그아웃</a>
    <a href="/member/admin">관리자버전</a>
    로그인 회원 정보: ${loginMember}
    세션에 담은 memberId: ${sessionScope.loginMemberId}
    세션에 담은 m_id:${sessionScope.loginId}
</body>
</html>
