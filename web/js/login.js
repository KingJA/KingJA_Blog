/**
 * Created by Administrator on 2017/1/6.
 */
function doLogin() {
    console.log("开始AJAX")
    $.ajax({
        type: "POST",
        url: "/admin/doLogin",
        data: $("#loginForm").serialize(),
        dataType: "json",
        success: function (retult) {
            if(retult.resultCode===0){//登录成功，跳转后台页面
                window.location.href = "/admin/article/1";
            } else {//登录失败，重新登录
                alert(retult.resultText);
                window.location.href = "/admin/login";
            }
        },
        error: function () {
        }
    });
}