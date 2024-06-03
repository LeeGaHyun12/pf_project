<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style>
        body *{
            font-family: 'Jua';
        }

        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;

        }
        input[type="submit"],input[type="file"],input[type="text"],
        textarea {
            width: 100%;
            padding: 5px;
            outline: none;
            border-radius: 10px;
            border: 0.2px solid black;
        }

        button{
            border-radius: 10px;
            border: 0.2px solid white;
            margin: 5px; /* 버튼 간격 추가 */
            flex: 1 1 30%; /* 버튼이 30%의 폭을 차지하도록 설정 */
            text-align: center;
        }
        button.selected {
            background-color: #ea4c89;
            color: white;
        }
        label {
            line-height: 1.9rem;
        }


        fieldset {
            padding: 20px 40px;
        }

    </style>
    <script>
        $(function(){
            $("#upload").change(function(){
                //console.log($(this)[0]);//type 이 file 인경우 배열타입으로 넘어온다
                let reg=/(.*?)\/(jpg|jpeg|png|gif)$/;
                let f=$(this)[0].files[0];
                if(!f.type.match(reg)){
                    alert("이미지 파일만 가능합니다");
                    return;
                }
                if(f){
                    let reader=new FileReader();
                    reader.onload=function(e){
                        $("#showimg").attr("src",e.target.result);
                    }
                    reader.readAsDataURL($(this)[0].files[0]);
                }

            });
            $('button.category-btn').click(function() {
                // Remove 'selected' class from all buttons
                $('button.category-btn').removeClass('selected');
                // Add 'selected' class to the clicked button
                $(this).addClass('selected');
                // Set the value of the hidden input to the clicked button's value
                $('#category').val($(this).val());
            });

        });
    </script>
</head>

<c:if test="${sessionScope.loginok==null}">
    <script type="text/javascript">
        /*alert("먼저 로그인후 글을 작성해주세요");*/
        /*history.back();*/
    </script>
</c:if>

<body>
<form action="./upload" method="post" enctype="multipart/form-data">

    <fieldset>
        <legend>게시물 작성</legend>

        <div class="form-control">
            <label for="subject">제목</label>
            <input type="text" id="subject" name="subject" placeholder="Enter your name" required />
        </div>

        <div class="form-control">
            <label for="upload">파일 업로드</label>
            <input type="file" id="upload" name="upload" required/>
        </div>

        <div class="form-control">
            <label>분류</label>
            <div>
                <button type="button" class="category-btn" value="graphic_design">그래픽 디자인</button>
                <button type="button" class="category-btn" value="branding_editing">브랜딩/편집</button>
                <button type="button" class="category-btn" value="video_motion_graphics">영상/모션그래픽</button>
                <button type="button" class="category-btn" value="ui_ux">UI/UX</button>
                <button type="button" class="category-btn" value="character_design">캐릭터 디자인</button>
                <button type="button" class="category-btn" value="product_package_design">제품/패키지 디자인</button>
                <button type="button" class="category-btn" value="digital_art">디지털 아트</button>
                <button type="button" class="category-btn" value="typography">타이포그래피</button>
                <button type="button" class="category-btn" value="illustration">일러스트레이션</button>
                <button type="button" class="category-btn" value="photography">포토그래피</button>
                <button type="button" class="category-btn" value="fine_art">파인아트</button>
                <button type="button" class="category-btn" value="craft">공예</button>
            </div>
            <input type="hidden" id="category" name="category" required>
        </div>
        <div class="form-control">
            <label for="content">Message</label>
            <textarea
                    id="content"
                    name="content"
                    cols="40"
                    rows="10"
                    placeholder="Enter your message"
                    required
            ></textarea>
        </div>
        <input type="submit" value="전송" class="submit-btn" />
    </fieldset>

</form>
</body>
</html>



