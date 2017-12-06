
function login(name,password) {
    var id=name;
    var pwd=password;
    $.ajax({
        type: "post",
        async: false,
        url: "localhost:8080/src/main/login.php",
        dataType: "json",
        data: {"id": id,
        "pwd":pwd},
        success: function (result) {
            if (result[0].answer == "Fail") {
                alert("用户名和密码不符");
            }
            else if(result[0].answer == "Success"){
                window.location.href='./user_index.jsp';
            }
        }
    });
};

function register(usern,userp,users,useri,userl,userc,userd){
    var name=usern;
    var pwd=userp;
    var special=users;
    var interest=useri;
    var location=userl;
    var contact=userc;
    var des=userd;
    $.ajax({
        type: "post",
        async: false,
        url: "localhost:8080/src/main/register.php",
        dataType: "json",
        data: {"name": name,
            "pwd":pwd,
        "special":special,
        "interest":interest,
        "location":location,
        "contact":contact,
        "des":des},
        success: function (result) {
            if (result[0].answer == "Fail") {
                alert("请再试一次");
            }
            else{
                alert("注册成功！您的账号是："+result[0].answer);
                window.location.href='./index.html';
            }
        }
    });
};

function user_index(){
    var inform_num=[];
    var ask_num=[];
    var head=[];
    var id=[];
    var name=[];
    var pic=[];
    var pic_id=[];
    var tag=[];
    var hot=[];
    var comment=[];
    var c_head=[];
    var c_name=[];
    var c_id=[];
    var des=[];
    var time=[];
    var like_head=[];
    var like_name=[];
    var like_id=[];
    $.ajax({
        type: "post",
        async: false,
        url: "localhost:8080/src/main/get_message_num.php",
        dataType: "json",
        success: function (result) {
            if (result) {
                inform_num.push(result[0].inform);
                ask_num.push(result[0].ask);
            }
            else {
                alert("fail");
            }
        },error:function (msg) {
            //alert("msg"+msg);
        }
    });
    $.ajax({
        type: "post",
        async: false,
        url: "localhost:8080/src/main/get_index_pic.php",
        dataType: "json",
        data:{"id":userid},
        success: function (result) {
            if (result) {
                for (var i = 0; i < result.length; i++) {
                    head.push(result[i].head);
                    id.push(result[i].id);
                    pic_id.push(result[i].picid);
                    tag.push(result[i].tag);
                    hot.push(result[i].hot);
                    name.push(result[i].name);
                    pic.push(result[i].pic);
                    des.push(result[i].des);
                    time.push(result[i].time);
                }
            }
            else {
                alert("fail");
            }
        },error:function (msg) {
            //alert("msg"+msg);
        }
    });
    $.ajax({
        type: "post",
        async: false,
        url: "localhost:8080/src/main/get_guess.php",
        dataType: "json",
        data:{"id":userid},
        success: function (result) {
            if (result) {
                for (var i = 0; i < result.length; i++) {
                    like_head.push(result[i].head);
                    like_id.push(result[i].id);
                    like_name.push(result[i].name);
                }
                for(var i=0;i<pic_id.length;i++){
                    var c=[];
                    var h=[];
                    var n=[];
                    var id=[];
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "../src/main/get_comment.php",
                        dataType: "json",
                        data:{"id":pic_id[i]},
                        success: function (result) {
                            if (result) {
                                for (var j = 0; j < result.length; j++) {
                                    c.push(result[i].content);
                                    h.push(result[i].head);
                                    n.push(result[i].name);
                                    id.push(result[i].id);
                                }
                            }
                            else {
                                alert("fail");
                            }
                        },error:function (msg) {
                            alert("msg"+msg);
                        }
                    });
                    comment.push(c);
                    c_head.push(h);
                    c_id.push(id);
                    c_name.push(n);
                }

                if(inform_num[0]!=0||ask_num[0]!=0){
                    document.getElementById("inform").setAttribute("style","");
                    if(inform_num[0]!=0){
                        document.getElementById("inform_num").innerHTML=inform_num[0]+"条通知";
                        document.getElementById("newask").setAttribute("style","");
                    }
                    if(ask_num[0]!=0){
                        document.getElementById("ask_num").innerHTML=ask_num[0]+"条询问";
                        document.getElementById("newinf").setAttribute("style","");
                    }
                }

                for(var i=0;i<head.length;i++){
                    var head_pic = document.createElement("img");
                    head_pic.setAttribute("src",head[i]);
                    head_pic.setAttribute("width","65px");
                    head_pic.setAttribute("onclick","other_user_info()");
                    head_pic.setAttribute("value",id[i]);
                    head_pic.setAttribute("alt",name[i]);
                    head_pic.setAttribute("title",name[i]);
                    var link1 = document.createElement("a");
                    link1.setAttribute("target","_blank");
                    link1.appendChild(head_pic);
                    var div1 = document.createElement("div");
                    div1.setAttribute("class","portrait");
                    div1.appendChild(link1);
                    var list = document.createElement("div");
                    list.setAttribute("class","list");
                    list.appendChild(div1);

                    var pic1 = document.createElement("img");
                    pic1.setAttribute("src",pic[i]);
                    pic1.setAttribute("width","250px");
                    pic1.setAttribute("value",pic_id[i]);
                    var link2 = document.createElement("a");
                    link2.setAttribute("hidefocus","true");
                    link2.setAttribute("style","width: 100%;");
                    link2.appendChild(pic1);
                    var div2 = document.createElement("div");
                    div2.setAttribute("class","pic");
                    div2.setAttribute("style","margin-top:10px;margin-left:-350px;max-height: 250px;width: 300%;cursor: hand;");
                    div2.appendChild(link2);
                    var div3 = document.createElement("div");
                    div3.setAttribute("style","opacity:1;float:left;width:50%;padding-left:20px;box-sizing:border-box;text-align:center;");
                    div3.appendChild(div2);

                    var p1 = document.createElement("p");
                    p1.innerHTML=des[i];
                    var p2 = document.createElement("p");
                    p2.innerHTML=time[i];
                    var b1 = document.createElement("blockquote");
                    b1.appendChild(p1);
                    b1.appendChild(p2);

                    var div4 = document.createElement("div");
                    div4.setAttribute("class","text");
                    div4.appendChild(b1);

                    var cnt = document.createElement("div");
                    cnt.setAttribute("class","cnt");
                    cnt.appendChild(div3);
                    cnt.appendChild(div4);

                    var work = document.createElement("div");
                    work.setAttribute("class","work");
                    work.appendChild(cnt);

                    var tagdiv=document.createElement("div");
                    for(var j=0;j<tag.length&&j<3;j++){
                        var span1 = document.createElement("span");
                        span1.setAttribute("class","opti");
                        span1.innerHTML=tag[j];
                        tagdiv.appendChild(span1);
                    }
                    var span2 = document.createElement("span");
                    span2.setAttribute("class","opti");
                    span2.innerHTML="热度("+hot[0]+")";
                    var span3 = document.createElement("span");
                    span3.setAttribute("class","opti_c");
                    span3.innerHTML="评论";
                    var span4 = document.createElement("span");
                    span4.setAttribute("class","opti");
                    span4.innerHTML="转发";
                    var span5=document.createElement("span");
                    span5.setAttribute("class","opti");
                    span5.setAttribute("style","margin-left: -5px;margin-top: -18px");
                    var link3=document.createElement("a");
                    var icon1=document.createElement("img");
                    icon1.setAttribute("src","./img/like_unclicked.png");
                    icon1.setAttribute("class","like_u");
                    var icon2=document.createElement("img");
                    icon2.setAttribute("src","./img/like_clicked.png");
                    icon2.setAttribute("class","like_c");
                    icon2.setAttribute("style","display: none;");
                    link3.appendChild(icon1);
                    link3.appendChild(icon2);
                    span5.appendChild(link3);
                    var divcomment=document.createElement("div");
                    divcomment.setAttribute("class","comment");
                    divcomment.appendChild(span2);
                    divcomment.appendChild(span3);
                    divcomment.appendChild(span4);
                    divcomment.appendChild(span5);
                    var fedback=document.createElement("div");
                    fedback.setAttribute("class","fed_back");
                    fedback.appendChild(tagdiv);
                    fedback.appendChild(divcomment);

                    var talk_body=document.createElement("div");
                    talk_body.setAttribute("class","talk_body");
                    talk_body.appendChild(work);
                    talk_body.appendChild(fedback);
                    for(var j=0;j<c_head.length;j++){
                        var c_bar=document.createElement("div");
                        c_bar.setAttribute("class","comment_bar1");
                        c_bar.setAttribute("style","display:none;");
                        var span6 = document.createElement("span");
                        span6.setAttribute("class","opti");
                        span6.setAttribute("style","margin-left: 20px;");
                        var link4=document.createElement("a");
                        var c_icon=document.createElement("img");
                        c_icon.setAttribute("src",c_head[i][j]);
                        c_icon.setAttribute("width","65px");
                        c_icon.setAttribute("style","border-radius:50%;");
                        c_icon.setAttribute("onclick","other_user_info()");
                        c_icon.setAttribute("value",c_id[i][j]);
                        c_icon.setAttribute("alt",c_name[i][j]);
                        c_icon.setAttribute("title",c_name[i][j]);
                        link4.appendChild(c_icon);
                        span6.appendChild(link4);
                        c_bar.appendChild(span6);
                        var div5=document.createElement("div");
                        div5.setAttribute("class","m_txt1");
                        var div6=document.createElement("div");
                        div6.setAttribute("class","m_content");
                        div6.innerHTML=comment[i][j];
                        div5.appendChild(div6);
                        c_bar.appendChild(div5);
                        talk_body.appendChild(c_bar);
                    }
                    var div7=document.createElement("div");
                    div7.setAttribute("class","comment_bar");
                    div7.setAttribute("style","display: none;");
                    var div8=document.createElement("div");
                    div8.setAttribute("class","c_input");
                    div8.setAttribute("contenteditable","true");
                    var input=document.createElement("input");
                    input.setAttribute("type","submit");
                    input.setAttribute("value","发布");
                    input.setAttribute("class","c_button");
                    div7.appendChild(div8);
                    div7.appendChild(input);
                    talk_body.appendChild(div7);
                    var content=document.createElement("div");
                    content.setAttribute("class","content");
                    var h=document.createElement("div");
                    h.setAttribute("class","talk_h");
                    content.appendChild(h);
                    content.appendChild(talk_body);

                    list.appendChild(content);

                    var head_pic1 = document.createElement("img");
                    head_pic1.setAttribute("src",head[i]);
                    head_pic1.setAttribute("width","65px");
                    head_pic1.setAttribute("onclick","other_user_info()");
                    head_pic1.setAttribute("value",id[i]);
                    head_pic1.setAttribute("alt",name[i]);
                    head_pic1.setAttribute("title",name[i]);
                    var link11 = document.createElement("a");
                    link11.setAttribute("target","_blank");
                    link11.appendChild(head_pic1);
                    var div11 = document.createElement("div");
                    div11.setAttribute("class","portrait");
                    div11.appendChild(link11);
                    var list1 = document.createElement("div");
                    list1.setAttribute("class","list");
                    list1.setAttribute("style","display: none;");
                    list1.appendChild(div11);

                    var pic11 = document.createElement("img");
                    pic11.setAttribute("src",pic[i]);
                    pic11.setAttribute("width","600px");
                    pic11.setAttribute("style","float:left;margin-left:320px;");
                    pic11.setAttribute("value",pic_id[i]);
                    var link21 = document.createElement("a");
                    link21.setAttribute("hidefocus","true");
                    link21.setAttribute("style","width: 300%;");
                    link21.appendChild(pic11);
                    var div21 = document.createElement("div");
                    div21.setAttribute("class","picbig");
                    div21.setAttribute("style","margin-top:10px;cursor: hand;width: 350%;");
                    div21.appendChild(link21);
                    var div31 = document.createElement("div");
                    div31.setAttribute("style","min-width: 100%;min-height:500px;margin-left:-85px;");
                    div31.appendChild(div21);

                    var p11 = document.createElement("p");
                    p11.innerHTML=des[i];
                    var p21 = document.createElement("p");
                    p21.innerHTML=time[i];
                    var b11 = document.createElement("blockquote");
                    b11.appendChild(p11);
                    b11.appendChild(p21);

                    var div41 = document.createElement("div");
                    div41.setAttribute("class","text");
                    div41.setAttribute("style","width: 100%;margin-left:-85px;");
                    div41.appendChild(b11);

                    var cnt1 = document.createElement("div");
                    cnt1.setAttribute("class","cnt");
                    cnt1.appendChild(div31);
                    cnt1.appendChild(div41);

                    var work1 = document.createElement("div");
                    work1.setAttribute("class","work1");
                    work1.appendChild(cnt1);

                    var tagdiv1=document.createElement("div");
                    tagdiv1.setAttribute("style","width: 191px");
                    for(var j=0;j<tag.length&&j<3;j++){
                        var span11 = document.createElement("span");
                        span11.setAttribute("class","opti");
                        span11.innerHTML=tag[j];
                        tagdiv1.appendChild(span11);
                    }
                    var span21 = document.createElement("span");
                    span21.setAttribute("class","opti");
                    span21.innerHTML="热度("+hot[0]+")";
                    var span31 = document.createElement("span");
                    span31.setAttribute("class","opti_c");
                    span31.innerHTML="评论";
                    var span41 = document.createElement("span");
                    span41.setAttribute("class","opti");
                    span41.innerHTML="转发";
                    var span51=document.createElement("span");
                    span51.setAttribute("class","opti");
                    span51.setAttribute("style","margin-left: -5px;margin-top: -18px");
                    var link31=document.createElement("a");
                    var icon11=document.createElement("img");
                    icon11.setAttribute("src","./img/like_unclicked.png");
                    icon11.setAttribute("class","like_u");
                    var icon21=document.createElement("img");
                    icon21.setAttribute("src","./img/like_clicked.png");
                    icon21.setAttribute("class","like_c");
                    icon21.setAttribute("style","display: none;");
                    link31.appendChild(icon11);
                    link31.appendChild(icon21);
                    span51.appendChild(link31);
                    var divcomment1=document.createElement("div");
                    divcomment1.setAttribute("class","comment");
                    divcomment1.appendChild(span21);
                    divcomment1.appendChild(span31);
                    divcomment1.appendChild(span41);
                    divcomment1.appendChild(span51);
                    var fedback1=document.createElement("div");
                    fedback1.setAttribute("class","fed_back");
                    fedback1.appendChild(tagdiv1);
                    fedback1.appendChild(divcomment1);

                    var talk_body1=document.createElement("div");
                    talk_body1.setAttribute("class","talk_body1");
                    talk_body1.appendChild(work1);
                    talk_body1.appendChild(fedback1);
                    for(var j=0;j<c_head.length;j++){
                        var c_bar1=document.createElement("div");
                        c_bar1.setAttribute("class","comment_bar1");
                        c_bar1.setAttribute("style","display:none;");
                        var span61 = document.createElement("span");
                        span61.setAttribute("class","opti");
                        span61.setAttribute("style","margin-left: 20px;");
                        var link41=document.createElement("a");
                        var c_icon1=document.createElement("img");
                        c_icon1.setAttribute("src",c_head[i][j]);
                        c_icon1.setAttribute("width","65px");
                        c_icon1.setAttribute("style","border-radius:50%;");
                        c_icon1.setAttribute("onclick","other_user_info()");
                        c_icon1.setAttribute("value",c_id[i][j]);
                        c_icon1.setAttribute("alt",c_name[i][j]);
                        c_icon1.setAttribute("title",c_name[i][j]);
                        link41.appendChild(c_icon1);
                        span61.appendChild(link41);
                        c_bar1.appendChild(span61);
                        var div51=document.createElement("div");
                        div51.setAttribute("class","m_txt1");
                        var div61=document.createElement("div");
                        div61.setAttribute("class","m_content");
                        div61.innerHTML=comment[i][j];
                        div51.appendChild(div61);
                        c_bar1.appendChild(div51);
                        talk_body1.appendChild(c_bar1);
                    }
                    var div71=document.createElement("div");
                    div71.setAttribute("class","comment_bar");
                    div71.setAttribute("style","display: none;");
                    var div81=document.createElement("div");
                    div81.setAttribute("class","c_input");
                    div81.setAttribute("contenteditable","true");
                    var input1=document.createElement("input");
                    input1.setAttribute("type","submit");
                    input1.setAttribute("value","发布");
                    input1.setAttribute("class","c_button");
                    div71.appendChild(div81);
                    div71.appendChild(input1);
                    talk_body1.appendChild(div71);
                    var content1=document.createElement("div");
                    content1.setAttribute("class","content");
                    var h1=document.createElement("div");
                    h1.setAttribute("class","talk_h");
                    content1.appendChild(h1);
                    content1.appendChild(talk_body1);

                    list1.appendChild(content1);
                    var tar = document.getElementById("index_main");
                    tar.appendChild(list);
                    tar.appendChild(list1);
                }

                for(var i=0;i<like_head.length;i++){
                    var guesslike=document.createElement("div");
                    guesslike.setAttribute("class","guess_like");
                    var span01=document.createElement("span");
                    span01.innerHTML="猜你喜欢";
                    var txt=docunment.createElement("div");
                    txt.setAttribute("class","txt1");
                    guesslike.appendChild(txt);
                    var div01=document.createElement("div");
                    var likehead=document.createElement("div");
                    likehead.setAttribute("class","like_head");
                    var link01=document.createElement("a");
                    link01.setAttribute("class","por");
                    var head_pic21=document.createElement("img");
                    head_pic21.setAttribute("src",like_head[i]);
                    head_pic21.setAttribute("value",like_id[i]);
                    head_pic21.setAttribute("width","100px");
                    head_pic21.setAttribute("onclick","other_user_info()");
                    link01.appendChild(head_pic21);
                    likehead.appendChild(link01);
                    var div02=document.createElement("div");
                    div02.setAttribute("style","height: 35px");
                    likehead.appendChild(div02);
                    var link02=document.createElement("a");
                    link02.setAttribute("style","margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;");
                    link02.setAttribute("onclick","other_user_info()");
                    link02.innerHTML="琪琪";
                    likehead.appendChild(link02);
                    div01.appendChild(likehead);
                    var link03=document.createElement("a");
                    link03.setAttribute("class","follow_button");
                    var span02=document.createElement("span");
                    span02.setAttribute("class","fol1");
                    var addicon=document.createElement("img");
                    addicon.setAttribute("src","./img/add.png");
                    span02.appendChild(addicon);
                    var span03=document.createElement("span");
                    span03.setAttribute("class","fol1");
                    span03.innerHTML="关";
                    var span04=document.createElement("span");
                    span04.setAttribute("class","fol1");
                    span04.innerHTML="注";
                    link03.appendChild(span02);
                    link03.appendChild(span03);
                    link03.appendChild(span04);
                    var link04=document.createElement("a");
                    link04.setAttribute("class","disfollow_btn");
                    link04.setAttribute("style","display: none");
                    var span05=document.createElement("span");
                    span05.setAttribute("class","unfollow_txt");
                    span05.innerHTML="取";
                    var span06=document.createElement("span");
                    span06.setAttribute("class","unfollow_txt");
                    span06.innerHTML="消";
                    var span07=document.createElement("span");
                    span07.setAttribute("class","unfollow_txt");
                    span07.innerHTML="关";
                    var span08=document.createElement("span");
                    span08.setAttribute("class","unfollow_txt");
                    span08.innerHTML="注";
                    link04.appendChild(span05);
                    link04.appendChild(span06);
                    link04.appendChild(span07);
                    link04.appendChild(span08);
                    div01.appendChild(link03);
                    div01.appendChild(link04);
                    guesslike.appendChild(div01);
                    var tar1 = document.getElementById("side");
                    tar1.appendChild(guesslike);
                }
            }
            else {
                //alert("fail");
            }
        },error:function (msg) {
            //alert("msg"+msg);
        }
    });

};

