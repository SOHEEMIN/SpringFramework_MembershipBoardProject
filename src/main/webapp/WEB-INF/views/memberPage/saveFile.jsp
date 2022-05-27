<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2 class="display-4 fw-normal">save.jsp</h2>
    <div class="py-5 text-center">
        <form action="/member/saveFile" method="post" enctype="multipart/form-data">
            <p>아이디</p>
            <input type="text" name="memberId" placeholder="아이디" onblur="duplicateCheck()" id="memberId">
            <div id="dup-check-result"></div>
            <p>비밀번호</p>
            <input type="text" name="memberPassword" placeholder="비밀번호" onblur="pwCheck()" id="memberPassword">
            <div id="password-check-result"></div>
            <p>이름</p>
            <input type="text" name="memberName" placeholder="이름">
            <p>이메일</p>
            <input type="text" name="memberEmail" placeholder="이메일">
            <p>전화번호</p>
            <input type="text" name="memberMobile" placeholder="전화번호" onblur="mbCheck()" id="memberMobile">
            <div id="mobile-check-result"></div>
            <p>프로필사진</p>
            <input type="file" name="memberProfile">
            <input class="btn btn-primary" type="submit" value="회원가입">

        </form>
    </div>
</div>
</body>
<script>
    function duplicateCheck() {
        const memberId = document.getElementById("memberId").value;
        const checkResult = document.getElementById("dup-check-result");
        const exp = /^(?=.*[a-z])(?=.*\d)[a-z\d]{5,10}$/;
        $.ajax({
            type: "post",
            url: "duplicate-check",
            data: {"memberId": memberId},
            dataType: "text",
            success: function (result) {
                if (result == "ok") {
                    if (memberId.match(exp)) {
                        checkResult.innerHTML = "사용가능한 아이디입니다.";
                        checkResult.style.color = "green";
                    } else {
                        checkResult.innerHTML = "영문소문자와 숫자를 포함한 5~10글자 입력"
                        checkResult.style.color = "red";
                    }
                } else {
                    checkResult.innerHTML = "이미 사용중인 아이디입니다.";
                    checkResult.style.color = "red";
                }
            }, error: function () {
                alert("형식에 맞지 않은 아이디입니다.");
            }
        });

    }

    function pwCheck() {
        const memberPassword = document.getElementById("memberPassword").value;
        const checkResult = document.getElementById("password-check-result");
        const exp = /^(?=.*[a-z])(?=.*\d)[a-z\d]{5,10}$/;
        if (memberPassword.match(exp)) {
            checkResult.innerHTML = "사용 가능한 비밀번호입니다";
            checkResult.style.color = "green";
        } else {
            checkResult.innerHTML = "영문소문자와 숫자를 포함한 5~10글자 입력";
            checkResult.style.color = "red";
        }
    }

    function mbCheck() {
        const memberMobile = document.getElementById("memberMobile").value;
        const checkResult = document.getElementById("mobile-check-result");
        const exp = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
        if (memberMobile.match(exp)) {
            checkResult.innerHTML = "사용 가능한 전화번호입니다."
            checkResult.style.color = "green";
        } else {
            checkResult.innerHTML = "다시 입력해주세요.";
            checkResult.style.color = "red";
        }

    }
</script>
</html>
