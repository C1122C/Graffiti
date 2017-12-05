<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>张三</title>
    <meta name="keywords" content="摄影，图片">
    <meta charset="utf-8">
    <meta name="description" content="晒出你的图片来">
    <link href="./CSS/user.css" rel="stylesheet">
    <script src="./js/user.js"></script>
    <script src="./js/picture.js"></script>
    <script src="./js/jquery-3.2.1.js"></script>
    <script type="text/javascript">
        window.onload=function(){
            load_info();
        };

        $(document).ready(function(){
            $("#inform_title").click(function(){
                $(this).hide();
            });

            $(".pic").click(function(){
                $(this).parent().parent().parent().parent().parent().parent().hide();
                $(this).parent().parent().parent().parent().parent().parent().next().show();
            });

            $(".picbig").click(function(){
                $(this).parent().parent().parent().parent().parent().parent().hide();
                $(this).parent().parent().parent().parent().parent().parent().prev().show();
            });

            $(".like_u").click(function(){
                $(this).hide();
                $(this).siblings().show();
                thumb();
            });

            $(".like_c").click(function(){
                $(this).hide();
                $(this).siblings().show();
                cancle_thumb();
            });

            $(".opti_c").click(function(){
                $(this).parent().parent().parent().find(".comment_bar1").toggle();
                $(this).parent().parent().parent().find(".comment_bar").toggle();
            });

            $(".c_button").click(function(){
                var content=$(this).parent().find(".c_input").value;
                if(content==""||content==null){
                    alert("请填写评论");
                }
                else{
                    comment(content);
                }
                $(this).parent().hide();
            });

            $(".c_input").blur(function(){
                $(this).parent().hide();
            });

            $(".follow_button").click(function(){
                $(this).parent().find(".disfollow_btn").show();
                $(this).hide();
                follow($(this).value);
            });

            $(".disfollow_btn").click(function(){
                $(this).parent().find(".follow_button").show();
                $(this).hide();
                unfollow($(this).value);
            });

        });
    </script>
</head>
<body>
<div style="height: 60px;margin-left: 175px;margin-bottom: 0px;margin-top: 20px">
    <a class="follow_button">
        <span class="fol1"><img src="./img/add.png"></span>
        <span class="fol1">关</span>
        <span class="fol1">注</span>
    </a>
    <a class="disfollow_btn" style="display: none">
        <span class="unfollow_txt">取</span>
        <span class="unfollow_txt">消</span>
        <span class="unfollow_txt">关</span>
        <span class="unfollow_txt">注</span>
    </a>
