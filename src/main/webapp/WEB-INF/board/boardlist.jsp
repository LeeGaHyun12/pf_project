<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  <style>

    .container {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-around;
      padding: 1px;
      border: 1px solid rebeccapurple;
    }

    /* 각 box의 스타일 */
    .box {
      position: relative;
      border: 1px solid black;
      color: white;
      width: 22%; /* 한 줄에 4개의 박스를 표시하기 위해 22%로 설정 */
      height: 300px;
      margin: 1%; /* 각 박스 사이의 간격을 설정 */
      border-radius: 16px;
      overflow: hidden;
    }

    /* 이미지를 배경으로 사용하는 스타일 */
    .box_background {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-size: cover;
      filter: brightness(70%);
    }

    /* 박스 내부 콘텐츠 스타일 */
    .content {
      position: absolute;
      bottom: 0;
      right: 0;
      left: 0;
      height: 20%;
      padding: 1rem;
      background: linear-gradient(to bottom left, #EF8D9C 40%, #FFC39E 100%);
      width: 100%;
      box-sizing: border-box;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    /* 텍스트 스타일 */
    .content p {
      margin: 0;
      color: white;
      font-size: 20px;
    }


    /* 아이콘 스타일 */
    .icons {
      display: flex;
      align-items: center;
      font-size: 20px;
    }


  </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<div class="container">
  <c:forEach var="dto" items="${boardList}">
    <div class="box">
      <div class="box_background"><img src="../photo/${dto.port_photo}"> </div>

      <div class="content">
        <p class="userId" style="margin: 0;">${dto.userId}</p>
        <div class="icons">
          <i class="bi bi-heart-fill" style="margin-right: 5px;"></i> <!-- 하트 아이콘 -->
          <span style="color: white; margin: 10px;">${dto.like_count}</span>
          <i class="bi bi-eye-fill"></i> <!-- 조회 아이콘 -->
          <span style="color: white; margin: 10px;">${dto.count}</span>
        </div>
      </div>
    </div>


  </c:forEach>
</div>
</body>
</html>

