<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookType.aspx.cs" Inherits="BkAdminSystem.BookType" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>图书分类表</title>
    <link rel="stylesheet" type="text/css" href="App_Themes/HuiPublic/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/OperAdmin/OperAdmin.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/BookInfo/style1.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/OperAdmin/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:BulletedList ID="BulletedList2" runat="server"></asp:BulletedList>
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

            <asp:ListView ID="lvBookType" runat="server" DataSourceID="dsBookType1" FullRowSelect="true" AutoPostBack="True" DataKeyNames="btId">
                <LayoutTemplate>
                    <tr runat="server">
                        <td runat="server">
                            <table border="1" id="itemPlaceholderContainer" runat="server" class="table table-border table-bordered table-hover table-bg table-sort dataTable no-footer">
                                <tr style="background-color: #001334; color: White;" runat="server">
                                    <th id="Th1" runat="server">
                                        <input id="selCheckAll" type="checkbox" name="selCheckAll" />
                                        选择</th>
                                    <th runat="server">分类编号</th>
                                    <th runat="server">分类父类编号</th>
                                    <th runat="server">分类名称</th>
                                    <th runat="server">分类排序值</th>
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
                        <td>
                            <input id="Checkbox1" type="checkbox" /></td>
                        <td><%# Eval("btId") %></td>
                        <td><%# Eval("btTypeId") %></td>
                        <td><%# Eval("btName") %></td>
                        <td><%# Eval("btOrder") %></td>
                        <td><%# Eval("btmark") %></td>
                        <td>
                            <input id="" type="button" value="&#xe60c;" class="heroInput Hui-iconfont" onclick="oaGetTableOne(this)" />
                            <input id="" type="button" value="&#xe6e2;" class="heroInput Hui-iconfont" onclick="oaDel(this)" /></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>

            <asp:SqlDataSource ID="dsBookType1" runat="server" ConnectionString="<%$ ConnectionStrings:bkAdminString %>" SelectCommand="SELECT * FROM [BookType] WHERE ([btId] = @btId2)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="btId2" SessionField="sType" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsBookType" runat="server" ConnectionString="<%$ ConnectionStrings:bkAdminString %>" SelectCommand="select btId,btName FROM [BookType] where btTypeId = 0"></asp:SqlDataSource>
        </div>
    </form>
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
</body>
</html>
