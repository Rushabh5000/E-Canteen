<%@ Page Language="C#" MasterPageFile="logged.master" AutoEventWireup="true" CodeFile="canrefund.aspx.cs" Inherits="canrefund" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Refund</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      Rfid no: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="Enter value in Digits only." 
                    ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
        <br />
        <br />
        Amount: <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="Enter value in Digits only." 
                    ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
    </div>
    </form>
</body>
</html>
