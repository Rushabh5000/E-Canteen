<%@ Page Language="C#" MasterPageFile="logged.master" AutoEventWireup="true" CodeFile="raise.aspx.cs" Inherits="raise" %>
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
<label for="Query" class="col-md-3 control-label"> Enter the query </label>
<div class="col-md-6">
<asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" placeholder="Query" TextMode="MultiLine"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="TextBox2" ErrorMessage="Enter Query" 
        ForeColor="#990000"></asp:RequiredFieldValidator>
</div>
</div>
<div class="form-group">
<div class="col-md-offset-3 col-md-9">
<asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" class="btn btn-info"/>
    <asp:Label ID="Label2" runat="server"></asp:Label>
<i class="icon-hand-right">
    <asp:Label ID="Label3" runat="server"></asp:Label>
    </i>
</div>
</div> 
</div>
</div>
</div>
<div><br /><br /> <br /><br /><br /><br /> <br /><br /><br /><br /><br /> <br /><br /> <br /> <br /> <br /> <br /><br /><br /> <br /> <br /> <br /> <br /></div>
</asp:Content>