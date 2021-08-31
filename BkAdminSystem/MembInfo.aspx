<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MembInfo.aspx.cs" Inherits="BkAdminSystem.MembInfo" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link rel="stylesheet" type="text/css" href="App_Themes/HuiPublic/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/OperAdmin/OperAdmin.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/BookInfo/style1.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/OperAdmin/style.css" />


    <title>会员信息管理 - By SCscHero</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="deltest()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" onclick="member_add('会员信息','MembInfo_Add.aspx','650','500')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加会员</a></span> <span class="r">共有数据：<strong>54</strong> 条</span> </div>
        <div>
            <div id="divDpMembInfo">
                <asp:DataPager ID="dpMembInfo" runat="server" PagedControlID="lvMembInfo" PageSize="25">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" RenderDisabledButtonsAsLabels="true" />
                        <asp:NumericPagerField ButtonType="Button" ButtonCount="6" NextPageText=">>" PreviousPageText="<<" />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowPreviousPageButton="false" ShowLastPageButton="True" RenderDisabledButtonsAsLabels="true" />
                    </Fields>
                </asp:DataPager>
            </div>
            <!--OnSelectedIndexChanged="lvOpenInfo_SelectedIndexChanged"-->
            <asp:ListView ID="lvMembInfo" runat="server" DataSourceID="dsMembInfo" FullRowSelect="true" AutoPostBack="True" DataKeyNames="miId">
                <LayoutTemplate>
                    <tr runat="server">
                        <td runat="server">
                            <table border="1" id="itemPlaceholderContainer" runat="server" class="table table-border table-bordered table-hover table-bg table-sort dataTable no-footer">
                                <tr style="background-color: #001334; color: White;" runat="server">
                                    <th id="Th1" runat="server">
                                        <input id="selCheckAll" type="checkbox" name="selCheckAll" />
                                        选择</th>
                                    <th runat="server">会员编号</th>
                                    <th runat="server">会员姓名</th>
                                    <th runat="server">联系方式</th>
                                    <th runat="server">会员卡号</th>
                                    <th runat="server">卡内余额</th>
                                    <th runat="server">入会时间</th>
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
                        <td runat="server">
                            <input id="selCheck" type="checkbox" name='selCheck' /></td>
                        <td runat="server">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("miId") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="PropertyTypeLabel" runat="server" Text='<%# Eval("miName") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="BedroomsLabel" runat="server" Text='<%# Eval("miTel") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="TownLabel" runat="server" Text='<%# Eval("miAdres") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="LatLabel" runat="server" Text='<%# Eval("miCard") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="LonLabel" runat="server" Text='<%# Eval("miMoney") %>' /></td>
                        <td runat="server">
                            <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("miMark") %>' />
                        </td>
                        <td runat="server">
                            <asp:Button ID="Button2" runat="server" Text="&#xe60c;" CommandName="Edit" OnCommand="modiMebInfo" CommandArgument='<%#Eval("miId") %>' CssClass="Hui-iconfont heroInput" />
                            <asp:Button ID="Button1" runat="server" Text="&#xe6e2;" CommandName="Edit" OnCommand="delMebInfo" CommandArgument='<%#Eval("miId") %>' CssClass="heroInput Hui-iconfont" />
                            <input id="in1" type="button" value="button" onclick="modaldemo(this,'10001')" />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <asp:SqlDataSource ID="dsMembInfo" runat="server" ConnectionString="<%$ ConnectionStrings:bkAdminString %>" SelectCommand="SELECT * FROM [MembInfo]"></asp:SqlDataSource>
    </form>
    <div id="modal-demo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content radius">
                <div class="modal-header">
                    <h3 class="modal-title">对话框标题</h3>
                    <a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
                </div>
                <div class="modal-body">
                    <p>对话框内容…</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary">确定</button>
                    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="App_Scripts/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="App_Scripts/OperAdmin/OperAdmin.js"></script>
<script type="text/javascript" src="App_Scripts/MembInfo/MembInfo.js"></script>
<script type="text/javascript" src="App_Scripts/HomePage/layer.js"></script>
<script type="text/javascript" src="App_Scripts/HomePage/H-ui.min.js"></script>
<script type="text/javascript" src="App_Scripts/HomePage/H-ui.admin.js"></script>

<script type="text/javascript" src="App_Scripts/MembInfo/WdatePicker.js"></script>
<script type="text/javascript" src="App_Scripts/MembInfo/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="App_Scripts/MembInfo/laypage.js"></script>
<script>
    function modaldemo(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: 'POST',
                url: '',
                dataType: 'json',
                success: function (data) {
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!', { icon: 1, time: 1000 });
                },
                error: function (data) {
                    console.log(data.msg);
                },
            });
        });
    }
</script>

</html>
