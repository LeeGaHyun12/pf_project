<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 구글 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <!-- 사용자 정의 CSS -->
    <style>
        body, input {
            font-family: 'Noto Sans KR', sans-serif;
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
        .form-profile-img{
            float: right;
            width: 300px;
            display: flex; /* 부모 요소를 가로 정렬로 설정 */
            align-items: center; /* 아이템들을 세로 중앙 정렬 */
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
<body>

<div class="container">
    <h1>변경됐나 </h1>
    <h3 class="text-center mb-4">회원 가입</h3>
    <form action="https://dribbble.com/signup/new" method="post">
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" id="name" name="name" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="userId">아이디</label>
            <input type="text" id="userId" name="userId" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="email">이메일</label>
            <input type="email" id="email" name="email" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="passwd">비밀번호</label>
            <input type="password" id="passwd" name="passwd" class="form-control" required maxlength="8">
        </div>

        <div class="form-profile" style="width: 250px;">
            <label for="myfile">프로필사진</label>
            <input type="file" id="myfile" name="myfile" class="form-control" required>
        </div>
        <div class="form-profile-img">
            <img src="" id="showimg1" style="width: 100px;"
                 onerror="this.src='../image/saram.png'" class="rounded-circle">
        </div>

        <div class="form-group">
            <label>관심 분야</label><br>
            <input type="checkbox" id="graphic_design" name="graphic_design">
            <label for="graphic_design">그래픽 디자인</label><br>

            <input type="checkbox" id="web_design" name="web_design">
            <label for="web_design">웹 디자인</label><br>

            <input type="checkbox" id="illustration" name="illustration">
            <label for="illustration">일러스트레이션</label><br>

            <input type="checkbox" id="photography" name="photography">
            <label for="photography">포토그래피</label><br>
        </div>

        <div class="form-group text-center">

            <button type="submit" class="btn btn-danger btn-block">회원가입</button>
        </div>
    </form>
</div>

<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

