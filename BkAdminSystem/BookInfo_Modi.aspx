<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookInfo_Modi.aspx.cs" Inherits="BkAdminSystem.BookInfo_Modi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>图书信息修改</title>
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="App_Scripts/OperInfo_Add/skin/layer.css" />
</head>
<body>
    <form class="form form-horizontal" id="form-admin-add">
        <!--Hero-->
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图书名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="biName" name="biName" runat="server" />
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图书分类：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span class="select-box">
                    <select id="biTypeOne" runat="server" class="select">
                        <option value="" selected="selected">请选择图书分类</option>
                    </select></span>
                <span class="select-box">
                    <select id="biTypeTwo" runat="server" class="select"></select></span>
                <span class="select-box">
                    <select id="biTypeThree" runat="server" class="select"></select></span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>撰写人：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span class="select-box">
                    <select id="sWriter" runat="server" class="select"></select></span>
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图书简介：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="biDesc" name="biDesc" runat="server" />
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图书图片（上传图片）：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <%--<input type="text" class="input-text" value="" placeholder="" id="inpOiTel" name="inpOiTel" />--%>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>出版社：</label>
            <div class="formControls col-xs-8 col-sm-9" runat="server">
                <span class="select-box">
                    <select id="sPubHouse" name="sPubHouse" runat="server" class="select"></select></span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图书状态：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span class="select-box">
                    <select id="sBookState" name="sBookState" runat="server" class="select"></select></span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>出版时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',maxDate:'%y-%M-%d %H:%m'})" id="biPubTime" name="biPubTime" class="input-text Wdate" runat="server" />
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>备注：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input id="biMark" name="biMark" type="text" class="input-text" value="" placeholder="" runat="server" />
            </div>
        </div>



        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button onclick="BookInfoModiSave()" id="btnBookInfoModiSave" class="btn btn-primary radius" <%-- type="submit--%>><i class="Hui-iconfont">&#xe632;</i> 保存</button>
                <button onclick="article_save_submit();" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 新增</button>
                <button onclick="removeIframe();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
            </div>
        </div>
    </form>
    <form id="formCsharp" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    </form>
</body>
<script type="text/javascript" src="App_Scripts/OperInfo_Add/jquery.min.js"></script>
<script type="text/javascript" src="App_Scripts/OperInfo_Add/layer.js"></script>
<script type="text/javascript" src="App_Scripts/OperInfo_Add/H-ui.min.js"></script>
<script type="text/javascript" src="App_Scripts/HuiPublic/H-ui.admin.js"></script>
<!--专属脚本-->
<script type="text/javascript" src="App_Scripts/HuiPublic/WdatePicker.js"></script>
<script type="text/javascript" src="App_Scripts/OperInfo_Add/jquery.validate.js"></script>
<script type="text/javascript" src="App_Scripts/OperInfo_Add/validate-methods.js"></script>
<script type="text/javascript" src="App_Scripts/OperInfo_Add/messages_zh.js"></script>
<script type="text/javascript">
    function BookInfoModiSave() {

        var oldId = $(obj).parents("tr").find("td:eq(1)>span").html();
        
        var biName = $("#biName").val();
        var biTypeTwo1 = $("#biTypeTwo").val();
        var sWriter = $("#sWriter").val();
        var biDesc = $("#biDesc").val();
        var sPubHouse = $("#sPubHouse").val();
        var sBookState = $("#sBookState").val();
        var biPubTime = $("#biPubTime").val();
        var biMark = $("#biMark").val()


        $.post("hdBookInfoModiSave.ashx", { biName: biName, biTypeTwo1: biTypeTwo1, sWriter: sWriter, biDesc: biDesc, sPubHouse: sPubHouse, sBookState: sBookState, biPubTime: biPubTime, biMark: biMark }, function () {
            alert("新增成功");

        }, "json");




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

</script>
</html>
