<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModiBokState.aspx.cs" Inherits="BkAdminSystem.ModiBokState" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="stateId" runat="server"></asp:TextBox>
        <asp:TextBox ID="stateName" runat="server"></asp:TextBox>
        <asp:TextBox ID="stateMark" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="保存" />
        <asp:Button ID="Button2" runat="server" Text="关闭" />
    </div>
    </form>
</body>
</html>
