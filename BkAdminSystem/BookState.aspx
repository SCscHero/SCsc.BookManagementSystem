<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookState.aspx.cs" Inherits="BkAdminSystem.BookState" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="App_Scripts/OperInfo_Add/skin/layer.css" />

    <title>图书状态管理 - By SCscHero</title>

</head>
<body>
    <form id="form1" runat="server">
        <h1>图书状态管理</h1>
        <div class="text-c">
            日期范围：
            <div class="divBeau">
                <input type="text" class="layui-input dateBeau dateWidHei" id="test1" placeholder="yyyy-MM-dd" />
                <input type="text" class="layui-input dateBeau dateWidHei" id="test2" placeholder="yyyy-MM-dd" />
            </div>

            <input id="Text1" class="dateWidHei" type="text" placeholder="请输入关键词" />

            <div style="height: 200px; width: 200px" class="dateBeau"></div>

            <input type="text" class="input-text" style="width: 250px" placeholder="输入会员名称、电话、邮箱" id="" name="" />
            <button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
        </div>
        <div>
            <%--            <asp:Button ID="ins" runat="server" Text="新增" OnClick="insBkState" />
            <asp:Button ID="modi" runat="server" Text="修改" OnClick="modBkState" />
            <asp:Button ID="able" runat="server" Text="启用" OnClick="ableBkState" />
            <asp:Button ID="disable" runat="server" Text="停用" OnClick="disableBkState" />  OnClick="delBkState" OnClick="insBkState"--%>


            <%--<asp:BulletedList ID="BulletedList1" runat="server" DataSourceID="dsBookInfo" DataTextField="biName" DataValueField="biPicPathFi"></asp:BulletedList>--%>
            <asp:ListBox ID="ListBox1" runat="server" DataSourceID="dsBookInfo" DataTextField="biName" DataValueField="biPicPathFi" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
            <asp:Image ID="Image2" runat="server" Width="205px" ImageUrl="App_Images/picBook/0.jpg"/>
            <img id="img2" alt="" src="" /><br />
            <asp:Button ID="btnDelete" runat="server" Text="&#xe6e2;批量删除" CssClass="Hui-iconfont btnRed" />
            &nbsp;<asp:Button ID="btnIns" runat="server" Text="&#xe600;新增状态" CssClass="Hui-iconfont btnBlue" />

        </div>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="dsBookState" ItemPlaceholderID="holder">
            <LayoutTemplate>
                <div runat="server" id="holder"></div>
            </LayoutTemplate>
            <ItemTemplate>
                <asp:Label ID="PropertyTypeLabel" runat="server" Text='<%# Eval("bsId") %>' />
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("bsState") %>' />
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("bsStuse") %>' />
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("bsMark") %>' />
                <asp:TextBox ID="TextBox2" runat="server" placeHolder="123"></asp:TextBox>
                <hr/>
                <div class="clr"></div>
            </ItemTemplate>
        </asp:ListView>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Panel ID="Panel1" runat="server" CssClass="pnlPopup"></asp:Panel>
        <asp:SqlDataSource ID="dsBookState" runat="server" ConnectionString="<%$ ConnectionStrings:bkAdminString %>" SelectCommand="SELECT * FROM [BookState]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsBookInfo" runat="server" ConnectionString="<%$ ConnectionStrings:bkAdminString %>" SelectCommand="SELECT [biName], ('App_Images/picBook/' + [biPicPath]) AS biPicPathFi FROM [BookInfo]"></asp:SqlDataSource>
    </form>
    <!--【Hero】Js在这里-->
    <script type="text/javascript" src="App_Scripts/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="App_Scripts/BookState/laydate.js"></script>
    <!--【Hero】日期控件的绑定-->
    <script type="text/javascript">
        //执行一个laydate实例
        laydate.render({
            elem: '#test1', //指定元素
        });
        laydate.render({
            elem: '#test2', //指定元素
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#ListBox1").change(function () {
                $("#img2").attr("src", $(this).val());
            });
        });
    </script>
</body>
</html>
