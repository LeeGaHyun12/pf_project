<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
    <script>
        $(document).ready(function() {
            $('.center').slick({
                dots: true,
                infinite: true,
                speed: 300,
                slidesToShow: 3,  // 한 화면에 보여줄 슬라이드 개수
                slidesToScroll: 1, // 한 번에 넘어가는 슬라이드 개수
                centerMode: true,
                variableWidth: true
            });
        });
    </script>
    <style>
        body {
            margin: 0;
            padding: 0;

        }

        .center {
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 20px;
        }

        .banner {
            background-color: black;
            color: white;
            width: 600px;
            height: 290px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 20px;
            position: relative;
        }

        .slick-slide {
            margin: 0 8px; /* 배너 사이 간격 설정 */
        }

        .slick-list {
            margin: 0 -10px; /* 양쪽 끝 간격 조정 */
        }

        img {
            position: absolute; /* Add this */
            width: 100%; /* Add this */
            height: 100%; /* Add this */
            object-fit: cover; /* Add this */
            border-radius: 20px; /* Optional: match border-radius of .banner */
        }
    </style>
</head>

<body>
<div class="center">
    <div class="banner"><img src="./image/photo.jpg"> </div>
    <div class="banner">2</div>
    <div class="banner">3</div>
    <div class="banner">4</div>
    <div class="banner">5</div>
</div>
</body>

</html>

