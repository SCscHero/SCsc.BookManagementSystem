$(document).ready(function () {
    //全选或全不选
    $("#selCheckAll").click(function () {
        if (this.checked) {
            $("#lvMembInfo_itemPlaceholderContainer :checkbox").attr("checked", true);
        } else {
            $("#lvMembInfo_itemPlaceholderContainer :checkbox").attr("checked", false);
        }
    });

});

/*图片-删除*/
function picture_del(obj, id) {
    layer.confirm('确认要删除吗？', function (index) {
        $.ajax({
            type: 'POST',
            url: '',
            dataType: 'json',
            success: function (data) {
                $(obj).parents("tr").remove();
                layer.msg('已删除!', { icon: 1, time: 1000 });
            },
            error: function (data) {
                console.log(data.msg);
            }
        });
    });
}

/*图片-删除*/
function deltest(obj, id) {
    layer.confirm('确认要删除吗？', function (index) {
        layer.msg('已删除!', { icon: 1, time: 1000 });
    });
}

//添加会员信息
function member_add(title, url, w, h) {
    if (title == null || title == '') {
        title = false;
    }
    if (url == null || title == '') {
        url = "SelBokInfo.aspx";
    }
    if (w == null || w == '') {
        w = 800;
    }
    if (h == null || w == '') {
        h = 500;
    };
    //layer.open({})
    //layer_show(title, url, w, h);
    layer.open({
        type: 2,
        area: [w + 'px', h + 'px'],
        fix: false, //不固定
        maxmin: false,
        shade: 0.4,
        title: title,
        content: url
    });
}

////设置全选复选框
//$("#list :checkbox").click(function () {
//    allchk();
//});
//function allchk() {
//    var chknum = $("#list :checkbox").size();//选项总个数
//    var chk = 0;
//    $("#list :checkbox").each(function () {
//        if ($(this).attr("checked")) {
//            chk++;
//        }
//    });
//    if (chknum == chk) {//全选
//        $("#all").attr("checked", true);
//    } else {//不全选
//        $("#all").attr("checked", false);
//    }
//}
////显示时执行一次
//allchk();


//function selectAll(selectStatus) {//传入参数（全选框的选中状态）
//    //根据name属性获取到单选框的input，使用each方法循环设置所有单选框的选中状态
//    $("input[name='selCheck']").each(function (i, n) {
//        n.checked = status;
//    });
//}