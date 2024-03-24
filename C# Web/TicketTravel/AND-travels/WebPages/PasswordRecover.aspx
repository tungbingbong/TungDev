<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordRecover.aspx.cs" Inherits="AND_travels.WebPages.PasswordRecover" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RecoverYourPassword</title>
    <link href="../Styles/Authentication.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
    <nav>
        <div>
        <ul class="brand">
          <li class="repo"><a href="index.aspx" style="font-size:25px;margin-left:50px;">&</a></li>
          <li class="left"><a href="#">Bus Tickets</a></li>
          <li class="left"><a href="#">Hotels</a></li>
          <li class="left"><a href="#">Tour Packages</a></li>
          <li class="right dropdown" style="margin-right:100px;"><a href="#" class="dropbtn"><i class="fas fa-user-circle large"></i>&nbsp;&nbsp;<i class="fas fa-caret-down"></i></a>
            <div class="dropdown-content">
              <p>Existing User</p>
              <a href="Authentication.aspx">Login</a>
              <p>New User</p>
              <a href="Authentication.aspx">SignUp</a>
              </div>
          </li>
          <li class="right dropdown"><a href="#" class="dropbtn">Manage Booking&nbsp;&nbsp;<i class="fas fa-caret-down"></i></a>
            <div class="dropdown-content">
              <p>Bus Tickets</p>
              <a href="#">CancelTicket</a>
              <a href="#">PrintTicket</a>
              <p>Hotel Tickets</p>
              <a href="#">Cancel/Refund</a>
            </div>
          </li>
          <li class="right"><a href="#">Help</a></li>
        </ul>
      </div>
      </nav>

        <br />
        <center style="margin-top:70px;">
            <h1>Forget Your Password.....?</h1>
            <br /><br />
            <table>
            <tr>
                <td style="padding:20px;"><asp:Label ID="lblEmail" runat="server" Text="Email : "></asp:Label></td>
                <td style="padding:20px;"><asp:TextBox ID="tbEmail" runat="server" TextMode="Email" style="color:#F22f08;padding:10px;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage=" *" Font-Bold="true" ForeColor="#F22f08" ControlToValidate="tbEmail" ValidationGroup="grpRecover"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td></td>
                <td style="padding-left:20px;"><asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Email is not Valid" ControlToValidate="tbEmail" ForeColor="#F22F08" Font-Bold="true" ValidationGroup="grpRecover" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td></td>
                <td style="padding:20px;"><asp:LinkButton ID="lnkbtnRecover" runat="server" Text="Recover" CssClass="btnLogin" ValidationGroup="grpRecover" OnClick="lnkbtnRecover_Click"></asp:LinkButton></td>
            </tr>
                <tr>
                   <td colspan="2"><asp:Label ID="lblMEssege" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label></td>
               </tr>
                <tr>
                    <td style="padding:20px;"><asp:LinkButton ID="lnkbtnSignUp" runat="server" Text="SignUp" OnClick="lnkbtnSignUp_Click"></asp:LinkButton></td>
                    <td style="padding:20px;"><asp:LinkButton ID="lnkbtnLogin" runat="server" Text="Login" OnClick="lnkbtnLogin_Click"></asp:LinkButton></td>
                </tr>
                
            </table>
         </center>
    </form>
</body>
</html>
