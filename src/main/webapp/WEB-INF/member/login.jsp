<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>로그인</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 사용자 정의 CSS -->
    <style>

        @font-face {
            font-family : 'YangjuByeolsanA1';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405@1.0/YangjuByeolsanA1.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        body *{
            font-family : 'YangjuByeolsanA1';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405@1.0/YangjuByeolsanA1.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        body,input {
            font-family : 'YangjuByeolsanA1';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405@1.0/YangjuByeolsanA1.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .form-group {
            margin-bottom: 10px;
        }
        .form-group label {
            font-weight: 700;
        }
        .btn-danger {
            background-color: #ea4c89;
            border-color: #ea4c89;
        }
        .btn-danger:hover {
            background-color: #d8336b;
            border-color: #d8336b;
        }
    </style>
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<script type="text/javascript">
    $(function(){
        $("#loginfrm").submit(function(e){
            //기본 이벤트 무효화
            e.preventDefault();
            //폼안의 입력값 읽기
            let fdata=$(this).serialize();

            $.ajax({
                type:"get",
                dataType:"json",
                url:"${root}/member/login",
                data:fdata,
                success:function(data){
                    if(data.status=='success'){
                        window.location.href = "../";
                    }else{
                        alert("아이디 또는 비밀번호가 맞지 않습니다");
                    }
                }
            });
        });

    });//close function
</script>
<body style="background-color: black;">
<div class="container">
    <h3 class="text-center mb-4">로그인</h3>
    <form id="loginfrm" action="<%=request.getContextPath()%>/member/login" method="get" enctype="multipart/form-data">
        <div class="form-group-id" style="width: 300px;">
            <label for="userId">아이디</label>
            <input type="text" id="userId" name="userId" class="form-control"
                   value="${sessionScope.saveid!=null and sessionScope.saveid=='yes'?
                               sessionScope.loginid:''}" required>
            <input type="checkbox" id="saveid" name="saveid" ${sessionScope.saveid=null or sessionScope.saveid=='no'?"":"checked"}>&nbsp;아이디저장

        </div>

        <div class="form-group">
            <label for="passwd">비밀번호</label>
            <input type="password" id="passwd" name="passwd" class="form-control" required maxlength="8">
        </div>

        <div class="form-group text-center">
            <button type="submit" class="btn btn-danger btn-block">로그인</button>
        </div>
    </form>
</div>

<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

