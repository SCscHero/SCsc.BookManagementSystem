//新增
function biAdd() {
    var biName = $("#biName").val();
    var biTypeTwo1 = $("#biTypeTwo").val();
    var sWriter = $("#sWriter").val();
    var biDesc = $("#biDesc").val();
    var sPubHouse = $("#sPubHouse").val();
    var sBookState = $("#sBookState").val();
    var biPubTime = $("#biPubTime").val();
    var biMark = $("#biMark").val()

    $.post("hdBookInfoAdd.ashx", { biName: biName, biTypeTwo1: biTypeTwo1, sWriter: sWriter, biDesc: biDesc, sPubHouse: sPubHouse, sBookState: sBookState, biPubTime: biPubTime, biMark: biMark }, function (result) {
        layer.msg('添加成功', { icon: 1, time: 1000 });
        var index = parent.layer.getFrameIndex(window.name);
        setTimeout(function () { parent.layer.close(index); }, 1200);
    });
}
//操作员密码修改
function pwdModi() {
    var oldPwd = $("#oldPwd").val();
    var newPwd1 = $("#newPwd1").val();
    var newPwd2 = $("#newPwd2").val();
    if (newPwd1 == newPwd2) {
        $.post("hdPwdMidi.ashx", { newPwd1: newPwd1 }, function () {
            layer.msg('修改密码成功，今后请使用新密码登录', { icon: 6, time: 1000 });
            var index = parent.layer.getFrameIndex(window.name);
            setTimeout(function () { parent.layer.close(index); }, 1200);
        });
    }
    else {
        layer.msg('两次输入密码不一致', { icon: 5, time: 1000 });
    }
}

function exitThis() {
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}




$(document).ready(function () {
    //找到三个下拉框
    var biTypeOne = $("#biTypeOne")
    var biTypeTwo = $("#biTypeTwo")
    var biTypeThree = $("#biTypeThree")
    var btnBookInfoAdd = $("#btnBookInfoAdd")

    //给三个下拉框注册事件
    biTypeOne.change(function () {
        //1.需要获得当前下拉框的值
        var biTypeOneValue = $(this).val();
        //1.1只要第一个下拉框内容有变化，第三个下拉框都要先隐藏起来
        biTypeThree.hide();
        //2.如果值不为空，则将下拉框的值传送给服务器
        if (biTypeOneValue != "") {
            $.post("hdBiTypeOne.ashx", { biTypeOneValue: biTypeOneValue }, function (data) {
                //2.1回调接收服务器返回值
                if (data.length != 0) {
                    biTypeTwo.html("");
                    //$("<option value=''>请选择二级目录</option>").appendTo(biTypeTwo);
                    for (var i = 0; i < data.length; i++) {
                        $("<option value='" + data[i].btId + "'>" + data[i].btName + "</option>").appendTo(biTypeTwo);
                    }
                    //2.2.二级下拉框显示出
                    biTypeTwo.show();
                } else {
                    biTypeTwo.hide();
                    biTypeThree.hide();
                }
                biTypeTwo.data(biTypeOneValue, data);
            }, "json");
        } else {
            biTypeTwo.hide();
        }
    });

    //给三个下拉框注册事件
    biTypeTwo.change(function () {
        //1.需要获得当前下拉框的值
        var biTypeTwoValue = $(this).val();
        //2.如果值不为空，则将下拉框的值传送给服务器
        if (biTypeTwoValue != "") {
            $.post("hdBiTypeTwo.ashx", { biTypeTwoValue: biTypeTwoValue }, function (data) {
                //2.1回调接收服务器返回值
                if (data.length != 0) {
                    biTypeThree.html("");
                    //$("<option value=''>请选择二级目录</option>").appendTo(biTypeTwo);
                    for (var i = 0; i < data.length; i++) {
                        $("<option value='" + data[i].btId + "'>" + data[i].btName + "</option>").appendTo(biTypeThree);
                    }
                    //2.2.二级下拉框显示出
                    biTypeThree.show();
                } else {
                    biTypeThree.hide();
                }
                biTypeThree.data(biTypeTwoValue, data);
            }, "json");
        } else {

            biTypeThree.hide();
        }
    });
})









//biName: "'" + $("#biName").val() + "'",
//biTypeTwo: "'" + $("#biTypeTwo").val() + "'",
//sWriter: "'" + $("#sWriter").val() + "'",
//biDesc: "'" + $("#biDesc").val() + "'",
//sPubHouse: "'" + $("#sPubHouse").val() + "'",
//sBookState: "'" + $("#sBookState").val() + "'",
//biPubTime: "'" + $("#biPubTime").val() + "'",
//biMark: "'" + $("#biMark").val() + "'"

//// 定义一个对象
// var objBookInfoAdd = {
//     biName: $("#biName").val(),
//     biTypeTwo: $("#biTypeTwo").val(),
//     sWriter: $("#sWriter").val(),
//     biDesc: $("#biDesc").val(),
//     sPubHouse: $("#sPubHouse").val(),
//     sBookState: $("#sBookState").val(),
//     biPubTime: $("#biPubTime").val(),
//     biMark: $("#biMark").val()
// };

// $.post("hdBookInfoAdd.ashx", { objBookInfoAdd: JSON.stringify(objBookInfoAdd) }, function () {
//     alert("新增成功");

// }, "json");

//if (biTypeTwoValue != "") {
//    $.post("hdBiTypeTwo.ashx", { biTypeTwoValue: biTypeTwoValue }, function (data) {
//        //2.1回调接收服务器返回值
//        if (data.length != 0) {
//            biTypeThree.html("");
//            //$("<option value=''>请选择二级目录</option>").appendTo(biTypeTwo);
//            for (var i = 0; i < data.length; i++) {
//                $("<option value='" + data[i].btId + "'>" + data[i].btName + "</option>").appendTo(biTypeThree);
//            }
//            //2.2.二级下拉框显示出
//            biTypeThree.show();
//        } else {
//            biTypeThree.hide();
//        }
//        biTypeThree.data(biTypeTwoValue, data);
//    }, "json");
//} else {

//    biTypeThree.hide();
//}