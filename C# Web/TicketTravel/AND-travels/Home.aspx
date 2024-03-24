<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AND_travels.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link rel="stylesheet" type="text/css" href="../Styles/index.css"/>
    <!--<link rel="stylesheet" href="fontawesome/css/fontawesome.css"/>-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
  
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="mobile-view">
          <h1 style="color:#F22F08;margin-top:200px;">Ooopss.....!</h1><br><br>
          <h4>We are not Available in this resolution. Please Go with Our <a href="https://play.google.com/store?hl=en" target="_blank">Mobile App.</a></h4>

    </div>

      <nav>
        <div>
        <ul class="brand">
          <li class="repo"><a href="#" style="font-size:25px;margin-left:50px;">&</a></li>
          <li class="left"><a href="#">Bus Tickets</a></li>
          <li class="left"><a href="#">Hotels</a></li>
          <li class="left"><a href="#">Tour Packages</a></li>
          <li class="right dropdown" style="margin-right:100px;"><a href="#" class="dropbtn">&nbsp;Welcome:-&nbsp;<asp:LinkButton ID="lnkbtnUserName" runat="server" Text="Name"></asp:LinkButton>&nbsp;&nbsp;<i class="fas fa-caret-down"></i></a>
            <div class="dropdown-content" style="margin-top:25px;padding-top:10px;">  
                <asp:LinkButton ID="lnkbtnHistry" runat="server" Text="Booked Ticket History"></asp:LinkButton>
                <asp:LinkButton ID="lnkbtnLogout" runat="server" Text="LogOut" OnClick="lnkbtnLogout_Click"></asp:LinkButton>
              </div>
          </li>
          <li class="right dropdown"><a href="#" class="dropbtn">Manage Booking&nbsp;&nbsp;<i class="fas fa-caret-down"></i></a>
            <div class="dropdown-content">
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

    <div id="block1">
          <h1>&-travels</h1><br><br>
        <center>
        <table>
        <tr>
          <td>
            <div style="margin-top:-15px;">From<br />
                <asp:DropDownList ID="ddlFrom" runat="server" Font-Size="X-Large">
                    <asp:ListItem Text="Delhi" Value="101"></asp:ListItem>
                    <asp:ListItem Text="Mumbai" Value="102"></asp:ListItem>
                    <asp:ListItem Text="Kolkata" Value="103"></asp:ListItem>
                    <asp:ListItem Text="Varanasi" Value="104"></asp:ListItem>
                </asp:DropDownList>
            </div>
          </td>
          <td>
            <div style="margin-top:-15px;">To<br />
                <asp:DropDownList ID="ddlTo" runat="server" Font-Size="X-Large">
                    <asp:ListItem Text="Varanasi" Value="104"></asp:ListItem>
                    <asp:ListItem Text="Kolkata" Value="103"></asp:ListItem>
                    <asp:ListItem Text="Mumbai" Value="102"></asp:ListItem>
                    <asp:ListItem Text="Delhi" Value="101"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </td>
        <td>
            <input type="date" ID="tbTravelDate" runat="server" style="padding:6px;margin-top:6px;" />
        </td>
        <td>
            <asp:LinkButton ID="lnkbtnSearch" runat="server" Text="Search" CssClass="lnkbtnSearch" OnClick="lnkbtnSearch_Click"></asp:LinkButton>
        </td>
        </tr>
       </table>
     </center>
    </div>
    <div id="block2">
      <h2>Get Assured Discount on Every Booking &nbsp;&nbsp;  <span><i class="fas fa-asterisk rotate" style="font-size:70px;color:#f22f08;"></i></span></h2>
    </div>

<center>
  <div style="margin-left:70px;margin-top:100px;">
    <div id="block3">
        <a href="#">
          <div class="info">
            <h4>Insurence</h4>
            <image src="../Images/offer_tile.png"/>
            <p>Assured Insurence on every<br/> Travelling For Safty.</p>
          </div>
        </a>
    </div>

    <div id="block3">
        <a href="#">
          <div class="info">
              <h4>Scratch card upto 1250</h4>
            <image src="../Images/G-pay.png"/>
            <p>Scratch card upto <br> 1250 rs on every booking</p>
          </div>
        </a>
    </div>

    <div id="block3">
        <a href="#">
          <div class="info">
              <h4> Holiday Extra Package</h4>
            <image src="../Images/holidays.png"/>
            <p>Holiday package with<br> Family tour.</p>
          </div>
        </a>
    </div>
</div>
    </center>
    <br><br><br>

  <center>
  <div id="block4">
    <img src="../Images/promise.png" alt="promise"/>
    <h2>WE PROMISE TO DELIVER</h2>
    <div id="b41"><img src="../Images/maximum_choices.png" height="100px"/>
      <p>MAXIMUM CHOICES</p>
      <br><br>
      <p>We give you the widest number<br> of travel options across<br> thousands of routes.</p>
    </div>
    <div id="b42"><img src="../Images/customer_care.png" height="100px" />
      <p>SUPERIOR &nbsp;&nbsp;&nbsp;CUSTOMER <br>SERVICE</p>
      <br>
      <p>We put our experience and<br> relationships to good use <br>and are available <br>to solve your <br>travel issues.</p>
    </div>
    <div id="b43"><img src="../Images/lowest_Fare.png" height="100px" />
      <p>LOWEST PRICES</p>
      <br><br>
      <p>We always give you the<br> lowest price with the best<br> partner offers.</p>
    </div>
    <div id="b44"><img src="../Images/benefits.png" height="100px" />
      <p>UNMATCHED BENEFITS</p>
      <br><br>
      <p>We take care of your <br>travel beyond ticketing by<br> providing you with innovative<br> and unique benefits.</p>
    </div>
  </div>
  <br><br>


     
</center>

<footer id="block6">
  <div>& - travels<br><br>
      <ul>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Contact Us</a></li>
        <li><a href="#">Mobile Version</a></li>
        <li><a href="#">& - travels</a></li>
        <li><a href="#">Sitemap</a></li>
        <li><a href="#">Offers</a></li>
        <li><a href="#">Careers</a></li>
      </ul>
  </div>
    <div>Info<br><br>
      <ul>
          <li><a href="#">T & C</a></li>
          <li><a href="#">Privacy Policy</a></li>
          <li><a href="#">FAQ</a></li>
          <li><a href="#">Blog</a></li>
          <li><a href="#">Agent Registration</a></li>
          <li><a href="#">Insurance Partner</a></li>
      </ul>
    </div>
      <div style="float:right;"><br><br>
        <a href="#" style="color:#ABA6BF;">
          <i class="fab fa-facebook-f" style="font-size:50px"></i>
          <i class="fab fa-twitter" style="margin-left:40px;font-size:50px"></i>
          <i class="fab fa-google-plus-g" style="margin-left:40px;font-size:50px"></i>
        </a>
      </div>
  </footer>


    </div>
    </form>
    <script type="text/javascript">
        function validate(evt) {
            var theEvent = evt || window.event;

            // Handle paste
            if (theEvent.type === 'paste') {
                key = event.clipboardData.getData('text/plain');
            } else {
                // Handle key press
                var key = theEvent.keyCode || theEvent.which;
                key = String.fromCharCode(key);
            }
            var regex = /[0-9]|\./;
            if (!regex.test(key)) {
                theEvent.returnValue = false;
                if (theEvent.preventDefault) theEvent.preventDefault();
            }
        }
    </script>
    </body>
    </div>
    </form>
</body>
</html>
