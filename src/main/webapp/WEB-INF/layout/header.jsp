<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<style>

    div.header{
        display: flex;
        justify-content: flex-end;
        align-items: center;

    }
    div.rightbox {
        display: flex;
        gap: 8px;

    }
    div.title{
        display: flex;
        background-color: black;
        color: white;
        width: 100px;
        height: 100px;
        justify-content: center;
        position: absolute; /* 절대 위치 지정 */
        left: 50%; /* 가로 중앙에 맞춤 */
        transform: translateX(-50%); /* 요소 너비의 절반만큼 왼쪽으로 이동 */
    }
    div.search{
        background-color: black;
        color: white;
        width: 280px;
        height: 150px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    input{
        width: 350px;
        border: 1px solid #bbb;
        border-radius: 25px;
        padding: 10px 12px;
        font-size: 18px;
        height: 50px;
    }
    div.login{
        background-color: black;
        color: white;
        width: 170px;
        height: 150px;
        display: flex;
        justify-content: center;
        align-items: center;

    }
    .btnlogin{
        width:140px;
        height: 50px;
        color:#fff;
        background: #ea4c89;
        font-size: 22px;
        border:none;
        border-radius: 35px;
        box-shadow: 0 4px 16px rgba(0,79,255,0.3);
        transition:0.3s;
    }
    div.signup{
        background-color: black;
        color: white;
        width: 170px;
        height: 150px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .btnsignup{
        width:140px;
        height: 50px;
        color:#fff;
        background: #ea4c89;
        font-size: 22px;
        border:none;
        border-radius: 35px;
        box-shadow: 0 4px 16px rgba(0,79,255,0.3);
        transition:0.3s;
    }
</style>
</head>
<body>
<!--test-->
<div class="header">
        <div class="title">title</div>
    <div class="rightbox">
        <div class="search"><input type="text" placeholder=" Search..."></div>
        <div class="login"><button class="btnlogin" onclick="location.href='/member/login'">login</button></div>
        <div class="signup"><button class="btnsignup" onclick="location.href='/member/form'">sign up</button></div>
    </div>


</div>
</body>
</html>
