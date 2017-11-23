<%--
  Created by IntelliJ IDEA.
  User: 曹畅
  Date: 2017/10/19
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
    <head>
        <title>Graffiti</title>
        <meta name="keywords" content="摄影，图片">
        <meta charset="utf-8">
        <meta name="description" content="晒出你的图片来">
        <link href="./CSS/Index.css" rel="stylesheet">
        <script src="./js/user.js"></script>
        <script type="text/javascript">
            function check(){
                var username = document.getElementById("account").value;
                var password = document.getElementById("password").value;
                var goon=1;
                if (username==null || username=="") {
                    alert("请输入用户名");
                    goon=0;
                }
                else if (password==null || password=="") {
                    alert("请输入密码");
                    goon=0;
                }
                if(goon==1){
                    logcheck(username,password);
                }
            }
        </script>
    </head>

    <body>
        <div class="icon">
            <img src="./img/login-logo.png" height="120px" width="350px">
        </div>
        <div class="log-pan">
            <div style="height: 30px;"></div>
            <div class="log-input" style="margin-top: 50px;">
                <span class="fon">账号</span>
                <span><input id="account" type="text"/> </span>
            </div>
            <div class="log-input">
                <span class="fon">密码</span>
                <span><input id="password" type="password"/> </span>
            </div>
            <div class="log-button">
                <span><a href="register.jsp"><input id="reg-button" class="fon" value="注册" type="button"/></a></span>
                <span><a href="visit_scan.jsp"><input id="visit-button" class="fon" value="游览" type="button"/></a></span>
                <span><a href="user_index.jsp"><input id="login-button" class="fon" value="登录" type="button" onclick="check()"/></a></span>
            </div>
        </div>
    </body>
</html>
