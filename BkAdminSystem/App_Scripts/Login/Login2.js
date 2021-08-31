function ifLogin() {
    //传入Act、Pwd值,将结果用result接收
    var result = PageMethods.judgePwd(inpOper.value, inpPwd.value, function (result) {
        
        if (result == "0") {
            //返回0 用户名不存在
            layer.msg('用户名不存在!', { icon: 5, time: 1000 });
        }
        else if (result == "1") {
            //返回1 密码不正确
            layer.msg('用户名为空或用户名不正确!', { icon: 5, time: 1000 });
        }
        else if (result == "ok") {
            //返回ok 验证成功
            layer.msg('验证成功!', { icon: 6, time: 1000 });
            setTimeout(function () { window.location.href = "HomePage.aspx"; }, 2000);
        }
        else {
            layer.msg('系统错误！!', { icon: 5, time: 1000 });
        }
    });
}
function error0() {
    layer.msg('用户名不存在!', { icon: 5, time: 1000 });
}
function error1() {
    layer.msg('用户名为空或用户名不正确!', { icon: 5, time: 1000 });
}
function errorOk() {
    layer.msg('验证成功!', { icon: 6, time: 1000 });
    setTimeout(function () { window.location.href = "HomePage.aspx"; }, 2000);
}
function errorElse() {
    layer.msg('系统错误！!', { icon: 5, time: 1000 });
}

$(document).ready(function () {
    $('#horizontalTab').easyResponsiveTabs({
        type: 'default', //Types: default, vertical, accordion           
        width: 'auto', //auto or any width like 600px
        fit: true   // 100% fit in a container
    });
});