function other_user_info(){
    var id=$(this).name;
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/send_check_id.php",
        dataType: "json",
        data: {"id": id},
        success: function (result) {
        },
        error:function (msg) {
            //alert("msg"+msg);
        },
    });
    window.location.href='./other_index.jsp';
};

function load_info(){
    var head=[];
    var id=[];
    var name=[];
    var pic=[];
    var pic_id=[];
    var tag=[];
    var hot=[];
    var comment=[];
    var des=[];
    var time=[];
    var a_id=[];
    var type=[];
    var author=[];
    var author_head=[];
    var author_mark=[];
    var act_type=[];
    var location=[];
    var fare=[];
    var ask=[];

    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/get_other_index.php",
        dataType: "json",
        success: function (result) {
            if (result) {
                for (var i = 0; i < result.length; i++) {
                    head.push(result[i].head);
                    id.push(result[i].id);
                    pic_id.push(result[i].picid);
                    tag.push(result[i].tag);
                    hot.push(result[i].hot);
                    name.push(result[i].name);
                    pic.push(result[i].pic);
                    des.push(result[i].des);
                    time.push(result[i].time);
                }
                for(var i=0;i<pic_id.length;i++){
                    var c=[];
                    var h=[];
                    var n=[];
                    var id=[];
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "../src/main/get_comment.php",
                        dataType: "json",
                        data:{"id":pic_id[i]},
                        success: function (result) {
                            if (result) {
                                for (var j = 0; j < result.length; j++) {
                                    c.push(result[i].content);
                                    h.push(result[i].head);
                                    n.push(result[i].name);
                                    id.push(result[i].id);
                                }
                            }
                            else {
                                alert("fail");
                            }
                        },error:function (msg) {
                            alert("msg"+msg);
                        }
                    });
                    comment.push(c);
                    c_head.push(h);
                    c_id.push(id);
                    c_name.push(n);
                }
                for(var i=0;i<head.length;i++){
                    var head_pic = document.createElement("img");
                    head_pic.setAttribute("src",head[i]);
                    head_pic.setAttribute("width","65px");
                    head_pic.setAttribute("onclick","other_user_info()");
                    head_pic.setAttribute("value",id[i]);
                    head_pic.setAttribute("alt",name[i]);
                    head_pic.setAttribute("title",name[i]);
                    var link1 = document.createElement("a");
                    link1.setAttribute("target","_blank");
                    link1.appendChild(head_pic);
                    var div1 = document.createElement("div");
                    div1.setAttribute("class","portrait");
                    div1.appendChild(link1);
                    var list = document.createElement("div");
                    list.setAttribute("class","list");
                    list.appendChild(div1);

                    var pic1 = document.createElement("img");
                    pic1.setAttribute("src",pic[i]);
                    pic1.setAttribute("width","250px");
                    pic1.setAttribute("value",pic_id[i]);
                    var link2 = document.createElement("a");
                    link2.setAttribute("hidefocus","true");
                    link2.setAttribute("style","width: 100%;");
                    link2.appendChild(pic1);
                    var div2 = document.createElement("div");
                    div2.setAttribute("class","pic");
                    div2.setAttribute("style","margin-top:10px;margin-left:-350px;max-height: 250px;width: 300%;cursor: hand;");
                    div2.appendChild(link2);
                    var div3 = document.createElement("div");
                    div3.setAttribute("style","opacity:1;float:left;width:50%;padding-left:20px;box-sizing:border-box;text-align:center;");
                    div3.appendChild(div2);

                    var p1 = document.createElement("p");
                    p1.innerHTML=des[i];
                    var p2 = document.createElement("p");
                    p2.innerHTML=time[i];
                    var b1 = document.createElement("blockquote");
                    b1.appendChild(p1);
                    b1.appendChild(p2);

                    var div4 = document.createElement("div");
                    div4.setAttribute("class","text");
                    div4.appendChild(b1);

                    var cnt = document.createElement("div");
                    cnt.setAttribute("class","cnt");
                    cnt.appendChild(div3);
                    cnt.appendChild(div4);

                    var work = document.createElement("div");
                    work.setAttribute("class","work");
                    work.appendChild(cnt);

                    var tagdiv=document.createElement("div");
                    for(var j=0;j<tag.length&&j<3;j++){
                        var span1 = document.createElement("span");
                        span1.setAttribute("class","opti");
                        span1.innerHTML=tag[j];
                        tagdiv.appendChild(span1);
                    }
                    var span2 = document.createElement("span");
                    span2.setAttribute("class","opti");
                    span2.innerHTML="热度("+hot[0]+")";
                    var span3 = document.createElement("span");
                    span3.setAttribute("class","opti_c");
                    span3.innerHTML="评论";
                    var span4 = document.createElement("span");
                    span4.setAttribute("class","opti");
                    span4.innerHTML="转发";
                    var span5=document.createElement("span");
                    span5.setAttribute("class","opti");
                    span5.setAttribute("style","margin-left: -5px;margin-top: -18px");
                    var link3=document.createElement("a");
                    var icon1=document.createElement("img");
                    icon1.setAttribute("src","./img/like_unclicked.png");
                    icon1.setAttribute("class","like_u");
                    var icon2=document.createElement("img");
                    icon2.setAttribute("src","./img/like_clicked.png");
                    icon2.setAttribute("class","like_c");
                    icon2.setAttribute("style","display: none;");
                    link3.appendChild(icon1);
                    link3.appendChild(icon2);
                    span5.appendChild(link3);
                    var divcomment=document.createElement("div");
                    divcomment.setAttribute("class","comment");
                    divcomment.appendChild(span2);
                    divcomment.appendChild(span3);
                    divcomment.appendChild(span4);
                    divcomment.appendChild(span5);
                    var fedback=document.createElement("div");
                    fedback.setAttribute("class","fed_back");
                    fedback.appendChild(tagdiv);
                    fedback.appendChild(divcomment);

                    var talk_body=document.createElement("div");
                    talk_body.setAttribute("class","talk_body");
                    talk_body.appendChild(work);
                    talk_body.appendChild(fedback);
                    for(var j=0;j<c_head.length;j++){
                        var c_bar=document.createElement("div");
                        c_bar.setAttribute("class","comment_bar1");
                        c_bar.setAttribute("style","display:none;");
                        var span6 = document.createElement("span");
                        span6.setAttribute("class","opti");
                        span6.setAttribute("style","margin-left: 20px;");
                        var link4=document.createElement("a");
                        var c_icon=document.createElement("img");
                        c_icon.setAttribute("src",c_head[i][j]);
                        c_icon.setAttribute("width","65px");
                        c_icon.setAttribute("style","border-radius:50%;");
                        c_icon.setAttribute("onclick","other_user_info()");
                        c_icon.setAttribute("value",c_id[i][j]);
                        c_icon.setAttribute("alt",c_name[i][j]);
                        c_icon.setAttribute("title",c_name[i][j]);
                        link4.appendChild(c_icon);
                        span6.appendChild(link4);
                        c_bar.appendChild(span6);
                        var div5=document.createElement("div");
                        div5.setAttribute("class","m_txt1");
                        var div6=document.createElement("div");
                        div6.setAttribute("class","m_content");
                        div6.innerHTML=comment[i][j];
                        div5.appendChild(div6);
                        c_bar.appendChild(div5);
                        talk_body.appendChild(c_bar);
                    }
                    var div7=document.createElement("div");
                    div7.setAttribute("class","comment_bar");
                    div7.setAttribute("style","display: none;");
                    var div8=document.createElement("div");
                    div8.setAttribute("class","c_input");
                    div8.setAttribute("contenteditable","true");
                    var input=document.createElement("input");
                    input.setAttribute("type","submit");
                    input.setAttribute("value","发布");
                    input.setAttribute("class","c_button");
                    div7.appendChild(div8);
                    div7.appendChild(input);
                    talk_body.appendChild(div7);
                    var content=document.createElement("div");
                    content.setAttribute("class","content");
                    var h=document.createElement("div");
                    h.setAttribute("class","talk_h");
                    content.appendChild(h);
                    content.appendChild(talk_body);

                    list.appendChild(content);

                    var head_pic1 = document.createElement("img");
                    head_pic1.setAttribute("src",head[i]);
                    head_pic1.setAttribute("width","65px");
                    head_pic1.setAttribute("onclick","other_user_info()");
                    head_pic1.setAttribute("value",id[i]);
                    head_pic1.setAttribute("alt",name[i]);
                    head_pic1.setAttribute("title",name[i]);
                    var link11 = document.createElement("a");
                    link11.setAttribute("target","_blank");
                    link11.appendChild(head_pic1);
                    var div11 = document.createElement("div");
                    div11.setAttribute("class","portrait");
                    div11.appendChild(link11);
                    var list1 = document.createElement("div");
                    list1.setAttribute("class","list");
                    list1.setAttribute("style","display: none;");
                    list1.appendChild(div11);

                    var pic11 = document.createElement("img");
                    pic11.setAttribute("src",pic[i]);
                    pic11.setAttribute("width","600px");
                    pic11.setAttribute("style","float:left;margin-left:320px;");
                    pic11.setAttribute("value",pic_id[i]);
                    var link21 = document.createElement("a");
                    link21.setAttribute("hidefocus","true");
                    link21.setAttribute("style","width: 300%;");
                    link21.appendChild(pic11);
                    var div21 = document.createElement("div");
                    div21.setAttribute("class","picbig");
                    div21.setAttribute("style","margin-top:10px;cursor: hand;width: 350%;");
                    div21.appendChild(link21);
                    var div31 = document.createElement("div");
                    div31.setAttribute("style","min-width: 100%;min-height:500px;margin-left:-85px;");
                    div31.appendChild(div21);

                    var p11 = document.createElement("p");
                    p11.innerHTML=des[i];
                    var p21 = document.createElement("p");
                    p21.innerHTML=time[i];
                    var b11 = document.createElement("blockquote");
                    b11.appendChild(p11);
                    b11.appendChild(p21);

                    var div41 = document.createElement("div");
                    div41.setAttribute("class","text");
                    div41.setAttribute("style","width: 100%;margin-left:-85px;");
                    div41.appendChild(b11);

                    var cnt1 = document.createElement("div");
                    cnt1.setAttribute("class","cnt");
                    cnt1.appendChild(div31);
                    cnt1.appendChild(div41);

                    var work1 = document.createElement("div");
                    work1.setAttribute("class","work1");
                    work1.appendChild(cnt1);

                    var tagdiv1=document.createElement("div");
                    tagdiv1.setAttribute("style","width: 191px");
                    for(var j=0;j<tag.length&&j<3;j++){
                        var span11 = document.createElement("span");
                        span11.setAttribute("class","opti");
                        span11.innerHTML=tag[j];
                        tagdiv1.appendChild(span11);
                    }
                    var span21 = document.createElement("span");
                    span21.setAttribute("class","opti");
                    span21.innerHTML="热度("+hot[0]+")";
                    var span31 = document.createElement("span");
                    span31.setAttribute("class","opti_c");
                    span31.innerHTML="评论";
                    var span41 = document.createElement("span");
                    span41.setAttribute("class","opti");
                    span41.innerHTML="转发";
                    var span51=document.createElement("span");
                    span51.setAttribute("class","opti");
                    span51.setAttribute("style","margin-left: -5px;margin-top: -18px");
                    var link31=document.createElement("a");
                    var icon11=document.createElement("img");
                    icon11.setAttribute("src","./img/like_unclicked.png");
                    icon11.setAttribute("class","like_u");
                    var icon21=document.createElement("img");
                    icon21.setAttribute("src","./img/like_clicked.png");
                    icon21.setAttribute("class","like_c");
                    icon21.setAttribute("style","display: none;");
                    link31.appendChild(icon11);
                    link31.appendChild(icon21);
                    span51.appendChild(link31);
                    var divcomment1=document.createElement("div");
                    divcomment1.setAttribute("class","comment");
                    divcomment1.appendChild(span21);
                    divcomment1.appendChild(span31);
                    divcomment1.appendChild(span41);
                    divcomment1.appendChild(span51);
                    var fedback1=document.createElement("div");
                    fedback1.setAttribute("class","fed_back");
                    fedback1.appendChild(tagdiv1);
                    fedback1.appendChild(divcomment1);

                    var talk_body1=document.createElement("div");
                    talk_body1.setAttribute("class","talk_body1");
                    talk_body1.appendChild(work1);
                    talk_body1.appendChild(fedback1);
                    for(var j=0;j<c_head.length;j++){
                        var c_bar1=document.createElement("div");
                        c_bar1.setAttribute("class","comment_bar1");
                        c_bar1.setAttribute("style","display:none;");
                        var span61 = document.createElement("span");
                        span61.setAttribute("class","opti");
                        span61.setAttribute("style","margin-left: 20px;");
                        var link41=document.createElement("a");
                        var c_icon1=document.createElement("img");
                        c_icon1.setAttribute("src",c_head[i][j]);
                        c_icon1.setAttribute("width","65px");
                        c_icon1.setAttribute("style","border-radius:50%;");
                        c_icon1.setAttribute("onclick","other_user_info()");
                        c_icon1.setAttribute("value",c_id[i][j]);
                        c_icon1.setAttribute("alt",c_name[i][j]);
                        c_icon1.setAttribute("title",c_name[i][j]);
                        link41.appendChild(c_icon1);
                        span61.appendChild(link41);
                        c_bar1.appendChild(span61);
                        var div51=document.createElement("div");
                        div51.setAttribute("class","m_txt1");
                        var div61=document.createElement("div");
                        div61.setAttribute("class","m_content");
                        div61.innerHTML=comment[i][j];
                        div51.appendChild(div61);
                        c_bar1.appendChild(div51);
                        talk_body1.appendChild(c_bar1);
                    }
                    var div71=document.createElement("div");
                    div71.setAttribute("class","comment_bar");
                    div71.setAttribute("style","display: none;");
                    var div81=document.createElement("div");
                    div81.setAttribute("class","c_input");
                    div81.setAttribute("contenteditable","true");
                    var input1=document.createElement("input");
                    input1.setAttribute("type","submit");
                    input1.setAttribute("value","发布");
                    input1.setAttribute("class","c_button");
                    div71.appendChild(div81);
                    div71.appendChild(input1);
                    talk_body1.appendChild(div71);
                    var content1=document.createElement("div");
                    content1.setAttribute("class","content");
                    var h1=document.createElement("div");
                    h1.setAttribute("class","talk_h");
                    content1.appendChild(h1);
                    content1.appendChild(talk_body1);

                    list1.appendChild(content1);
                    var tar = document.getElementById("index_main");
                    tar.appendChild(list);
                    tar.appendChild(list1);
                }
            }
            else {
                alert("fail");
            }
        },error:function (msg) {
            //alert("msg"+msg);
        }
    });
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/my_part.php",
        dataType: "json",
        data: {"id": userid},
        success: function (result) {
            if (result) {
                for (var i = 0; i < result.length; i++) {
                    a_id.push(result[i].id);
                    type.push(result[i].type);
                    author.push(result[i].author);
                    author_head.push(result[i].head);
                    author_mark.push(result[i].mark);
                    act_type.push(result[i].act);
                    location.push(result[i].location);
                    fare.push(result[i].fare);
                    ask.push(result[i].ask);
                }
                for(var i=0;i<head.length;i++){
                    var card=document.createElement("div");
                    card.setAttribute("class","a_card");
                    var div1=document.createElement("div");
                    div1.setAttribute("style","height: 20px;");
                    card.appendChild(div1);
                    var p_head=document.createElement("div");
                    p_head.setAttribute("class","p_head");
                    var span1=document.createElement("span");
                    span1.setAttribute("class","opti");
                    span1.setAttribute("style","margin-left: 2px;");
                    var link1=document.createElement("a");
                    var img1=document.createElement("img");
                    img1.setAttribute("src",author_head[i]);
                    img1.setAttribute("width","65px");
                    img1.setAttribute("onclick","other_user_info()");
                    img1.setAttribute("value",author[i]);
                    img1.setAttribute("style","border-radius:50%;");
                    link1.appendChild(img1);
                    span1.appendChild(link1);
                    p_head.appendChild(span1);
                    var span2=document.createElement("span");
                    span2.setAttribute("class","opti");
                    var link2=document.createElement("a");
                    link2.setAttribute("class","a_tag");
                    var span3=document.createElement("span");
                    span3.setAttribute("style","margin-left: 0px;margin-right: 0px;");
                    span3.innerHTML="·"+type[i];
                    link2.appendChild(span3);
                    span2.appendChild(link2);
                    p_head.appendChild(span2);
                    var div2=document.createElement("div");
                    var span4=document.createElement("span");
                    span4.setAttribute("class","opti");
                    var link3=document.createElement("a");
                    link3.setAttribute("class","a_tag");
                    link3.setAttribute("style","width: 80px;margin-left: 10px;font-size: 15px;color: #222222;");
                    var span5=document.createElement("span");
                    span5.setAttribute("style","margin-left: 0px;margin-right: 0px;");
                    var loc=document.createElement("img");
                    loc.setAttribute("src","./img/location.png");
                    span5.appendChild(loc);
                    var span6=document.createElement("span");
                    span6.setAttribute("style","margin-left: 0px;margin-right: 20px;");
                    span6.innerHTML=location[i];
                    var span7=document.createElement("span");
                    span7.setAttribute("style","margin-left: 10px;margin-right: 20px;");
                    span7.innerHTML=act_type[i];
                    var span8=document.createElement("span");
                    span8.setAttribute("style","margin-left: 10px;margin-right: 20px;");
                    span8.innerHTML=fare[i];
                    var span9=document.createElement("span");
                    span9.setAttribute("margin-left: 10px;margin-right: 20px;");
                    span9.innerHTML=author_mark[i];
                    link3.appendChild(span5);
                    link3.appendChild(span6);
                    link3.appendChild(span7);
                    link3.appendChild(span8);
                    link3.appendChild(span9);
                    span4.appendChild(link3);
                    div2.appendChild(span4);
                    card.appendChild(div2);
                    var div3=document.createElement("div");
                    div3.setAttribute("class","announce_des");
                    var p1=document.createElement("p");
                    p1.setAttribute("style","text-align: left;margin-left: 25px");
                    p1.innerHTML=ask[i];
                    div3.appendChild(p1);
                    card.appendChild(div3);
                    var tar1 = document.getElementById("side");
                    tar1.appendChild(card);
                }
            }
            else {
                alert("fail");
            }
        },error:function (msg) {
            alert("msg"+msg);
        }
    });
}

