<%--
  Created by IntelliJ IDEA.
  User: 曹畅
  Date: 2017/11/20
  Time: 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>消息</title>
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
                    <li><a href="find_a_partner.jsp" >约拍</a></li>
                    <li><a href="talk.jsp" >关注</a></li>
                    <li><a href="mine.jsp" style="border-bottom-color:#fff">消息</a></li>
                </ul>
            </div>
        </div>
        <div style="height: 15px;"></div>
        <div class="wall" style="text-align: center;">
            <div class="m_wall">
                <div class="m_header">
                    <h2>
                        <span>
                            <a class="m_a1" style="font-weight: bolder">询问</a>
                            <a class="m_a1">通知</a>
                            <a class="m_a1">问候</a>
                        </span>
                        <span>CC</span>
                    </h2>
                </div>
                <div class="m_body">
                    <li>
                        <div class="inner_list">
                            <div class="m_tag">
                                <div class="m_pic">
                                    <a href="other_index.jsp" target="_blank">
                                        <img src="./img/IMG_0004.JPG" width="64" height="64">
                                    </a>
                                    <span class="m_new"><img src="./img/new.png"></span>
                                </div>
                            </div>
                            <div class="m_txt">
                                <div class="m_content">张三揭榜您的公告</div>
                            </div>
                            <div class="m_action">
                                <span class="m_btn">
                                    <a>同意</a>
                                </span>
                                <span class="m_btn">
                                    <a>拒绝</a>
                                </span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="inner_list">
                            <div class="m_tag">
                                <div class="m_pic">
                                    <a>
                                        <img src="./img/IMG_0022.JPG" width="64" height="64">
                                    </a>
                                    <span class="m_new"><img src="./img/new.png"></span>
                                </div>
                            </div>
                            <div class="m_txt">
                                <div class="m_content">李四同意您的揭榜<br>联系方式：12345678987</div>
                            </div>
                        </div>
                    </li>
                </div>
            </div>
        </div>

    </body>
</html>
