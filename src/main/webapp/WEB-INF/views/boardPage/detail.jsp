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
        <button id="comment-write-btn" class="btn btn-danger">댓글작성</button>
        <c:if test = "${sessionScope.loginMemberId eq board.memberId}">
            <button class="btn btn-primary" onclick="boardUpdate()">글 수정</button>
            <button class="btn btn-primary" onclick="boardDelete()">글 삭제</button>
        </c:if>
        <c:if test = "${sessionScope.loginMemberId eq 'admin'}">
            <button class="btn btn-primary" onclick="boardDelete()">글 삭제</button>
        </c:if>
        <div id="comment-list">
            <table class="table">
                <tr>
                    <th>댓글번호</th>
                    <th>작성자</th>
                    <th>내용</th>
                    <th>작성시간</th>
                </tr>
                <c:forEach items="${commentList}" var="comment">
                    <tr>
                        <td>${comment.c_id}</td>
                        <td>${comment.memberId}</td>
                        <td>${comment.commentContents}</td>
                        <td>${comment.commentCreatedDate}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
<script>
    $("#comment-write-btn").click(function () {
        //댓글 작성자, 내용을 가져오고 ajax 문법을 활용하여 /comment/save 주소로 post방식으로 작성자, 내용, 글번호
        //세개의 값을 보내는 코드를 작성하시오
        const memberId = document.getElementById("memberId").value;
        const commentContents = $("#commentContents").val();
        const boardId = '${board.b_id}';
        console.log(memberId, commentContents, boardId)
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                "memberId": memberId,
                "commentContents": commentContents,
                "boardId": boardId
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                let output = "<table class='table'>";
                output += "<tr>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for(let i in result){
                    output += "<tr>";
                    output += "<td>"+result[i].c_id+"</td>";
                    output += "<td>"+result[i].memberId+"</td>";
                    output += "<td>"+result[i].commentContents+"</td>";
                    output += "<td>"+result[i].commentCreatedDate+"</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('memberId').value='';
                document.getElementById('commentContents').value='';
            },
            error: function () {
                alert("어디가 틀렸을까");
            }
        });
    });
    const paging = () => {
        location.href="/board/paging?page=${page}";
    }
    const boardUpdate = () => {
        location.href="/board/update?b_id=${board.b_id}";
    }
    const boardDelete = () => {
        location.href="/board/delete?b_id=${board.b_id}";
    }
</script>
</html>
