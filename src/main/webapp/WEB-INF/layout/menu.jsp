<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <!--폰트-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Archivo:ital,wght@0,100..900;1,100..900&family=Domine:wght@400..700&display=swap" rel="stylesheet">


    <style>
        body *{
            font-family: "Archivo", sans-serif;

        }
        .container {
            height: 100vh; /* 화면 전체를 사용할 수 있도록 높이 설정 */
            border: 1px solid black;
        }
        .write{
            border: 1px solid black;
        }
        b{
            font-size: 90px;
            color: white;
        }

        .btnwrite {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            background-color: #151010;
            color: white;
            font-size: 20px;
            font-weight: bold;
            padding: 12px 30px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btnwrite:hover {
            background-color: #ff87a3;
        }

        .btnwrite:active {
            transform: translateY(2px);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /*.btnwrite {*/
        /*    width: 180px;*/
        /*    height: 50px;*/
        /*    color: #fff;*/
        /*    background: #ff5649;*/
        /*    font-size: 22px;*/
        /*    border: none;*/
        /*    border-radius: 30px;*/
        /*    transition: 0.3s;*/
        /*    display: flex; !* 버튼 안의 내용물을 가로 중앙 정렬하기 위해 추가 *!*/
        /*    justify-content: center; !* 버튼 안의 내용물을 가로 중앙 정렬하기 위해 추가 *!*/
        /*    align-items: center; !* 버튼 안의 내용물을 세로 중앙 정렬하기 위해 추가 *!*/
        /*}*/
    </style>
</head>
<body>
<div class="container">
    <div class="write"><b>Create your</b> <br><b>portfolio and designs</b><button class="btnwrite" onclick="location.href='/board/writeform'">write</button></div>
</div>
</body>
</html>
