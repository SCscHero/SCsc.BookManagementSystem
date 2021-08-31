<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModiPwd.aspx.cs" Inherits="BkAdminSystem.ModiPwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改密码 By SCscHero</title>
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="App_Scripts/OperInfo_Add/skin/layer.css" />

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
</head>
<body>
    <form class="form form-horizontal" id="form-admin-add">
        <div style="text-align:center;margin:0 auto;">
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>旧密码：</label>
                <div class="formControls col-xs-8 col-sm-6">
                    <input type="password" class="input-text" value="" placeholder="" id="oldPwd" name="oldPwd" runat="server" />
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>新密码：</label>
                <div class="formControls col-xs-8 col-sm-6">
                    <input type="password" class="input-text" value="" placeholder="" id="newPwd1" name="newPwd1" runat="server" />
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>再次输入：</label>
                <div class="formControls col-xs-8 col-sm-6">
                    <input type="password" class="input-text" value="" placeholder="" id="newPwd2" name="newPwd2" runat="server" />
                </div>
            </div>
            <div class="row cl">
                <div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-2">
                    <input onclick="pwdModi()" id="btnModi" type="button" value="&#xe632;修改" class="btn btn-primary radius Hui-iconfont" />
                    <input onclick="exitThis()" id="test123" type="button" value="&#xe632;取消" class="btn btn-primary radius Hui-iconfont" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
