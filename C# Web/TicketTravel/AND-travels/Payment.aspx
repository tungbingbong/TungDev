<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="AND_travels.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment</title>
    <style>
        *{
            font-family:'Segoe UI';
        }
        #lblUserId{
            visibility:hidden;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br /><br />
        <center>
            <h1 style="color:#ff0000;">Safe and Secure Payments</h1><br />
           <table>
               <tr>
                   <td>PaymentId</td>
                   <td colspan="4"><asp:Label ID="lblPaymentId" runat="server"></asp:Label></td>
               </tr>
           <tr>
               <td>CardNumber : </td>
               <td><asp:TextBox ID="tbFirst" runat="server" Columns="4"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="rfvFirst" runat="server" ControlToValidate="tbFirst" ValidationGroup="grpValidate" ErrorMessage="*" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
               </td>
               <td><asp:TextBox ID="tbSecond" runat="server" Columns="4"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvSecond" runat="server" ControlToValidate="tbSecond" ValidationGroup="grpValidate" ErrorMessage="*" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
               </td>
               <td><asp:TextBox ID="tbThird" runat="server" Columns="4"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="rfvThird" runat="server" ControlToValidate="tbthird" ValidationGroup="grpValidate" ErrorMessage="*" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
               </td>
               <td><asp:TextBox ID="tbFourth" runat="server" Columns="4"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="rfvFourth" runat="server" ControlToValidate="tbFourth" ValidationGroup="grpValidate" ErrorMessage="*" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
               </td>
           </tr>
               <tr>
                   <td>CVV : </td>
                   <td colspan="4" style="float:left;"><asp:TextBox ID="tbCvv" runat="server" Columns="3" TextMode="Password"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rfvCvv" runat="server" ControlToValidate="tbCvv" ValidationGroup="grpValidate" ErrorMessage="*" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
               
                   </td>
               </tr>
               <tr>
                   <td><asp:Label ID="lblCost" runat="server" Text="Payable Amount : "></asp:Label></td>
                   <td colspan="4"><asp:Label ID="lblTotalCost" runat="server" ForeColor="red" Font-Bold="true"></asp:Label></td>
               </tr>
               <tr>
                   <td></td>
                   <td><asp:Button ID="btnPay" runat="server" Text="Pay" ValidationGroup="grpValidate" OnClick="btnPay_Click"/></td>
               </tr>
         </table>
        </center>
    <asp:Label ID="lblUserId" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
