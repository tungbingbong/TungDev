<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintTicket.aspx.cs" Inherits="AND_travels.PrintTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ticket & Travels</title>
    <style>
        *{
            font-family:'Segoe UI';
        }
        table tr td{
            padding:5px 10px 5px 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <center>
       <div>
           <h2>E-Ticket | &-Travels</h2>
        <table border="1" style="border-collapse:collapse;">
            <tr>
                <td><h3 style="color:#F22F08;">Bus Number :-</h3></td>
                <td><asp:Label ID="lblBusNumber" runat="server" Text="bn"></asp:Label></td>
                <td><h3 style="color:#F22F08;">Bus Name :-</h3></td>
                <td><asp:Label ID="lblBusName" runat="server" Text="BName"></asp:Label></td>
            </tr>
            <tr>
                <td><h3 style="color:#F22F08;">Source : </h3></td><td><asp:Label ID="lblSource" runat="server"></asp:Label></td>
                <td><h3 style="color:#F22F08;">Destination : </h3></td><td><asp:Label ID="lblDestination" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><h3 style="color:#F22F08;">Passanger Name : </h3></td>
                <td><asp:Label ID="lblPassangerName" runat="server" Text="pn"></asp:Label></td>
                <td><h3 style="color:#F22F08;">Passanger Mobile : </h3></td>
                <td><asp:Label ID="lblMobile" runat="server" Text="Mobile"></asp:Label></td>
            </tr>
            <tr>
                <td><h3 style="color:#F22F08;">Schedule Arrival :-</h3></td>
                <td><asp:Label ID="lblArrival" runat="server"></asp:Label></td>
                <td><h3 style="color:#F22F08;">Schedule Departure :-</h3></td>
                <td><asp:Label ID="lblDeparture" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><h3 style="color:#F22F08;">Booking Date :-</h3></td>
                <td><asp:Label ID="lblBookingDate" runat="server" Text="BD"></asp:Label></td>
                <td><h3 style="color:#F22F08;">Journey Date :-</h3></td>
                <td><asp:Label ID="lblJourneyDate" runat="server" Text="JD"></asp:Label></td>
            </tr>
            <tr>
                <td><h3 style="color:#F22F08;">Passanger Count :-</h3></td>
                <td><asp:Label ID="lblPassengerCount" runat="server" Text="PC"></asp:Label></td>
                <td><h3 style="color:#F22F08;">Total Price :-</h3></td>
                <td><asp:Label ID="lblTotalPrice" runat="server" Text="TC"></asp:Label></td>
            </tr>
        </table>
           <table>
               
            <tr>
                <td><input type="button" value="Print" onclick="printFunction()"/></td>
                <td><asp:Button ID="btnHome" runat="server" Text="Close" OnClick="btnHome_Click" /></td>
                </tr>
           </table>
    </div>
   </center>
    </form>
    <script>
        alert('You Have Successfully Booked Your Ticket..!');
        function printFunction()
        {
            window.print();
        }
    </script>
</body>
</html>
