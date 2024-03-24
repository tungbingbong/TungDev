<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="AND_travels.Booking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BookNow</title>
    <link rel="stylesheet" type="text/css" href="../Styles/index.css"/>
    <!--<link rel="stylesheet" href="fontawesome/css/fontawesome.css"/>-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
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
        <center>
            <br /><br />
            <table>
                <tr>
                  <td colspan="3" style="padding:10px;">
                       <h1><asp:Label ID="lblName" runat="server" Text="Name" ForeColor="#F22f08"></asp:Label></h1>
                  </td>
               </tr>
                <tr>
                    <td style="float:right;padding:10px;"><asp:Label ID="lblSource" runat="server" Text="Source"></asp:Label></td>
                    <td style="padding:10px;">->&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDestination" runat="server" Text="Destination"></asp:Label></td>
                </tr>
                <tr>
                    <td style="float:right;padding:10px;"> <asp:Label ID="lblType" runat="server" Text="Bus-Type : "></asp:Label></td>
                    <td><asp:Label ID="lblBusType" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td style="float:right;padding:10px;"><asp:Label ID="lblBn" runat="server" Text="Bus Number :"></asp:Label></td>
                    <td><asp:Label ID="lblBusNumber" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" style="float:right;padding:10px;">Arrive : <asp:Label ID="lblArrive" runat="server" Text="lblArrive"></asp:Label></td>
                    <td style="padding:10px;"> &nbsp;&nbsp;Departs : <asp:Label ID="lblDeparts" runat="server" Text="lblDeparts"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" style="float:right;padding:10px;"><asp:Label ID="lblSeats" runat="server" Text="NumberOfSeats : "></asp:Label></td>
                    <td style="padding:10px;"><asp:DropDownList ID="ddlNumberOfSeats" runat="server" AutoPostBack="True">
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                        <asp:ListItem Text="9" Value="9"></asp:ListItem>
                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                        <asp:ListItem Text="11" Value="11"></asp:ListItem>
                        <asp:ListItem Text="12" Value="12"></asp:ListItem>
                        <asp:ListItem Text="13" Value="13"></asp:ListItem>
                        <asp:ListItem Text="14" Value="14"></asp:ListItem>
                        <asp:ListItem Text="15" Value="15"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td style="float:right;padding:10px;"><asp:Label ID="lblTotal" runat="server" Text="TotalCosts : "></asp:Label></td>
                    <td style="padding:10px;"><asp:Label ID="lblTotalCosts" runat="server" Text="Costs" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td style="padding:10px;"><asp:Button ID="btnPayment" runat="server" Text="ProceedToPayment" OnClick="btnPayment_Click" /></td>
                </tr>
            </table>
            <br /><br />
           
        </center>

    <asp:Label ID="lblUserId" runat="server"></asp:Label>
        <asp:Label ID="lblBookigDate" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
