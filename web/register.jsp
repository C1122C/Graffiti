<%--
  Created by IntelliJ IDEA.
  User: 曹畅
  Date: 2017/12/4
  Time: 23:44
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
    <script src="./js/user.js"></script>
    <script type="text/javascript">
        function check(){
            var username = document.getElementById("uname").value;
            var password = document.getElementById("upassword").value;
            var special=document.getElementById("uspecial").value;
            var interest=document.getElementById("uinterest").value;
            var location=document.getElementById("ulocation").value;
            var contact=document.getElementById("ucontact").value;
            var description=document.getElementById("des").value;
            var goon=0;
            if (username==null || username=="") {
                alert("请输入用户名");
            }
            else if (password==null || password=="") {
                alert("请输入密码");
            }
            else if(special==null || special==""){
                alert("请输入专长");
            }
            else if(interest==null || interest==""){
                alert("请输入兴趣");
            }
            else if(location==null || location==""){
                alert("请输入位置");
            }
            else if(contact==null || contact==""){
                alert("请输入联系方式");
            }
            else{
                goon=1;
            }
            if(goon==1){
                register(username,password,special,interest,location,contact,description);
            }
        }
    </script>
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
        <textarea name="description" id="des" rows="3" cols="50"></textarea>
    </div>
    <div style="text-align: right; margin-right: 60px">
        <span><a href="js/index.html"><input id="cancle" value="取消" type="button"/></a></span>
        <span><input id="register"  value="注册" type="button" onclick="check()"/></span>
    </div>
</div>
</body>
</html>