</div>
<div class="wall">
    <div id="index_main" class="main_b" style="margin-left: -30px;">
        <div class="list">
            <div class="portrait">
                <a target="_blank">
                    <img src="img/IMG_0004.JPG" width="65px">
                </a>
            </div>
            <div class="content">
                <div class="talk_h"></div>
                <div class="talk_body">
                    <div class="work">
                        <div class="cnt">
                            <div style="opacity:1;float:left;width:50%;padding-left:20px;box-sizing:border-box;text-align:center;">
                                <div class="pic" style="margin-top:10px;margin-left:-350px;max-height: 250px;width: 300%">
                                    <a href="#" hidefocus="true" style="width: 100%;">
                                        <img src="./img/IMG_0006.JPG" width="250px">
                                    </a>
                                </div>
                            </div>
                            <div class="text">
                                <blockquote>
                                    <p>
                                        大雨落幽燕，白浪滔天，秦皇岛外打鱼船，一片汪洋都不见，知向谁边<br>
                                        往事越千年，魏武挥鞭，东临碣石有遗篇，萧瑟秋风今又是，换了人间。
                                    </p>
                                    <p>2017.11.2 &nbsp 南京</p>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                    <div class="fed_back">
                        <div class="tag" style="width: 191px">
                            <span class="opti">摄影</span>
                            <span class="opti">生活</span>
                            <span class="opti">行路</span>
                        </div>
                        <div class="comment">
                            <span class="opti">热度（46）</span>
                            <span class="opti_c">评论</span>
                            <span class="opti">转发</span>
                            <span class="opti" style="margin-left: -5px;margin-top: -18px">
                                        <a>
                                            <img src="./img/like_unclicked.png" class="like_u">
                                            <img src="./img/like_clicked.png"  style="display: none;" class="like_c">
                                        </a>
                                    </span>
                        </div>
                    </div>
                    <div class="comment_bar1" style="display:none;">
                                <span class="opti" style="margin-left: 20px;">
                                    <a>
                                        <img src="./img/IMG_7965.JPG" width="65px" style="border-radius:50%;" onclick="other_user_info()">
                                    </a>
                                </span>
                        <div class="m_txt1">
                            <div class="m_content">色彩把握的不错。</div>
                        </div>
                    </div>
                    <div class="comment_bar" style="display: none;">
                        <div class="c_input" contenteditable="true">
                        </div>
                        <input type="submit" value="发布" class="c_button">
                    </div>
                </div>
            </div>
        </div>
        <div class="list1" style="display: none;">
            <div class="portrait">
                <a target="_blank">
                    <img src="img/IMG_0004.JPG" width="65px">
                </a>
            </div>
            <div class="content">
                <div class="talk_h"></div>
                <div class="talk_body">
                    <div class="work">
                        <div class="cnt">
                            <div style="min-width: 100%;min-height:500px;margin-left:-85px;">
                                <div  class="picbig" style="margin-top:10px;cursor: hand;width: 350%;">
                                    <a hidefocus="true" style="width: 300%;">
                                        <img src="./img/IMG_0006.JPG" width="600px" style="float:left;margin-left:320px;">

                                    </a>
                                </div>
                            </div>
                            <div class="text">
                                <blockquote>
                                    <p>
                                        大雨落幽燕，白浪滔天，秦皇岛外打鱼船，一片汪洋都不见，知向谁边<br>
                                        往事越千年，魏武挥鞭，东临碣石有遗篇，萧瑟秋风今又是，换了人间。
                                    </p>
                                    <p>2017.11.2 &nbsp 南京</p>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                    <div class="fed_back">
                        <div class="tag" style="width: 191px">
                            <span class="opti">摄影</span>
                            <span class="opti">生活</span>
                            <span class="opti">行路</span>
                        </div>
                        <div class="comment">
                            <span class="opti">热度（46）</span>
                            <span class="opti_c">评论</span>
                            <span class="opti">转发</span>
                            <span class="opti" style="margin-left: -5px;margin-top: -18px">
                                        <a>
                                            <img src="./img/like_unclicked.png" class="like_u">
                                            <img src="./img/like_clicked.png"  style="display: none;" class="like_c">
                                        </a>
                                    </span>
                        </div>
                    </div>
                    <div class="comment_bar1" style="display:none;">
                                <span class="opti" style="margin-left: 20px;">
                                    <a>
                                        <img src="./img/IMG_7965.JPG" width="65px" style="border-radius:50%;" onclick="other_user_info()">
                                    </a>
                                </span>
                        <div class="m_txt1">
                            <div class="m_content">色彩把握的不错。</div>
                        </div>
                    </div>
                    <div class="comment_bar" style="display: none;">
                        <div class="c_input" contenteditable="true">
                        </div>
                        <input type="submit" value="发布" class="c_button">
                    </div>
                </div>
            </div>
        </div>
        <div class="list">
            <div class="portrait">
                <a target="_blank">
                    <img src="img/IMG_0004.JPG" width="65px">
                </a>
            </div>
            <div class="content">
                <div class="talk_h"></div>
                <div class="talk_body">
                    <div class="work">
                        <div class="cnt">
                            <div style="opacity:1;float:left;width:50%;padding-left:20px;box-sizing:border-box;text-align:center;">
                                <div class="pic" style="margin-top:10px;margin-left:-350px;max-height: 250px;width: 300%">
                                    <a href="#" hidefocus="true" style="width: 100%;">
                                        <img src="./img/IMG_0006.JPG" width="250px">
                                    </a>
                                </div>
                            </div>
                            <div class="text">
                                <blockquote>
                                    <p>
                                        大雨落幽燕，白浪滔天，秦皇岛外打鱼船，一片汪洋都不见，知向谁边<br>
                                        往事越千年，魏武挥鞭，东临碣石有遗篇，萧瑟秋风今又是，换了人间。
                                    </p>
                                    <p>2017.11.2 &nbsp 南京</p>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                    <div class="fed_back">
                        <div class="tag" style="width: 191px">
                            <span class="opti">摄影</span>
                            <span class="opti">生活</span>
                            <span class="opti">行路</span>
                        </div>
                        <div class="comment">
                            <span class="opti">热度（46）</span>
                            <span class="opti_c">评论</span>
                            <span class="opti">转发</span>
                            <span class="opti" style="margin-left: -5px;margin-top: -18px">
                                        <a>
                                            <img src="./img/like_unclicked.png" class="like_u">
                                            <img src="./img/like_clicked.png"  style="display: none;" class="like_c">
                                        </a>
                                    </span>
                        </div>
                    </div>
                    <div class="comment_bar1" style="display:none;">
                                <span class="opti" style="margin-left: 20px;">
                                    <a>
                                        <img src="./img/IMG_7965.JPG" width="65px" style="border-radius:50%;" onclick="other_user_info()">
                                    </a>
                                </span>
                        <div class="m_txt1">
                            <div class="m_content">色彩把握的不错。</div>
                        </div>
                    </div>
                    <div class="comment_bar" style="display: none;">
                        <div class="c_input" contenteditable="true">
                        </div>
                        <input type="submit" value="发布" class="c_button">
                    </div>
                </div>
            </div>
        </div>
        <div class="list1" style="display: none;">
            <div class="portrait">
                <a target="_blank">
                    <img src="img/IMG_0004.JPG" width="65px">
                </a>
            </div>
            <div class="content">
                <div class="talk_h"></div>
                <div class="talk_body">
                    <div class="work">
                        <div class="cnt">
                            <div style="min-width: 100%;min-height:500px;margin-left:-85px;">
                                <div  class="picbig" style="margin-top:10px;cursor: hand;width: 350%;">
                                    <a hidefocus="true" style="width: 300%;">
                                        <img src="./img/IMG_0006.JPG" width="600px" style="float:left;margin-left:320px;">

                                    </a>
                                </div>
                            </div>
                            <div class="text">
                                <blockquote>
                                    <p>
                                        大雨落幽燕，白浪滔天，秦皇岛外打鱼船，一片汪洋都不见，知向谁边<br>
                                        往事越千年，魏武挥鞭，东临碣石有遗篇，萧瑟秋风今又是，换了人间。
                                    </p>
                                    <p>2017.11.2 &nbsp 南京</p>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                    <div class="fed_back">
                        <div class="tag" style="width: 191px">
                            <span class="opti">摄影</span>
                            <span class="opti">生活</span>
                            <span class="opti">行路</span>
                        </div>
                        <div class="comment">
                            <span class="opti">热度（46）</span>
                            <span class="opti_c">评论</span>
                            <span class="opti">转发</span>
                            <span class="opti" style="margin-left: -5px;margin-top: -18px">
                                        <a>
                                            <img src="./img/like_unclicked.png" class="like_u">
                                            <img src="./img/like_clicked.png"  style="display: none;" class="like_c">
                                        </a>
                                    </span>
                        </div>
                    </div>
                    <div class="comment_bar1" style="display:none;">
                                <span class="opti" style="margin-left: 20px;">
                                    <a>
                                        <img src="./img/IMG_7965.JPG" width="65px" style="border-radius:50%;" onclick="other_user_info()">
                                    </a>
                                </span>
                        <div class="m_txt1">
                            <div class="m_content">色彩把握的不错。</div>
                        </div>
                    </div>
                    <div class="comment_bar" style="display: none;">
                        <div class="c_input" contenteditable="true">
                        </div>
                        <input type="submit" value="发布" class="c_button">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="side" class="side_bar" style="margin-left: -100px;margin-top: 42px;">
        <div class="a_card">
            <div style="height: 20px;"></div>
            <div class="p_head">
                            <span class="opti" style="margin-left: 2px;">
                                <a>
                                    <img src="./img/IMG_7965.JPG" width="65px" style="border-radius:50%;">
                                </a>
                            </span>
                <span class="opti">
                                <a class="a_tag">
                                    <span style="margin-left: 0px;margin-right: 0px;">·找我拍</span>
                                </a>
                            </span>
            </div>

            <div>
                            <span class="opti">
                                <a class="a_tag" style="width: 80px;margin-left: 10px;font-size: 15px;color: #222222;">
                                    <span style="margin-left: 0px;margin-right: 0px;"><img src="./img/location.png"></span>
                                    <span style="margin-left: 0px;margin-right: 20px;">南京</span>
                                    <span style="margin-left: 10px;margin-right: 20px;">拍一次</span>
                                    <span style="margin-left: 10px;margin-right: 20px;">50/次</span>
                                    <span style="margin-left: 10px;margin-right: 20px;">评分：4.9</span>
                                </a>
                            </span>
            </div>

            <div class="announce_des">
                <p style="text-align: left;margin-left: 25px">专长：人像/静物</p>
            </div>
            <div class="announce_des">
                <p style="text-align: left;margin-left: 25px">两年摄影经验</p>
            </div>
        </div>
        <div class="a_card">
            <div style="height: 20px;"></div>
            <div class="p_head">
                            <span class="opti" style="margin-left: 2px;">
                                <a>
                                    <img src="./img/IMG_7965.JPG" width="65px" style="border-radius:50%;">
                                </a>
                            </span>
                <span class="opti">
                                <a class="a_tag">
                                    <span style="margin-left: 0px;margin-right: 0px;">·找我拍</span>
                                </a>
                            </span>
            </div>

            <div>
                            <span class="opti">
                                <a class="a_tag" style="width: 80px;margin-left: 10px;font-size: 15px;color: #222222;">
                                    <span style="margin-left: 0px;margin-right: 0px;"><img src="./img/location.png"></span>
                                    <span style="margin-left: 0px;margin-right: 20px;">南京</span>
                                    <span style="margin-left: 10px;margin-right: 20px;">拍一次</span>
                                    <span style="margin-left: 10px;margin-right: 20px;">50/次</span>
                                    <span style="margin-left: 10px;margin-right: 20px;">评分：4.9</span>
                                </a>
                            </span>
            </div>

            <div class="announce_des">
                <p style="text-align: left;margin-left: 25px">专长：人像/静物</p>
            </div>
            <div class="announce_des">
                <p style="text-align: left;margin-left: 25px">两年摄影经验</p>
            </div>
        </div>
        <div class="a_card">
            <div style="height: 20px;"></div>
            <div class="p_head">
                            <span class="opti" style="margin-left: 2px;">
                                <a>
                                    <img src="./img/IMG_7965.JPG" width="65px" style="border-radius:50%;">
                                </a>
                            </span>
                <span class="opti">
                                <a class="a_tag">
                                    <span style="margin-left: 0px;margin-right: 0px;">·找我拍</span>
                                </a>
                            </span>
            </div>

            <div>
                            <span class="opti">
                                <a class="a_tag" style="width: 80px;margin-left: 10px;font-size: 15px;color: #222222;">
                                    <span style="margin-left: 0px;margin-right: 0px;"><img src="./img/location.png"></span>
                                    <span style="margin-left: 0px;margin-right: 20px;">南京</span>
                                    <span style="margin-left: 10px;margin-right: 20px;">拍一次</span>
                                    <span style="margin-left: 10px;margin-right: 20px;">50/次</span>
                                    <span style="margin-left: 10px;margin-right: 20px;">评分：4.9</span>
                                </a>
                            </span>
            </div>

            <div class="announce_des">
                <p style="text-align: left;margin-left: 25px">专长：人像/静物</p>
            </div>
            <div class="announce_des">
                <p style="text-align: left;margin-left: 25px">两年摄影经验</p>
            </div>
        </div>
        <div class="a_card">
            <div style="height: 20px;"></div>
            <div class="p_head">
                            <span class="opti" style="margin-left: 2px;">
                                <a>
                                    <img src="./img/IMG_7965.JPG" width="65px" style="border-radius:50%;">
                                </a>
                            </span>
                <span class="opti">
                                <a class="a_tag">
                                    <span style="margin-left: 0px;margin-right: 0px;">·找我拍</span>
                                </a>
                            </span>
            </div>

            <div>
                            <span class="opti">
                                <a class="a_tag" style="width: 80px;margin-left: 10px;font-size: 15px;color: #222222;">
                                    <span style="margin-left: 0px;margin-right: 0px;"><img src="./img/location.png"></span>
                                    <span style="margin-left: 0px;margin-right: 20px;">南京</span>
                                    <span style="margin-left: 10px;margin-right: 20px;">拍一次</span>
                                    <span style="margin-left: 10px;margin-right: 20px;">50/次</span>
                                    <span style="margin-left: 10px;margin-right: 20px;">评分：4.9</span>
                                </a>
                            </span>
            </div>

            <div class="announce_des">
                <p style="text-align: left;margin-left: 25px">专长：人像/静物</p>
            </div>
            <div class="announce_des">
                <p style="text-align: left;margin-left: 25px">两年摄影经验</p>
            </div>
        </div>
    </div>
</div>

</body>
</html>
