<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ranking.aspx.cs" Inherits="E_Election.ranking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chart</title>
    <link href="css/ranking.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="images/Icon.jpg" />


</head>
<body>

     <a href="default.aspx"><img src="images/cancel.png" alt="Close" class="Close"/></a>

    <form id="form1" runat="server">
          <asp:Label ID="Label2" CssClass="selectType" runat="server" Text="Select Chart Type:" ForeColor="White"></asp:Label>
        <asp:DropDownList ID="DropDownList1" CssClass="selectType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ></asp:DropDownList>

    <div class="main">
        
       <a href="default.aspx" style="text-decoration: none"><div class="rankLabel"><asp:Label ID="Label1" runat="server" CssClass="ques" ></asp:Label></div></a> 
      
        <div class="chartBox">

        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" BackColor="Transparent" Height="596px" Width="1100px">            

            <Series>
                <asp:Series Name="Series1" XValueMember="Selected_Candidate" YValueMembers="Num_Of_Vote" YValuesPerPoint="3"></asp:Series>
            </Series>

            <ChartAreas>
                <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                    <Area3DStyle Enable3D="true" />
                    <AxisX LineColor="Transparent" >
                        <MajorGrid LineColor="Transparent" />
                        <LabelStyle ForeColor="White" />
                    </AxisX>

                    <AxisY LineColor="Transparent">
                        <MajorGrid LineColor="Transparent"/>
                        <LabelStyle Enabled="false" />
                    </AxisY>

                </asp:ChartArea>
            </ChartAreas>   

        </asp:Chart>

            </div>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Decision]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
