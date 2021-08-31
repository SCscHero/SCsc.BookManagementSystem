<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OperAdminAdd.aspx.cs" Inherits="BkAdminSystem.OperAdminAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>操作员信息添加</title>
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="App_Scripts/OperInfo_Add/skin/layer.css" />
</head>
<body>
    <form class="form form-horizontal" id="form-admin-add">
        <!--Hero-->
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>操作员帐号：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" id="oiAct" name="oiAct" />
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>操作员密码：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" id="oiPwd" name="oiPwd" />
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>操作员姓名：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" id="oiName" name="oiName" />
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系电话：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" id="oiTel" name="oiTel" />
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系地址：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" id="oiAdres" name="oiAdres" />
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>备注：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" id="oiMark" name="oiMark" />
            </div>
        </div>

        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <input onclick="oiAdd()" id="btnOperAdminAdd" type="button" value="&#xe632;新增" class="btn btn-primary radius Hui-iconfont" />
                <input onclick="exitThis()" id="test123" type="button" value="&#xe632;取消" class="btn btn-primary radius Hui-iconfont" />
            </div>
        </div>
    </form>
</body>
<!--基本脚本-->
<script type="text/javascript" src="App_Scripts/OperInfo_Add/jquery.min.js"></script>
<script type="text/javascript" src="App_Scripts/OperInfo_Add/layer.js"></script>
<script type="text/javascript" src="App_Scripts/OperInfo_Add/H-ui.min.js"></script>
<script type="text/javascript" src="App_Scripts/HuiPublic/H-ui.admin.js"></script>
<!--专属脚本-->
<script type="text/javascript" src="App_Scripts/HuiPublic/WdatePicker.js"></script>
<script type="text/javascript" src="App_Scripts/OperInfo_Add/jquery.validate.js"></script>
<script type="text/javascript" src="App_Scripts/OperInfo_Add/validate-methods.js"></script>
<script type="text/javascript" src="App_Scripts/OperInfo_Add/messages_zh.js"></script>
<script type="text/javascript" src="App_Scripts/BookInfo_Add/BookInfo_Add.js"></script>
<script type="text/javascript" src="App_Scripts/BookInfo/BookInfo2.js"></script>
<script type="text/javascript">
    function layerHero(obj, id) {
        //layer.confirm('确认要还原吗？', { icon: 5 }, function (index) {

            layer.msg('已还原!', { icon: 8, time: 1000 });
        //});
    }
</script>
</html>
