<%--
  Created by IntelliJ IDEA.
  User: 曹畅
  Date: 2017/12/5
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>票圈</title>
    <meta name="keywords" content="摄影，图片">
    <meta charset="utf-8">
    <meta name="description" content="晒出你的图片来">
    <link href="./CSS/user.css" rel="stylesheet">
    <script src="./js/user.js"></script>
    <script src="./js/jquery-3.2.1.js"></script>
    <script type="text/javascript">
        window.onload=function(){
            my_follow();
        };

        $(document).ready(function(){

            $(".follow_button").click(function(){
                var res=confirm("确定取消关注？")
                if(res==true){
                    $(this).hide();
                    $(this).siblings().show();
                    $(this).parent().find(".follow_button").show();
                    $(this).hide();
                    unfollow($(this).value);
                }
            });

            $("li").click(function(){
                group_change();
            })

        });
    </script>
</head>
<body>
<div class="v_headbar">
    <span class="logo"><a href="./index.jsp"></a> </span>
    <div class="v_topbar">
        <ul class="v_top_ul">
            <li><a href="./user_index.jsp">首页</a></li>
            <li><a href="./user_scan.jsp" >看图</a></li>
            <li><a href="./i_pie.jsp">爱拍</a></li>
            <li><a href="./find_a_partner.jsp" >约拍</a></li>
            <li><a href="./talk.jsp"  style="border-bottom-color:#fff">关注</a></li>
            <li><a href="./mine.jsp">消息</a></li>
        </ul>
    </div>
