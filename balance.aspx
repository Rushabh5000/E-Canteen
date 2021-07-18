<%@ Page Language="C#" MasterPageFile="logged.master" AutoEventWireup="true" CodeFile="balance.aspx.cs" Inherits="balance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<br /><br />
<div>
<br />   <br /> Welcome,
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br /> <br />
<div id="signupbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
<div class="panel panel-default">
<div class="panel-heading panel-heading-custom">
<div class="panel-title"> BALANCE </div>
</div>
<div style="float: right; font-size: 95%; position: relative; top: -10px">
</div>
<div id="signupform" class="form-horizontal">
<div class="form-group">  <br />
<label for="RFID" class="col-md-3 control-label"> RFID</label>
<div class="col-md-8">
<asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" 
        placeholder="RFID NO."></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="#990000"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="Enter value in Digits only." 
            ForeColor="#990000" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
            <br />
</div>
</div>
</div>
<div class="form-group">
<div class="col-md-offset-3 col-md-9">
<asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" class="btn btn-info"/>
    <asp:Label ID="Label2" runat="server"></asp:Label>
<i class="icon-hand-right"></i>
    <asp:Label ID="Label3" runat="server" Visible="False"></asp:Label>
</div>
</div>

<br /> <br /> 
                            </div>
                            </div>
                            </div>
<div> <br /> <br />   <br /> <br /> <br /><br />   <br /> <br /> <br /> <br /> <br />  <br /><br /> <br /> <br /> <br /> </div>
</asp:Content>
