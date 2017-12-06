
function pic_search_keyword(keyword){
    var head=[];
    var id=[];
    var name=[];
    var pic=[];
    var pic_id=[];
    var comment=[];
    var c_head=[];
    var c_name=[];
    var c_id=[];
    var des=[];
    var hot=[];
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/picture_search.php",
        dataType: "json",
        data:{"key":keyword},
        success: function (result) {
            if (result) {
                for (var i = 0; i < result.length; i++) {
                    head.push(result[i].head);
                    id.push(result[i].id);
                    pic_id.push(result[i].picid);
                    hot.push(result[i].hot);
                    name.push(result[i].name);
                    pic.push(result[i].pic);
                    des.push(result[i].des);
                }
                for(var i=0;i<pic_id.length;i++){
                    var c=[];
                    var h=[];
                    var n=[];
                    var idd=[];
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
                                    idd.push(result[i].id);
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
                    c_id.push(idd);
                    c_name.push(n);
                }
                var count=0;
                for(var i=0;i<head.length;i++){
                    var card=document.createElement("div");
                    card.setAttribute("class","card");
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
                    img1.setAttribute("src",head[i]);
                    img1.setAttribute("width","65px");
                    img1.setAttribute("onclick","other_user_info()");
                    img1.setAttribute("value",id[i]);
                    img1.setAttribute("alt",name[i]);
                    img1.setAttribute("title",name[i]);
                    img1.setAttribute("style","border-radius:50%;");
                    link1.appendChild(img1);
                    span1.appendChild(link1);
                    p_head.appendChild(span1);
                    var span2=document.createElement("span");
                    span2.setAttribute("class","opti");
                    var link2=document.createElement("a");
                    link2.setAttribute("class","follow_button");
                    link2.setAttribute("style","width: 80px;margin-left: 10px;");
                    var span3=document.createElement("span");
                    span3.setAttribute("style","margin-left: 0px;margin-right: 0px;");
                    var addicon=document.createElement("img");
                    addicon.setAttribute("src","./img/add.png");
                    span3.appendChild(addicon);
                    var span4=document.createElement("span");
                    span4.setAttribute("style","margin-left: 0px;margin-right: 0px;");
                    span4.innerHTML="关";
                    var span5=document.createElement("span");
                    span5.setAttribute("style","margin-left: 5px;margin-right: 0px;");
                    span5.innerHTML="注";
                    link2.appendChild(span3);
                    link2.appendChild(span4);
                    link2.appendChild(span5);
                    var link3=document.createElement("a");
                    link3.setAttribute("class","disfollow_btn");
                    link3.setAttribute("style","width: 110px;margin-left: 10px;display: none;");
                    var span6=document.createElement("span");
                    span6.setAttribute("class","unfollow_txt1");
                    span6.innerHTML="取";
                    var span7=document.createElement("span");
                    span7.setAttribute("class","unfollow_txt1");
                    span7.innerHTML="消";
                    var span8=document.createElement("span");
                    span8.setAttribute("class","unfollow_txt1");
                    span8.innerHTML="关";
                    var span9=document.createElement("span");
                    span9.setAttribute("class","unfollow_txt1");
                    span9.innerHTML="注";
                    link3.appendChild(span6);
                    link3.appendChild(span7);
                    link3.appendChild(span8);
                    link3.appendChild(span9);
                    span2.appendChild(link2);
                    span2.appendChild(link3);
                    p_head.appendChild(span2);
                    card.appendChild(p_head);
                    var imgdiv=document.createElement("div");
                    imgdiv.setAttribute("class","img");
                    var pic1 = document.createElement("img");
                    pic1.setAttribute("src",pic[i]);
                    pic1.setAttribute("width","300");
                    pic1.setAttribute("value",pic_id[i]);
                    imgdiv.appendChild(pic1);
                    card.appendChild(imgdiv);
                    var desdiv=document.createElement("div");
                    desdiv.setAttribute("class","des");
                    var word=document.createElement("div");
                    word.setAttribute("class","words");
                    var p1=document.createElement("p");
                    p1.setAttribute("style","text-align: left;margin-left: 25px");
                    p1.innerHTML=des[i];
                    word.appendChild(p1);
                    desdiv.appendChild(word);
                    card.appendChild(desdiv);
                    var like=document.createElement("div");
                    like.setAttribute("class","like");
                    like.setAttribute("style","with:100%;min-height: 65px;");
                    var lic=document.createElement("div");
                    lic.setAttribute("class","like_icon");
                    lic.setAttribute("style","float: left;");
                    var link4=document.createElement("a");
                    var icon1=document.createElement("img");
                    icon1.setAttribute("src","./img/like_unclicked.png");
                    icon1.setAttribute("class","like_u");
                    var icon2=document.createElement("img");
                    icon2.setAttribute("src","./img/like_clicked.png");
                    icon2.setAttribute("class","like_c");
                    icon2.setAttribute("style","display: none;");
                    link4.appendChild(icon1);
                    link4.appendChild(icon2);
                    lic.appendChild(link4);
                    like.appendChild(lic);
                    var div2=document.createElement("div");
                    div2.setAttribute("class","like_num");
                    div2.setAttribute("style","float: left;");
                    div2.innerHTML=""+hot[i]+"人喜欢";
                    var div3=document.createElement("div");
                    div3.setAttribute("class","like_num_c");
                    div3.setAttribute("style","float: left;margin-left: 90px;margin-right:10px;margin-top: 18px;cursor: hand;");
                    div3.innerHTML="评论";
                    var div4=document.createElement("div");
                    div4.setAttribute("class","like_num");
                    div4.setAttribute("style","float: left;margin-top: 18px;");
                    div4.innerHTML="转发";
                    like.appendChild(div2);
                    like.appendChild(div3);
                    like.appendChild(div4);
                    card.appendChild(like);
                    for(var j=0;j<c_head.length;j++){
                        var c_bar=document.createElement("div");
                        c_bar.setAttribute("class","comment_bar1");
                        c_bar.setAttribute("style","display:none;width: 100%;margin-left: 0px;min-height: 40px;");
                        var span10 = document.createElement("span");
                        span10.setAttribute("class","opti");
                        span10.setAttribute("style","margin-left: 20px;float: left;");
                        var link5=document.createElement("a");
                        var c_icon=document.createElement("img");
                        c_icon.setAttribute("src",c_head[i][j]);
                        c_icon.setAttribute("width","30px");
                        c_icon.setAttribute("style","border-radius:50%;");
                        c_icon.setAttribute("onclick","other_user_info()");
                        c_icon.setAttribute("value",c_id[i][j]);
                        c_icon.setAttribute("alt",c_name[i][j]);
                        c_icon.setAttribute("title",c_name[i][j]);
                        link5.appendChild(c_icon);
                        span10.appendChild(link5);
                        c_bar.appendChild(span10);
                        var div5=document.createElement("div");
                        div5.setAttribute("class","m_txt1");
                        div5.setAttribute("style","width: 250px;margin-top: 0px");
                        var div6=document.createElement("div");
                        div6.setAttribute("class","m_content");
                        div6.innerHTML=comment[i][j];
                        div5.appendChild(div6);
                        c_bar.appendChild(div5);
                        card.appendChild(c_bar);
                    }
                    var div7=document.createElement("div");
                    div7.setAttribute("class","comment_bar");
                    div7.setAttribute("style","display: none;width: 100%; margin-left: 0px;");
                    var div8=document.createElement("div");
                    div8.setAttribute("class","c_input");
                    div8.setAttribute("contenteditable","true");
                    div8.setAttribute("style","margin-left:4px;width:250px;min-height:15px;line-height:15px;");
                    var input=document.createElement("input");
                    input.setAttribute("type","submit");
                    input.setAttribute("value","发布");
                    input.setAttribute("class","c_button");
                    input.setAttribute("style","font-size: 14px;font-weight: normal;width:50px;height:34px;margin-top: -30px;");
                    div7.appendChild(div8);
                    div7.appendChild(input);
                    card.appendChild(div7);
                    if(count==0){
                        var tar1 = document.getElementById("u_s_col0");
                        tar1.appendChild(card);
                        count=1;
                    }
                    else if(count==1){
                        var tar1 = document.getElementById("u_s_col1");
                        tar1.appendChild(card);
                        count=2;
                    }
                    else{
                        var tar1 = document.getElementById("u_s_col2");
                        tar1.appendChild(card);
                        count=0;
                    }
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

function thumb(id){
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/thumb.php",
        dataType: "json",
        data: {"id": id,
            "act":"up"},
        success: function (result) {
        },
        error:function (msg) {
        },
    });
}

function cancle_thumb(id){
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/thumb.php",
        dataType: "json",
        data: {"id": id,
            "act":"down"},
        success: function (result) {
        },
        error:function (msg) {
        },
    });
}

