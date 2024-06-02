<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>

    .btnwrite{
    width:500px;
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
<div class="write"><button class="btnwrite" onclick="location.href='/board/writeform'">글쓰기</button></div>
</body>
</html>
