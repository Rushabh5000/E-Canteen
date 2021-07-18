<%@ Page Language="C#" MasterPageFile="logged.master" AutoEventWireup="true" CodeFile="requestpayment.aspx.cs" Inherits="requestpayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<br /><br /> <br /> <br /><br /> 
    Welcome, 
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
<div id="signupbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
<div class="panel panel-default">
<div class="panel-heading panel-heading-custom">
<div class="panel-title"> RAISE SUPPORT TICKET</div>
</div>
<div style="float: right; font-size: 95%; position: relative; top: -10px">
</div>
<div id="signupform" class="form-horizontal">
 <br /> <br />
<div class="form-group">
<label for="Email" class="col-md-3 control-label"> Email Id</label>
<div class="col-md-6">
<asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" 
        placeholder="EMAIL ID" ReadOnly="True"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="#990000"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="Enter valid Email address." ForeColor="#990000" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ControlToValidate="TextBox1"></asp:RegularExpressionValidator>
</div>
</div>
<div class="form-group">
<label for="Email" class="col-md-3 control-label"> Amount</label>
<div class="col-md-6">
<asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" 
        placeholder="AMOUNT" ReadOnly="True"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="#990000"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ErrorMessage="Enter valid Amount" ForeColor="#990000" 
            ValidationExpression="^[0-9]*$" 
            ControlToValidate="TextBox2"></asp:RegularExpressionValidator>
</div>
</div>

<div class="form-group">
<div class="col-md-offset-3 col-md-9">
<asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" class="btn btn-info"/>
    <asp:Label ID="Label2" runat="server"></asp:Label>
    <asp:Label ID="Label3" runat="server"></asp:Label>
<i class="icon-hand-right"></i>
</div>
</div> 
</div>
</div>
</div>
<div><br /><br /> <br /><br /><br /><br /> <br /><br /><br /><br /><br /> <br /><br /> <br /> <br /> <br /> <br /><br /><br /> <br /> <br /> <br /> <br /></div>
</asp:Content>