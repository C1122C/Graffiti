<%--
  Created by IntelliJ IDEA.
  User: 曹畅
  Date: 2017/10/20
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册Graffiti</title>
    <meta name="keywords" content="摄影，图片">
    <meta charset="utf-8">
    <meta name="description" content="晒出你的图片来">
    <link href="./CSS/Index.css" rel="stylesheet">
</head>
<body>
    <div class="reg-pan">
        <div style="height: 20px;"></div>
        <div class="reg-input">
            <div style="margin-top: 15px">
                <span class="reg-fon">昵称</span>
                <span class="reg-text"><input id="uname" type="text"/></span>
                <span class="reg-fon" style="margin-left: 100px">密码</span>
                <span class="reg-text"><input id="upassword" type="password"/></span>
            </div>
            <div style="margin-top: 15px">
                <span class="reg-fon">专长</span>
                <span class="reg-text"><input id="uspecial" type="text"/></span>
                <span class="reg-fon" style="margin-left: 100px">兴趣</span>
                <span class="reg-text"><input id="uinterest" type="text"/></span>
            </div>
            <div style="margin-top: 15px">
                <span class="reg-fon">位置</span>
                <span class="reg-text"><input id="ulocation" type="text"/></span>
                <span class="reg-fon" style="margin-left: 100px">联系方式</span>
                <span class="reg-text"><input id="ucontact" type="text"/></span>
            </div>

        </div>

        <div class="reg-input">
            <span class="reg-fon">个人说明</span>
        </div>
        <div style="margin-left: 50px;margin-top: 10px;">
            <textarea name="description" rows="3" cols="50"></textarea>
        </div>
        <div style="text-align: right; margin-right: 60px">
            <span><a href="index.jsp"><input id="cancle"  value="取消" type="button"/></a></span>
            <span><input id="register"  value="注册" type="button"/></span>
        </div>
    </div>
</body>
</html>
