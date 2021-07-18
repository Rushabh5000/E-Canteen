<%@ Page Language="C#" MasterPageFile="logged.master" AutoEventWireup="true" CodeFile="assign.aspx.cs" Inherits="assign" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div> <br /><br /><br /><br /> 
<div id="signupbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
<div class="panel panel-default">
<div class="panel-heading panel-heading-custom">
<div class="panel-title"> ASSIGN RFID </div>
</div>
<div style="float: right; font-size: 95%; position: relative; top: -10px">
</div>
<div id="signupform" class="form-horizontal"> <br /><br />
<div class="form-group">
<label for="Email" class="col-md-3 control-label"> Email Id</label>
<div class="col-md-6">
<asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" placeholder="Email Address"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="#990000"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="Enter valid Email address." ForeColor="#990000" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ControlToValidate="TextBox1"></asp:RegularExpressionValidator>
</div>
</div>

<div class="form-group">
<label for="RFID" class="col-md-3 control-label"> RFID NO.</label>
<div class="col-md-6">
<asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" placeholder="RFID no. "></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="#990000"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ControlToValidate="TextBox2" ErrorMessage="Enter value in Digits only." 
            ForeColor="#990000" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
</div>
</div>
<div class="form-group">
<div class="col-md-offset-3 col-md-9">
<asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" class="btn btn-info"/>
<i class="icon-hand-right">
    <br />
    <br />
    </i>
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <asp:Label ID="Label2" runat="server"></asp:Label>
    <asp:Label ID="Label3" runat="server"></asp:Label>
    <asp:Label ID="Label4" runat="server"></asp:Label>
</div>
</div>

</div>
</div>
</div>
        <div>
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /> <br /><br /><br /><br /> <br /><br /><br /><br />
        </div>
        </asp:Content>
