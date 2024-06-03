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
        input[type="button"] {
            border-radius: 10px;
            border: 0.2px solid white;
            margin: 5px; /* 버튼 간격 추가 */
            flex: 1 1 30%; /* 버튼이 30%의 폭을 차지하도록 설정 */
            text-align: center;
        }
        label {
            line-height: 1.9rem;
        }
        input[type="submit"] {
            padding: 3px;
            margin-top: 0.6rem;
            font-family: cursive;
            font-weight: bold;
            border-radius: 50px;
            border: 1px solid #ea4c89;
            width: 80px;
            background-color: #ea4c89;
            color: white;

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
            <label for="port_Id">port_Id</label>
            <input type="text" id="port_Id" name="port_Id" placeholder="Enter your name" required />
        </div>
        <div class="form-control">
            <label for="userId">userId</label>
            <input type="text" id="userId" name="userId" placeholder="Enter your name" required />
        </div>
        <div class="form-control">
            <label>분류</label>
            <br>
            <input type='button' value='그래픽 디자인'/>
            <input type='button' value='브랜딩/편집'/>
            <input type='button' value='영상/모션그래픽'/>
            <input type='button' value='UI/UX'/>
            <br>
            <input type='button' value='캐릭터 디자인'/>
            <input type='button' value='제품/패키지 디자인'/>
            <input type='button' value='디지털 아트'/>
            <input type='button' value='타이포그래피'/>
            <br>
            <input type='button' value='일러스트레이션'/>
            <input type='button' value='포토그래피'/>
            <input type='button' value='파인아트'/>
            <input type='button' value='공예'/>
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



