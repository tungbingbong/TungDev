<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="AND_travels.SearchResult" EnableEventValidation="false" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SearchResult</title>
    <link rel="stylesheet" type="text/css" href="../Styles/index.css"/>
    <!--<link rel="stylesheet" href="fontawesome/css/fontawesome.css"/>-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<style>
    table tr td{
        padding-left:20px;
    }
    #tblSearchResult tr td{
        padding:30px;
    }
    .hide{
        visibility:hidden;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <nav>
        <div>
        <ul class="brand">
          <li class="repo"><a href="#" style="font-size:25px;margin-left:50px;">&</a></li>
          <li class="left"><a href="#">Bus Tickets</a></li>
          <li class="left"><a href="#">Hotels</a></li>
          <li class="left"><a href="#">Tour Packages</a></li>
          <li class="right dropdown" style="margin-right:100px;"><a href="#" class="dropbtn">&nbsp;Welcome:-&nbsp;<asp:LinkButton ID="lnkbtnUserName" runat="server" Text="Name"></asp:LinkButton>&nbsp;&nbsp;<i class="fas fa-caret-down"></i></a>
            <div class="dropdown-content" style="margin-top:25px;padding-top:10px;">  
                <asp:LinkButton ID="lnkbtnHistry" runat="server" Text="Booked Ticket History" OnClick="lnkbtnHistry_Click"></asp:LinkButton>
                <asp:LinkButton ID="lnkbtnLogout" runat="server" Text="LogOut" OnClick="lnkbtnLogout_Click"></asp:LinkButton>
              </div>
          </li>
          <li class="right dropdown"><a href="#" class="dropbtn">Manage Booking&nbsp;&nbsp;<i class="fas fa-caret-down"></i></a>
            <div class="dropdown-content" style="padding-top:10px;">
              <p>Bus Tickets</p>
              <asp:LinkButton ID="lnkbtnCancleBusTicket" runat="server" OnClick="lnkbtnCancleBusTicket_Click">CancelBusTicket</asp:LinkButton>
              <a href="#">PrintTicket</a>
              <p>Hotel Tickets</p>
              <a href="#">Cancel/Refund</a>
            </div>
          </li>
          <li class="right"><a href="#">Help</a></li>
        </ul>
      </div>
      </nav>
    </div>
        <!-- Body Of Page is Starts--><br />
        <center>
        <div id="searchMenu"">
        <table>
            <tr>
             <td>Source<br /><asp:DropDownList id="ddlSource" runat="server" Font-Size="XX-Large">
                                <asp:ListItem Text="Delhi" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Mumbai" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Kolkata" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Varanasi" Value="3"></asp:ListItem>
                               </asp:DropDownList> 
            </td>
             <td>Destination<br /><asp:DropDownList id="ddlDestination" runat="server" Font-Size="XX-Large">
                                <asp:ListItem Text="Varanasi" Value="3"></asp:ListItem>
                                <asp:ListItem Text="Kolkata" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Mumbai" Value="1"></asp:ListItem>               
                                <asp:ListItem Text="Delhi" Value="0"></asp:ListItem>
                              </asp:DropDownList>
            </td>
            <td>
                Date:<br />
                    <input type="date" id="theDate" runat="server" />
                
            </td>
            <td>
                <div style="margin-top:40px;"></div>
                <asp:LinkButton ID="lnkbtnSearch" runat="server" Text="Search" CssClass="lnkbtnSearch" OnClick="lnkbtnSearch_Click"></asp:LinkButton>
            <br /><asp:Label ID="lblUserId" runat="server" CssClass="hide"></asp:Label>

            </td>
          </tr>
        </table>
      </div>
            <br />
            <hr />
            <br />
            <br />
            <br />
        
            <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" Font-Size="Large" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                <table id="tblSerchResult"  style="border:1px solid;margin-bottom:20px;padding-top:10px;padding-left:10px;padding-right:20px;border-color:#F22F08;box-shadow:rgba(0,0,0,0.4) 1px 1px 20px;">
                    <tr>
                        <td>
                           <asp:Label ID="BusNameLabel" runat="server" Text='<%# Eval("BusName") %>' ForeColor="Red" />
                            &nbsp;-&nbsp;
                            <asp:Label ID="BusNumberLabel" runat="server" Text='<%# Eval("BusNumber") %>' ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDeparts" runat="server" ForeColor="Red">Departs </asp:Label> 
                        </td>
                        <td>
                            <asp:Label ID="lblArrive" runat="server" ForeColor="Red">Arrive </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblAvailable" runat="server" ForeColor="Red">Available </asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="btnBook" runat="server" Text="BookNow" CssClass="fa-1x" CommandName="BookNow" CommandArgument='<%# Eval("BusNumber") %>' OnCommand="btnBook_Command" />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-bottom:20px;">
                            <asp:Label ID="SourceLabel" runat="server" Text='<%# Eval("Source") %>'></asp:Label> &nbsp; <asp:Label ID="lblSign" runat="server" ForeColor="Red">-></asp:Label> &nbsp;
                            <asp:Label ID="DestinationLabel" runat="server" Text='<%# Eval("Destination") %>'></asp:Label>
                        </td>
                        <td style="padding-bottom:20px;">
                            <asp:Label ID="DepartsLabel" runat="server" Text='<%# Eval("Departs") %>'></asp:Label>    
                        </td>
                        <td style="padding-bottom:20px;">
                            <asp:Label ID="ArriveLabel" runat="server" Text='<%# Eval("Arrive") %>'></asp:Label>
                        </td>
                        
                        <td style="padding-bottom:20px;">
                            <asp:Label ID="AvailableLabel" runat="server" Text='<%# Eval("AvailableSeats") %>'></asp:Label>
                        </td>
                    </tr>

                </table>
            </ItemTemplate>
            </asp:DataList>
                <!--<asp:Label ID="lblMessege" runat="server" Text="Messege"></asp:Label>-->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="spSearchResult" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter Name="Source" Type="String" />
                    <asp:Parameter Name="Destination" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

        </center>
    </form>
    <script>
        var date = new Date();

        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();

        if (month < 10) month = "0" + month;
        if (day < 10) day = "0" + day;

        var today = year + "-" + month + "-" + day;
        document.getElementById("theDate").value = today;
    </script>
</body>
</html>
