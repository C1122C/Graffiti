<%--
  Created by IntelliJ IDEA.
  User: 曹畅
  Date: 2017/11/19
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <head>
            <title>上传</title>
            <meta name="keywords" content="摄影，图片">
            <meta charset="utf-8">
            <meta name="description" content="晒出你的图片来">
            <link href="./CSS/user.css" rel="stylesheet">
        </head>
    </head>
    <body style="background-image: url(./img/create_album.jpg);background-size:100% 100%;">
        <div style="height: 50px;width: 100%"></div>
        <div class="upload_pan">
            <div class="up_col" style="width: 100%;margin-left: 20px;">
                <div style="height: 20px"></div>
                <div class="tip_text"><span>相 册 名 称: </span></div>
                <div class="tag_div">
                    <div class="tag_input">
                        <input class="tag_input_inner" maxlength="20">
                    </div>
                </div>
                <div style="height: 20px;"></div>

                <div class="tip_text"><span>标 签: </span></div>
                <div class="tag_div">
                    <div class="tag_input">
                        <input class="tag_input_inner" maxlength="20" placeholder="添加标签，以逗号分隔">
                    </div>
                </div>
                <div style="height: 20px;"></div>

                <div class="tip_text" style="margin-bottom: 5px"><span>描 述: </span></div>
                <div class="des_editor">
                    <div class="publish_editor">
                        <div class="write_board" contenteditable="true"></div>
                    </div>
                </div>
                <div class="up_button_div">
                    <a href="i_pie.jsp"><button class="cancle_button" hidefocus="true">
                        <span>取 消</span>
                    </button></a>
                    <a href="i_pie.jsp"><button class="pub_button" style="margin-right: 60px;">
                        <span>创 建</span>
                    </button></a>
                </div>
            </div>
        </div>

    </body>
</html>
