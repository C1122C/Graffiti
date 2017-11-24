<%--
  Created by IntelliJ IDEA.
  User: 曹畅
  Date: 2017/11/17
  Time: 0:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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

            $(document).ready(function(){

                $(".photo_small").click(function(){
                    var res=confirm("移除这张图片？");
                    if(res==true){
                        $(this).hide();
                        cancle_upload();
                    }
                });

                $(".photo_click").click(function(){
                    $(this).hide();
                    $(this).siblings().show();
                });


            });

            function open_upload_window(){

            }
            function cancal_pic(){

            }
            function check(){
                var tag=document.getElementById("pic_upload_tag").value;
                var album=document.getElementById("pic_upload_album").value;
                var description=document.getElementById("pic_upload_des").value;
            }
        </script>
    </head>
    <body style="background-image: url(./img/upload_back.jpg);background-size:100% 100%;">
        <div style="height: 50px;width: 100%"></div>
        <div class="upload_pan">
            <div style="height: 40px;"></div>
            <div class="up_col">
                <div class="photo_click"></div>
                <div class="photo_list" id="pic_upload_list"  style="display: none;">
                    <div class="photo_queue">
                        <div class="photo_small">
                            <img src="./img/IMG_0004.JPG" width="96" height="96" onclick="cancal_pic()">
                        </div>
                        <div class="photo_small">
                            <img src="./img/IMG_0004.JPG" width="96" height="96" onclick="cancal_pic()">
                        </div>
                        <div class="photo_small">
                            <img src="./img/IMG_0004.JPG" width="96" height="96" onclick="cancal_pic()">
                        </div>
                        <div class="photo_small">
                            <img src="./img/IMG_0004.JPG" width="96" height="96" onclick="cancal_pic()">
                        </div>
                        <div class="photo_small">
                            <img src="./img/IMG_0004.JPG" width="96" height="96" onclick="cancal_pic()">
                        </div>
                        <div class="photo_small">
                            <img src="./img/IMG_0004.JPG" width="96" height="96" onclick="cancal_pic()">
                        </div>
                    </div>
                </div>
                <div class="add_bar" onclick="open_upload_window()" style="display: none;">
                    <div class="add_button">
                        <div class="add_icon">
                            <img src="./img/add.png" width="38px" height="40px">
                        </div>
                        <div class="add_text">继 续 添 加</div>
                    </div>
                </div>
            </div>
            <div class="up_col">
                <div class="tip_text"><span>标 签: </span></div>
                <div class="tag_div">
                    <div class="tag_input">
                        <input class="tag_input_inner" id="pic_upload_tag" maxlength="20" placeholder="添加标签，以逗号分隔">
                    </div>
                </div>
                <div style="height: 20px;"></div>
                <div style="opacity: 2;margin-bottom: 10px;">
                    <div class="tip_text" style="float: left"><span>相 册: </span></div>
                    <select class="select_bar" id="pic_upload_album">
                        <option>album1</option>
                        <option>album2</option>
                        <option>album3</option>
                    </select>
                </div>
                <div style="height: 50px;"></div>
                <div class="tip_text" style="margin-bottom: 5px"><span>描 述: </span></div>
                <div class="des_editor">
                    <div class="publish_editor">
                        <div class="write_board" contenteditable="true" id="pic_upload_des"></div>
                    </div>
                </div>
                <div class="up_button_div">
                    <a href="i_pie.jsp"><button class="cancle_button" hidefocus="true">
                        <span>取 消</span>
                    </button></a>
                    <a href="i_pie.jsp"><button class="pub_button" onclick="check()">
                        <span>发 布</span>
                    </button></a>
                </div>
            </div>
        </div>
    </body>
</html>
