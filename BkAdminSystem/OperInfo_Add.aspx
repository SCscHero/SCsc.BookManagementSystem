<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OperInfo_Add.aspx.cs" Inherits="BkAdminSystem.OperInfo_Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>操作员信息添加</title>
    <link rel="stylesheet" type="text/css" href="App_Themes/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="App_Scripts/OperInfo_Add/skin/layer.css" />

</head>
<body>
    <form class="form form-horizontal" id="form-admin-add">
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
        <label class="form-label col-xs-4 col-sm-3">备注：</label>
        <div class="formControls col-xs-8 col-sm-6"">
            <textarea id="miMark" name="miMark" cols="" rows="" class="textarea" placeholder="说点什么...100个字符以内" dragonfly="true" onkeyup="$.Huitextarealength(this,100)"></textarea>
            <p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
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

    <script type="text/javascript" src="App_Scripts/OperInfo_Add/layer.js"></script>
    
</body>
<script type="text/javascript" src="App_Scripts/OperInfo_Add/jquery.min.js"></script>
<script type="text/javascript" src="App_Scripts/OperInfo_Add/H-ui.min.js"></script>
<script type="text/javascript" src="App_Scripts/OperInfo_Add/jquery.validate.js"></script>
<script type="text/javascript" src="App_Scripts/OperInfo_Add/validate-methods.js"></script>
<script type="text/javascript" src="App_Scripts/OperInfo_Add/messages_zh.js"></script>
<script type="text/javascript">
    $(function () {
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form-admin-add").validate({
            rules: {
                //根据input控件的name属性确定验证规则
                adminName: {
                    required: true,
                    minlength: 4,
                    maxlength: 16
                },
                password: {
                    required: true,
                },
                password2: {
                    required: true,
                    equalTo: "#password"
                },
                sex: {
                    required: true,
                },
                phone: {
                    required: true,
                    isPhone: true,
                },
                email: {
                    required: true,
                    email: true,
                },
                adminRole: {
                    required: true,
                },
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    type: 'post',
                    url: "xxxxxxx",
                    success: function (data) {
                        layer.msg('添加成功!', { icon: 1, time: 1000 });
                    },
                    error: function (XmlHttpRequest, textStatus, errorThrown) {
                        layer.msg('error!', { icon: 1, time: 1000 });
                    }
                });
                var index = parent.layer.getFrameIndex(window.name);
                parent.$('.btn-refresh').click();
                parent.layer.close(index);
            }
        });
    });
</script>
</html>
