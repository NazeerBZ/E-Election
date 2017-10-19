<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="selection.aspx.cs" Inherits="E_Election.selection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Candidates</title>
    <link rel="icon" href="images/Icon.jpg" />
    <script src="js/script2.js" type="text/javascript"></script>
        
    <style>

    body{

        padding: 0px; 
        margin: 0px;
    }

    .main_hding{

        text-align: center;
        font-size: 40px;
        padding-top: 40px;
        padding-bottom: 30px;
        color: white;
    }

    .line1{

        list-style-type: none;
        padding: 0px;
        margin: 0px;
        
    }

    .line1 > li{

        width: 150px;
        height: 150px;
        float: left;
        margin-left: 110px;
        margin-right: 110px;
    }

      .line1name{

        list-style-type: none;
        padding: 0px;
        margin: 0px;
        
    }

    .line1name > li{

        width: 150px;
        float: left;
        margin-left: 110px;
        margin-right: 110px;
        text-align:center;
    }

    .casting{

        cursor: pointer;
        text-decoration: none;
    }

    .big{

        transition: transform 1s;
        margin: 0px auto;
    }

    .big:hover{

        transform: scale(1.2);
    }

    .beech{

        text-decoration: none;
        font-family: Philosopher;
        color: white;

    }

    .peopleList{

        width: 500px;
        margin: 0px auto;
    }
    
    .ddl{

        width: 100%;
        font-size: 18px;
       padding: 8px 0px 8px 0px;
       border: 1px solid black;
    }
    
    .vote{

        text-align: center;
        font-size: 60px;
        padding-top: 130px;
        padding-bottom: 30px;
        margin: 0px;
        position: relative;
        animation: castYourVote 2s;
    }

 @keyframes castYourVote{

     from{bottom: 130px; opacity: 0.3;}
     to{bottom: 0px;}
 }

    .VE{

        margin:0px auto;
    }

    #Button1{

        border: none;
        background-color: rgba(0, 0, 0, 1);
        color: #FFFFFF;
        cursor: pointer;
        padding: 7px 15px 7px 15px;
        float: right;
        margin-right: 10px;
    }

    #Button2{
        
        border: none;
        background-color: rgba(0, 0, 0, 1);
        color: #FFFFFF;
        cursor: pointer;
        padding: 7px 12px 7px 12px;
        float: right;
    }

    .clear{

        clear: both
    }

    .selectBack{

        width: 100%;
        height: 550px;
        padding-bottom: 100px;
       background-image: url("../images/SimpleBG3.jpg");
       background-size: cover;
       background-attachment:fixed;
       padding-top: 60px;
    }

    .voteSubject{

        text-align:center;
    }

    .specific{

        width: 200px;
    }

    .imgCan{

        width: 150px;
        height: 150px;
        margin: 0px auto;
    }

    .canImg{

        text-align:center;
    }

    .container{

        width: 100%;
        height: 780px;
        background-image: url(../images/frontImage.jpg);
        background-attachment: fixed;
        background-size: cover;
        }

    .cyv{

        width: 700px;
        margin: 0px auto;
    }

    .Text1{

        width: 693px;
        border: 1px solid black;
        margin: 7px 0px 7px 0px;
        padding: 10px 0px 10px 7px;
        font-size: 15px;
    }

     .Text2{

        width: 693px;
        border: 1px solid black;
        margin: 7px 0px 7px 0px;
        padding: 10px 0px 10px 7px;
        font-size: 15px;
    }

      .Text3{

        width: 693px;
        border: 1px solid black;
        margin: 7px 0px 7px 0px;
        padding: 10px 0px 10px 7px;
        font-size: 15px;
    }

    .slowly{

        animation: voteBoxes 2s;
        position: relative;
    }

    @keyframes voteBoxes{

        from{bottom: 130px; opacity: 0.3;}
     to{bottom: 0px;}
 }    
      
        .auto-style1 {
            color: #FF0000;
        }
      
    </style>
</head>
<body>          
        <div class="selectBack">

        <div class="voteSubject"><asp:Label ID="Label1" runat="server" CssClass="main_hding" Width="1150px"></asp:Label></div>

        <asp:DataList ID="DataList1" runat="server" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" RepeatColumns="3" RepeatDirection="Horizontal" Font-Size="Larger" HorizontalAlign="Center" >

            <AlternatingItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <EditItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" />

            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />

            <ItemTemplate>

                <table class="specific">

                    <tr>

                        <td>

                            <div  class="imgCan">
                            <a href="#down" class="casting">
                            <img src="<%#Eval("Image") %>" height="150" width="150" class="big" />
                            </a>
                                </div>
                            <br />

                            <div class="canImg">
                             <a href="#down" class="beech">
                         <%#Eval("Candidate") %>
                         </a>
                            </div>

                            <br /><br />
                        </td>

                    </tr>

                </table>

            </ItemTemplate>

            <SelectedItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />

            <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" />

        </asp:DataList>



        <div class="clear"></div>

                </div>

    <div class="container">

        <form id="form1" runat="server" method="post">
            
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div class="cyv">

            <h1 id="down">Cast Your Vote</h1>

                <div id="move">

            <asp:Label ID="selectCandidate_label" runat="server" Text="Select Your Candidate:"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="ddl"></asp:DropDownList>
                    
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                        <ContentTemplate>

            <asp:TextBox ID="TextBox1" runat="server" name="tb1" CssClass="Text1" placeholder="CNIC Name:" required="required"></asp:TextBox>
                              
            <asp:TextBox ID="TextBox2" runat="server" name="tb2" CssClass="Text2" placeholder="CNIC Number:" required="required"></asp:TextBox>
                               
            <asp:TextBox ID="TextBox3" runat="server" name="tb3" CssClass="Text3" placeholder="Phone.no:" required="required"></asp:TextBox>

            <asp:TextBox ID="TextBox4" runat="server" name="tb4" CssClass="Text3" placeholder="Email ID:" required="required" TextMode="Email"></asp:TextBox>
                            
                        </ContentTemplate>

                           <Triggers>

                            <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />

                            </Triggers>

                        </asp:UpdatePanel>

                <div class="VE">

             <asp:Button ID="Button2" runat="server" Text="Clear" OnClick="Button2_Click" formnovalidate="formnovalidate" />
             &nbsp;&nbsp;&nbsp;
             <asp:Button ID="Button1" runat="server" Text="Vote" OnClick="Button1_Click" />
                                                                 
                </div>
                                    
                    <div class="clear"></div>

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>

                            <strong>
                            <asp:Label ID="Label2" runat="server" CssClass="auto-style1" Font-Size="X-Large" Text="You Are Already Voted!" Visible="False"></asp:Label>
                            </strong>

                        </ContentTemplate>

                    </asp:UpdatePanel>
                    
                    </div>
                
                </div>
            
       </form>

        </div>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ElectionInfo]"></asp:SqlDataSource>
</body>
</html>
