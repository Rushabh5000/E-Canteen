<%@ Page Language="C#" MasterPageFile="logged.master" AutoEventWireup="true" CodeFile="resolve.aspx.cs" Inherits="resolve" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<br /><br /> <br /> <br /><br /> <br />
<div id="signupbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
<div class="panel panel-default">
<div class="panel-heading panel-heading-custom">
<div class="panel-title"> RESOLVE SUPPORT TICKET</div>
</div>
<div style="float: right; font-size: 95%; position: relative; top: -10px">
</div>
<div id="signupform" class="form-horizontal">
 <br /> 
    <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" 
        DataTextField="reqid" DataValueField="message" Width="100%" 
        AutoPostBack="True" onselectedindexchanged="ListBox1_SelectedIndexChanged" 
        BackColor="#FFFBD6" ForeColor="#990000" Rows="5"></asp:ListBox>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT [reqid], [message], [email], [reply] FROM [query] WHERE ([status] = @status) ORDER BY [date]">
        <SelectParameters>
            <asp:Parameter DefaultValue="Processing" Name="status" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
<div class="form-group">
<label for="Email" class="col-md-3 control-label"> ENTER REQUEST ID</label>
<div class="col-md-6">
<asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" 
        placeholder="Request ID" ReadOnly="True"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="#990000"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="Enter valid Request ID" ForeColor="#990000" 
            ValidationExpression="^[0-9]*$" 
            ControlToValidate="TextBox1"></asp:RegularExpressionValidator>
</div>
</div>
<div class="form-group">
<label for="Email" class="col-md-3 control-label"> Query</label>
<div class="col-md-6">
<asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" 
        placeholder="Query" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
</div>
</div>

<div class="form-group">
<label for="Query" class="col-md-3 control-label"> Enter the Resolution </label>
<div class="col-md-6">
<asp:TextBox runat="server" ID="TextBox3" CssClass="form-control" placeholder="Query" TextMode="MultiLine"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="#990000"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="TextBox3" ErrorMessage="Enter Query" 
        ForeColor="#990000"></asp:RequiredFieldValidator>
</div>
</div>
<div class="form-group">
<div class="col-md-offset-3 col-md-9">
<asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" class="btn btn-info"/>
<i class="icon-hand-right"></i>
</div>
</div> 
</div>
</div>
</div>
<div><br /><br /> <br /><br /><br /><br /> <br /><br /><br /><br /><br /> <br /><br /> <br /> <br /> <br /> <br /><br /><br /> <br /> <br /> <br /> <br /></div>
</asp:Content>