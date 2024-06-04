<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

  <style>
    .container {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-around;
      padding: 1px;
      border: 1px solid rebeccapurple;
    }

    .box {
      position: relative;
      border: 1px solid black;
      color: white;
      width: 22%;
      height: 300px;
      margin: 1%;
      border-radius: 16px;
      overflow: hidden;
    }

    .box_background {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-size: cover;
      filter: brightness(70%);
    }

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
    /* 이미지 박스*/
    #portfolio-details {
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      align-items: center;

    }
    /* 이미지 */
    #portfolio-photo {
      width: 70%;
      height: auto;
      object-fit: cover;
      display: block;
      margin-top: 60px;
    }

    .modal-title {
      font-size: 20px;
    }

    .modal-dialog {
      max-width: 100%;
      height: auto;
    }
    .modal-content {
      height: 100%;
    }

    .btn-close {
      font-size: 20px; /* x버튼 사이즈 */
    }

    .modal-body {
      height: 80vh; /* 화면 높이의 80%로 설정 */
    }

    .modal-footer {
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      background-color: #f8f9fa;
      border-top: 1px solid #dee2e6;
      font-size: 20px;
      padding: 20px;
    }
    .modal-footer a,
    .modal-footer p {
      margin: 0;
      width: 100%;
      font-size: 16px;
      line-height: 1.5; /* 줄 간격 조정 */
    }

    .buttonbox {
      display: flex;
      overflow-x: auto;
      scroll-behavior: smooth;
      white-space: nowrap;
      -webkit-overflow-scrolling: touch;
      gap: 8px;
    }

    .buttonbox::-webkit-scrollbar {
      display: none; /* Hide scrollbar for WebKit browsers */
    }

    /*카테고리 버튼*/
    .ctbutton{
      width:auto;
      height: 50px;
      color:#fff;
      background: #EF8D9C;
      font-size: 22px;
      border:none;
      border-radius: 35px;
      transition:0.3s;
      display: flex;
      justify-content: center;
      align-items: center;
      margin: 8px;
      padding: 0 20px;
    }

  </style>
  <script>
    $(document).ready(function() {

      // Like button click event
      $('.bi-heart-fill').on('click', function() {
        var $icon = $(this);
        var $likeCount = $icon.next('span');
        var num = $icon.closest('.box').data('num');

        $.ajax({
          url: '/likePost',
          type: 'POST',
          data: { num: num },
          success: function(data) {
            if (data.success) {
              // Increase like count
              var currentCount = parseInt($likeCount.text());
              $likeCount.text(currentCount + 1);
              // Change icon color
              $icon.css('color', 'red');
              location.reload();
            }
          },
          error: function(xhr, status, error) {
            console.error(xhr.responseText);
          }
        });
      });

      $('.box').on('click', function() {
        var num = $(this).data('num');

        // Increase view count
        $.ajax({
          url: '/increaseCount',
          type: 'POST',
          data: { num: num },
          success: function(data) {
            if (data.success) {
              location.reload();
              // Update the view count in the UI
              var $viewCount = $('.box[data-num="' + num + '"]').find('.bi-eye-fill').next('span');
              var currentCount = parseInt($viewCount.text());
              $viewCount.text(currentCount + 1);


            }
          },
          error: function(xhr, status, error) {
            console.error(xhr.responseText);
          }
        });

        $.ajax({
          url: '/getData',
          type: 'GET',
          data: { num: num},
          success: function(data) {
            console.log('Image URL:', data.port_photo);
            $('#portfolio-number').text(data.num);
            $('#portfolio-photo').attr('src','../photo/'+data.port_photo);
            $('#portfolio-subject').text(data.subject);
            $('#portfolio-content').text(data.content);

            $('#myModal').modal('show');
          },
          error: function(xhr, status, error) {
            console.error(xhr.responseText);
          }
        });
      });

      // 모달이 닫힐 때 이전 페이지로 이동하는 함수
      function closeModalAndReload() {
        $('#myModal').modal('hide'); // 모달을 닫음
        window.location.reload(); // 이전 페이지로 새로 고침
      }

      // 모달 닫힘 이벤트 리스너 등록
      $('#myModal').on('hidden.bs.modal', function () {
        closeModalAndReload(); // 모달이 닫히면 이전 페이지로 이동
      });


      // Scroll buttons
      $('#scroll-left').on('click', function() {
        $('.buttonbox').scrollLeft($('.buttonbox').scrollLeft() - 100);
      });

      $('#scroll-right').on('click', function() {
        $('.buttonbox').scrollLeft($('.buttonbox').scrollLeft() + 100);
      });


    });
  </script>
</head>
<body>


<div class="buttonbox">
  <button class="ctbutton">그래픽 디자인</button>
  <button class="ctbutton">영상/모션그래픽</button>
  <button class="ctbutton">캐릭터 디자인</button>
  <button class="ctbutton">디지털 아트</button>
  <button class="ctbutton">일러스트레이션</button>
  <button class="ctbutton">파인아트</button>
  <button class="ctbutton">브랜딩/편집</button>
  <button class="ctbutton">UI/UX</button>
  <button class="ctbutton">제품/패키지 디자인</button>
  <button class="ctbutton">타이포그래피</button>
  <button class="ctbutton">포토그래피</button>
  <button class="ctbutton">공예</button>
</div>

<div class="container">
  <c:forEach var="dto" items="${boardList}">
    <div class="box" data-num="${dto.num}" data-category="${dto.category}">
      <div class="box_background"><img src="../photo/${dto.port_photo}"> </div>

      <div class="content">
        <p class="userId" style="margin: 0;">${dto.userId}</p>
        <div class="icons">
          <i class="bi bi-heart-fill" style="margin-right: 5px;">
            <span style="color: white; margin: 10px;">${dto.like_count}</span>
          </i> <!-- 하트 아이콘 -->

          <i class="bi bi-eye-fill"> <!-- 조회 아이콘 -->
          <span style="color: white; margin: 10px;">${dto.count}</span>
          </i>
        </div>
      </div>
    </div>
  </c:forEach>

</div>

<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title"><span id="portfolio-subject"></span></h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="portfolio-details">
        <img id="portfolio-photo" src="" alt="Portfolio Photo">
      </div>
      <div class="modal-footer">
        <a><strong>Portfolio Number:</strong> <span id="portfolio-number"></span></a>
        <p><strong>Content:</strong> <span id="portfolio-content"></span></p>
      </div>
    </div>
  </div>
</div>

</body>
</html>
