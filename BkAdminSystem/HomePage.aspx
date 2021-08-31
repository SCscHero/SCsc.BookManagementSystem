<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="BkAdminSystem.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <%--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />--%>
    <title>主页 - By SCscHero</title>

    <%--    <script src="App_Scripts/jquery-1.8.2.min.js"></script>
    <script src="App_Scripts/hpSdiPanel.js"></script>--%>

    <link rel="Bookmark" href="App_Images/HomePage/favicon.ico" />
    <link rel="Shortcut Icon" href="App_Images/HomePage/favicon.ico" />
    <!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/HomePage1.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="App_Skin/default/skin.css" id="skin" />

</head>
<body>
    <header class="navbar-wrapper">
        <div class="navbar navbar-fixed-top">
            <div class="container-fluid cl">
                <a class="logo navbar-logo f-l mr-10 hidden-xs" href="HomePage.aspx">图书管理系统</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml">H-ui</a>
                <span class="logo navbar-slogan f-l mr-10 hidden-xs">By SCscHero</span>
                <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
                <nav class="nav navbar-nav">
                    <ul class="cl">
                        <li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i class="Hui-iconfont">&#xe6d5;</i></a>
                            <ul class="dropDown-menu menu radius box-shadow">
                                <li><a href="javascript:;" onclick="member_add('图书信息添加','BookInfo_Add.aspx','800','600')"><i class="Hui-iconfont">&#xe616;</i> 图书信息</a></li>
                                <li><a href="javascript:;" onclick="member_add('操作员信息添加','OperAdminAdd.aspx','800','600')"><i class="Hui-iconfont">&#xe613;</i> 操作员信息</a></li>
                                <li><a href="javascript:;" onclick="member_add('会员信息添加','MembInfo_Add.aspx','800','600')"><i class="Hui-iconfont">&#xe620;</i> 会员信息</a></li>
                                <li><a href="javascript:;" onclick="member_add('图书状态添加','BookState_Modi.aspx','800','600')"><i class="Hui-iconfont">&#xe60d;</i> 图书状态</a></li>
                            </ul>

                        </li>
                    </ul>
                </nav>
                <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                    <ul class="cl">
                        <li id="oiState" runat="server">超级管理员</li>
                        <li class="dropDown dropDown_hover">
                            <a href="#" class="dropDown_A">admin <i class="Hui-iconfont">&#xe6d5;</i></a>
                            <ul class="dropDown-menu menu radius box-shadow">
                                <li><a href="javascript:;" onclick="pwdModiLayer()">修改密码</a></li>
                                <li><a href="javascript:;" onclick="logOut()">切换账户</a></li>
                                <li><a href="javascript:;" onclick="exitSystem()">退出</a></li>
                            </ul>
                        </li>
                        <li id="Hui-msg"><a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size: 18px">&#xe68a;</i></a> </li>

                        <li id="Hui-skin" class="dropDown right dropDown_hover"><a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size: 18px">&#xe62a;</i></a>
                            <ul class="dropDown-menu menu radius box-shadow">
                                <!--【Hero】此处换肤ID+下拉菜单类，后台Jquery监听-->
                                <li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
                                <li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
                                <li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
                                <li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
                                <li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
                                <li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>
    <aside class="Hui-aside">
        <div class="menu_dropdown bk_2">
            <dl id="menu_OperAdmin" runat="server">
                <dt><i class="Hui-iconfont">&#xe616;</i> 操作员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
                <dd>
                    <ul>
                        <li><a data-href="OperAdmin.aspx" data-title="操作员信息" href="javascript:void(0)">操作员信息</a></li>
                        <li><a data-href="OperLimit.aspx" data-title="菜单权限控制" href="javascript:void(0)">菜单权限控制</a></li>
                    </ul>
                </dd>
            </dl>
            <dl id="menu-picture">
                <dt><i class="Hui-iconfont">&#xe710;</i> 书籍信息管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
                <dd>
                    <ul>
                        <li><a data-href="BookState.aspx" data-title="图书状态" href="javascript:void(0)">图书状态</a></li>
                        <li><a data-href="BookInfo.aspx" data-title="图书信息" href="javascript:void(0)">图书信息</a></li>
                        <li><a data-href="BookType.aspx" data-title="图书分类" href="javascript:void(0)">图书分类</a></li>
                    </ul>
                </dd>
            </dl>
            <dl id="menu-product">
                <dt><i class="Hui-iconfont">&#xe620;</i> 书单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
                <dd>
                    <ul>
                        <li><a data-href="BrowBokAdm.aspx" data-title="借书管理" href="javascript:void(0)">借书管理</a></li>
                        <li><a data-href="RetuBokAdm.aspx" data-title="还书管理" href="javascript:void(0)">还书管理</a></li>
                    </ul>
                </dd>
            </dl>
            <dl id="menu-comments">
                <dt><i class="Hui-iconfont">&#xe622;</i> 会员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
                <dd>
                    <ul>
                        <li><a data-href="MembInfo.aspx" data-title="会员信息" href="javascript:void(0)">会员信息</a></li>
                    </ul>
                </dd>
            </dl>
            <dl id="menu-member">
                <dt><i class="Hui-iconfont">&#xe60d;</i> 回收站<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
                <dd>
                    <ul>
                        <li><a data-href="member-list.html" data-title="图书状态恢复" href="javascript:;">图书状态恢复</a></li>
                        <li><a data-href="member-del.html" data-title="会员信息恢复" href="javascript:;">会员信息恢复</a></li>
                        <li><a data-href="member-level.html" data-title="图书信息恢复" href="javascript:;">图书信息恢复</a></li>
                        <li><a data-href="member-scoreoperation.html" data-title="操作员信息恢复" href="javascript:;">操作员信息恢复</a></li>
                        <li><a data-href="member-record-browse.html" data-title="角色信息恢复" href="javascript:void(0)">角色信息恢复</a></li>
                    </ul>
                </dd>
            </dl>

            <dl id="menu-tongji">
                <dt><i class="Hui-iconfont">&#xe61a;</i> 账户管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
                <dd>
                    <ul>
                        <li><a data-href="CentPerson.aspx" data-title="个人中心" href="javascript:void(0)">个人中心</a></li>
                        <li><a data-href="ModiPwd.aspx" data-title="修改密码" href="javascript:void(0)">修改密码</a></li>
                    </ul>
                </dd>
            </dl>
            <dl id="menu-system">
                <dt><i class="Hui-iconfont">&#xe62e;</i> 系统设置<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
                <dd>
                    <ul>
                        <li><span class="heroheroClassClass" onclick="logOut()">注销账号</span></li>
                        <li><span class="heroheroClassClass" onclick="exitSystem()">退出系统</span></li>
                    </ul>
                </dd>
            </dl>
        </div>
    </aside>
    <div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onclick="displaynavbar(this)"></a></div>
    <section class="Hui-article-box">
        <div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
            <div class="Hui-tabNav-wp">
                <ul id="min_title_list" class="acrossTab cl">
                    <li class="active">
                        <span title="图书管理系统" data-href="SelBokInfo.aspx">图书管理系统</span>
                        <em></em></li>
                </ul>
            </div>
            <div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
        </div>
        <div id="iframe_box" class="Hui-article">
            <div class="show_iframe">
                <div style="display: none" class="loading"></div>
                <iframe scrolling="yes" frameborder="0" src="SelBokInfo.aspx"></iframe>
            </div>
        </div>
    </section>

    <div class="contextMenu" id="Huiadminmenu">
        <ul>
            <li id="closethis">关闭当前 </li>
            <li id="closeall">关闭全部 </li>
        </ul>
    </div>

    <!--_footer 作为公共模版分离出去-->
    <script type="text/javascript" src="App_Scripts/HomePage/jquery.min.js"></script>
    <script type="text/javascript" src="App_Scripts/HomePage/layer.js"></script>
    <script type="text/javascript" src="App_Scripts/HomePage/H-ui.min.js"></script>
    <script type="text/javascript" src="App_Scripts/HomePage/H-ui.admin.js"></script>
    <!--/_footer 作为公共模版分离出去-->

    <!--请在下方写此页面业务相关的脚本-->
    <script type="text/javascript" src="App_Scripts/HomePage/jquery.contextmenu.r2.js"></script>

    <script type="text/javascript">
        $(function () {
            /*$("#min_title_list li").contextMenu('Huiadminmenu', {
                bindings: {
                    'closethis': function(t) {
                        console.log(t);
                        if(t.find("i")){
                            t.find("i").trigger("click");
                        }		
                    },
                    'closeall': function(t) {
                        alert('Trigger was '+t.id+'\nAction was Email');
                    },
                }
            });*/
        });


        //注销方法
        function logOut() {
            layer.confirm('确定要注销本次登录？', { icon: 3 }, function (index) {
                if (index) {
                    //销毁Session
                    $.post("hdDesSession.ashx");
                    //返回页面
                    window.location.href = "Login.aspx";
                }
            })
        }

        //退出系统方法
        function exitSystem() {
            layer.confirm('确定要退出系统？', { icon: 3 }, function (index) {
                if (index) {
                    //销毁Session
                    $.post("hdDesSession.ashx");
                    //关闭系统页面，并打开一个空白页
                    var userAgent = navigator.userAgent;
                    if (userAgent.indexOf("Firefox") != -1 || userAgent.indexOf("Chrome") != -1) {
                        window.location.href = "about:blank";
                        window.close();
                    } else {
                        window.opener = null;
                        window.open("", "_self");
                        window.close();
                    }
                }
            })
        }


        function pwdModiLayer() {
            layer.open({
                type: 2,
                area: [600 + 'px', 300 + 'px'],
                fix: false, //不固定
                maxmin: false,
                shade: 0.4,
                title: '密码修改',
                content: 'ModiPwd.aspx'
            });
        }

        /*个人信息*/
        function myselfinfo() {
            layer.open({
                type: 1,
                area: ['300px', '200px'],
                fix: false, //不固定
                maxmin: true,
                shade: 0.4,
                title: '查看信息',
                content: '<div>管理员信息</div>'
            });
        }

        /*资讯-添加*/
        function article_add(title, url) {
            var index = layer.open({
                type: 2,
                title: title,
                content: url
            });
            layer.full(index);
        }
        /*图片-添加*/
        function picture_add(title, url) {
            var index = layer.open({
                type: 2,
                title: title,
                content: url
            });
            layer.full(index);
        }
        /*产品-添加*/
        function product_add(title, url) {
            var index = layer.open({
                type: 2,
                title: title,
                content: url
            });
            layer.full(index);
        }
        /*用户-添加*/
        function member_add(title, url, w, h) {
            layer_show(title, url, w, h);
        }


    </script>


