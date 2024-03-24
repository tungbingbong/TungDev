<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookedTicketHistory.aspx.cs" Inherits="AND_travels.BookedTicketHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BookedTicketHistory</title>
    <link rel="stylesheet" type="text/css" href="../Styles/index.css"/>
    <!--<link rel="stylesheet" href="fontawesome/css/fontawesome.css"/>-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <style>
        .pad{
            padding-top:5px;
            padding-left:20px;
            padding-bottom:5px;
            padding-right:20px;
        }
        #lblUserId{
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
                <asp:LinkButton ID="lnkbtnHistry" runat="server" Text="Home" OnClick="lnkbtnHistry_Click"></asp:LinkButton>
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
        <br />
        <br />
            <h1>Booked ticket History</h1>
             <br /><br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="spGetHistory" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblUserId" Name="UserId" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="PaymentId" HeaderText="PaymentId" ReadOnly="True" SortExpression="PaymentId" ItemStyle-CssClass="pad" />
                    <asp:BoundField DataField="BusNumber" HeaderText="BusNumber" ReadOnly="True" SortExpression="BusNumber" ItemStyle-CssClass="pad"/>
                    <asp:BoundField DataField="Source" HeaderText="Source" ReadOnly="True" SortExpression="Source" ItemStyle-CssClass="pad"/>
                    <asp:BoundField DataField="Destination" HeaderText="Destination" ReadOnly="True" SortExpression="Destination" ItemStyle-CssClass="pad"/>
                    <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" ReadOnly="True" SortExpression="BookingDate" ItemStyle-CssClass="pad"/>
                    <asp:BoundField DataField="JourneyDate" HeaderText="JourneyDate" ReadOnly="True" SortExpression="JourneyDate" ItemStyle-CssClass="pad"/>
                    <asp:BoundField DataField="PassangerCount" HeaderText="PassangerCount" ReadOnly="True" SortExpression="PassangerCount" ItemStyle-CssClass="pad"/>
                    <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" ReadOnly="True" SortExpression="TotalPrice" ItemStyle-CssClass="pad"/>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" CssClass="pad" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="pad" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        <br />
            </div>
        <asp:Label ID="lblUserId" runat="server"></asp:Label>
    </center>
    </form>
</body>
</html>
