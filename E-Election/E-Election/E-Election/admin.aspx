<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="E_Election.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administrator</title>
    <link href="css/AdminStyle.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="images/Icon.jpg" />

 
</head>
<body>
    <form id="form1" runat="server">
        
    <a href="default.aspx"><img src="images/cancel.png" alt="Cancel" class="Close"/></a> 

    <div class="box">

        <div class="mycontrols">
            
        <h1 class="log">Admin Login</h1> 

        <asp:TextBox ID="TextBox1" CssClass="adTextBox" runat="server" required ="required" placeholder="Name"></asp:TextBox>
            <br /><br />
        <asp:TextBox ID="TextBox2" CssClass="adTextBox" runat="server" required ="required" TextMode="Password" placeholder="Password"></asp:TextBox>
            <br /><br />
       <div class="getin"><asp:Button ID="Button1" CssClass="login_button" runat="server" Text="Log In" OnClick="Button1_Click" /></div>

        </div>
      <asp:Label ID="Label1" runat="server" CssClass="incorrect" ForeColor="Red" Visible="False" Font-Size="Large"></asp:Label>


    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Administrator]"></asp:SqlDataSource>
    </form>


</body>
</html>
