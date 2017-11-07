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
        <span class="logo"><a href="index.jsp"></a> </span>
        <div class="v_topbar">
            <ul class="v_top_ul">
                <li><a href="index.jsp">首页</a></li>
                <li><a href="visit_scan.jsp" style="border-bottom-color:#fff">看图</a></li>
                <li><a href="visit_search.jsp">找图</a></li>
            </ul>
        </div>
    </div>

    <div style="height: 30px;"></div>
    <div id="wall_body" class="wall">
        <div class="col0">
            <div class="card">
                <div style="height: 30px;"></div>
                <div class="img" onclick="">
                    <img src="./img/IMG_0004.JPG" onload="" width="300"/>
                </div>
                <div class="des">
                    <div class="words">
                        <p>暗香浮动</p>
                    </div>
                </div>
                <div class="like">
                    <div class="like_icon" style="float: left;"><img src="./img/like_unclicked.png"/></div>
                    <div class="like_num" style="float: left;"><p>266人喜欢</p></div>
                </div>
                <div style="height: 60px;"></div>
            </div>
            <div class="card">
                <div style="height: 30px;"></div>
                <div class="img" onclick="">
                    <img src="./img/IMG_0178.JPG" onload="" width="300"/>
                </div>
                <div class="des">
                    <div class="words">
                        <p>午后漫步，走过无人的小巷</p>
                    </div>
                </div>
                <div class="like">
                    <div class="like_icon" style="float: left;"><img src="./img/like_unclicked.png"/></div>
                    <div class="like_num" style="float: left;"><p>266人喜欢</p></div>
                </div>
                <div style="height: 60px;"></div>
            </div>
        </div>
        <div class="col1">
            <div class="card">
                <div style="height: 30px;"></div>
                <div class="img" onclick="">
                    <img src="./img/IMG_7965.JPG" onload="" width="300"/>
                </div>
                <div class="des">
                    <div class="words">
                        <p>蛋糕来自心灵手巧的乐乐！么么哒！</p>
                    </div>
                </div>
                <div class="like">
                    <div class="like_icon" style="float: left;"><img src="./img/like_unclicked.png"/></div>
                    <div class="like_num" style="float: left;"><p>266人喜欢</p></div>
                </div>
                <div style="height: 60px;"></div>
            </div>
            <div class="card">
                <div style="height: 30px;"></div>
                <div class="img" onclick="">
                    <img src="./img/IMG_0006.JPG" onload="" width="300"/>
                </div>
                <div class="des">
                    <div class="words">
                        <p>东篱把酒黄昏后</p>
                    </div>
                </div>
                <div class="like">
                    <div class="like_icon" style="float: left;"><img src="./img/like_unclicked.png"/></div>
                    <div class="like_num" style="float: left;"><p>266人喜欢</p></div>
                </div>
                <div style="height: 60px;"></div>
            </div>
        </div>
        <div class="col2">
            <div class="card">
                <div style="height: 30px;"></div>
                <div class="img" onclick="">
                    <img src="./img/IMG_0007.JPG" onload="" width="300"/>
                </div>
                <div class="des">
                    <div class="words">
                        <p>童话世界</p>
                    </div>
                </div>
                <div class="like">
                    <div class="like_icon" style="float: left;"><img src="./img/like_unclicked.png"/></div>
                    <div class="like_num" style="float: left;"><p>266人喜欢</p></div>
                </div>
                <div style="height: 60px;"></div>
            </div>
            <div class="card">
                <div style="height: 30px;"></div>
                <div class="img" onclick="">
                    <img src="./img/IMG_0024.JPG" onload="" width="300"/>
                </div>
                <div class="des">
                    <div class="words">
                        <p>春困秋乏，夏盹冬眠</p>
                    </div>
                </div>
                <div class="like">
                    <div class="like_icon" style="float: left;"><img src="./img/like_unclicked.png"/></div>
                    <div class="like_num" style="float: left;"><p>266人喜欢</p></div>
                </div>
                <div style="height: 60px;"></div>
            </div>
        </div>
    </div>
</body>
</html>
