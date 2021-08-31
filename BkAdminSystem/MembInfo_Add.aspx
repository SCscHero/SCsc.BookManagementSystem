<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MembInfo_Add.aspx.cs" Inherits="BkAdminSystem.MembInfo_Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>会员信息的添加</title>
    <link rel="stylesheet" type="text/css" href="App_Themes/H-ui.min.css" />
</head>
<body>
    <form class="form form-horizontal" id="form-admin-add">
        <!--Hero-->
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>会员姓名：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" id="miName" name="miName" />
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系方式：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" id="miTel" name="miTel" />
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系地址：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" id="miAdres" name="miAdres" />
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>会员卡号：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" id="miCard" name="miCard" />
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>入会时间：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',maxDate:'%y-%M-%d %H:%m'})" id="miTime" name="miTime" class="input-text Wdate" />
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>备注：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" id="miMark" name="miMark" />
            </div>
        </div>

        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button onclick="" id="btnBookInfoAdd" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 新增</button>
                <button onclick="" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 新增</button>
                <button onclick="removeIframe();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
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
</html>