function comment(c){
    var pid=$(this).name;
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/add_comment.php",
        dataType: "json",
        data: {"id": pid,
            "comment":c},
        success: function (result) {
        },
        error:function (msg) {
        },
    });
}


function hot_pic_user(){
    var head=[];
    var id=[];
    var name=[];
    var pic=[];
    var pic_id=[];
    var comment=[];
    var c_head=[];
    var c_name=[];
    var c_id=[];
    var des=[];
    var hot=[];
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/get_hot_picture.php",
        dataType: "json",
        success: function (result) {
            if (result) {
                for (var i = 0; i < result.length; i++) {
                    head.push(result[i].head);
                    id.push(result[i].id);
                    pic_id.push(result[i].picid);
                    hot.push(result[i].hot);
                    name.push(result[i].name);
                    pic.push(result[i].pic);
                    des.push(result[i].des);
                    hot.push(result[i].hot);
                }
                for(var i=0;i<pic_id.length;i++){
                    var c=[];
                    var h=[];
                    var n=[];
                    var idd=[];
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
                                    idd.push(result[i].id);
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
                    c_id.push(idd);
                    c_name.push(n);
                }
                var count=0;
                for(var i=0;i<head.length;i++){
                    var card=document.createElement("div");
                    card.setAttribute("class","card");
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
                    img1.setAttribute("src",head[i]);
                    img1.setAttribute("width","65px");
                    img1.setAttribute("onclick","other_user_info()");
                    img1.setAttribute("value",id[i]);
                    img1.setAttribute("alt",name[i]);
                    img1.setAttribute("title",name[i]);
                    img1.setAttribute("style","border-radius:50%;");
                    link1.appendChild(img1);
                    span1.appendChild(link1);
                    p_head.appendChild(span1);
                    var span2=document.createElement("span");
                    span2.setAttribute("class","opti");
                    var link2=document.createElement("a");
                    link2.setAttribute("class","follow_button");
                    link2.setAttribute("style","width: 80px;margin-left: 10px;");
                    var span3=document.createElement("span");
                    span3.setAttribute("style","margin-left: 0px;margin-right: 0px;");
                    var addicon=document.createElement("img");
                    addicon.setAttribute("src","./img/add.png");
                    span3.appendChild(addicon);
                    var span4=document.createElement("span");
                    span4.setAttribute("style","margin-left: 0px;margin-right: 0px;");
                    span4.innerHTML="关";
                    var span5=document.createElement("span");
                    span5.setAttribute("style","margin-left: 5px;margin-right: 0px;");
                    span5.innerHTML="注";
                    link2.appendChild(span3);
                    link2.appendChild(span4);
                    link2.appendChild(span5);
                    var link3=document.createElement("a");
                    link3.setAttribute("class","disfollow_btn");
                    link3.setAttribute("style","width: 110px;margin-left: 10px;display: none;");
                    var span6=document.createElement("span");
                    span6.setAttribute("class","unfollow_txt1");
                    span6.innerHTML="取";
                    var span7=document.createElement("span");
                    span7.setAttribute("class","unfollow_txt1");
                    span7.innerHTML="消";
                    var span8=document.createElement("span");
                    span8.setAttribute("class","unfollow_txt1");
                    span8.innerHTML="关";
                    var span9=document.createElement("span");
                    span9.setAttribute("class","unfollow_txt1");
                    span9.innerHTML="注";
                    link3.appendChild(span6);
                    link3.appendChild(span7);
                    link3.appendChild(span8);
                    link3.appendChild(span9);
                    span2.appendChild(link2);
                    span2.appendChild(link3);
                    p_head.appendChild(span2);
                    card.appendChild(p_head);
                    var imgdiv=document.createElement("div");
                    imgdiv.setAttribute("class","img");
                    var pic1 = document.createElement("img");
                    pic1.setAttribute("src",pic[i]);
                    pic1.setAttribute("width","300");
                    pic1.setAttribute("value",pic_id[i]);
                    imgdiv.appendChild(pic1);
                    card.appendChild(imgdiv);
                    var desdiv=document.createElement("div");
                    desdiv.setAttribute("class","des");
                    var word=document.createElement("div");
                    word.setAttribute("class","words");
                    var p1=document.createElement("p");
                    p1.setAttribute("style","text-align: left;margin-left: 25px");
                    p1.innerHTML=des[i];
                    word.appendChild(p1);
                    desdiv.appendChild(word);
                    card.appendChild(desdiv);
                    var like=document.createElement("div");
                    like.setAttribute("class","like");
                    like.setAttribute("style","with:100%;min-height: 65px;");
                    var lic=document.createElement("div");
                    lic.setAttribute("class","like_icon");
                    lic.setAttribute("style","float: left;");
                    var link4=document.createElement("a");
                    var icon1=document.createElement("img");
                    icon1.setAttribute("src","./img/like_unclicked.png");
                    icon1.setAttribute("class","like_u");
                    var icon2=document.createElement("img");
                    icon2.setAttribute("src","./img/like_clicked.png");
                    icon2.setAttribute("class","like_c");
                    icon2.setAttribute("style","display: none;");
                    link4.appendChild(icon1);
                    link4.appendChild(icon2);
                    lic.appendChild(link4);
                    like.appendChild(lic);
                    var div2=document.createElement("div");
                    div2.setAttribute("class","like_num");
                    div2.setAttribute("style","float: left;");
                    div2.innerHTML=""+hot[i]+"人喜欢";
                    var div3=document.createElement("div");
                    div3.setAttribute("class","like_num_c");
                    div3.setAttribute("style","float: left;margin-left: 90px;margin-right:10px;margin-top: 18px;cursor: hand;");
                    div3.innerHTML="评论";
                    var div4=document.createElement("div");
                    div4.setAttribute("class","like_num");
                    div4.setAttribute("style","float: left;margin-top: 18px;");
                    div4.innerHTML="转发";
                    like.appendChild(div2);
                    like.appendChild(div3);
                    like.appendChild(div4);
                    card.appendChild(like);
                    for(var j=0;j<c_head.length;j++){
                        var c_bar=document.createElement("div");
                        c_bar.setAttribute("class","comment_bar1");
                        c_bar.setAttribute("style","display:none;width: 100%;margin-left: 0px;min-height: 40px;");
                        var span10 = document.createElement("span");
                        span10.setAttribute("class","opti");
                        span10.setAttribute("style","margin-left: 20px;float: left;");
                        var link5=document.createElement("a");
                        var c_icon=document.createElement("img");
                        c_icon.setAttribute("src",c_head[i][j]);
                        c_icon.setAttribute("width","30px");
                        c_icon.setAttribute("style","border-radius:50%;");
                        c_icon.setAttribute("onclick","other_user_info()");
                        c_icon.setAttribute("value",c_id[i][j]);
                        c_icon.setAttribute("alt",c_name[i][j]);
                        c_icon.setAttribute("title",c_name[i][j]);
                        link5.appendChild(c_icon);
                        span10.appendChild(link5);
                        c_bar.appendChild(span10);
                        var div5=document.createElement("div");
                        div5.setAttribute("class","m_txt1");
                        div5.setAttribute("style","width: 250px;margin-top: 0px");
                        var div6=document.createElement("div");
                        div6.setAttribute("class","m_content");
                        div6.innerHTML=comment[i][j];
                        div5.appendChild(div6);
                        c_bar.appendChild(div5);
                        card.appendChild(c_bar);
                    }
                    var div7=document.createElement("div");
                    div7.setAttribute("class","comment_bar");
                    div7.setAttribute("style","display: none;width: 100%; margin-left: 0px;");
                    var div8=document.createElement("div");
                    div8.setAttribute("class","c_input");
                    div8.setAttribute("contenteditable","true");
                    div8.setAttribute("style","margin-left:4px;width:250px;min-height:15px;line-height:15px;");
                    var input=document.createElement("input");
                    input.setAttribute("type","submit");
                    input.setAttribute("value","发布");
                    input.setAttribute("class","c_button");
                    input.setAttribute("style","font-size: 14px;font-weight: normal;width:50px;height:34px;margin-top: -30px;");
                    div7.appendChild(div8);
                    div7.appendChild(input);
                    card.appendChild(div7);
                    if(count==0){
                        var tar1 = document.getElementById("u_s_col0");
                        tar1.appendChild(card);
                        count=1;
                    }
                    else if(count==1){
                        var tar1 = document.getElementById("u_s_col1");
                        tar1.appendChild(card);
                        count=2;
                    }
                    else{
                        var tar1 = document.getElementById("u_s_col2");
                        tar1.appendChild(card);
                        count=0;
                    }
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


function republish(id){
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/add_republish.php",
        dataType: "json",
        data: {"pid":id},
        success: function (result) {
        },
        error:function (msg) {
        },
    });
}
