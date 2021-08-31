<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RetuBokAdm.aspx.cs" Inherits="BkAdminSystem.RetuBokAdm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>还书管理 - By SCschero</title>
    <link rel="stylesheet" type="text/css" href="App_Themes/HuiPublic/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/OperAdmin/OperAdmin.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/BookInfo/style1.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/OperAdmin/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="deltest()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" onclick="member_add('会员信息','BookInfo_Add.aspx','1000','800')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加图书</a><a href="javascript:;" onclick="deltest()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a></span> <span class="r">共有数据：<strong id="sBookInfoDataLength"><%=lvBookInfo.Items.Count %></strong> 条</span> </div>
        <div>
            <div id="divDpMembInfo">
                <asp:DataPager ID="dpMembInfo" runat="server" PagedControlID="lvBookInfo" PageSize="25">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" RenderDisabledButtonsAsLabels="true" />
                        <asp:NumericPagerField ButtonType="Button" ButtonCount="6" NextPageText=">>" PreviousPageText="<<" />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowPreviousPageButton="false" ShowLastPageButton="True" RenderDisabledButtonsAsLabels="true" />
                    </Fields>
                </asp:DataPager>
            </div>
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
                            <img alt="" src="App_Images/picBook/<%# Eval("biPicPath") %>" height="70" width="70" /></td>
                        <td runat="server">
                            <asp:Label ID="BedroomsLabel" runat="server" Text='<%# Eval("btName") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="TownLabel" runat="server" Text='<%# Eval("wName") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("biDesc") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("phName") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="Label5" runat="server" class="btn-secondary radius" Text='<%# Eval("bsState") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("biPubTime") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="LatLabel" runat="server" Text='<%# Eval("biPrice") %>' /></td>
                        <td runat="server">
                            <input id="" type="button" value="&#xe60c;" class="heroInput Hui-iconfont" onclick="ret()" />
                            <input id="" type="button" value="&#xe6e2;" class="heroInput Hui-iconfont" onclick="del()" />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <asp:SqlDataSource ID="dsBookInfo" runat="server" ConnectionString="<%$ ConnectionStrings:bkAdminString %>" SelectCommand="SELECT BookInfo.biId,BookInfo.biName,BookType.btName,Writer.wName,BookInfo.biDesc,BookInfo.biPicPath,PubHouse.phName,BookState.bsState,BookInfo.biPubTime,BookInfo.biPrice,BookInfo.biMark FROM dbo.BookInfo 
left JOIN dbo.BookType ON BookInfo.biType = BookType.btId
left JOIN dbo.Writer ON BookInfo.biWriter = Writer.wId
left JOIN dbo.PubHouse ON BookInfo.biPublish = PubHouse.phId
left JOIN dbo.BookState ON BookInfo.biState = BookState.bsId WHERE BookInfo.biState = 2"></asp:SqlDataSource>
    </form>
</body>
<script type="text/javascript" src="App_Scripts/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="App_Scripts/jquery-1.8.2.js"></script>
<%--<script type="text/javascript" src="App_Scripts/OperAdmin/OperAdmin.js"></script>--%>
<script type="text/javascript" src="App_Scripts/MembInfo/MembInfo.js"></script>
<script type="text/javascript" src="App_Scripts/HomePage/layer.js"></script>
<script type="text/javascript" src="App_Scripts/HomePage/H-ui.min.js"></script>


<script type="text/javascript" src="App_Scripts/MembInfo/WdatePicker.js"></script>
<%--<script type="text/javascript" src="App_Scripts/MembInfo/jquery.dataTables.min.js"></script>--%>
<script type="text/javascript" src="App_Scripts/MembInfo/laypage.js"></script>
<script type="text/javascript" src="App_Scripts/BookInfo/BookInfo2.js"></script>
</html>
