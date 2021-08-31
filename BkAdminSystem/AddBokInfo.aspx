<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBokInfo.aspx.cs" Inherits="BkAdminSystem.AddBokInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="tbBiisbn" runat="server" CssClass="tb"></asp:TextBox>
        <asp:TextBox ID="tbBiname" runat="server" CssClass="tb"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="必填字段" ControlToValidate="tbBiname"></asp:RequiredFieldValidator>

        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="请输入正确价格"></asp:RegularExpressionValidator>

        <asp:TextBox ID="tbBiwirte" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbBinumber" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbBirent" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbBicard" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbBitime" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbMark" runat="server" TextMode="MultiLine"></asp:TextBox>

        <asp:Button ID="新增" runat="server" Text="Button" />
        <asp:Button ID="放弃" runat="server" Text="Button" />
    </div>
    </form>
</body>
</html>
