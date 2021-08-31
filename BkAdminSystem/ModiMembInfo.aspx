<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModiMembInfo.aspx.cs" Inherits="BkAdminSystem.ModiMembInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="App_Themes/OperAdmin/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/OperAdmin/OperAdmin.css"/>
    <title>修改会员信息 - By SCscHero</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataPager ID="dpOperInfo" runat="server" PagedControlID="lvOperInfo">
                <Fields>
                    <asp:NextPreviousPagerField />
                </Fields>
            </asp:DataPager>
            <!--OnSelectedIndexChanged="lvOpenInfo_SelectedIndexChanged"-->
            <asp:ListView ID="lvOperInfo" runat="server" DataSourceID="dsOperInfo" FullRowSelect="true" AutoPostBack="True" DataKeyNames="oiId" OnSelectedIndexChanged="lvOperInfo_SelectedIndexChanged">
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table border="1" id="itemPlaceholderContainer" runat="server" class="table table-border table-bordered table-hover table-bg table-sort dataTable no-footer">
                                    <tr style="background-color: #001334; color: White;" runat="server">
                                        <th id="Th1" runat="server">操作员编号</th>
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
                            
<%--                            <input type="button" runat="server" class="Hui-iconfont" value="&#xe60c;" commandname="Edit" oncommand="dosth" commandargument='<%#Eval("oiId") %>' />

                            


                            <a id="modiA" runat="server" class="Hui-iconfont" CommandName="Edit"  OnCommand="modiOiInfo" CommandArgument='<%#Eval("oiId") %>'>&#xe60c;</a>

                            <span runat="server" class="Hui-iconfont" onserverclick="_123" commandname="Delete" oncommand="dosth" commandargument='<%#Eval("oiId") %>'>&#xe6e2;</span>
                            <input type="button" runat="server" value="123" />
--%>

                            <asp:Button ID="Button2" runat="server" Text="&#xe60c;" CommandName="Edit"  OnCommand="modiOiInfo" CommandArgument='<%#Eval("oiId") %>' cssClass="Hui-iconfont heroInput"/>
                            <asp:Button ID="Button1" runat="server" Text="&#xe6e2;" CommandName="Edit" OnCommand="delOiInfo" CommandArgument='<%#Eval("oiId") %>' cssClass="heroInput Hui-iconfont"/>

                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <asp:SqlDataSource ID="dsOperInfo" runat="server" ConnectionString="<%$ ConnectionStrings:bkAdminString %>" SelectCommand="SELECT * FROM [OperInfo]"></asp:SqlDataSource>
    </form>
</body>
<script type="text/javascript" src="App_Scripts/OperAdmin/OperAdmin.js"></script>
</html>
