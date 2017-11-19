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
                    <li><a href="talk.jsp" >论坛</a></li>
                    <li><a href="mine.jsp">我的</a></li>
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
                                   <li>
                                       <a href="">1条通知</a>
                                       <a href="">1条询问</a>
                                       <a href="">5条问候</a>
                                   </li>
                               </ul>
                           </div>
                       </div>
                    </div>
                </div>
                <div class="list">
                    <div class="portrait">
                        <a href="" target="_blank">
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
                                        <ol style="display: none">
                                            <li>
                                                <div class="pic">
                                                    <a href="#" hidefocus="true">
                                                        <img src="./img/IMG_0006.JPG" width="500px">
                                                    </a>
                                                </div>
                                                <div><a onclick="" class="clickBig">查看大图</a></div>
                                                <p></p>
                                            </li>
                                        </ol>
                                    </div>
                                    <div class="text" style="display: none">
                                        <blockquote>
                                            <p>
                                                大雨落幽燕，白浪滔天，秦皇岛外打鱼船，一片汪洋都不见，知向谁边<br>
                                                往事越千年，魏武挥鞭，东临碣石有遗篇，萧瑟秋风今又是，换了人间。
                                            </p>
                                            <p>2017.11.2 &nbsp 南京</p>
                                        </blockquote>
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
                                    <span class="opti" style="margin-left: -5px;margin-top: -18px">
                                        <a>
                                            <img src="./img/like_unclicked.png">
                                        </a>
                                    </span>
                                </div>
                            </div>
                            <div class="fed_back">
                                <div class="c_input" contenteditable="true">
                                </div>
                                <input type="submit" value="发布" class="c_button">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list">
                    <div class="portrait">
                        <a href="" target="_blank">
                            <img src="img/IMG_0006.JPG" width="65px">
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
                                                <img src="./img/IMG_0007.JPG" width="250px">
                                            </a>
                                        </div>
                                        <ol style="display: none">
                                            <li>
                                                <div class="pic">
                                                    <a href="#" hidefocus="true">
                                                        <img src="./img/IMG_0007.JPG" width="500px">
                                                    </a>
                                                </div>
                                                <div><a onclick="" class="clickBig">查看大图</a></div>
                                                <p></p>
                                            </li>
                                        </ol>
                                    </div>
                                    <div class="text" style="display: none">
                                        <blockquote>
                                            <p>
                                                大雨落幽燕，白浪滔天，秦皇岛外打鱼船，一片汪洋都不见，知向谁边<br>
                                                往事越千年，魏武挥鞭，东临碣石有遗篇，萧瑟秋风今又是，换了人间。
                                            </p>
                                            <p>2017.11.2 &nbsp 南京</p>
                                        </blockquote>
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
                                    <span class="opti">热度（281）</span>
                                    <span class="opti" style="margin-left: -5px;margin-top: -18px">
                                        <a>
                                            <img src="./img/like_unclicked.png">
                                        </a>
                                    </span>
                                </div>
                            </div>
                            <div class="fed_back">
                                <div class="c_input" contenteditable="true">
                                </div>
                                <input type="submit" value="发布" class="c_button">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list">
                    <div class="portrait">
                        <a href="" target="_blank">
                            <img src="img/IMG_0007.JPG" width="65px">
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
                                                <img src="./img/IMG_0022.JPG" width="250px">
                                            </a>
                                        </div>
                                        <ol style="display: none">
                                            <li>
                                                <div class="pic">
                                                    <a href="#" hidefocus="true">
                                                        <img src="./img/IMG_0022.JPG" width="500px">
                                                    </a>
                                                </div>
                                                <div><a onclick="" class="clickBig">查看大图</a></div>
                                                <p></p>
                                            </li>
                                        </ol>
                                    </div>
                                    <div class="text" style="display: none">
                                        <blockquote>
                                            <p>
                                                大雨落幽燕，白浪滔天，秦皇岛外打鱼船，一片汪洋都不见，知向谁边<br>
                                                往事越千年，魏武挥鞭，东临碣石有遗篇，萧瑟秋风今又是，换了人间。
                                            </p>
                                            <p>2017.11.2 &nbsp 南京</p>
                                        </blockquote>
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
                                    <span class="opti">热度（220）</span>
                                    <span class="opti" style="margin-left: -5px;margin-top: -18px">
                                        <a>
                                            <img src="./img/like_unclicked.png">
                                        </a>
                                    </span>
                                </div>
                            </div>
                            <div class="fed_back">
                                <div class="c_input" contenteditable="true">
                                </div>
                                <input type="submit" value="发布" class="c_button">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list">
                    <div class="portrait">
                        <a href="" target="_blank">
                            <img src="img/IMG_0022.JPG" width="65px">
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
                                                <img src="./img/IMG_0024.JPG" width="250px">
                                            </a>
                                        </div>
                                        <ol style="display: none">
                                            <li>
                                                <div class="pic">
                                                    <a href="#" hidefocus="true">
                                                        <img src="./img/IMG_0024.JPG" width="500px">
                                                    </a>
                                                </div>
                                                <div><a onclick="" class="clickBig">查看大图</a></div>
                                                <p></p>
                                            </li>
                                        </ol>
                                    </div>
                                    <div class="text" style="display: none">
                                        <blockquote>
                                            <p>
                                                大雨落幽燕，白浪滔天，秦皇岛外打鱼船，一片汪洋都不见，知向谁边<br>
                                                往事越千年，魏武挥鞭，东临碣石有遗篇，萧瑟秋风今又是，换了人间。
                                            </p>
                                            <p>2017.11.2 &nbsp 南京</p>
                                        </blockquote>
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
                                    <span class="opti">热度（189）</span>
                                    <span class="opti" style="margin-left: -5px;margin-top: -18px">
                                        <a>
                                            <img src="./img/like_unclicked.png">
                                        </a>
                                    </span>
                                </div>
                            </div>
                            <div class="fed_back">
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
                                <a href="" class="mi">
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
                                <a href="" class="mi">
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
                                <a href="" class="mi">
                                    <span class="txt">
                                        <img src="./img/chat.png">
                                    </span>
                                    <span class="txt">问候</span>
                                    <span class="new_inf">
                                        <img src="./img/new.png">
                                    </span>
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
                                <img src="./img/IMG_7965.JPG" width="100px">
                            </a>
                            <div style="height: 35px"></div>
                            <a href=""style="margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;">琪琪</a>
                        </div>
                        <a class="follow_button">
                            <span class="fol1"><img src="./img/add.png"></span>
                            <span class="fol1">关</span>
                            <span class="fol1">注</span>
                        </a>
                    </div>
                </div>
                <div class="guess_like">
                    <div class="txt1"><span>猜你喜欢</span></div>
                    <div>
                        <div class="like_head">
                            <a href="" target="_blank" class="por">
                                <img src="./img/IMG_0178.JPG" width="100px">
                            </a>
                            <div style="height: 35px"></div>
                            <a href=""style="margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;">橙子</a>
                        </div>
                        <a class="follow_button">
                            <span class="fol1"><img src="./img/add.png"></span>
                            <span class="fol1">关</span>
                            <span class="fol1">注</span>
                        </a>
                    </div>
                </div>
                <div class="guess_like">
                    <div class="txt1"><span>猜你喜欢</span></div>
                    <div>
                        <div class="like_head">
                            <a href="" target="_blank" class="por">
                                <img src="./img/IMG_0024.JPG" width="100px">
                            </a>
                            <div style="height: 35px"></div>
                            <a href=""style="margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;">双黄蛋</a>
                        </div>
                        <a class="follow_button">
                            <span class="fol1"><img src="./img/add.png"></span>
                            <span class="fol1">关</span>
                            <span class="fol1">注</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
