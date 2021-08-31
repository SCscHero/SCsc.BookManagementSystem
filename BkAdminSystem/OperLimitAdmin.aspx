<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OperLimitAdmin.aspx.cs" Inherits="BkAdminSystem.OperLimitAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>操作员管理</title>
    <link rel="stylesheet" type="text/css" href="App_Themes/HuiPublic/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/OperAdmin/OperAdmin.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/BookInfo/style1.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/OperAdmin/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
            <asp:BulletedList ID="BulletedList1" runat="server" DataSourceID="dsOperList" DataTextField="oiAct" DataValueField="oiId" Style="width: 200px; display: inline-block;" OnSelectedIndexChanged="lbModi" DisplayMode="LinkButton"></asp:BulletedList>

            <%--<asp:ListBox ID="OperList" runat="server" Height="300px" Width="150px" DataSourceID="dsOperList" DataTextField="oiAct" DataValueField="oiId" OnTextChanged="lbModi" OnSelectedIndexChanged="lbModi" AutoPostBack="True" style="display:inline-block"></asp:ListBox>--%>
            <div id="wrap" style="text-align: center; margin: 0 auto;">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="dsResult">
                    <LayoutTemplate>
                        <tr runat="server">
                            <td runat="server">
                                <table border="1" id="itemPlaceholderContainer" runat="server" class="table table-border table-bordered table-hover table-bg table-sort  no-footer" style="width: 30%!important; display: inline-block">
                                    <tr style="background-color: #001334; color: White;" runat="server">
                                        <th id="Th1" runat="server">全选</th>
                                        <th id="Th2" runat="server">操作员权限</th>
                                        <th id="Th3" runat="server">图书状态权限</th>
                                        <th id="Th4" runat="server">图书信息权限</th>
                                        <th id="Th5" runat="server">借书管理权限</th>
                                        <th id="Th6" runat="server">还书管理权限</th>

                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server"></td>
                        </tr>
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
                                <asp:CheckBox ID="checkAll" runat="server" />
                            </td>
                            <td runat="server">
                                <asp:CheckBox ID="cbOlInfo" runat="server" Value='<%# Eval("olInfo") %>' Checked="true" />
                            </td>
                            <td runat="server">
                                <asp:CheckBox ID="cbOlState" runat="server" Value='<%# Eval("olState") %>' />
                            </td>
                            <td runat="server">
                                <asp:CheckBox ID="cbOlBokInfo" runat="server" Value='<%# Eval("olBokInfo") %>' />
                            </td>
                            <td runat="server">
                                <asp:CheckBox ID="cbOlBowAd" runat="server" Value='<%# Eval("olBowAd") %>' />
                            </td>
                            <td runat="server">
                                <asp:CheckBox ID="cbOlRetuAd" runat="server" Value='<%# Eval("olRetuAd") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            </asp:UpdatePanel>
            <asp:SqlDataSource ID="dsResult" runat="server" ConnectionString="<%$ ConnectionStrings:bkAdminString %>" SelectCommand="SELECT * FROM [OperLimit] WHERE ([olId] = @olId)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="olId" SessionField="CID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsOperList" runat="server" ConnectionString="<%$ ConnectionStrings:bkAdminString %>" SelectCommand="SELECT * FROM [OperInfo]"></asp:SqlDataSource>



        </div>
    </form>
</body>
</html>
