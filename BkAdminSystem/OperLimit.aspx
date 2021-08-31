<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OperLimit.aspx.cs" Inherits="BkAdminSystem.OperLimit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HuiPublic/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/OperAdmin/OperAdmin.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/BookInfo/style1.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/OperAdmin/style.css" />

    <title>操作员信息管理 - </title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="deltest()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" onclick="open" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 新增</a><a class="btn btn-primary radius" data-href="OperLimitAdmin.aspx" data-title="操作员信息" href="javascript:void(0)"><i class="Hui-iconfont">&#xe600;</i> 批量管理</a></span> <span class="r">共有数据：<strong id="sBookInfoDataLength"><%=lvOperInfo.Items.Count %></strong> 条</span> </div>
        <div>
            <div id="divDpMembInfo">
                <asp:DataPager ID="dpMembInfo" runat="server" PagedControlID="lvOperInfo" PageSize="25">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" RenderDisabledButtonsAsLabels="true" />
                        <asp:NumericPagerField ButtonType="Button" ButtonCount="6" NextPageText=">>" PreviousPageText="<<" />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowPreviousPageButton="false" ShowLastPageButton="True" RenderDisabledButtonsAsLabels="true" />
                    </Fields>
                </asp:DataPager>
            </div>
            <asp:ListView ID="lvOperInfo" runat="server" DataSourceID="dsOperInfo" FullRowSelect="true" AutoPostBack="True" DataKeyNames="olId">
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table border="1" id="itemPlaceholderContainer" runat="server" class="table-hover table table-border table-bordered table-bg">
                                    <tr style="background-color: #001334; color: White;" runat="server">
                                        <th id="Th1" runat="server">
                                            <input id="selCheckAll" type="checkbox" name="selCheckAll" />选择</th>
                                        <th runat="server">操作员编号</th>
                                        <th runat="server">操作员权限</th>
                                        <th runat="server">书状态权限</th>
                                        <th runat="server">图书权限</th>
                                        <th runat="server">借书管理</th>
                                        <th runat="server">还书管理</th>
                                        <th runat="server">备注</th>
                                        <th runat="server">操作</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server"></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <EmptyDataTemplate>
                    <table runat="server">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <tr>
                        <td runat="server">
                            <input id="selCheck" type="checkbox" name='selCheck' /></td>
                        <td runat="server">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("olId") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="PropertyTypeLabel" runat="server" Text='<%# Eval("newolInfo") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="BedroomsLabel" runat="server" Text='<%# Eval("newolState") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="TownLabel" runat="server" Text='<%# Eval("newolBokInfo") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="LatLabel" runat="server" Text='<%# Eval("newolBowAd") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="LonLabel" runat="server" Text='<%# Eval("newolRetuAd") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("newolMark") %>' />
                        </td>
                        <td runat="server">
                            <input id="" type="button" value="&#xe60c;" class="heroInput Hui-iconfont" onclick="OperLimit()" />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <%--SELECT olId,olInfo,olState,olBokInfo,olBowAd,olRetuAd,olMark FROM [OperLimit]--%>
        <asp:SqlDataSource ID="dsOperInfo" runat="server" ConnectionString="<%$ ConnectionStrings:bkAdminString %>" SelectCommand="SELECT olId,olInfo,olState,olBokInfo,olBowAd,olRetuAd,olMark ,
CASE olInfo WHEN 0 THEN '否' When 1 Then'是' END newolInfo,
CASE olState WHEN 0 THEN '否' When 1 Then'是' END newolState,
CASE olBokInfo WHEN 0 THEN '否' When 1 Then'是' END newolBokInfo,
CASE olBowAd WHEN 0 THEN '否' When 1 Then'是' END newolBowAd,
CASE olRetuAd WHEN 0 THEN '否' When 1 Then'是' END newolRetuAd,
CASE olMark WHEN 0 THEN '否' When 1 Then'是' END newolMark
FROM OperLimit"></asp:SqlDataSource>
    </form>
</body>
<script type="text/javascript" src="App_Scripts/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="App_Scripts/jquery-1.8.2.js"></script>
<script type="text/javascript" src="App_Scripts/MembInfo/MembInfo.js"></script>
<script type="text/javascript" src="App_Scripts/HomePage/layer.js"></script>
<script type="text/javascript" src="App_Scripts/HomePage/H-ui.min.js"></script>
<script type="text/javascript" src="App_Scripts/HomePage/H-ui.admin.js"></script>


<script type="text/javascript" src="App_Scripts/MembInfo/WdatePicker.js"></script>
<script type="text/javascript" src="App_Scripts/MembInfo/laypage.js"></script>
<script type="text/javascript" src="App_Scripts/BookInfo/BookInfo2.js"></script>
</html>
