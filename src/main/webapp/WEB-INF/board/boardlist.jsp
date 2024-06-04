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

  <!--폰트-->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Archivo:ital,wght@0,100..900;1,100..900&family=Domine:wght@400..700&display=swap" rel="stylesheet">

  <style>
    body *{
      font-family: "Archivo", sans-serif;


    }

    .container {
      max-width: 1600px; /* 최대 너비 설정 */
      display: flex;
      flex-wrap: wrap;
      justify-content: flex-end; /* 오른쪽부터 정렬 */
      padding: 10px;
      flex-direction: row-reverse; /* 오른쪽부터 정렬 */
    }

    .box {
      position: relative;
      color: white;
      flex: 1 1 calc(25% - 2%); /* 4개씩 배치되도록 설정 (25% - 2%는 margin 포함한 크기) */
      max-width: calc(25% - 2%);
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
      overflow: hidden;
    }
    .box_background img {
      width: 100%;
      height: 100%;
      object-fit: cover; /* 이미지를 부모 요소의 크기에 맞게 조정 */
      right: 0px;
    }

    .content {
      position: absolute;
      bottom: 0;
      right: 0;
      left: 0;
      height: 15%;
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
    .modal-body {
      display: flex;
      justify-content: center; /* 수평 가운데 정렬 */
      align-items: center; /* 수직 가운데 정렬 */
      position: relative; /* 내부 요소들의 위치를 조정하기 위해 relative */

    }

    #portfolio-photo {
      position: relative;
      width: 70%;
      height: auto;
      object-fit: cover;
      display: block;
      margin-top: 60px;
    }


    .modal-title {
      font-size: 28px;
    }

    .modal-dialog {
      max-width: 100%;
    }


    .btn-close {
      font-size: 20px; /* x버튼 사이즈 */
    }



    .modal-footer {
      background-color: #f8f9fa;
      border-top: 1px solid #dee2e6;
      font-size: 20px;
    }

    .buttonbox {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-wrap: wrap; /* 버튼들이 창 크기에 맞게 줄을 바꾸도록 설정 */
      width: 80%;
      border: 1px solid black;
      margin: 0 auto; /* 가로 중앙 정렬을 위해 추가 */

    }

    .text{
      font-size: 70px;
      color: black;
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
    .ctbutton {
      flex: 1 1 auto; /* 버튼이 가로로 균등하게 늘어나도록 설정 */
      max-width: 190px; /* 버튼의 최대 너비 설정 */
      min-width: 60px; /* 버튼의 최소 너비 설정 */
      height: 50px;
      color: white;
      background: #feb6c8;
      font-size: 22px;
      border: none;
      border-radius: 15px;
      transition: 0.3s;
      display: flex;
      justify-content: center;
      align-items: center;
      margin: 8px;

      white-space: nowrap; /* 텍스트 줄바꿈 방지 */
      overflow: hidden; /* 넘치는 텍스트 숨기기 */
      text-overflow: ellipsis; /* 넘치는 텍스트 생략 표시 (...) */
    }

    /* 아이콘 버튼 */
    .icon-buttons {
      position: absolute;
      right: 15px;
      top: 15px;
      display: flex;
      flex-direction: column; /* 세로 방향으로 버튼 정렬 */
      gap: 15px; /* 버튼 간의 간격 */
    }

    .icon-button {
      width: 70px;
      height: 70px;
      background-color: #fff;
      border-radius: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .icon-button:hover {
      background-color: #f0f0f0;
    }

    .icon-button i {
      font-size: 27px;
      color: #333;
      padding: 0 20px;
    }

  </style>
  <script>
    $(document).ready(function() {

      $('.ctbutton').on('click', function() {
        var category = $(this).val();

        // 모든 박스를 숨기고 해당 카테고리에 맞는 박스만 표시
        $('.box').hide().filter(function() {
          return $(this).data('category') === category;
        }).show();
      });

      $(document).on('click', '.box', function() {
        var num = $(this).data('num');

        $.ajax({
          url: '/getData',
          type: 'GET',
          data: { num: num },
          success: function(data) {
            $('#portfolio-number').text(data.num);
            $('#portfolio-photo').attr('src', '../photo/' + data.port_photo);
            $('#portfolio-subject').text(data.subject);
            $('#portfolio-content').text(data.content);

            $('#myModal').modal('show');


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

<b class="text">Explore inspiring designs</b><br>
<div class="buttonbox">
  <button class="ctbutton" value="graphic_design"># 그래픽 디자인</button>
  <button class="ctbutton" value="video_motion_graphics"># 영상/모션그래픽</button>
  <button class="ctbutton" value="character_design"># 캐릭터 디자인</button>
  <button class="ctbutton" value="digital_art"># 디지털 아트</button>
  <button class="ctbutton" value="illustration"># 일러스트레이션</button>
  <button class="ctbutton" value="fine_art"># 파인아트</button>
  <button class="ctbutton" value="branding_editing"># 브랜딩/편집</button>
  <button class="ctbutton" value="ui_ux"># UI/UX</button>
  <button class="ctbutton" value="product_package_design"># 제품/패키지 디자인</button>
  <button class="ctbutton" value="typography"># 타이포그래피</button>
  <button class="ctbutton" value="photography"># 포토그래피</button>
  <button class="ctbutton" value="craft"># 공예</button>
</div>

<div class="container">
  <c:forEach var="dto" items="${boardList}">
    <div class="box" data-num="${dto.num}" data-category="${dto.category}">

      <div class="box_background"><img src="../photo/${dto.port_photo}"></div>


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
        <div class="icon-buttons">
          <div class="icon-button"></div>
          <div class="icon-button" style="background-color: #f75172"><i class="bi bi-heart-fill" style="color: white"></i></div>
          <div class="icon-button" style="background-color: #1bcad3"><i class="bi bi-chat-dots-fill" style="color: white"></i></div>
          <div class="icon-button"><i class="bi bi-share-fill"></i></div>
        </div>

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