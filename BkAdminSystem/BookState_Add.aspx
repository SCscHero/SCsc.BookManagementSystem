<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookState_Add.aspx.cs" Inherits="BkAdminSystem.BookState_Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form class="form form-horizontal" id="form-admin-add">
        <!--Hero-->
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>状态名称：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" id="bsState" name="bsState" />
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>是否启用：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" id="bsStuse" name="bsStuse" />
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>备注：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" id="bsMark" name="bsMark" />
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
