<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BkAdminSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录 - By SCscHero</title>

<%--    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/H-ui.admin.css" />--%>

    <%--<!--JS - Jquery、选项卡的Js文件-->--%>
    <script src="App_Scripts/jquery-1.8.2.min.js"></script>
    <script src="App_Scripts/Login/easyResponsiveTabs.js"></script>
    <script src="App_Scripts/Login/Login2.js"></script>
    <script type="text/javascript" src="App_Scripts/HomePage/layer.js"></script>

    <!--投入登录界面Css文件、H-ui提示Css-->
    <link rel="stylesheet" type="text/css" href="App_Themes/Login/Login.css" />
<%--    <link rel="stylesheet" type="text/css" href="App_Themes/H-ui.min.css" />--%>
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/Login/style.css" />
</head>
<body>
    <form id="form1" runat="server" method="get">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div class="main">
            <div style="height: 150px"></div>
            <h1>图书管理系统</h1>
            <div class="login-form">
                <div class="sap_tabs w3ls-tabs">
                    <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                        <ul class="resp-tabs-list">
                            <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>登录</span></li>
                            <li class="resp-tab-item" aria-controls="tab_item-1" role="tab">
                                <label>/</label><span>注册</span></li>
                        </ul>
                        <div class="clear"></div>
                        <!--登录选项卡-->
                        <div class="resp-tabs-container">
                            <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
                                <div class="login-agileits-top">
                                    <p>操作员 </p>
                                    <input id="inpOper" type="text" name="User Name" required="" runat="server" />
                                    <p>密码</p>
                                    <input id="inpPwd" type="password" name="Password" required="" runat="server" />
                                    <p>验证码</p>
                                    <input id="tbx_yzm" type="text" name="tbx_yzm" required="" runat="server" style="width: 45%!important; display: inline-block;" />&nbsp;&nbsp;&nbsp;<asp:Image ID="ibtn_yzm" runat="server" Style="height: 30px" />
                                    <a href="javascript:changeCode()" style="text-decoration: underline; font-size: 20px; color:grey;" class="Hui-iconfont">&#xe66c;</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" id="brand" value=""/>
									<label for="brand"><span></span>七天免登陆</label>
                                    <input id="btnLogin" type="button" value="登  录" runat="server" onclick="ifLogin()" style="margin-top:10px"/>

                                </div>
                                <div class="login-agileits-bottom">
                                    <p><a href="#">忘记密码?</a></p>
                                </div>
                            </div>
                            <!--注册选项卡-->
                            <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
                                <div class="login-agileits-top sign-up">

                                    <p>操作员 </p>
                                    <input type="text" name="User Name" required="" runat="server" />
                                    <p>手机号 </p>
                                    <input type="text" name="Email" required="" runat="server" />
                                    <p>密码</p>
                                    <input type="password" name="Password" placeholder="" required="" runat="server" />
                                    <label for="我同意保密协议"><span></span>我同意保密协议</label>
                                    <input type="button" value="注  册" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright">
            <p>© 2018 任我行集团 天通事业部 By SCscHero</p>
        </div>
    </form>
</body>
<script type="text/javascript">
    function changeCode() {
        document.getElementById('ibtn_yzm').src = document.getElementById('ibtn_yzm').src + '?';
    }
</script>
<%--<script type="text/javascript" src="App_Scripts/HomePage/jquery.min.js"></script>--%>

<%--<script type="text/javascript" src="App_Scripts/HomePage/H-ui.min.js"></script>
<script type="text/javascript" src="App_Scripts/HomePage/H-ui.admin.js"></script>--%>
</html>
<!--JS - 验证控件-->
<%--    <script src="App_Scripts/Login/jquery.validate.js"></script>
    <script src="App_Scripts/Login/validate-methods.js"></script>
    <script src="App_Scripts/Login/messages_zh.js"></script>--%>