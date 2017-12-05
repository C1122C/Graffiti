function show_inq(){
    var userid = [];
    var mid=[];
    var partner_head=[];
    var partner_id=[];
    var partner_name=[];
    var content=[];
    var isread=[];
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/get_user.js",
        dataType: "json",
        success: function (result) {
            userid = result[0].user;
        },
        error:function (msg) {
            //alert("msg"+msg);
        },
    });
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/get_inq.js",
        dataType: "json",
        data:{"id":userid},
        success: function (result) {
            if (result) {
                for (var i = 0; i < result.length; i++) {
                    mid.push(result[0].id);
                    partner_head.push(result[0].head);
                    partner_id.push(result[0].p_id);
                    partner_name.push(result[0].pname);
                    content.push(result[0].content);
                    isread.push(result[0].isread);
                }
                var tar = document.getElementById("m_list");
                tar.innerHTML="";
                for(var i=0;i<mid.length;i++){
                    var li1=document.createElement("li");
                    li1.setAttribute("name",mid[i]);
                    var inner=document.createElement("div");
                    inner.setAttribute("class","inner_list");
                    var m_tag=document.createElement("div");
                    m_tag.setAttribute("class","m_tag");
                    var m_pic=document.createElement("div");
                    m_pic.setAttribute("class","m_pic");
                    var link1=document.createElement("a");
                    link1.setAttribute("target","_blank");
                    link1.setAttribute("onclick","other_user_info()");
                    link1.setAttribute("name",partner_id[i]);
                    var head_pic = document.createElement("img");
                    head_pic.setAttribute("src",partner_head[i]);
                    head_pic.setAttribute("width","64px");
                    head_pic.setAttribute("onclick","other_user_info()");
                    head_pic.setAttribute("name",partner_id[i]);
                    head_pic.setAttribute("alt",partner_name[i]);
                    head_pic.setAttribute("title",partner_name[i]);
                    link1.appendChild(head_pic);
                    m_pic.appendChild(link1);
                    if(isread[i]==0){
                        var span1=document.createElement("span");
                        span1.setAttribute("class","m_new");
                        var newicon=document.createElement("img");
                        newicon.setAttribute("src","./img/new.png");
                        span1.appendChild(newicon);
                        m_pic.appendChild(span1);
                    }
                    m_tag.appendChild(m_pic);
                    inner.appendChild(m_tag);
                    var m_txt=document.createElement("div");
                    m_txt.setAttribute("class","m_txt");
                    var m_content=document.createElement("div");
                    m_content.setAttribute("class","m_content");
                    m_content.innerHTML=content[i];
                    m_txt.appendChild(m_content);
                    inner.appendChild(m_txt);
                    if(isread[i]==0){
                        var m_action=document.createElement("div");
                        m_action.setAttribute("class","m_action");
                        var span2=document.createElement("span");
                        span2.setAttribute("class","m_btn");
                        var link2=document.createElement("a");
                        link2.setAttribute("class","ok");
                        link2.innerHTML="同意";
                        span2.appendChild(link2);
                        var span3=document.createElement("span");
                        span3.setAttribute("class","m_btn");
                        var link3=document.createElement("a");
                        link3.setAttribute("class","no");
                        link3.innerHTML="拒绝";
                        span3.appendChild(link3);
                        m_action.appendChild(span2);
                        m_action.appendChild(span3);
                        inner.appendChild(m_action);
                        var div2=document.createElement("div");
                        div2.setAttribute("class","m_action");
                        div2.setAttribute("style","display: none;");
                        div2.innerHTML="已同意";
                        var div3=document.createElement("div");
                        div3.setAttribute("class","m_action");
                        div3.setAttribute("style","display: none;");
                        div3.innerHTML="已拒绝";
                        inner.appendChild(div2);
                        inner.appendChild(div3);
                    }
                    li1.appendChild(inner);
                    tar.appendChild(li1);
                }

            }
            else {
                //alert("fail");
            }
        },error:function (msg) {
            //alert("msg"+msg);
        }
    });

}

function show_inform(){
    var userid = [];
    var mid=[];
    var partner_head=[];
    var partner_id=[];
    var partner_name=[];
    var content=[];
    var isread=[];
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/get_user.js",
        dataType: "json",
        success: function (result) {
            userid = result[0].user;
        },
        error:function (msg) {
            //alert("msg"+msg);
        },
    });
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/get_inf.js",
        dataType: "json",
        data:{"id":userid},
        success: function (result) {
            if (result) {
                for (var i = 0; i < result.length; i++) {
                    mid.push(result[0].id);
                    partner_head.push(result[0].head);
                    partner_id.push(result[0].p_id);
                    partner_name.push(result[0].pname);
                    content.push(result[0].content);
                    isread.push(result[0].isread);
                }
                var tar = document.getElementById("m_list");
                tar.innerHTML="";
                for(var i=0;i<mid.length;i++){
                    var li1=document.createElement("li");
                    li1.setAttribute("name",mid[i]);
                    var inner=document.createElement("div");
                    inner.setAttribute("class","inner_list");
                    var m_tag=document.createElement("div");
                    m_tag.setAttribute("class","m_tag");
                    var m_pic=document.createElement("div");
                    m_pic.setAttribute("class","m_pic");
                    var link1=document.createElement("a");
                    link1.setAttribute("target","_blank");
                    link1.setAttribute("onclick","other_user_info()");
                    link1.setAttribute("name",partner_id[i]);
                    var head_pic = document.createElement("img");
                    head_pic.setAttribute("src",partner_head[i]);
                    head_pic.setAttribute("width","64px");
                    head_pic.setAttribute("onclick","other_user_info()");
                    head_pic.setAttribute("name",partner_id[i]);
                    head_pic.setAttribute("alt",partner_name[i]);
                    head_pic.setAttribute("title",partner_name[i]);
                    link1.appendChild(head_pic);
                    m_pic.appendChild(link1);
                    if(isread[i]==0){
                        var span1=document.createElement("span");
                        span1.setAttribute("class","m_new");
                        var newicon=document.createElement("img");
                        newicon.setAttribute("src","./img/new.png");
                        span1.appendChild(newicon);
                        m_pic.appendChild(span1);
                    }
                    m_tag.appendChild(m_pic);
                    inner.appendChild(m_tag);
                    var m_txt=document.createElement("div");
                    m_txt.setAttribute("class","m_txt");
                    var m_content=document.createElement("div");
                    m_content.setAttribute("class","m_content");
                    m_content.innerHTML=content[i];
                    m_txt.appendChild(m_content);
                    inner.appendChild(m_txt);
                    li1.appendChild(inner);
                    tar.appendChild(li1);
                }

            }
            else {
                //alert("fail");
            }
        },error:function (msg) {
            //alert("msg"+msg);
        }
    });
}

function not_new(){
    var id=$(this).name;
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/readmessage.js",
        dataType: "json",
        data: {"id": id},
        success: function (result) {
        },
        error:function (msg) {
        },
    });
}

function send_agree_inform(){
    var id=$(this).name;
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/agree_inq.js",
        dataType: "json",
        data: {"id": id},
        success: function (result) {
        },
        error:function (msg) {
        },
    });
}

function send_refuse_inform(){
    var id=$(this).name;
    $.ajax({
        type: "post",
        async: false,
        url: "../src/main/refuse_inq.js",
        dataType: "json",
        data: {"id": id},
        success: function (result) {
        },
        error:function (msg) {
        },
    });
}