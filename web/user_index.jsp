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
                    <li><a href="user_search.jsp">找图</a></li>
                    <li><a href="user_upload.jsp">爱拍</a></li>
                    <li><a href="find_a_partner.jsp" >约拍</a></li>
                    <li><a href="mine.jsp">我的</a></li>
                </ul>
            </div>
        </div>

        <div class="wall">
            <div id="index_main" class="main_b">
                <div id="inform" class="inform_div">
                    <div id="inform_window" class="inform_w">
                       <div class="inform_tag">
                           <div class="inform_title">
                               <span style="background-image: url(./img/letter.png);background-repeat: no-repeat;height: 40px;"></span>
                               <h3>新消息</h3>
                           </div>
                           <div class="inform_body">
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
                            <img src="img/IMG_7965.JPG" width="40px">
                        </a>
                    </div>
                    <div class="content">
                        <div class="talk_h"></div>
                        <div class="talk_body">
                            <div class="work">
                                <div class="cnt">
                                    <div>
                                        <div class="pic" style="height: 250px;">
                                            <a href="#" hidefocus="true">
                                                <img src="./img/IMG_0004.JPG" width="164px">
                                            </a>
                                        </div>
                                        <ol style="display: none">
                                            <li>
                                                <div class="pic">
                                                    <a href="#" hidefocus="true">
                                                        <img src="./img/IMG_0004.JPG" width="500px">
                                                    </a>
                                                </div>
                                                <div><a onclick="" class="clickBig">查看大图</a> </div>
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
                                    <div class="text" style="display: block">
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
                                    <span class="opti">热度（111）</span>
                                    <span class="opti"><a>评论</a></span>
                                    <span class="opti"><a class="add_like"></a></span>
                                </div>
                            </div>
                            <div class="c_body">
                                <div>
                                    <div class="shadow"></div>
                                    <div class="c_min">
                                        <div>
                                            <div class="c_input" maxlength="200" contenteditable="true"></div>
                                            <button class="c_button"></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list">
                    <div class="portrait">
                        <a href="" target="_blank">
                            <img src="img/IMG_7965.JPG" width="40px">
                        </a>
                    </div>
                    <div class="content">
                        <div class="talk_h"></div>
                        <div class="talk_body">
                            <div class="work">
                                <div class="cnt">
                                    <div>
                                        <div class="pic" style="height: 250px;">
                                            <a href="#" hidefocus="true">
                                                <img src="./img/IMG_0004.JPG" width="164px">
                                            </a>
                                        </div>
                                        <ol style="display: none">
                                            <li>
                                                <div class="pic">
                                                    <a href="#" hidefocus="true">
                                                        <img src="./img/IMG_0004.JPG" width="500px">
                                                    </a>
                                                </div>
                                                <div><a onclick="" class="clickBig">查看大图</a> </div>
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
                                    <div class="text" style="display: block">
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
                                    <span class="opti">热度（111）</span>
                                    <span class="opti"><a>评论</a></span>
                                    <span class="opti"><a class="add_like"></a></span>
                                </div>
                            </div>
                            <div class="c_body">
                                <div>
                                    <div class="shadow"></div>
                                    <div class="c_min">
                                        <div>
                                            <div class="c_input" maxlength="200" contenteditable="true"></div>
                                            <button class="c_button"></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list">
                    <div class="portrait">
                        <a href="" target="_blank">
                            <img src="img/IMG_7965.JPG" width="40px">
                        </a>
                    </div>
                    <div class="content">
                        <div class="talk_h"></div>
                        <div class="talk_body">
                            <div class="work">
                                <div class="cnt">
                                    <div>
                                        <div class="pic" style="height: 250px;">
                                            <a href="#" hidefocus="true">
                                                <img src="./img/IMG_0004.JPG" width="164px">
                                            </a>
                                        </div>
                                        <ol style="display: none">
                                            <li>
                                                <div class="pic">
                                                    <a href="#" hidefocus="true">
                                                        <img src="./img/IMG_0004.JPG" width="500px">
                                                    </a>
                                                </div>
                                                <div><a onclick="" class="clickBig">查看大图</a> </div>
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
                                    <div class="text" style="display: block">
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
                                    <span class="opti">热度（111）</span>
                                    <span class="opti"><a>评论</a></span>
                                    <span class="opti"><a class="add_like"></a></span>
                                </div>
                            </div>
                            <div class="c_body">
                                <div>
                                    <div class="shadow"></div>
                                    <div class="c_min">
                                        <div>
                                            <div class="c_input" maxlength="200" contenteditable="true"></div>
                                            <button class="c_button"></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="side" class="side_bar">
                <div class="g_box">
                    <div class="menum">
                        <ul>
                            <li style="border-color: #b2b2b2;">
                                <a href="" class="mi">
                                    <span class="ask_icon"></span>
                                    <span class="txt">询问</span>
                                    <span class="new_inf"></span>
                                </a>
                            </li>
                            <li style="border-color: #b2b2b2;">
                                <a href="" class="mi">
                                    <span class="inform_icon"></span>
                                    <span class="txt">通知</span>
                                    <span class="new_inf"></span>
                                </a>
                            </li>
                            <li style="border-color: #b2b2b2;">
                                <a href="" class="mi">
                                    <span class="chat_icon"></span>
                                    <span class="txt">问候</span>
                                    <span class="new_inf"></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="guess_like">
                    <div class="txt"><span>猜你喜欢</span></div>
                    <div>
                        <div class="like_head">
                            <a href="" target="_blank" class="por"><img src="../img/IMG_7956.JPG" width="80px"></a>
                            <a href="">琪琪</a>
                        </div>
                        <a class="follow_button"></a>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
