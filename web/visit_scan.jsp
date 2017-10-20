<%--
  Created by IntelliJ IDEA.
  User: 曹畅
  Date: 2017/10/20
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Graffiti 游客看图</title>
    <meta name="keywords" content="摄影，图片">
    <meta charset="utf-8">
    <meta name="description" content="晒出你的图片来">
    <link href="./CSS/visit.css" rel="stylesheet">
</head>
<body>
    <div class="v_headbar">
        <h1 class="logo"><a href="index.jsp"></a> </h1>
        <div class="v_topbar">
            <ul class="v_top_ul">
                <li><a href="index.jsp">首页</a></li>
                <li class="selected"><a href="visit_scan.jsp">看图</a></li>
                <li><a href="">找图</a></li>
            </ul>
        </div>
    </div>

    <div id="wall_body">
        <div class="col0"></div>
        <div class="col1"></div>
        <div class="col2"></div>
        <div class="col3"></div>
    </div>
</body>
</html>
