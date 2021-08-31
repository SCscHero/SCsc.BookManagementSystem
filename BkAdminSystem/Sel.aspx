<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sel.aspx.cs" Inherits="BkAdminSystem.Sel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>查询结果</title>
    <link rel="stylesheet" type="text/css" href="App_Themes/HuiPublic/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/OperAdmin/OperAdmin.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/BookInfo/BookInfo.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="deltest()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" onclick="member_add('会员信息','BookInfo_Add.aspx','800','500')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加图书</a><a href="javascript:;" onclick="deltest()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a></span> <span class="r">共有数据：<strong id="sBookInfoDataLength"></strong> 条</span> </div>
        <div>
            <asp:DataPager ID="dpMembInfo" runat="server" PagedControlID="lvBookInfo" PageSize="25">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True" ShowNextPageButton="False" RenderDisabledButtonsAsLabels="true" />
                    <asp:NumericPagerField ButtonType="Link" ButtonCount="6" NextPageText=">>" PreviousPageText="<<" />
                    <asp:NextPreviousPagerField ButtonType="Link" ShowPreviousPageButton="false" ShowLastPageButton="True" RenderDisabledButtonsAsLabels="true" />
                </Fields>
            </asp:DataPager>
            <!--OnSelectedIndexChanged="lvOpenInfo_SelectedIndexChanged"-->
            <asp:ListView ID="lvBookInfo" runat="server" DataSourceID="dsBookInfo" FullRowSelect="true" AutoPostBack="True" DataKeyNames="biId">
                <LayoutTemplate>
                    <tr runat="server">
                        <td runat="server">
                            <table border="1" id="itemPlaceholderContainer" runat="server" class="table table-border table-bordered table-hover table-bg table-sort dataTable no-footer">
                                <tr style="background-color: #001334; color: White;" runat="server">
                                    <th id="Th1" runat="server">
                                        <input id="selCheckAll" type="checkbox" name="selCheckAll" />
                                        选择</th>
                                    <th runat="server">图书编号</th>
                                    <th runat="server">图书名称</th>
                                    <th runat="server">图书分类</th>
                                    <th runat="server">撰写人</th>
                                    <th runat="server">图书简介</th>
                                    <th runat="server">图书图片</th>
                                    <th runat="server">出版社</th>
                                    <th runat="server">图书状态</th>
                                    <th runat="server">出版时间</th>
                                    <th runat="server">图书价格</th>
                                    <th runat="server">相关备注</th>
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
                        <td runat="server">
                            <input id="selCheck" type="checkbox" name='selCheck' /></td>
                        <td runat="server">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("biId") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="PropertyTypeLabel" runat="server" Text='<%# Eval("biName") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="BedroomsLabel" runat="server" Text='<%# Eval("biType") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="TownLabel" runat="server" Text='<%# Eval("biWriter") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("biDesc") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("biPicPath") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("biPublish") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("biState") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("biPubTime") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="LatLabel" runat="server" Text='<%# Eval("biPrice") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="LonLabel" runat="server" Text='<%# Eval("biMark") %>' /></td>
                        <td runat="server">
                            <asp:Button ID="Button2" runat="server" Text="&#xe60c;" CommandName="Edit" OnCommand="modiBookInfo" CommandArgument='<%#Eval("biId") %>' CssClass="Hui-iconfont heroInput" />
                            <asp:Button ID="Button1" runat="server" Text="&#xe6e2;" CommandName="Edit" OnCommand="delBookInfo" CommandArgument='<%#Eval("biId") %>' CssClass="heroInput Hui-iconfont" />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <asp:SqlDataSource ID="dsBookInfo" runat="server" ConnectionString="<%$ ConnectionStrings:bkAdminString %>" SelectCommand="SELECT * FROM [BookInfo] where biName Like '%'+@sel+'%' OR biDesc LIKE '%'+@sel+'%'">
            <SelectParameters>
             <asp:SessionParameter Name="sel" SessionField="sel" Type="string" />
         </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
<script type="text/javascript" src="App_Scripts/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="App_Scripts/OperAdmin/OperAdmin.js"></script>
<script type="text/javascript" src="App_Scripts/MembInfo/MembInfo.js"></script>
<script type="text/javascript" src="App_Scripts/HomePage/layer.js"></script>
<script type="text/javascript" src="App_Scripts/HomePage/H-ui.min.js"></script>

<script type="text/javascript" src="App_Scripts/MembInfo/WdatePicker.js"></script>
<script type="text/javascript" src="App_Scripts/MembInfo/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="App_Scripts/MembInfo/laypage.js"></script>
<script type="text/javascript" src="App_Scripts/BookInfo/BookInfo.js"></script>
</html>
