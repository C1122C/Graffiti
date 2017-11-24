<%--
  Created by IntelliJ IDEA.
  User: 曹畅
  Date: 2017/11/7
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>看图</title>
    <meta name="keywords" content="摄影，图片">
    <meta charset="utf-8">
    <meta name="description" content="晒出你的图片来">
    <link href="./CSS/user.css" rel="stylesheet">
    <script src="./js/picture.js"></script>
    <script src="./js/user.js"></script>
    <script src="./js/jquery-3.2.1.js"></script>
    <script type="text/javascript">
        window.onload=function(){
            hot_pic_user();
        };
        $(document).ready(function(){

            $(".like_u").click(function(){
                $(this).hide();
                $(this).siblings().show();
                thumb();
            });

            $(".like_c").click(function(){
                $(this).hide();
                $(this).siblings().show();
                cancle_thumb();
            });

            $(".like_num_c").click(function(){
                $(this).parent().parent().find(".comment_bar1").toggle();
                $(this).parent().parent().find(".comment_bar").toggle();
            });

            $(".c_button").click(function(){
                var content=$(this).parent().find(".c_input").value;
                if(content==""||content==null){
                    alert("请填写评论");
                }
                else{
                    comment(content);
                }
                $(this).parent().hide();
            });

            $(".c_input").blur(function(){
                $(this).parent().hide();
            });

            $(".follow_button").click(function(){
                $(this).parent().find(".disfollow_btn").show();
                $(this).hide();
                follow();
            });

            $(".disfollow_btn").click(function(){
                $(this).parent().find(".follow_button").show();
                $(this).hide();
                unfollow();
            });

        });

    </script>
</head>
<body>
<div class="v_headbar">
    <span class="logo"><a href="index.jsp"></a> </span>
    <div class="v_topbar">
        <ul class="v_top_ul">
            <li><a href="user_index.jsp">首页</a></li>
            <li><a href="user_scan.jsp"   style="border-bottom-color:#fff">看图</a></li>
            <li><a href="i_pie.jsp">爱拍</a></li>
            <li><a href="find_a_partner.jsp" >约拍</a></li>
            <li><a href="talk.jsp" >关注</a></li>
            <li><a href="mine.jsp">消息</a></li>
        </ul>
    </div>
</div>
<div style="height: 15px;"></div>
<div class="search_bar">
    <form id="search">
        <input type="text" class="input_text" id="u_s_input" placeholder="  输入分类、作者或描述查找图片"/>
        <input type="submit" class="input_button" onclick="check()" value=""/>
    </form>
</div>
<div id="wall_body" class="wall">
    <div class="col0" id="u_s_col0">
        <div class="card" id="card1">
            <div style="height: 20px;"></div>
            <div class="p_head">
                    <span class="opti" style="margin-left: 2px;">
                        <a>
                            <img src="./img/IMG_7965.JPG" width="65px" style="border-radius:50%;" onclick="other_user_info()">
                        </a>
                    </span>
                    <span class="opti">
                        <a class="follow_button" style="width: 80px;margin-left: 10px;">
                            <span style="margin-left: 0px;margin-right: 0px;"><img src="./img/add.png"></span>
                            <span style="margin-left: 0px;margin-right: 0px;">关</span>
                            <span style="margin-left: 5px;margin-right: 0px;">注</span>
                        </a>
                        <a class="disfollow_btn" style="width: 110px;margin-left: 10px;display: none;">
                            <span class="unfollow_txt1">取</span>
                            <span class="unfollow_txt1">消</span>
                            <span class="unfollow_txt1">关</span>
                            <span class="unfollow_txt1">注</span>
                        </a>
                    </span>
            </div>
            <div class="img" onclick="">
                <img src="./img/IMG_0004.JPG"  width="300"/>
            </div>
            <div class="des">
                <div class="words">
                    <p style="text-align: left;margin-left: 25px">暗香浮动</p>
                </div>
            </div>
            <div class="like" style="with:100%;min-height: 65px;">
                <div class="like_icon" style="float: left;">
                    <a>
                        <img src="./img/like_unclicked.png" class="like_u">
                        <img src="./img/like_clicked.png"  style="display: none;" class="like_c">
                    </a>
                </div>
                <div class="like_num" style="float: left;"><p>266人喜欢</p></div>
                <div class="like_num_c" style="float: left;margin-left: 90px;margin-right:10px;margin-top: 18px;cursor: hand;">评论</div>
                <div class="like_num" style="float: left;margin-top: 18px;"><a>转发</a></div>
            </div>
            <div class="comment_bar1" style="display:none;width: 100%;margin-left: 0px;min-height: 40px;">
                <span class="opti" style="margin-left: 20px;float: left;">
                    <a>
                        <img src="./img/IMG_7965.JPG" width="30px" style="border-radius:50%;" onclick="other_user_info()">
                    </a>
                </span>
                <div class="m_txt1" style="width: 250px;margin-top: 0px">
                    <div class="m_content">色彩把握的不错。</div>
                </div>
            </div>
            <div class="comment_bar" style="display: none;width: 100%; margin-left: 0px;">
                <div class="c_input" style="margin-left:4px;width:250px;min-height:15px;line-height:15px;" id="c1" contenteditable="true">
                </div>
                <input type="submit" style="font-size: 14px;font-weight: normal;width:50px;height:34px;margin-top: -30px;" value="发布" class="c_button">
            </div>
        </div>
    </div>
    <div class="col1" id="u_s_col1">

    </div>
    <div class="col2" id="u_s_col2">

    </div>
</div>
</body>
</html>