</body>
</html>

<!--备份-->
<!--
    <form id="form1" runat="server">
        <div class="header">

            <asp:Menu ID="Menu1" runat="server" DataSourceID="homeMenu" Orientation="Horizontal" StaticDisplayLevels="2"></asp:Menu>
            <asp:SiteMapDataSource ID="homeMenu" runat="server" SiteMapProvider="bk" />
        </div>
        <div class="left">
            <div><a href="#" url="/WebForm/Page1.aspx" id="1">Page1</a></div>
            <div><a href="#" url="/WebForm/Page2.aspx" id="2">Page2</a></div>
            <div><a href="#" url="/WebForm/Page3.aspx" id="3">Page3</a></div>
            <asp:treeview runat="server">
            <Nodes>
                <asp:TreeNode NavigateUrl="#" Text="操作员管理">
                    <asp:TreeNode NavigateUrl="OperAdmin.aspx" Text="操作员"/>
                    <asp:TreeNode NavigateUrl="MenuLimit.aspx" Text="菜单权限控制"/>
                </asp:TreeNode>
                <asp:TreeNode NavigateUrl="#" Text="书籍信息管理">
                    <asp:TreeNode NavigateUrl="MembInfo.aspx" Text="会员信息"/>
                    <asp:TreeNode NavigateUrl="BookState.aspx" Text="图书状态"/>
                    <asp:TreeNode NavigateUrl="BookInfo.aspx" Text="图书信息"/>
                    <asp:TreeNode NavigateUrl="BrowBokAdm.aspx" Text="借书管理"/>
                    <asp:TreeNode NavigateUrl="RetuBokAdm.aspx" Text="还书管理"/>
                    <asp:TreeNode NavigateUrl="#" Text="书籍查询"/>
                </asp:TreeNode>
                <asp:TreeNode NavigateUrl="#" Text="系统设置">
                    <asp:TreeNode NavigateUrl="ModiPwd.aspx" Text="修改密码"/>
                    <asp:TreeNode NavigateUrl="CentPerson.aspx" Text="个人中心"/>
                </asp:TreeNode>
                <asp:TreeNode NavigateUrl="#" Text="注销系统"/>
            </Nodes>
        </asp:treeview>
        </div>
        <div class="right">
            <div class="right_top"></div>
            <div class="content"></div>
        </div>
    </form>-->