function follow(id){
    var group=prompt("请输入分组：","");
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/add_follow.php",
        dataType: "json",
        data: {"id":id,
        "group":group},
        success: function (result) {
        },
        error:function (msg) {
        },
    });
};

function unfollow(id){
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/unfollow.php",
        dataType: "json",
        data: {"id":id},
        success: function (result) {
        },
        error:function (msg) {
        },
    });
};

function user_info_mod(username,password,special,interest,location,contact,description){
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/user_info_mod.php",
        dataType: "json",
        data: {"name": name,
            "pwd":pwd,
            "special":special,
            "interest":interest,
            "location":location,
            "contact":contact,
            "des":des},
        success: function (result) {
            if (result[0].answer == "Fail") {
                alert("请再试一次");
            }
            else if(result[0].answer == "Success"){
                alert("修改成功！")
                window.location.href='./user_index.jsp';
            }
        }
    });
}

function my_work(){
    var album=[];
    var a_pic=[]
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/get_album.php",
        dataType: "json",
        data:{"id":userid},
        success: function (result) {
            if (result) {
                for (var i = 0; i < result.length; i++) {
                    album.push(result[i].album);
                    a_pic.push(result[i].pic);
                }
                for(var i=0;i<album.length;i++){
                    var al = document.createElement("img");
                    al.setAttribute("src",a_pic[i]);
                    al.setAttribute("width","180");
                    al.setAttribute("style","z-index: 3");
                    var span1=document.createElement("span");
                    span1.setAttribute("class","operator");
                    var del = document.createElement("img");
                    del.setAttribute("src","./img/delete.png");
                    span1.appendChild(del);
                    var span2=document.createElement("span");
                    span2.setAttribute("class","name");
                    span2.innerHTML=album[i];
                    var alb=document.createElement("div");
                    alb.setAttribute("class","album");
                    alb.appendChild(al);
                    alb.appendChild(span1);
                    alb.appendChild(span2);
                    var tar1 = document.getElementById("album_list");
                    tar1.appendChild(alb);
                }
            }
            else {
                alert("fail");
            }
        },error:function (msg) {
            //alert("msg"+msg);
        }
    });

}

