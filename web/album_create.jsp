<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <title>上传</title>
        <meta name="keywords" content="摄影，图片">
        <meta charset="utf-8">
        <meta name="description" content="晒出你的图片来">
        <link href="./CSS/user.css" rel="stylesheet">
        <script src="./js/picture.js"></script>
        <script src="./js/user.js"></script>
        <script src="./js/jquery-3.2.1.js"></script>
        <script type="text/javascript">

            function check(){
                var name=document.getElementById("album_c_name").value;
                var tag=document.getElementById("album_c_tag").value;
                var des=document.getElementById("album_c_des").value;
                var goon=0;
                if(name==null||name==""){
                    alert("请输入相册名");
                }
                if(goon==1){
                    album_create(name,tag,des);
                }
            }
        </script>
    </head>
</head>
<body style="background-image: url(./img/create_album.jpg);background-size:100% 100%;background-attachment:fixed;">
<div style="height: 50px;width: 100%"></div>
<div class="upload_pan">
    <div class="up_col" style="width: 100%;margin-left: 20px;">
        <div style="height: 20px"></div>
        <div class="tip_text"><span>相 册 名 称: </span></div>
        <div class="tag_div">
            <div class="tag_input" style="background: rgba(255,255,255,0.6);">
                <input class="tag_input_inner" id="album_c_name" maxlength="20">
            </div>
        </div>
        <div style="height: 20px;"></div>

        <div class="tip_text"><span>标 签: </span></div>
        <div class="tag_div">
            <div class="tag_input">
                <input class="tag_input_inner" id="album_c_tag" maxlength="20" placeholder="添加标签，以逗号分隔">
            </div>
        </div>
        <div style="height: 20px;"></div>

        <div class="tip_text" style="margin-bottom: 5px"><span>描 述: </span></div>
        <div class="des_editor">
            <div class="publish_editor">
                <div class="write_board" contenteditable="true" id="album_c_des"></div>
            </div>
        </div>
        <div class="up_button_div">
            <a href="./i_pie.jsp"><button class="cancle_button" hidefocus="true">
                <span>取 消</span>
            </button></a>
            <a href="./i_pie.jsp"><button class="pub_button" style="margin-right: 60px;" onclick="check()">
                <span>创 建</span>
            </button></a>
        </div>
    </div>
</div>

</body>
</html>
