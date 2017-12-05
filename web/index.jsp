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
        function check() {
            var id=document.getElementById("account");
            var pwd=document.getElementById("password");
            var can=true;
            if(id==null||id=="") {
                alert("请输入用户名");
                can=false;
            }
            else if(pwd==null||pwd==""){
                alert("请输入密码");
                can=false;
            }
            if(can==true){
                login(id,pwd);
            }

        };
    </script>
</head>

<body>
<div class="icon">
    <img src="./img/login-logo.png" height="120px" width="350px">
</div>
<div class="log-pan">
    <form action="./controller/login.php" method="post">
        <div style="height: 30px;"></div>
        <div class="log-input" style="margin-top: 50px;">
            <span class="fon">账号</span>
            <span><input id="account" name="account" type="text"/> </span>
        </div>
        <div class="log-input">
            <span class="fon">密码</span>
            <span><input id="password" type="password" name="pwd"/> </span>
        </div>
        <div class="log-button">
            <span><a href="./register.jsp"><input id="reg-button" class="fon" value="注册" type="button"/></a></span>
            <span><a href="./user_index.jsp"><input id="login-button" class="fon" value="登录" onclick="check()" type="button" /></a></span>
        </div>
    </form>
</div>
</body>
</html>
