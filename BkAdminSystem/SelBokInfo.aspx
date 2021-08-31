<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelBokInfo.aspx.cs" Inherits="BkAdminSystem.SelBokInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>查询书籍</title>
    <link rel="stylesheet" type="text/css" href="App_Themes/SelBokInfo/SelBokInfo1.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/iconfont.css" />

    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/HomePage/H-ui.admin.css" />
</head>
<body>
    <form id="form1" runat="server">
        <p style="position:absolute;font-size:50px;font-weight:bold; bottom:80%;left:33%;z-index:400;color:white;">图书管理系统 By SCscHero</p>
            <span class="topSpan" style="z-index:50">
                <input id="inpSel" type="text" name="word" class="inpTopSel" runat="server" />
                <asp:Button ID="btnSel" runat="server" Text="&#xe709;" class="Hui-iconfont selSearch" OnClick="btnSel_Click" />
            </span>
        <div class="banner">
         <div class="banner_wrap">
             <ul class="banner_img clear_fix">
                 <li class="ig"><img src="App_Images/SelBookInfo/back1.jpg" alt=""/></li>
                 <li class="ig"><img src="App_Images/SelBookInfo/back2.jpg" alt=""/></li>
                 <li class="ig"><img src="App_Images/SelBookInfo/back3.jpg" alt=""/></li>
                 <li class="ig"><img src="App_Images/SelBookInfo/back4.jpg" alt=""/></li>
             </ul>
             <div class="banner_left">
                 <img src="App_Images/SelBookInfo/left.png" alt=""/>
             </div >
             <div class="banner_right">
                 <img src="App_Images/SelBookInfo/right.png" alt=""/>
             </div>
         </div>
     </div>        <p style="font-size:31px;font-weight:bold">新书上架</p><hr/>
        <div style="display:flex">
            <img src="App_Images/picBook/10.jpg"/>
            <img src="App_Images/picBook/11.jpg"/>
            <img src="App_Images/picBook/12.jpg"/>
            <img src="App_Images/picBook/13.jpg"/>
            <img src="App_Images/picBook/14.jpg"/>
            <img src="App_Images/picBook/15.jpg"/>
            <img src="App_Images/picBook/16.jpg"/>
            <img src="App_Images/picBook/17.jpg"/>
            <img src="App_Images/picBook/18.jpg"/>
        </div>

    </form>
</body>
<script type="text/javascript" src="App_Scripts/HomePage/jquery.min.js"></script>
<script type="text/javascript" src="App_Scripts/HomePage/layer.js"></script>
<script type="text/javascript" src="App_Scripts/HomePage/H-ui.min.js"></script>
<script type="text/javascript" src="App_Scripts/HomePage/H-ui.admin.js"></script>
<script type="text/javascript" src="App_Scripts/SelBokInfo/SelBokInfo1.js"></script>
    <script type="text/javascript" src="App_Scripts/jquery-1.8.2.js"></script>

</html>
