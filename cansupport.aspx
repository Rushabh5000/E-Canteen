<%@ Page Language="C#" MasterPageFile="logged.master" AutoEventWireup="true" CodeFile="cansupport.aspx.cs" Inherits="cansupport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<div> <br /><br /><br />
    <br />
    <br /></div>
    <div>
    Welcome, 
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        <br />

    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/support.jpeg" 
            onclick="ImageButton1_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/img/track.png" 
            onclick="ImageButton2_Click" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Height="74px" onclick="Button1_Click1" 
            Text="Button" Width="115px" />
<div class="form-group">
<div class="col-md-offset-3 col-md-9">
<i class="icon-hand-right"></i>
</div>
</div>
</div>

<div><br /><br /> <br /><br /><br /><br /> <br /><br /></div>
</asp:Content>