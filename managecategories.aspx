<%@ Page Title="" Language="C#" MasterPageFile="~/logged.master" AutoEventWireup="true" CodeFile="managecategories.aspx.cs" Inherits="managecategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div> <br /><br /><br /><br /> 
<div id="signupbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
<div class="panel panel-default">
<div class="panel-heading panel-heading-custom">
<div class="panel-title"> MANAGE CATEGORIES </div>
</div>
<div style="float: right; font-size: 95%; position: relative; top: -10px">
</div>
<div id="signupform" class="form-horizontal"> <br />
   

<div class="form-group">
<label for="RFID" class="col-md-3 control-label"> Category Name</label>
<div class="col-md-6">

    <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource1" DataTextField="CategoryName" 
        DataValueField="CategoryID"></asp:ListBox>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories] ORDER BY [CategoryName]">
    </asp:SqlDataSource>

    <label for="RFID" class="col-md-3 control-label">Enter Category name if you want to add new Category</label>
    <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" placeholder="Name of Category "></asp:TextBox>
</div>
</div>
<div class="form-group">
<div class="col-md-offset-3 col-md-9">
<asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Add" 
        class="btn btn-info"/>
<i class="icon-hand-right">
    &nbsp;&nbsp;&nbsp;
<asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Delete" 
        class="btn btn-info"/>
    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnBack" runat="server" class="btn btn-info" 
        OnClientClick="JavaScript: window.history.back(1); return false;" text="Back" />
    <br />
    <br />
    </i>
    <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="Label2" runat="server"></asp:Label>
</div>
</div>

</div>
</div>
</div>
<div>
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /> <br /><br /><br /><br /> <br /><br /><br /><br />
        </div>
        </asp:Content>
