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
    <script type="text/javascript">
        window.onload=function(){
            hot_pic_user();
        }
        function check(){
            var input = document.getElementById("u_s_input").value;
            var goon=1;
            if (input==null || input=="") {
                alert("请输入搜索条件");
                goon=0;
            }
            if(goon==1){
                pic_search_keyword_user(input);
            }
        }
        function readyToComment(){

        }
        function checkComment(){

        }
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
        <input type="submit" class="input_button" onclick="check()"/>
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
                        <a class="follow_button" style="width: 80px;margin-left: 10px;" onclick="follow()">
                            <span style="margin-left: 0px;margin-right: 0px;"><img src="./img/add.png"></span>
                            <span style="margin-left: 0px;margin-right: 0px;">关</span>
                            <span style="margin-left: 5px;margin-right: 0px;">注</span>
                        </a>
                    </span>
            </div>
            <div class="img" onclick="">
                <img src="./img/IMG_0004.JPG" onload="" width="300"/>
            </div>
            <div class="des">
                <div class="words">
                    <p style="text-align: left;margin-left: 25px">暗香浮动</p>
                </div>
            </div>
            <div class="like">
                <div class="like_icon" style="float: left;" onclick="thumb()"><img src="./img/like_unclicked.png"/></div>
                <div class="like_num" style="float: left;"><p>266人喜欢</p></div>
                <div class="like_num" style="float: left;margin-left: 90px;margin-right:10px;margin-top: 18px;" onclick="readyToComment()"><a>评论</a></div>
                <div class="like_num" style="float: left;margin-top: 18px;" onclick="republish()"><a>转发</a></div>
            </div>
            <div class="fed_back">
                <div class="c_input" style="margin-left:4px;width:250px;min-height:15px;line-height:15px;" id="c1" contenteditable="true">
                </div>
                <input type="submit" style="font-size: 14px;font-weight: normal;width:50px;height:34px;" value="发布" class="c_button" onclick="checkComment()">
            </div>
            <div style="height: 90px;"></div>
        </div>
        <div class="card" id="card2">
            <div style="height: 20px;"></div>
            <div class="p_head">
                    <span class="opti" style="margin-left: 2px;">
                        <a>
                            <img src="./img/IMG_7965.JPG" width="65px" style="border-radius:50%;" onclick="other_user_info()">
                        </a>
                    </span>
                <span class="opti">
                        <a class="follow_button" style="width: 80px;margin-left: 10px;" onclick="follow()">
                            <span style="margin-left: 0px;margin-right: 0px;"><img src="./img/add.png"></span>
                            <span style="margin-left: 0px;margin-right: 0px;">关</span>
                            <span style="margin-left: 5px;margin-right: 0px;">注</span>
                        </a>
                    </span>
            </div>
            <div class="img" onclick="">
                <img src="./img/IMG_0004.JPG" onload="" width="300"/>
            </div>
            <div class="des">
                <div class="words">
                    <p style="text-align: left;margin-left: 25px">暗香浮动</p>
                </div>
            </div>
            <div class="like">
                <div class="like_icon" style="float: left;" onclick="thumb()"><img src="./img/like_unclicked.png"/></div>
                <div class="like_num" style="float: left;"><p>266人喜欢</p></div>
                <div class="like_num" style="float: left;margin-left: 90px;margin-right:10px;margin-top: 18px;" onclick="readyToComment()"><a>评论</a></div>
                <div class="like_num" style="float: left;margin-top: 18px;" onclick="republish()"><a>转发</a></div>
            </div>
            <div class="fed_back">
                <div class="c_input" style="margin-left:4px;width:250px;min-height:15px;line-height:15px;" id="c2" contenteditable="true">
                </div>
                <input type="submit" style="font-size: 14px;font-weight: normal;width:50px;height:34px;" value="发布" class="c_button" onclick="checkComment()">
            </div>
            <div style="height: 90px;"></div>
        </div>
    </div>
    <div class="col1" id="u_s_col1">
        <div class="card" id="card3">
            <div style="height: 20px;"></div>
            <div class="p_head">
                    <span class="opti" style="margin-left: 2px;">
                        <a>
                            <img src="./img/IMG_7965.JPG" width="65px" style="border-radius:50%;" onclick="other_user_info()">
                        </a>
                    </span>
                <span class="opti">
                        <a class="follow_button" style="width: 80px;margin-left: 10px;" onclick="follow()">
                            <span style="margin-left: 0px;margin-right: 0px;"><img src="./img/add.png"></span>
                            <span style="margin-left: 0px;margin-right: 0px;">关</span>
                            <span style="margin-left: 5px;margin-right: 0px;">注</span>
                        </a>
                    </span>
            </div>
            <div class="img" onclick="">
                <img src="./img/IMG_0004.JPG" onload="" width="300"/>
            </div>
            <div class="des">
                <div class="words">
                    <p style="text-align: left;margin-left: 25px">暗香浮动</p>
                </div>
            </div>
            <div class="like">
                <div class="like_icon" style="float: left;" onclick="thumb()"><img src="./img/like_unclicked.png"/></div>
                <div class="like_num" style="float: left;"><p>266人喜欢</p></div>
                <div class="like_num" style="float: left;margin-left: 90px;margin-right:10px;margin-top: 18px;" onclick="readyToComment()"><a>评论</a></div>
                <div class="like_num" style="float: left;margin-top: 18px;" onclick="republish()"><a>转发</a></div>
            </div>
            <div class="fed_back">
                <div class="c_input" style="margin-left:4px;width:250px;min-height:15px;line-height:15px;" id="c3" contenteditable="true">
                </div>
                <input type="submit" style="font-size: 14px;font-weight: normal;width:50px;height:34px;" value="发布" class="c_button" onclick="checkComment()">
            </div>
            <div style="height: 90px;"></div>
        </div>
        <div class="card" id="card4">
            <div style="height: 20px;"></div>
            <div class="p_head">
                    <span class="opti" style="margin-left: 2px;">
                        <a>
                            <img src="./img/IMG_7965.JPG" width="65px" style="border-radius:50%;" onclick="other_user_info()">
                        </a>
                    </span>
                <span class="opti">
                        <a class="follow_button" style="width: 80px;margin-left: 10px;" onclick="follow()">
                            <span style="margin-left: 0px;margin-right: 0px;"><img src="./img/add.png"></span>
                            <span style="margin-left: 0px;margin-right: 0px;">关</span>
                            <span style="margin-left: 5px;margin-right: 0px;">注</span>
                        </a>
                    </span>
            </div>
            <div class="img" onclick="">
                <img src="./img/IMG_0004.JPG" onload="" width="300"/>
            </div>
            <div class="des">
                <div class="words">
                    <p style="text-align: left;margin-left: 25px">暗香浮动</p>
                </div>
            </div>
            <div class="like">
                <div class="like_icon" style="float: left;" onclick="thumb()"><img src="./img/like_unclicked.png"/></div>
                <div class="like_num" style="float: left;"><p>266人喜欢</p></div>
                <div class="like_num" style="float: left;margin-left: 90px;margin-right:10px;margin-top: 18px;" onclick="readyToComment()"><a>评论</a></div>
                <div class="like_num" style="float: left;margin-top: 18px;" onclick="republish()"><a>转发</a></div>
            </div>
            <div class="fed_back">
                <div class="c_input" style="margin-left:4px;width:250px;min-height:15px;line-height:15px;" id="c4" contenteditable="true">
                </div>
                <input type="submit" style="font-size: 14px;font-weight: normal;width:50px;height:34px;" value="发布" class="c_button" onclick="checkComment()">
            </div>
            <div style="height: 90px;"></div>
        </div>
    </div>
    <div class="col2" id="u_s_col2">
        <div class="card" id="card5">
            <div style="height: 20px;"></div>
            <div class="p_head">
                    <span class="opti" style="margin-left: 2px;">
                        <a>
                            <img src="./img/IMG_7965.JPG" width="65px" style="border-radius:50%;" onclick="other_user_info()">
                        </a>
                    </span>
                <span class="opti">
                        <a class="follow_button" style="width: 80px;margin-left: 10px;" onclick="follow()">
                            <span style="margin-left: 0px;margin-right: 0px;"><img src="./img/add.png"></span>
                            <span style="margin-left: 0px;margin-right: 0px;">关</span>
                            <span style="margin-left: 5px;margin-right: 0px;">注</span>
                        </a>
                    </span>
            </div>
            <div class="img" onclick="">
                <img src="./img/IMG_0004.JPG" onload="" width="300"/>
            </div>
            <div class="des">
                <div class="words">
                    <p style="text-align: left;margin-left: 25px">暗香浮动</p>
                </div>
            </div>
            <div class="like">
                <div class="like_icon" style="float: left;" onclick="thumb()"><img src="./img/like_unclicked.png"/></div>
                <div class="like_num" style="float: left;"><p>266人喜欢</p></div>
                <div class="like_num" style="float: left;margin-left: 90px;margin-right:10px;margin-top: 18px;" onclick="readyToComment()"><a>评论</a></div>
                <div class="like_num" style="float: left;margin-top: 18px;" onclick="republish()"><a>转发</a></div>
            </div>
            <div class="fed_back">
                <div class="c_input" style="margin-left:4px;width:250px;min-height:15px;line-height:15px;" id="c5" contenteditable="true">
                </div>
                <input type="submit" style="font-size: 14px;font-weight: normal;width:50px;height:34px;" value="发布" class="c_button" onclick="checkComment()">
            </div>
            <div style="height: 90px;"></div>
        </div>
        <div class="card" id="card6">
            <div style="height: 20px;"></div>
            <div class="p_head">
                    <span class="opti" style="margin-left: 2px;">
                        <a>
                            <img src="./img/IMG_7965.JPG" width="65px" style="border-radius:50%;" onclick="other_user_info()">
                        </a>
                    </span>
                <span class="opti">
                        <a class="follow_button" style="width: 80px;margin-left: 10px;" onclick="follow()">
                            <span style="margin-left: 0px;margin-right: 0px;"><img src="./img/add.png"></span>
                            <span style="margin-left: 0px;margin-right: 0px;">关</span>
                            <span style="margin-left: 5px;margin-right: 0px;">注</span>
                        </a>
                    </span>
            </div>
            <div class="img" onclick="">
                <img src="./img/IMG_0004.JPG" onload="" width="300"/>
            </div>
            <div class="des">
                <div class="words">
                    <p style="text-align: left;margin-left: 25px">暗香浮动</p>
                </div>
            </div>
            <div class="like">
                <div class="like_icon" style="float: left;" onclick="thumb()"><img src="./img/like_unclicked.png"/></div>
                <div class="like_num" style="float: left;"><p>266人喜欢</p></div>
                <div class="like_num" style="float: left;margin-left: 90px;margin-right:10px;margin-top: 18px;" onclick="readyToComment()"><a>评论</a></div>
                <div class="like_num" style="float: left;margin-top: 18px;" onclick="republish()"><a>转发</a></div>
            </div>
            <div class="fed_back">
                <div class="c_input" style="margin-left:4px;width:250px;min-height:15px;line-height:15px;" id="c6" contenteditable="true">
                </div>
                <input type="submit" style="font-size: 14px;font-weight: normal;width:50px;height:34px;" value="发布" class="c_button" onclick="checkComment()">
            </div>
            <div style="height: 90px;"></div>
        </div>
    </div>
</div>
</body>
</html>
