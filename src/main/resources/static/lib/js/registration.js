$('#submit').click(function (e) {
    var userName = $("#username").val();
    var passWd = $("#password").val();
    var rname = $("#rname").val();
    var phone = $("#telephone").val();
    var email = $("#email").val();
    var userinfo = {
        'userName': userName,
        'passWd': passWd,
        'rname': rname,
        'phone': phone,
        'email': email,
    };
    var JSONdata = JSON.stringify(userinfo);
    $.ajax({
        type: "post",
        url: "/managebooks/admin/user",
        data: JSONdata,
        dataType: "json",
        contentType: "application/json;charset=UTF-8",
        success: function (result) {
            if (result['status']) {
                window.location.href = "http://47.105.181.146:8082/managebooks/login"
            } else {
                alert("添加失败");
            }
        }
    });
    // }
});


// message popup tool
function Toast(msg, duration) {
    duration = isNaN(duration) ? 3000 : duration;
    var m = document.createElement('div');
    m.innerHTML = msg;
    m.style.cssText = "font-family:siyuan;max-width:60%;min-width: 150px;padding:0 14px;height: 40px;color: rgb(255, 255, 255);line-height: 40px;text-align: center;border-radius: 4px;position: fixed;top: 50%;left: 50%;transform: translate(-50%, -50%);z-index: 999999;background: rgba(0, 0, 0,.7);font-size: 16px;";
    document.body.appendChild(m);
    setTimeout(function () {
        var d = 0.5;
        m.style.webkitTransition = '-webkit-transform ' + d + 's ease-in, opacity ' + d + 's ease-in';
        m.style.opacity = '0';
        setTimeout(function () {
            document.body.removeChild(m)
        }, d * 1000);
    }, duration);
}

