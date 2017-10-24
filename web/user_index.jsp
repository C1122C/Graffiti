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
                    <li><a href="user_index.jsp" class="selected">首页</a></li>
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

                </div>
            </div>
        </div>

    </body>
</html>