function album_pic(n){
    var head=[];
    var name=[];
    var pic=[];
    var pic_id=[];
    var tag=[];
    var hot=[];
    var comment=[];
    var c_head=[];
    var c_name=[];
    var c_id=[];
    var des=[];
    var time=[];
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/get_my_picture.php",
        dataType: "json",
        data:{"album":n},
        success: function (result) {
            if (result) {
                for (var i = 0; i < result.length; i++) {
                    head.push(result[i].head);
                    pic_id.push(result[i].picid);
                    tag.push(result[i].tag);
                    hot.push(result[i].hot);
                    name.push(result[i].name);
                    pic.push(result[i].pic);
                    des.push(result[i].des);
                    time.push(result[i].time);
                }
                for(var i=0;i<pic_id.length;i++){
                    var c=[];
                    var h=[];
                    var n=[];
                    var id=[];
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "../src/main/get_comment.php",
                        dataType: "json",
                        data:{"id":pic_id[i]},
                        success: function (result) {
                            if (result) {
                                for (var j = 0; j < result.length; j++) {
                                    c.push(result[i].content);
                                    h.push(result[i].head);
                                    n.push(result[i].name);
                                    id.push(result[i].id);
                                }
                            }
                            else {
                                alert("fail");
                            }
                        },error:function (msg) {
                            alert("msg"+msg);
                        }
                    });
                    comment.push(c);
                    c_head.push(h);
                    c_id.push(id);
                    c_name.push(n);
                }
                for(var i=0;i<head.length;i++){
                    var head_pic = document.createElement("img");
                    head_pic.setAttribute("src",head[i]);
                    head_pic.setAttribute("width","65px");
                    head_pic.setAttribute("onclick","other_user_info()");
                    head_pic.setAttribute("value",id[i]);
                    head_pic.setAttribute("alt",name[i]);
                    head_pic.setAttribute("title",name[i]);
                    var link1 = document.createElement("a");
                    link1.setAttribute("target","_blank");
                    link1.appendChild(head_pic);
                    var div1 = document.createElement("div");
                    div1.setAttribute("class","portrait");
                    div1.appendChild(link1);
                    var list = document.createElement("div");
                    list.setAttribute("class","list");
                    list.appendChild(div1);

                    var pic1 = document.createElement("img");
                    pic1.setAttribute("src",pic[i]);
                    pic1.setAttribute("width","250px");
                    pic1.setAttribute("value",pic_id[i]);
                    var link2 = document.createElement("a");
                    link2.setAttribute("hidefocus","true");
                    link2.setAttribute("style","width: 100%;");
                    link2.appendChild(pic1);
                    var div2 = document.createElement("div");
                    div2.setAttribute("class","pic");
                    div2.setAttribute("style","margin-top:10px;margin-left:-350px;max-height: 250px;width: 300%;cursor: hand;");
                    div2.appendChild(link2);
                    var div3 = document.createElement("div");
                    div3.setAttribute("style","opacity:1;float:left;width:50%;padding-left:20px;box-sizing:border-box;text-align:center;");
                    div3.appendChild(div2);

                    var p1 = document.createElement("p");
                    p1.innerHTML=des[i];
                    var p2 = document.createElement("p");
                    p2.innerHTML=time[i];
                    var b1 = document.createElement("blockquote");
                    b1.appendChild(p1);
                    b1.appendChild(p2);

                    var div4 = document.createElement("div");
                    div4.setAttribute("class","text");
                    div4.appendChild(b1);

                    var cnt = document.createElement("div");
                    cnt.setAttribute("class","cnt");
                    cnt.appendChild(div3);
                    cnt.appendChild(div4);

                    var work = document.createElement("div");
                    work.setAttribute("class","work");
                    work.appendChild(cnt);

                    var tagdiv=document.createElement("div");
                    for(var j=0;j<tag.length&&j<3;j++){
                        var span1 = document.createElement("span");
                        span1.setAttribute("class","opti");
                        span1.innerHTML=tag[j];
                        tagdiv.appendChild(span1);
                    }
                    var span2 = document.createElement("span");
                    span2.setAttribute("class","opti");
                    span2.innerHTML="热度("+hot[0]+")";
                    var span3 = document.createElement("span");
                    span3.setAttribute("class","opti_c");
                    span3.innerHTML="评论";
                    var span4 = document.createElement("span");
                    span4.setAttribute("class","opti");
                    span4.innerHTML="删除";
                    var span5=document.createElement("span");
                    span5.setAttribute("class","opti");
                    span5.setAttribute("style","margin-left: -5px;margin-top: -18px");
                    var link3=document.createElement("a");
                    var icon1=document.createElement("img");
                    icon1.setAttribute("src","./img/like_unclicked.png");
                    icon1.setAttribute("class","like_u");
                    var icon2=document.createElement("img");
                    icon2.setAttribute("src","./img/like_clicked.png");
                    icon2.setAttribute("class","like_c");
                    icon2.setAttribute("style","display: none;");
                    link3.appendChild(icon1);
                    link3.appendChild(icon2);
                    span5.appendChild(link3);
                    var divcomment=document.createElement("div");
                    divcomment.setAttribute("class","comment");
                    divcomment.appendChild(span2);
                    divcomment.appendChild(span3);
                    divcomment.appendChild(span4);
                    divcomment.appendChild(span5);
                    var fedback=document.createElement("div");
                    fedback.setAttribute("class","fed_back");
                    fedback.appendChild(tagdiv);
                    fedback.appendChild(divcomment);

                    var talk_body=document.createElement("div");
                    talk_body.setAttribute("class","talk_body");
                    talk_body.appendChild(work);
                    talk_body.appendChild(fedback);
                    for(var j=0;j<c_head.length;j++){
                        var c_bar=document.createElement("div");
                        c_bar.setAttribute("class","comment_bar1");
                        c_bar.setAttribute("style","display:none;");
                        var span6 = document.createElement("span");
                        span6.setAttribute("class","opti");
                        span6.setAttribute("style","margin-left: 20px;");
                        var link4=document.createElement("a");
                        var c_icon=document.createElement("img");
                        c_icon.setAttribute("src",c_head[i][j]);
                        c_icon.setAttribute("width","65px");
                        c_icon.setAttribute("style","border-radius:50%;");
                        c_icon.setAttribute("onclick","other_user_info()");
                        c_icon.setAttribute("value",c_id[i][j]);
                        c_icon.setAttribute("alt",c_name[i][j]);
                        c_icon.setAttribute("title",c_name[i][j]);
                        link4.appendChild(c_icon);
                        span6.appendChild(link4);
                        c_bar.appendChild(span6);
                        var div5=document.createElement("div");
                        div5.setAttribute("class","m_txt1");
                        var div6=document.createElement("div");
                        div6.setAttribute("class","m_content");
                        div6.innerHTML=comment[i][j];
                        div5.appendChild(div6);
                        c_bar.appendChild(div5);
                        talk_body.appendChild(c_bar);
                    }
                    var div7=document.createElement("div");
                    div7.setAttribute("class","comment_bar");
                    div7.setAttribute("style","display: none;");
                    var div8=document.createElement("div");
                    div8.setAttribute("class","c_input");
                    div8.setAttribute("contenteditable","true");
                    var input=document.createElement("input");
                    input.setAttribute("type","submit");
                    input.setAttribute("value","发布");
                    input.setAttribute("class","c_button");
                    div7.appendChild(div8);
                    div7.appendChild(input);
                    talk_body.appendChild(div7);
                    var content=document.createElement("div");
                    content.setAttribute("class","content");
                    var h=document.createElement("div");
                    h.setAttribute("class","talk_h");
                    content.appendChild(h);
                    content.appendChild(talk_body);

                    list.appendChild(content);

                    var head_pic1 = document.createElement("img");
                    head_pic1.setAttribute("src",head[i]);
                    head_pic1.setAttribute("width","65px");
                    head_pic1.setAttribute("onclick","other_user_info()");
                    head_pic1.setAttribute("value",id[i]);
                    head_pic1.setAttribute("alt",name[i]);
                    head_pic1.setAttribute("title",name[i]);
                    var link11 = document.createElement("a");
                    link11.setAttribute("target","_blank");
                    link11.appendChild(head_pic1);
                    var div11 = document.createElement("div");
                    div11.setAttribute("class","portrait");
                    div11.appendChild(link11);
                    var list1 = document.createElement("div");
                    list1.setAttribute("class","list");
                    list1.setAttribute("style","display: none;");
                    list1.appendChild(div11);

                    var pic11 = document.createElement("img");
                    pic11.setAttribute("src",pic[i]);
                    pic11.setAttribute("width","600px");
                    pic11.setAttribute("style","float:left;margin-left:320px;");
                    pic11.setAttribute("value",pic_id[i]);
                    var link21 = document.createElement("a");
                    link21.setAttribute("hidefocus","true");
                    link21.setAttribute("style","width: 300%;");
                    link21.appendChild(pic11);
                    var div21 = document.createElement("div");
                    div21.setAttribute("class","picbig");
                    div21.setAttribute("style","margin-top:10px;cursor: hand;width: 350%;");
                    div21.appendChild(link21);
                    var div31 = document.createElement("div");
                    div31.setAttribute("style","min-width: 100%;min-height:500px;margin-left:-85px;");
                    div31.appendChild(div21);

                    var p11 = document.createElement("p");
                    p11.innerHTML=des[i];
                    var p21 = document.createElement("p");
                    p21.innerHTML=time[i];
                    var b11 = document.createElement("blockquote");
                    b11.appendChild(p11);
                    b11.appendChild(p21);

                    var div41 = document.createElement("div");
                    div41.setAttribute("class","text");
                    div41.setAttribute("style","width: 100%;margin-left:-85px;");
                    div41.appendChild(b11);

                    var cnt1 = document.createElement("div");
                    cnt1.setAttribute("class","cnt");
                    cnt1.appendChild(div31);
                    cnt1.appendChild(div41);

                    var work1 = document.createElement("div");
                    work1.setAttribute("class","work1");
                    work1.appendChild(cnt1);

                    var tagdiv1=document.createElement("div");
                    tagdiv1.setAttribute("style","width: 191px");
                    for(var j=0;j<tag.length&&j<3;j++){
                        var span11 = document.createElement("span");
                        span11.setAttribute("class","opti");
                        span11.innerHTML=tag[j];
                        tagdiv1.appendChild(span11);
                    }
                    var span21 = document.createElement("span");
                    span21.setAttribute("class","opti");
                    span21.innerHTML="热度("+hot[0]+")";
                    var span31 = document.createElement("span");
                    span31.setAttribute("class","opti_c");
                    span31.innerHTML="评论";
                    var span41 = document.createElement("span");
                    span41.setAttribute("class","opti");
                    span41.innerHTML="转发";
                    var span51=document.createElement("span");
                    span51.setAttribute("class","opti");
                    span51.setAttribute("style","margin-left: -5px;margin-top: -18px");
                    var link31=document.createElement("a");
                    var icon11=document.createElement("img");
                    icon11.setAttribute("src","./img/like_unclicked.png");
                    icon11.setAttribute("class","like_u");
                    var icon21=document.createElement("img");
                    icon21.setAttribute("src","./img/like_clicked.png");
                    icon21.setAttribute("class","like_c");
                    icon21.setAttribute("style","display: none;");
                    link31.appendChild(icon11);
                    link31.appendChild(icon21);
                    span51.appendChild(link31);
                    var divcomment1=document.createElement("div");
                    divcomment1.setAttribute("class","comment");
                    divcomment1.appendChild(span21);
                    divcomment1.appendChild(span31);
                    divcomment1.appendChild(span41);
                    divcomment1.appendChild(span51);
                    var fedback1=document.createElement("div");
                    fedback1.setAttribute("class","fed_back");
                    fedback1.appendChild(tagdiv1);
                    fedback1.appendChild(divcomment1);

                    var talk_body1=document.createElement("div");
                    talk_body1.setAttribute("class","talk_body1");
                    talk_body1.appendChild(work1);
                    talk_body1.appendChild(fedback1);
                    for(var j=0;j<c_head.length;j++){
                        var c_bar1=document.createElement("div");
                        c_bar1.setAttribute("class","comment_bar1");
                        c_bar1.setAttribute("style","display:none;");
                        var span61 = document.createElement("span");
                        span61.setAttribute("class","opti");
                        span61.setAttribute("style","margin-left: 20px;");
                        var link41=document.createElement("a");
                        var c_icon1=document.createElement("img");
                        c_icon1.setAttribute("src",c_head[i][j]);
                        c_icon1.setAttribute("width","65px");
                        c_icon1.setAttribute("style","border-radius:50%;");
                        c_icon1.setAttribute("onclick","other_user_info()");
                        c_icon1.setAttribute("value",c_id[i][j]);
                        c_icon1.setAttribute("alt",c_name[i][j]);
                        c_icon1.setAttribute("title",c_name[i][j]);
                        link41.appendChild(c_icon1);
                        span61.appendChild(link41);
                        c_bar1.appendChild(span61);
                        var div51=document.createElement("div");
                        div51.setAttribute("class","m_txt1");
                        var div61=document.createElement("div");
                        div61.setAttribute("class","m_content");
                        div61.innerHTML=comment[i][j];
                        div51.appendChild(div61);
                        c_bar1.appendChild(div51);
                        talk_body1.appendChild(c_bar1);
                    }
                    var div71=document.createElement("div");
                    div71.setAttribute("class","comment_bar");
                    div71.setAttribute("style","display: none;");
                    var div81=document.createElement("div");
                    div81.setAttribute("class","c_input");
                    div81.setAttribute("contenteditable","true");
                    var input1=document.createElement("input");
                    input1.setAttribute("type","submit");
                    input1.setAttribute("value","发布");
                    input1.setAttribute("class","c_button");
                    div71.appendChild(div81);
                    div71.appendChild(input1);
                    talk_body1.appendChild(div71);
                    var content1=document.createElement("div");
                    content1.setAttribute("class","content");
                    var h1=document.createElement("div");
                    h1.setAttribute("class","talk_h");
                    content1.appendChild(h1);
                    content1.appendChild(talk_body1);

                    list1.appendChild(content1);
                    var tar = document.getElementById("i_pie_list");
                    tar.appendChild(list);
                    tar.appendChild(list1);
                }
            }
            else {
                alert("fail");
            }
        },error:function (msg) {
            //alert("msg"+msg);
        }
    });

}

