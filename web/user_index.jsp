<%--
  Created by IntelliJ IDEA.
  User: 曹畅
  Date: 2017/10/25
  Time: 0:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Graffiti</title>
        <meta name="keywords" content="摄影，图片">
        <meta charset="utf-8">
        <meta name="description" content="晒出你的图片来">
        <link href="./CSS/user.css" rel="stylesheet">
        <script src="./js/user.js"></script>
        <script src="./js/picture.js"></script>
        <script src="./js/jquery-3.2.1.js"></script>
        <script type="text/javascript">
            window.onload=function(){
                user_index();
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
                    follow();
                });

                $(".disfollow_btn").click(function(){
                    $(this).parent().find(".follow_button").show();
                    $(this).hide();
                    unfollow();
                });

            });
        </script>
    </head>
    <body>
        <div class="v_headbar">
            <span class="logo"><a href="index.jsp"></a> </span>
            <div class="v_topbar">
                <ul class="v_top_ul">
                    <li><a href="user_index.jsp" style="border-bottom-color:#fff">首页</a></li>
                    <li><a href="user_scan.jsp" >看图</a></li>
                    <li><a href="i_pie.jsp">爱拍</a></li>
                    <li><a href="find_a_partner.jsp" >约拍</a></li>
                    <li><a href="talk.jsp" >关注</a></li>
                    <li><a href="mine.jsp">消息</a></li>
                </ul>
            </div>
        </div>

        <div class="wall">
            <div id="index_main" class="main_b">
                <div id="inform" class="inform_div">
                    <div id="inform_window" class="inform_w">
                       <div class="inform_tag">
                           <div class="inform_title" style="display: block">
                               <span class="letter"><img src="./img/letter.png" width="30px"></span>
                               <h3>新消息</h3>
                           </div>
                           <div class="inform_body" style="display:block;">
                               <ul class="i_ul">
                                   <li id="inform_title">
                                       <a href="mine.jsp">1条通知</a>
                                       <a href="mine.jsp">1条询问</a>
                                   </li>
                               </ul>
                           </div>
                       </div>
                    </div>
                </div>
                <div class="list">
                    <div class="portrait">
                        <a href="other_index.jsp" target="_blank">
                            <img src="img/IMG_0004.JPG" width="65px" onclick="other_user_info()">
                        </a>
                    </div>
                    <div class="content">
                        <div class="talk_h"></div>
                        <div class="talk_body">
                            <div class="work">
                                <div class="cnt">
                                    <div style="opacity:1;float:left;width:50%;padding-left:20px;box-sizing:border-box;text-align:center;">
                                        <div  class="pic" style="margin-top:10px;margin-left:-350px;max-height: 250px;width: 300%;cursor: hand;">
                                            <a hidefocus="true" style="width: 100%;">
                                                <img src="./img/IMG_0006.JPG" width="250px">
                                            </a>
                                        </div>
                                        <ol style="display: none;cursor: hand;z-index: 20;min-width: 500px;min-height: 500px;">
                                            <li>
                                                <div class="picbig" style="cursor: hand;">
                                                    <a href="#" hidefocus="true">
                                                        <img src="./img/IMG_0006.JPG" width="500px" style="overflow: visible;">
                                                    </a>
                                                </div>
                                                <p></p>
                                            </li>
                                        </ol >
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
                        <a href="other_index.jsp" target="_blank">
                            <img src="img/IMG_0004.JPG" width="65px" onclick="other_user_info()">
                        </a>
                    </div>
                    <div class="content">
                        <div class="talk_h"></div>
                        <div class="talk_body1">
                            <div class="work1">
                                <div class="cnt">
                                    <div style="min-width: 100%;min-height:500px;margin-left:-85px;">
                                        <div  class="picbig" style="margin-top:10px;cursor: hand;width: 350%;">
                                            <a hidefocus="true" style="width: 300%;">
                                                <img src="./img/IMG_0006.JPG" width="600px" style="float:left;margin-left:320px;">

                                            </a>
                                        </div>
                                    </div>
                                    <div class="text" style="width: 100%;margin-left:-85px;">
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
                            <div class="comment_bar" style="display: none;">
                                <div class="c_input" contenteditable="true">
                                </div>
                                <input type="submit" value="发布" class="c_button">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="side" class="side_bar">
                <div class="g_box">
                    <div class="menum">
                        <ul style="list-style: none">
                            <li style="border-color: #b2b2b2;">
                                <a href="mine.jsp" class="mi">
                                    <span class="txt">
                                        <img src="./img/ask_s.png">
                                    </span>
                                    <span class="txt">询问</span>
                                    <span class="new_inf">
                                        <img src="./img/new.png">
                                    </span>
                                </a>
                            </li>
                            <li style="border-color: #b2b2b2;">
                                <a href="mine.jsp" class="mi">
                                    <span class="txt">
                                        <img src="./img/inform.png">
                                    </span>
                                    <span class="txt">通知</span>
                                    <span class="new_inf">
                                        <img src="./img/new.png">
                                    </span>
                                </a>
                            </li>
                            <li style="border-color: #b2b2b2;">
                                <a href="user_info_mod.jsp" class="mi">
                                    <span class="txt">
                                        <img src="./img/person.png">
                                    </span>
                                    <span class="txt">个人信息修改</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="guess_like">
                    <div class="txt1"><span>猜你喜欢</span></div>
                    <div>
                        <div class="like_head">
                            <a href="" target="_blank" class="por">
                                <img src="./img/IMG_7965.JPG" width="100px" onclick="other_user_info()">
                            </a>
                            <div style="height: 35px"></div>
                            <a href=""style="margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;" onclick="other_user_info()">琪琪</a>
                        </div>
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
                </div>
                <div class="guess_like">
                    <div class="txt1"><span>猜你喜欢</span></div>
                    <div>
                        <div class="like_head">
                            <a href="" target="_blank" class="por">
                                <img src="./img/IMG_0178.JPG" width="100px" onclick="other_user_info()">
                            </a>
                            <div style="height: 35px"></div>
                            <a href=""style="margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;" onclick="other_user_info()">橙子</a>
                        </div>
                        <a class="follow_button" onclick="follow()">
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
                </div>
                <div class="guess_like">
                    <div class="txt1"><span>猜你喜欢</span></div>
                    <div>
                        <div class="like_head">
                            <a href="" target="_blank" class="por">
                                <img src="./img/IMG_0024.JPG" width="100px" onclick="other_user_info()">
                            </a>
                            <div style="height: 35px"></div>
                            <a href=""style="margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;" onclick="other_user_info()">双黄蛋</a>
                        </div>
                        <a class="follow_button" onclick="follow()">
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
                </div>
            </div>
        </div>

    </body>
</html>
