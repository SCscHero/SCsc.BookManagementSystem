<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookInfo_Add.aspx.cs" Inherits="BkAdminSystem.BookInfo_Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>图书信息添加</title>
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/iconfont.css" />
    <%--<link rel="stylesheet" type="text/css" href="App_Scripts/OperInfo_Add/skin/layer.css" />--%>

    <!--脚本引入-->
    <script type="text/javascript" src="App_Scripts/OperInfo_Add/jquery.min.js"></script>
    <script type="text/javascript" src="App_Scripts/OperInfo_Add/layer.js"></script>
    <script type="text/javascript" src="App_Scripts/OperInfo_Add/H-ui.min.js"></script>
    <script type="text/javascript" src="App_Scripts/HuiPublic/H-ui.admin.js"></script>
    <script type="text/javascript" src="App_Scripts/HuiPublic/WdatePicker.js"></script>
<%--    <script type="text/javascript" src="App_Scripts/OperInfo_Add/jquery.validate.js"></script>
    <script type="text/javascript" src="App_Scripts/OperInfo_Add/validate-methods.js"></script>
    <script type="text/javascript" src="App_Scripts/OperInfo_Add/messages_zh.js"></script>--%>
    <script type="text/javascript" src="App_Scripts/BookInfo_Add/BookInfo_Add.js"></script>
</head>
<body>
    <form class="form form-horizontal" id="form-admin-add">
        <!--Hero-->
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图书名称：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" id="biName" name="biName" runat="server" />
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图书分类：</label>
            <div class="formControls col-xs-8 col-sm-6">
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
            <div class="formControls col-xs-8 col-sm-6">
                <span class="select-box">
                    <select id="sWriter" runat="server" class="select"></select></span>
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图书简介：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" id="biDesc" name="biDesc" />
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图书图片</label>
            <div class="formControls col-xs-8 col-sm-6">
                <%--<input type="text" class="input-text" value="" placeholder="" id="inpOiTel" name="inpOiTel" />--%>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>出版社：</label>
            <div class="formControls col-xs-8 col-sm-6" runat="server">
                <span class="select-box">
                    <select id="sPubHouse" name="sPubHouse" runat="server" class="select"></select></span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图书状态：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <span class="select-box">
                    <select id="sBookState" name="sBookState" runat="server" class="select"></select></span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>出版时间：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',maxDate:'%y-%M-%d %H:%m'})" id="biPubTime" name="biPubTime" class="input-text Wdate" />
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>备注：</label>
            <div class="formControls col-xs-8 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" id="biMark" name="biMark" />
            </div>
        </div>

        <div class="row cl">
            <div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-2">
                <input id="btnBiAdd" onclick="biAdd()" type="button" class="Hui-iconfont btn btn-primary radius" value="&#xe632;新增" />
                <input id="Button1" type="button" value="&nbsp;&nbsp;取消&nbsp;&nbsp;" onclick="exitThis();" class="btn btn-default radius"/>
            </div>
        </div>
    </form>
    <form id="formCsharp" runat="server">
    </form>
</body>
</html>
