<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="BkAdminSystem.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="Plug-in/layer.js"></script>
    <script type="text/javascript" src="Plug-in/testJs.js"></script>
     <script src="App_Scripts/jquery-1.8.2.min.js"></script>
</head>
<body>
    <form id="form1" runat="server" method="get">
        <div>
            <input type="button" onclick="test()" value="test" runat="server" />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server"></asp:UpdatePanel>
        </div>
    </form>
</body>
</html>

<%--Listview控件表格--%>
<%--
    <asp:ListView ID="ListView1" runat="server">
            <AlternatingItemTemplate></AlternatingItemTemplate>
            <InsertItemTemplate></InsertItemTemplate>
            <ItemTemplate></ItemTemplate>
            <LayoutTemplate></LayoutTemplate>
        </asp:ListView>
    
--%>

<%--TreeView绑定数据源--%>
<%--
    <asp:TreeView ID="TreeView1" runat="server"></asp:TreeView>
    
--%>

<%--树形菜单 treeview  Nodes TreeNode
    <asp:treeview runat="server">
            <Nodes>
                <asp:TreeNode NavigateUrl="#" Text="操作员管理">
                    <asp:TreeNode NavigateUrl="#" Text="操作员"/>
                    <asp:TreeNode NavigateUrl="#" Text="菜单权限控制"/>
                </asp:TreeNode>
                <asp:TreeNode NavigateUrl="#" Text="书籍信息管理">
                    <asp:TreeNode NavigateUrl="#" Text="会员信息"/>
                    <asp:TreeNode NavigateUrl="#" Text="图书状态"/>
                    <asp:TreeNode NavigateUrl="#" Text="图书信息"/>
                    <asp:TreeNode NavigateUrl="#" Text="借书管理"/>
                    <asp:TreeNode NavigateUrl="#" Text="还书管理"/>
                    <asp:TreeNode NavigateUrl="#" Text="书籍查询"/>
                </asp:TreeNode>
                <asp:TreeNode NavigateUrl="#" Text="系统设置">
                    <asp:TreeNode NavigateUrl="#" Text="修改密码"/>
                    <asp:TreeNode NavigateUrl="#" Text="个人中心"/>
                </asp:TreeNode>
                <asp:TreeNode NavigateUrl="#" Text="注销系统"/>
            </Nodes>
        </asp:treeview>--%>