</div>
<div class="wall">
    <div class="t_board">
        <div class="t_people">
            <div class="t_col" id="f_col_0">
                <div class="t_follow">
                    <div class="txt1"><span></span></div>
                    <div>
                        <div class="like_head" onclick="other_user_info()">
                            <a href="" target="_blank" class="por">
                                <img src="./img/IMG_7965.JPG" width="100px">
                            </a>
                            <div style="height: 35px"></div>
                            <a href=""style="margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;">琪琪</a>
                        </div>
                        <a class="follow_button" style="display: none;">
                            <span class="fol1"><img src="./img/add.png"></span>
                            <span class="fol1">关</span>
                            <span class="fol1">注</span>
                        </a>
                        <a class="follow_button">
                            <span class="unfollow_txt">取</span>
                            <span class="unfollow_txt">消</span>
                            <span class="unfollow_txt">关</span>
                            <span class="unfollow_txt">注</span>
                        </a>
                    </div>
                </div>
                <div class="t_follow">
                    <div class="txt1"><span></span></div>
                    <div>
                        <div class="like_head" onclick="other_user_info()">
                            <a href="" target="_blank" class="por">
                                <img src="./img/IMG_7965.JPG" width="100px">
                            </a>
                            <div style="height: 35px"></div>
                            <a href=""style="margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;">琪琪</a>
                        </div>
                        <a class="follow_button" style="display: none;">
                            <span class="fol1"><img src="./img/add.png"></span>
                            <span class="fol1">关</span>
                            <span class="fol1">注</span>
                        </a>
                        <a class="follow_button">
                            <span class="unfollow_txt">取</span>
                            <span class="unfollow_txt">消</span>
                            <span class="unfollow_txt">关</span>
                            <span class="unfollow_txt">注</span>
                        </a>
                    </div>
                </div>
                <div class="t_follow">
                    <div class="txt1"><span></span></div>
                    <div>
                        <div class="like_head" onclick="other_user_info()">
                            <a href="" target="_blank" class="por">
                                <img src="./img/IMG_7965.JPG" width="100px">
                            </a>
                            <div style="height: 35px"></div>
                            <a href=""style="margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;">琪琪</a>
                        </div>
                        <a class="follow_button" style="display: none;">
                            <span class="fol1"><img src="./img/add.png"></span>
                            <span class="fol1">关</span>
                            <span class="fol1">注</span>
                        </a>
                        <a class="follow_button">
                            <span class="unfollow_txt">取</span>
                            <span class="unfollow_txt">消</span>
                            <span class="unfollow_txt">关</span>
                            <span class="unfollow_txt">注</span>
                        </a>
                    </div>
                </div>
                <div class="t_follow">
                    <div class="txt1"><span></span></div>
                    <div>
                        <div class="like_head" onclick="other_user_info()">
                            <a href="" target="_blank" class="por">
                                <img src="./img/IMG_7965.JPG" width="100px">
                            </a>
                            <div style="height: 35px"></div>
                            <a href=""style="margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;">琪琪</a>
                        </div>
                        <a class="follow_button" style="display: none;">
                            <span class="fol1"><img src="./img/add.png"></span>
                            <span class="fol1">关</span>
                            <span class="fol1">注</span>
                        </a>
                        <a class="follow_button">
                            <span class="unfollow_txt">取</span>
                            <span class="unfollow_txt">消</span>
                            <span class="unfollow_txt">关</span>
                            <span class="unfollow_txt">注</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="t_col" id="f_col_1">
                <div class="t_follow">
                    <div class="txt1"><span></span></div>
                    <div>
                        <div class="like_head" onclick="other_user_info()">
                            <a href="" target="_blank" class="por">
                                <img src="./img/IMG_7965.JPG" width="100px">
                            </a>
                            <div style="height: 35px"></div>
                            <a href=""style="margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;">琪琪</a>
                        </div>
                        <a class="follow_button" style="display: none;">
                            <span class="fol1"><img src="./img/add.png"></span>
                            <span class="fol1">关</span>
                            <span class="fol1">注</span>
                        </a>
                        <a class="follow_button">
                            <span class="unfollow_txt">取</span>
                            <span class="unfollow_txt">消</span>
                            <span class="unfollow_txt">关</span>
                            <span class="unfollow_txt">注</span>
                        </a>
                    </div>
                </div>
                <div class="t_follow">
                    <div class="txt1"><span></span></div>
                    <div>
                        <div class="like_head" onclick="other_user_info()">
                            <a href="" target="_blank" class="por">
                                <img src="./img/IMG_7965.JPG" width="100px">
                            </a>
                            <div style="height: 35px"></div>
                            <a href=""style="margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;">琪琪</a>
                        </div>
                        <a class="follow_button" style="display: none;">
                            <span class="fol1"><img src="./img/add.png"></span>
                            <span class="fol1">关</span>
                            <span class="fol1">注</span>
                        </a>
                        <a class="follow_button">
                            <span class="unfollow_txt">取</span>
                            <span class="unfollow_txt">消</span>
                            <span class="unfollow_txt">关</span>
                            <span class="unfollow_txt">注</span>
                        </a>
                    </div>
                </div>
                <div class="t_follow">
                    <div class="txt1"><span></span></div>
                    <div>
                        <div class="like_head" onclick="other_user_info()">
                            <a href="" target="_blank" class="por">
                                <img src="./img/IMG_7965.JPG" width="100px">
                            </a>
                            <div style="height: 35px"></div>
                            <a href=""style="margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;">琪琪</a>
                        </div>
                        <a class="follow_button" style="display: none;">
                            <span class="fol1"><img src="./img/add.png"></span>
                            <span class="fol1">关</span>
                            <span class="fol1">注</span>
                        </a>
                        <a class="follow_button">
                            <span class="unfollow_txt">取</span>
                            <span class="unfollow_txt">消</span>
                            <span class="unfollow_txt">关</span>
                            <span class="unfollow_txt">注</span>
                        </a>
                    </div>
                </div>
                <div class="t_follow">
                    <div class="txt1"><span></span></div>
                    <div>
                        <div class="like_head" onclick="other_user_info()">
                            <a href="" target="_blank" class="por">
                                <img src="./img/IMG_7965.JPG" width="100px">
                            </a>
                            <div style="height: 35px"></div>
                            <a href=""style="margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;">琪琪</a>
                        </div>
                        <a class="follow_button" style="display: none;">
                            <span class="fol1"><img src="./img/add.png"></span>
                            <span class="fol1">关</span>
                            <span class="fol1">注</span>
                        </a>
                        <a class="follow_button">
                            <span class="unfollow_txt">取</span>
                            <span class="unfollow_txt">消</span>
                            <span class="unfollow_txt">关</span>
                            <span class="unfollow_txt">注</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="t_col" id="f_col_2">
                <div class="t_follow">
                    <div class="txt1"><span></span></div>
                    <div>
                        <div class="like_head" onclick="other_user_info()">
                            <a href="" target="_blank" class="por">
                                <img src="./img/IMG_7965.JPG" width="100px">
                            </a>
                            <div style="height: 35px"></div>
                            <a href=""style="margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;">琪琪</a>
                        </div>
                        <a class="follow_button" style="display: none;">
                            <span class="fol1"><img src="./img/add.png"></span>
                            <span class="fol1">关</span>
                            <span class="fol1">注</span>
                        </a>
                        <a class="follow_button">
                            <span class="unfollow_txt">取</span>
                            <span class="unfollow_txt">消</span>
                            <span class="unfollow_txt">关</span>
                            <span class="unfollow_txt">注</span>
                        </a>
                    </div>
                </div>
                <div class="t_follow">
                    <div class="txt1"><span></span></div>
                    <div>
                        <div class="like_head" onclick="other_user_info()">
                            <a href="" target="_blank" class="por">
                                <img src="./img/IMG_7965.JPG" width="100px">
                            </a>
                            <div style="height: 35px"></div>
                            <a href=""style="margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;">琪琪</a>
                        </div>
                        <a class="follow_button" style="display: none;">
                            <span class="fol1"><img src="./img/add.png"></span>
                            <span class="fol1">关</span>
                            <span class="fol1">注</span>
                        </a>
                        <a class="follow_button">
                            <span class="unfollow_txt">取</span>
                            <span class="unfollow_txt">消</span>
                            <span class="unfollow_txt">关</span>
                            <span class="unfollow_txt">注</span>
                        </a>
                    </div>
                </div>
                <div class="t_follow">
                    <div class="txt1"><span></span></div>
                    <div>
                        <div class="like_head" onclick="other_user_info()">
                            <a href="" target="_blank" class="por">
                                <img src="./img/IMG_7965.JPG" width="100px">
                            </a>
                            <div style="height: 35px"></div>
                            <a href=""style="margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;">琪琪</a>
                        </div>
                        <a class="follow_button" style="display: none;">
                            <span class="fol1"><img src="./img/add.png"></span>
                            <span class="fol1">关</span>
                            <span class="fol1">注</span>
                        </a>
                        <a class="follow_button">
                            <span class="unfollow_txt">取</span>
                            <span class="unfollow_txt">消</span>
                            <span class="unfollow_txt">关</span>
                            <span class="unfollow_txt">注</span>
                        </a>
                    </div>
                </div>
                <div class="t_follow">
                    <div class="txt1"><span></span></div>
                    <div>
                        <div class="like_head" onclick="other_user_info()">
                            <a href="" target="_blank" class="por">
                                <img src="./img/IMG_7965.JPG" width="100px">
                            </a>
                            <div style="height: 35px"></div>
                            <a href=""style="margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;">琪琪</a>
                        </div>
                        <a class="follow_button" style="display: none;">
                            <span class="fol1"><img src="./img/add.png"></span>
                            <span class="fol1">关</span>
                            <span class="fol1">注</span>
                        </a>
                        <a class="follow_button">
                            <span class="unfollow_txt">取</span>
                            <span class="unfollow_txt">消</span>
                            <span class="unfollow_txt">关</span>
                            <span class="unfollow_txt">注</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="t_group">
            <ul style="padding: 0;margin: 0;width: 100%;cursor: hand;" id="group_ul">
                <li><a>group1</a></li>
                <li><a>group1</a></li>
                <li><a>group1</a></li>
                <li><a>group1</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
