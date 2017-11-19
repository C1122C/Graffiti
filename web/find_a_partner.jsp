<%--
  Created by IntelliJ IDEA.
  User: 曹畅
  Date: 2017/11/19
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>约拍</title>
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
                    <li><a href="i_pie.jsp">爱拍</a></li>
                    <li><a href="find_a_partner.jsp"  style="border-bottom-color:#fff">约拍</a></li>
                    <li><a href="talk.jsp" >关注</a></li>
                    <li><a href="mine.jsp">我的</a></li>
                </ul>
            </div>
        </div>
        <div style="height: 20px;"></div>
        <div class="wall">
            <div style="height: 60px;width:70%;margin-left: 120px;margin-bottom:0px;opacity: 4;background-color: #222;z-index: 5;">
                <div class="search_win">
                    <select class="select_bar" style="width: 160px">
                        <option>请你拍</option>
                        <option>找我拍</option>
                    </select>
                </div>
                <div class="search_win">
                    <select class="select_bar" style="width: 160px">
                        <option>拍一次</option>
                        <option>长期合作</option>
                    </select>
                </div>
                <div class="search_win"><input maxlength="20" placeholder="要求" style="width: 200px;background-color: #fff;border-width: 0px;"></div>
                <div style="float: right;border-width: 0px;"><button class="pub_button" style="float: left;margin-left: 20px;margin-top: 10px;border-radius: 5px;border-width: 0px;"><span>搜 索</span></button></div>
            </div>
            <div style="height: 160px;width:70%;margin-left: 120px;margin-top:-15px;background-color: #fff;z-index: 6;border-top-width: 0;">
                <div class="search_down">
                    <div class="search_tip"><span>位 置: </span></div>
                    <input maxlength="20" placeholder="我的位置" style="width: 200px;">
                </div>
                <div class="search_down">
                    <div class="search_tip"><span>费 用 范 围: </span></div>
                    <input maxlength="10" style="width: 70px;">
                    <div class="search_tip" style="margin-top: 15px;"><span> — </span></div>
                    <input maxlength="10" style="width: 70px;">
                </div>
                <div class="search_down">
                    <div class="search_tip"><span>评 分 范 围: </span></div>
                    <input maxlength="10" style="width: 70px;">
                    <div class="search_tip" style="margin-top: 15px;"><span> — </span></div>
                    <input maxlength="10" style="width: 70px;">
                </div>
            </div>
            <div style="width:70%;margin-left: 120px;margin-top:15px;">
                <a href="announce_create.jsp"><button class="pub_button" style="float: left;border-radius: 5px;"><span>新 公 告</span></button></a>
                <button class="pub_button" style="float: left;border-radius: 5px;"><span>我 发 布 的</span></button>
                <button class="pub_button" style="float: left;border-radius: 5px;"><span>我 参 与 的</span></button>
            </div>
            <div class="wall">
                <div class="announce_col" style="margin-left: 120px;">
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
                        <div class="fed_back">
                            <input type="submit" style="font-size: 18px;font-weight: 600;width:80px;height:30px;float:right;margin-right: 20px;border-radius: 5px;" value="修 改" class="c_button">
                            <input type="submit" value="删 除" class="a_cancle_btn">
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
                        <div class="fed_back">
                            <input type="submit" style="font-size: 18px;font-weight: 600;width:80px;height:30px;float:right;margin-right: 20px;border-radius: 5px;" value="揭 榜" class="c_button">
                        </div>
                    </div>
                </div>
                <div class="announce_col" style="margin-left: -10px;">
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
                        <div class="fed_back">
                            <input type="submit" style="font-size: 18px;font-weight: 600;width:80px;height:30px;float:right;margin-right: 20px;border-radius: 5px;" value="揭 榜" class="c_button">
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
                        <div class="fed_back">
                            <span class="opti" style="margin-top:-10px;">
                                <a class="a_tag">
                                    <span style="margin-left: -10px;margin-right: 0px;">活动评分(1~5)：</span>
                                </a>
                            </span>
                            <div class="c_input"style="margin-left:35px;width:30px;min-height:15px;line-height:15px;" contenteditable="true">
                            </div>
                            <input type="submit" style="font-size: 18px;font-weight: 600;width:80px;height:30px;float:right;margin-right: 20px;border-radius: 5px;" value="确 定" class="c_button">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
