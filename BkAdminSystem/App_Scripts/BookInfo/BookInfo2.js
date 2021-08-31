//取值方法
function getTableOne(obj) {

    var oldId = $(obj).parents("tr").find("td:eq(1)>span").html();

    $.post("hdBookInfoModi.ashx", { oldId: oldId }, function () {
        layer.open({
            type: 2,
            area: [1000 + 'px', 800 + 'px'],
            fix: false, //不固定
            maxmin: false,
            shade: 0.4,
            title: '图书信息修改',
            content: 'BookInfo_Modi.aspx'
        });
    }, "json");
}


//操作员信息修改
function oaGetTableOne(obj) {

    var oldId = $(obj).parents("tr").find("td:eq(1)>span").html();

    $.post("hdOperAdminModi.ashx", { oldId: oldId }, function () {
        layer.open({
            type: 2,
            area: [1000 + 'px', 800 + 'px'],
            fix: false, //不固定
            maxmin: false,
            shade: 0.4,
            title: '操作员信息修改',
            content: 'OperAdminModi.aspx'
        });
    }, "json");

}

//操作员信息删除
function oaDel(obj) {

    layer.confirm('是否删除？本记录将存放如回收站！在有需要时进行恢复！', { icon: 3 }, function (index) {
        if (index) {
            var oldId = $(obj).parents("tr").find("td:eq(1)>span").html();

            $.post("hdOperAdminDel.ashx", { oldId: oldId }, function () {
                layer.msg('删除成功', { icon: 1, time: 1000 });
                var index = parent.layer.getFrameIndex(window.name);
                setTimeout(function () { parent.layer.close(index); }, 1200);

            }, "json");
        }
    })
}

//管理员新增界面
function oiAdd() {
    var oiAct = $("#oiAct").val();
    var oiPwd = $("#oiPwd").val();
    var oiName = $("#oiName").val();
    var oiTel = $("#oiTel").val();
    var oiAdres = $("#oiAdres").val();
    var oiMark = $("#oiMark").val();

    $.post("hdOperAdminAdd.ashx", { oiAct: oiAct, oiPwd: oiPwd, oiName: oiName, oiTel: oiTel, oiAdres: oiAdres, oiMark: oiMark }, function () {
        layer.msg('添加成功', { icon: 1, time: 1000 });
        var index = parent.layer.getFrameIndex(window.name);
        setTimeout(function () { parent.layer.close(index); }, 1200);

    });

}

//退出窗体方法
function exitThis() {
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}



//删除方法
function getTabletwo() {

    alert($(this).parents("tr"));
    alert($(this).parent("tr").find("td:eq(2)").children("span").val());

    var oldId = $(this).parent("tr").find("td:eq(2)>span").val();

    $.post("hdBookInfoAdd.ashx", { oldId: oldId }, function () {
        member_add('图书信息修改', 'BookInfo_Modi.aspx', '1000', '800')

    }, "json");
}

//$(document).ready(function () {
//    //添加总数据
//    //$("#sBookInfoDataLength").html($("#lvBookInfo_itemPlaceholderContainer tr").length.toString());//单行获取本页数据
//});
////弹出新增面板
//function myselfinfo() {
//    layer.open({
//        type: 1,
//        area: ['500x', '800px'],
//        fix: false, //不固定
//        maxmin: true,
//        shade: 0.4,
//        title: '查看信息',
//        content: '<div>管理员信息</div>'
//    });
//}

//ajax绑定后台数据
//function loadPrograme() {
//    $.ajax({
//        url: '@{VideoLiveAction.programme}',
//        type: 'GET',
//        async: false,
//        datatype: 'json',
//        success: function (data) {
//            if (data) {
//                var programme_sel = [];
//                programme_sel.push('<option value="" selected>请选择</option>')
//                for (var i = 0, len = data.length; i < len; i++) {
//                    var programme = data[i];
//                    programme_sel.push('<option value="' + programme._id + '">' + programme.programme_name + '</option>')
//                }
//                $("#programme_view").html(programme_sel.join(' '));
//            }
//        },
//        error: function () {
//            alert('查询节目异常');
//        }
//    });
//}