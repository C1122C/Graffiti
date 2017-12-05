<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公告</title>
    <meta name="keywords" content="摄影，图片">
    <meta charset="utf-8">
    <meta name="description" content="晒出你的图片来">
    <link href="./CSS/user.css" rel="stylesheet">
    <script src="./js/user.js"></script>
    <script src="./js/announce.js"></script>
    <script src="./js/jquery-3.2.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $(".pub_button").click(function(){
                var type=document.getElementById("type").value;
                var act_type=document.getElementById("act_type").value;
                var ask=document.getElementById("ask").value;
                var location=document.getElementById("location").value;
                var fare=document.getElementById("fare").value;
                var mark=document.getElementById("mark").value;
                new_announce(type,act_type,ask,location,fare,mark);
            });
        });
    </script>
</head>
<body style="background-image: url(./img/newAnnounce.jpg);background-size:100% 100%;background-attachment:fixed;">
<div style="height: 100px;width: 100%"></div>
<div class="upload_pan" style="height: 70%;">
    <div style="height: 40px;"></div>
    <div class="up_col">
        <div class="tip_text"><span>公 告 类 型: </span></div>
        <select class="select_bar" id="type" style="line-height: 35px;height: 35px;font-size: 16px;text-align: center;width: 80%;margin-left: 0px;margin-right: 60px;">
            <option>请你拍</option>
            <option>我来拍</option>
        </select>
        <div style="height: 20px;"></div>
        <div class="tip_text"><span>活 动 类 型: </span></div>
        <select class="select_bar" id="act_type" style="line-height: 35px;height: 35px;font-size: 16px;text-align: center;width: 80%;margin-left: 0px;margin-right: 60px;">
            <option>拍一次</option>
            <option>长久拍</option>
        </select>
        <div style="height: 20px;"></div>
        <div class="tip_text"><span>位 置: </span></div>
        <div class="tag_div">
            <div class="tag_input" style="background: rgba(255,255,255,0.6)">
                <input class="tag_input_inner" id="location" maxlength="20">
            </div>
        </div>
        <div style="height: 20px;"></div>
        <div class="tip_text"><span>费 用 要 求: </span></div>
        <div class="tag_div">
            <div class="tag_input" style="background: rgba(255,255,255,0.6)">
                <input class="tag_input_inner" maxlength="20" id="fare">
            </div>
        </div>
        <div style="height: 20px;"></div>
    </div>
    <div class="up_col">
        <div class="tip_text" style="margin-bottom: 5px"><span>专 长/要 求: </span></div>
        <div style="height: 20px"></div>
        <div class="des_editor">
            <div class="publish_editor">
                <div class="write_board" contenteditable="true" id="ask"></div>
            </div>
        </div>
        <div style="height: 20px"></div>
        <div class="up_button_div">
            <a href="./i_pie.jsp"><button class="cancle_button" hidefocus="true">
                <span>取 消</span>
            </button></a>
            <a href="./i_pie.jsp"><button class="pub_button">
                <span>发 布</span>
            </button></a>
        </div>
    </div>
</div>
</body>
</html>
