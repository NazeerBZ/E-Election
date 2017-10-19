<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="E_Election._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Polling</title>
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="images/Icon.jpg" />

</head>
<body onload="loadck()" onunload="unloadck()">  
    <form id="form1" runat="server">
    
     <div class="MainContainer">

        <div class="content">

            <h1 class="elect_heading">E-Election</h1>

            <p class="myvc">Make Your</p>
                  
              <a href="javascript:void(0)" id="VoteEnd" class="voteline"><div class="vote">VOTE</div></a>
       
            <p class="myvc">Count</p>
                        
           <div class="p_s"> <asp:Button ID="Button1" runat="server" Text="Polling Status" CssClass="polling_status" OnClick="Button1_Click" /> </div>
            
        </div>
        
    </div>
    
        <div class="timing">
                        
            <h1 class="remaining_time"> Remaining Time...</h1>        
                        
            <ul class="hr_min_sec">
                <li><div id="hrs"></div> hours</li>
                <li><div id="min"></div> minutes</li>
                <li><div id="sec"></div> seconds</li>
            </ul>            
        </div>
    <a class="footer_anch" href="admin.aspx">
        <div id="admin_btn"><p class="p_admin">ADMIN</p></div>
    </a>

       <script src="js/script.js" type="text/javascript"></script>

    </form>
</body>
</html>
