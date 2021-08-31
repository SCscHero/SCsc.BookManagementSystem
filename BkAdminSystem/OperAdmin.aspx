<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OperAdmin.aspx.cs" Inherits="BkAdminSystem.OperAdmin" %>

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
        <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="deltest()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" onclick="member_add('会员信息','OperAdminAdd.aspx','800','600')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 新增</a></span> <span class="r">共有数据：<strong id="sBookInfoDataLength"><%=lvOperInfo.Items.Count %></strong> 条</span> </div>
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
            <asp:ListView ID="lvOperInfo" runat="server" DataSourceID="dsOperInfo" FullRowSelect="true" AutoPostBack="True" DataKeyNames="oiId" OnSelectedIndexChanged="lvOperInfo_SelectedIndexChanged">
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table border="1" id="itemPlaceholderContainer" runat="server" class="table-hover table table-border table-bordered table-bg">
                                    <tr style="background-color: #001334; color: White;" runat="server">
                                        <th id="Th1" runat="server">
                                            <input id="selCheckAll" type="checkbox" name="selCheckAll" />选择</th>
                                        <th runat="server">操作员编号</th>
                                        <th runat="server">帐号</th>
                                        <th runat="server">密码</th>
                                        <th runat="server">姓名</th>
                                        <th runat="server">手机号码</th>
                                        <th runat="server">地址</th>
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
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("oiId") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="PropertyTypeLabel" runat="server" Text='<%# Eval("oiAct") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="BedroomsLabel" runat="server" Text='<%# Eval("oiPwd") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="TownLabel" runat="server" Text='<%# Eval("oiName") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="LatLabel" runat="server" Text='<%# Eval("oiTel") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="LonLabel" runat="server" Text='<%# Eval("oiAdres") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("oiMark") %>' />
                        </td>
                        <td runat="server">
                            <input id="" type="button" value="&#xe60c;" class="heroInput Hui-iconfont" onclick="oaGetTableOne(this)" />
                            <input id="" type="button" value="&#xe6e2;" class="heroInput Hui-iconfont" onclick="oaDel(this)" />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <asp:SqlDataSource ID="dsOperInfo" runat="server" ConnectionString="<%$ ConnectionStrings:bkAdminString %>" SelectCommand="SELECT * FROM [OperInfo]"></asp:SqlDataSource>
    </form>
</body>
<script type="text/javascript" src="App_Scripts/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="App_Scripts/jquery-1.8.2.js"></script>
<%--<script type="text/javascript" src="App_Scripts/OperAdmin/OperAdmin.js"></script>--%>
<script type="text/javascript" src="App_Scripts/MembInfo/MembInfo.js"></script>
<script type="text/javascript" src="App_Scripts/HomePage/layer.js"></script>
<script type="text/javascript" src="App_Scripts/HomePage/H-ui.min.js"></script>
    <script type="text/javascript" src="App_Scripts/HomePage/H-ui.admin.js"></script>


<script type="text/javascript" src="App_Scripts/MembInfo/WdatePicker.js"></script>
<%--<script type="text/javascript" src="App_Scripts/MembInfo/jquery.dataTables.min.js"></script>--%>
<script type="text/javascript" src="App_Scripts/MembInfo/laypage.js"></script>
<script type="text/javascript" src="App_Scripts/BookInfo/BookInfo2.js"></script>
</html>
