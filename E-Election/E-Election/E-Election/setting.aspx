
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="setting.aspx.cs" Inherits="E_Election.setting" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Setting</title>
    <link rel="icon" href="images/Icon.jpg" />
    <link href="css/settingStyle.css" rel="stylesheet" />

    <%--<script>

        function AllNominee() {
            
            var sc = document.getElementById("slideItDown");

            switch(true){
    
                case sc.hasAttribute("class") == false: document.getElementById("slideItDown").className = "delBox";
                    break;

                case sc.hasAttribute("class") == true: document.getElementById("slideItDown").removeAttribute("class");
                    break;
            }

            
        }

    </script>
    --%>
</head>
<body>

    <a href="default.aspx"><img src="images/cancel.png" alt="Close" class="Close"/></a>

    <div class="box" >

     <h1 class="set_heading">SETTINGS</h1>
        
    <form id="form1" runat="server" class="auto-style1">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

        <asp:Label ID="Label1" runat="server" Text="Election Subject: " CssClass="elecSub"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="adminTextBox" required="required"></asp:TextBox>

        <br /><br />
        
        <asp:Label ID="Label2" runat="server" Text="Name of Nominee: " CssClass="elecSub"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" CssClass="adminTextBox" required="required"></asp:TextBox>

        <div class="clear"></div>
        <br />
        
<%--        <ajaxToolkit:AjaxFileUpload ID="AjaxFileUpload1" runat="server" MaximumNumberOfFiles="1" OnUploadComplete="AjaxFileUpload1_UploadComplete" />--%>
<%--        <asp:FileUpload ID="FileUpload1" runat="server" />--%>

        <ajaxToolkit:AsyncFileUpload ID="AsyncFileUpload1" runat="server" OnUploadedComplete="AsyncFileUpload1_UploadedComplete" />
                
        <asp:Button ID="Button2" runat="server" CssClass="adminUpload" Text="Upload" OnClick="Button2_Click" />
        <br /><br />
                           
                    </ContentTemplate>

            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
            </Triggers>

            </asp:UpdatePanel>

         <asp:Button ID="Button3" runat="server" Text="Proceed To Vote" CssClass="auto-style3" Width="308px" OnClick="Button3_Click" formnovalidate="formnovalidate" />
                                
         <asp:Button ID="Button1" runat="server" Text="Delete Data" CssClass="auto-style2" Width="308px" OnClick="Button1_Click" formnovalidate="formnovalidate"/>


            <%--<div id="slideItDown" runat="server">

                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>

                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Candidate" DataValueField="Candidate" Visible="False"></asp:CheckBoxList>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>--%>
        

        <asp:Button ID="Button4" runat="server" Text="Announcement" CssClass="auto-style0" Width="308px" OnClick="Announce" formnovalidate="formnovalidate" />

        <asp:UpdatePanel ID="UpdatePanel2" runat="server"> 
               <ContentTemplate>
        <div class="inviLabel">
            
        <asp:Label ID="Label3" runat="server" ForeColor="Red" Visible="false" CssClass="incorrectValue"></asp:Label>

        </div>
                   

            </ContentTemplate>
            </asp:UpdatePanel>
        
     </form>
                
    </div>
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Candidate] FROM [ElectionInfo]"></asp:SqlDataSource>
   
</body>
</html>
