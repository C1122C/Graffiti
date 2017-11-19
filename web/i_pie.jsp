<%--
  Created by IntelliJ IDEA.
  User: 曹畅
  Date: 2017/11/18
  Time: 23:49
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
    </head>
    <body>
        <div class="v_headbar">
            <span class="logo"><a href="index.jsp"></a> </span>
            <div class="v_topbar">
                <ul class="v_top_ul">
                    <li><a href="user_index.jsp">首页</a></li>
                    <li><a href="user_scan.jsp">看图</a></li>
                    <li><a href="user_upload.jsp"  style="border-bottom-color:#fff">爱拍</a></li>
                    <li><a href="find_a_partner.jsp" >约拍</a></li>
                    <li><a href="talk.jsp" >论坛</a></li>
                    <li><a href="mine.jsp">我的</a></li>
                </ul>
            </div>
        </div>
        <div style="height: 15px;"></div>
        <div style="height: 60px;margin-left: 175px;margin-bottom: 0px;margin-top: 20px">
            <a href="album_create.jsp"><button class="pub_button" style="float: left;margin-left: 50px;"><span>新 相 册</span></button></a>
            <a href="user_upload.jsp"><button class="pub_button" style="float: left;margin-left: 50px;"><span>新 图 片</span></button></a>
        </div>
        <div class="wall">
            <div class="paper">
                <div class="inner_paper">
                    <div class="album">
                        <img src="./img/IMG_0004.JPG" width="180" height="180" style="z-index: 3">
                        <span class="operator"><img src="./img/delete.png"></span>
                        <span>album1</span>
                    </div>
                    <div class="album">
                        <img src="./img/IMG_0004.JPG" width="180" height="180" style="z-index: 3">
                        <span class="operator"><img src="./img/delete.png"></span>
                        <span>album1</span>
                    </div>
                    <div class="album">
                        <img src="./img/IMG_0004.JPG" width="180" height="180" style="z-index: 3">
                        <span class="operator"><img src="./img/delete.png"></span>
                        <span>album1</span>
                    </div>
                    <div class="album">
                        <img src="./img/IMG_0004.JPG" width="180" height="180" style="z-index: 3">
                        <span class="operator"><img src="./img/delete.png"></span>
                        <span>album1</span>
                    </div>
                    <div class="album">
                        <img src="./img/IMG_0004.JPG" width="180" height="180" style="z-index: 3">
                        <span class="operator"><img src="./img/delete.png"></span>
                        <span>album1</span>
                    </div>
                </div>
                <div style="height: 20px;"></div>
            </div>
        </div>
        <div style="height: 15px;"></div>
        <div style="padding-left:100px">
            <div class="main_b" style="margin-left: 100px">
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
            </div>
        </div>
    </body>
</html>
