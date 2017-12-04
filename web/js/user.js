
function logcheck(username,password) {
    alert("IN function");
    var result = [];
    $.ajax({
        type: "post",
        async: true,
        url: "http://localhost:8080/controller/logcheck.php",
        dataType: "json",
        data: {"name": username,
            "pwd": password},
        success: function (res) {
            alert("success");
            if (res) {
                for (var i = 0; i < res.length; i++) {
                    result.push(res[i].result);
                }

            }
            else {
                alert("fail");
            }
            if(result=="SUCCESSFUL"){

            }
        },
        error:function (msg) {
            alert("error");
        },
    });
};

function register(usern,userp,users,useri,userl,userc,userd){

}

function other_user_info(){

}

function follow(){

}

function unfollow(){

}

function user_index(){

}

function my_work(){

}

function album_pic(){

}

function album_delete(){

}

function picture_delete(){

}

function album_create(name,tag,des){
    var result = [];

    $.ajax({
        type: "post",
        async: true,
        url: "../controller/albumadd.php",
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
            if(result=="SUCCESSFUL"){
                alert("创建成功！");
            }
        },
        error:function (msg) {
            alert(msg);
        },
    });
};

function picture_upload(){

}

function my_follow(){

}

function group_change(){}