function album_delete(name){
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/album_delete.php",
        dataType: "json",
        data: {"name":name},
        success: function (result) {
        },
        error:function (msg) {
        },
    });
}

function picture_delete(pid){
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/delete_picture.php",
        dataType: "json",
        data: {"picid":pid},
        success: function (result) {
        },
        error:function (msg) {
        },
    });
}

function album_create(name,tag,des){
    var result = [];

    $.ajax({
        type: "post",
        async: true,
        url: "../controller/album_add.php",
        dataType: "json",
        data: {"name": name,
            "tag": tag,
            "des": des},
        success: function (res) {
            if (res) {
                for (var i = 0; i < res.length; i++) {
                    result.push(res[i].result);
                }

            }
            else {
                alert("fail");
            }
            if(result=="SUCCESS"){
                alert("创建成功！");
            }
        },
        error:function (msg) {
            //alert(msg);
        },
    });
};

function my_follow(){
    var group=[];
    var like_head=[];
    var like_name=[];
    var like_id=[];

    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/get_my_group.php",
        dataType: "json",
        success: function (result) {
            if (result) {
                for (var i = 0; i < result.length; i++) {
                    group.push(result[0].group);
                }
            }
            else {
                //alert("fail");
            }
        },error:function (msg) {
            alert("msg"+msg);
        }
    });
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/get_follow.php",
        dataType: "json",
        data:{"group":group[0]},
        success: function (result) {
            if (result) {
                for (var i = 0; i < result.length; i++) {
                    like_head.push(result[i].head);
                    like_id.push(result[i].id);
                    like_name.push(result[i].name);
                }
                for(var i=0;i<group.length;i++){
                    var li1=document.createElement("li");
                    var link1=document.createElement("a");
                    link1.innerHTML=group[i];
                    li1.appendChild(link1);
                    var tar = document.getElementById("group_ul");
                    tar.appendChild(li1);
                }
                var count=0;
                for(var i=0;i<like_head.length;i++){
                    var guesslike=document.createElement("div");
                    guesslike.setAttribute("class","t_follow");
                    var txt=document.createElement("div");
                    txt.setAttribute("class","txt1");
                    guesslike.appendChild(txt);
                    var div01=document.createElement("div");
                    var likehead=document.createElement("div");
                    likehead.setAttribute("class","like_head");
                    var link01=document.createElement("a");
                    link01.setAttribute("class","por");
                    var head_pic21=document.createElement("img");
                    head_pic21.setAttribute("src",like_head[i]);
                    head_pic21.setAttribute("value",like_id[i]);
                    head_pic21.setAttribute("width","100px");
                    head_pic21.setAttribute("onclick","other_user_info()");
                    link01.appendChild(head_pic21);
                    likehead.appendChild(link01);
                    var div02=document.createElement("div");
                    div02.setAttribute("style","height: 35px");
                    likehead.appendChild(div02);
                    var link02=document.createElement("a");
                    link02.setAttribute("style","margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;");
                    link02.setAttribute("onclick","other_user_info()");
                    link02.innerHTML="琪琪";
                    likehead.appendChild(link02);
                    div01.appendChild(likehead);
                    var link03=document.createElement("a");
                    link03.setAttribute("class","follow_button");
                    link03.setAttribute("style","display: none");
                    var span02=document.createElement("span");
                    span02.setAttribute("class","fol1");
                    var addicon=document.createElement("img");
                    addicon.setAttribute("src","./img/add.png");
                    span02.appendChild(addicon);
                    var span03=document.createElement("span");
                    span03.setAttribute("class","fol1");
                    span03.innerHTML="关";
                    var span04=document.createElement("span");
                    span04.setAttribute("class","fol1");
                    span04.innerHTML="注";
                    link03.appendChild(span02);
                    link03.appendChild(span03);
                    link03.appendChild(span04);
                    var link04=document.createElement("a");
                    link04.setAttribute("class","disfollow_btn");
                    var span05=document.createElement("span");
                    span05.setAttribute("class","unfollow_txt");
                    span05.innerHTML="取";
                    var span06=document.createElement("span");
                    span06.setAttribute("class","unfollow_txt");
                    span06.innerHTML="消";
                    var span07=document.createElement("span");
                    span07.setAttribute("class","unfollow_txt");
                    span07.innerHTML="关";
                    var span08=document.createElement("span");
                    span08.setAttribute("class","unfollow_txt");
                    span08.innerHTML="注";
                    link04.appendChild(span05);
                    link04.appendChild(span06);
                    link04.appendChild(span07);
                    link04.appendChild(span08);
                    div01.appendChild(link03);
                    div01.appendChild(link04);
                    guesslike.appendChild(div01);
                    if(count==0){
                        var tar1 = document.getElementById("f_col_0");
                        tar1.appendChild(guesslike);
                        count=1;
                    }
                    else if(count==1){
                        var tar1 = document.getElementById("f_col_1");
                        tar1.appendChild(guesslike);
                        count=2;
                    }
                    else{
                        var tar1 = document.getElementById("f_col_2");
                        tar1.appendChild(guesslike);
                        count=0;
                    }
                }
            }
            else {
                alert("fail");
            }
        },error:function (msg) {
            //alert("msg"+msg);
        }
    });

}

