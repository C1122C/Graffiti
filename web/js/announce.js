function search(ty,act_ty,as,loc,fare_down,fare_up,mark_down,mark_up){
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
        url: "../src/main/announce_search.php",
        dataType: "json",
        data: {"type": ty,
        "act_type":act_ty,
        "ask":as,
        "location":loc,
        "fare_down":fare_down,
        "fare_up":fare_up,
        "mark_down":mark_down,
        "mark_up":mark_up},
        success: function (result) {
            if (result) {
                for (var i = 0; i < result.length; i++) {
                    a_id.push(result[i].aid);
                    type.push(result[i].type);
                    author.push(result[i].author);
                    author_head.push(result[i].head);
                    author_mark.push(result[i].mark);
                    act_type.push(result[i].act);
                    location.push(result[i].location);
                    fare.push(result[i].fare);
                    ask.push(result[i].ask);
                }
                var count=0;
                var tar = document.getElementById("a_col_0");
                tar.innerHTML="";
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
                    var fed=document.createElement("div");
                    fed.setAttribute("class","fed_back");
                    var in1=document.createElement("input");
                    in1.setAttribute("type","submit");
                    in1.setAttribute("style","font-size: 18px;font-weight: 600;width:80px;height:30px;float:right;margin-right: 20px;border-radius: 5px;margin-top: -10px;");
                    in1.setAttribute("value","揭 榜");
                    in1.setAttribute("name",a_id[i]);
                    in1.setAttribute("class","g_button");
                    fed.appendChild(in1);
                    card.appendChild(fed);
                    if(count==0){
                        var tar1 = document.getElementById("a_col_0");
                        tar1.appendChild(card);
                        count=1;
                    }
                    else{
                        var tar1 = document.getElementById("a_col_1");
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

function my_announce(){
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
        url: "../src/main/my_announce.php",
        dataType: "json",
        data: {"type": "OWN"},
        success: function (result) {
            if (result) {
                var tar = document.getElementById("a_col_0");
                tar.innerHTML="";
                for (var i = 0; i < result.length; i++) {
                    a_id.push(result[i].aid);
                    type.push(result[i].type);
                    author.push(result[i].author);
                    author_head.push(result[i].head);
                    author_mark.push(result[i].mark);
                    act_type.push(result[i].act);
                    location.push(result[i].location);
                    fare.push(result[i].fare);
                    ask.push(result[i].ask);
                }
                var count=0;
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
                    var fed=document.createElement("div");
                    fed.setAttribute("class","fed_back");
                    var in1=document.createElement("input");
                    in1.setAttribute("type","submit");
                    in1.setAttribute("style","font-size: 18px;font-weight: 600;width:80px;height:30px;float:right;margin-right: 20px;border-radius: 5px;margin-top: -10px;");
                    in1.setAttribute("value","修 改");
                    in1.setAttribute("name",a_id[i]);
                    in1.setAttribute("class","m_button");
                    var in2=document.createElement("input");
                    in2.setAttribute("type","submit");
                    in2.setAttribute("value","删 除");
                    in2.setAttribute("name",a_id[i]);
                    in2.setAttribute("class","a_cancle_btn");
                    fed.appendChild(in1);
                    fed.appendChild(in2);
                    card.appendChild(fed);
                    if(count==0){
                        var tar1 = document.getElementById("a_col_0");
                        tar1.appendChild(card);
                        count=1;
                    }
                    else{
                        var tar1 = document.getElementById("a_col_1");
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

function my_part(){
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
        url: "../src/main/my_announce.php",
        dataType: "json",
        data: {"type": "PART"},
        success: function (result) {
            if (result) {
                for (var i = 0; i < result.length; i++) {
                    a_id.push(result[i].aid);
                    type.push(result[i].type);
                    author.push(result[i].author);
                    author_head.push(result[i].head);
                    author_mark.push(result[i].mark);
                    act_type.push(result[i].act);
                    location.push(result[i].location);
                    fare.push(result[i].fare);
                    ask.push(result[i].ask);
                }
                var count=0;
                var tar = document.getElementById("a_col_0");
                tar.innerHTML="";
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
                    var fed=document.createElement("div");
                    fed.setAttribute("class","fed_back");
                    var span10=document.createElement("span");
                    span10.setAttribute("class","opti");
                    span10.setAttribute("style","margin-top:-10px;");
                    var link4=document.createElement("a");
                    link4.setAttribute("class","a_tag");
                    var span11=document.createElement("span");
                    span11.setAttribute("style","margin-left: -10px;margin-right: 0px;");
                    span11.innerHTML="活动评分(1~5)：";
                    link4.appendChild(span11);
                    span10.appendChild(link4);
                    fed.appendChild(span10);
                    var div4=document.createElement("div");
                    div4.setAttribute("class","c_input");
                    div4.setAttribute("contenteditable","true");
                    fed.appendChild(div4);
                    var in1=document.createElement("input");
                    in1.setAttribute("type","submit");
                    in1.setAttribute("style","font-size: 18px;font-weight: 600;width:80px;height:30px;float:right;margin-right: 20px;border-radius: 5px;margin-top: -10px;");
                    in1.setAttribute("value","确 定");
                    in1.setAttribute("name",a_id[i]);
                    in1.setAttribute("class","con_button");
                    fed.appendChild(in1);
                    card.appendChild(fed);
                    if(count==0){
                        var tar1 = document.getElementById("a_col_0");
                        tar1.appendChild(card);
                        count=1;
                    }
                    else{
                        var tar1 = document.getElementById("a_col_1");
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

function announce(){
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
        url: "../src/main/recent_announce.php",
        dataType: "json",
        success: function (result) {
            if (result) {
                for (var i = 0; i < result.length; i++) {
                    a_id.push(result[i].aid);
                    type.push(result[i].type);
                    author.push(result[i].author);
                    author_head.push(result[i].head);
                    author_mark.push(result[i].mark);
                    act_type.push(result[i].act);
                    location.push(result[i].location);
                    fare.push(result[i].fare);
                    ask.push(result[i].ask);
                }
                var count=0;
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
                    var fed=document.createElement("div");
                    fed.setAttribute("class","fed_back");
                    var in1=document.createElement("input");
                    in1.setAttribute("type","submit");
                    in1.setAttribute("style","font-size: 18px;font-weight: 600;width:80px;height:30px;float:right;margin-right: 20px;border-radius: 5px;margin-top: -10px;");
                    in1.setAttribute("value","揭 榜");
                    in1.setAttribute("name",a_id[i]);
                    in1.setAttribute("class","g_button");
                    fed.appendChild(in1);
                    card.appendChild(fed);
                    if(count==0){
                        var tar1 = document.getElementById("a_col_0");
                        tar1.appendChild(card);
                        count=1;
                    }
                    else{
                        var tar1 = document.getElementById("a_col_1");
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

function announce_del(aid){
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/announce_del.php",
        dataType: "json",
        data: {"aid": aid},
        success: function (result) {
            if(result[0]=="FAIL"){
                alert("不能删除已经执行的公告");
            }
        },
        error:function (msg) {
        },
    });
}

function announce_ans(aid){
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/answer_announce.php",
        dataType: "json",
        data: {"aid":aid},
        success: function (result) {
        },
        error:function (msg) {
        },
    });
}

function announce_mark(aid,mark){
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/mark_announce.php",
        dataType: "json",
        data: {"aid":aid,
        "mark":mark},
        success: function (result) {
        },
        error:function (msg) {
        },
    });
}

function new_announce(type,act_type,ask,location,fare,mark){
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/new_announce.php",
        dataType: "json",
        data: {"type": type,
            "act_type":act_type,
            "ask":ask,
            "location":location,
            "fare":fare,
            "mark":mark},
        success: function (result) {
            alert("创建成功！");
        },error:function (msg) {
            //alert("msg"+msg);
        }
    });
}