function group_change(){
    var name=$(this).find("a").innerHTML;
    var like_head=[];
    var like_name=[];
    var like_id=[];
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/get_follow.php",
        dataType: "json",
        data:{"id":userid,
            "group":name},
        success: function (result) {
            if (result) {
                for (var i = 0; i < result.length; i++) {
                    like_head.push(result[i].head);
                    like_id.push(result[i].id);
                    like_name.push(result[i].name);
                }
                var count=0;
                var tar = document.getElementById("f_col_0");
                tar.innerHTML="";
                tar = document.getElementById("f_col_1");
                tar.innerHTML="";
                tar = document.getElementById("f_col_2");
                tar.innerHTML="";
                for(var i=0;i<like_head.length;i++){
                    var guesslike=document.createElement("div");
                    guesslike.setAttribute("class","t_follow");
                    var txt=document.createElement("div");
                    txt.setAttribute("class","txt1");
                    guesslike.appendChild(txt);
                    var div01=document.createElement("div");
                    var likehead=document.createElement("div");
                    likehead.setAttribute("class","like_head");
                    var link01=document.createElement("a");
                    link01.setAttribute("class","por");
                    var head_pic21=document.createElement("img");
                    head_pic21.setAttribute("src",like_head[i]);
                    head_pic21.setAttribute("value",like_id[i]);
                    head_pic21.setAttribute("width","100px");
                    head_pic21.setAttribute("onclick","other_user_info()");
                    link01.appendChild(head_pic21);
                    likehead.appendChild(link01);
                    var div02=document.createElement("div");
                    div02.setAttribute("style","height: 35px");
                    likehead.appendChild(div02);
                    var link02=document.createElement("a");
                    link02.setAttribute("style","margin-top: 40px;font-family:'Microsoft YaHei';font-size: 25px;");
                    link02.setAttribute("onclick","other_user_info()");
                    link02.innerHTML="琪琪";
                    likehead.appendChild(link02);
                    div01.appendChild(likehead);
                    var link03=document.createElement("a");
                    link03.setAttribute("class","follow_button");
                    link03.setAttribute("style","display: none");
                    var span02=document.createElement("span");
                    span02.setAttribute("class","fol1");
                    var addicon=document.createElement("img");
                    addicon.setAttribute("src","./img/add.png");
                    span02.appendChild(addicon);
                    var span03=document.createElement("span");
                    span03.setAttribute("class","fol1");
                    span03.innerHTML="关";
                    var span04=document.createElement("span");
                    span04.setAttribute("class","fol1");
                    span04.innerHTML="注";
                    link03.appendChild(span02);
                    link03.appendChild(span03);
                    link03.appendChild(span04);
                    var link04=document.createElement("a");
                    link04.setAttribute("class","disfollow_btn");
                    var span05=document.createElement("span");
                    span05.setAttribute("class","unfollow_txt");
                    span05.innerHTML="取";
                    var span06=document.createElement("span");
                    span06.setAttribute("class","unfollow_txt");
                    span06.innerHTML="消";
                    var span07=document.createElement("span");
                    span07.setAttribute("class","unfollow_txt");
                    span07.innerHTML="关";
                    var span08=document.createElement("span");
                    span08.setAttribute("class","unfollow_txt");
                    span08.innerHTML="注";
                    link04.appendChild(span05);
                    link04.appendChild(span06);
                    link04.appendChild(span07);
                    link04.appendChild(span08);
                    div01.appendChild(link03);
                    div01.appendChild(link04);
                    guesslike.appendChild(div01);
                    if(count==0){
                        var tar1 = document.getElementById("f_col_0");
                        tar1.appendChild(guesslike);
                        count=1;
                    }
                    else if(count==1){
                        var tar1 = document.getElementById("f_col_1");
                        tar1.appendChild(guesslike);
                        count=2;
                    }
                    else{
                        var tar1 = document.getElementById("f_col_2");
                        tar1.appendChild(guesslike);
                        count=0;
                    }
                }
            }
            else {
                alert("fail");
            }
        },error:function (msg) {
            //alert("msg"+msg);
        }
    });

}