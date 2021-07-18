<%@ Page Language="C#" MasterPageFile="logged.master" AutoEventWireup="true" CodeFile="studentdashboard.aspx.cs" Inherits="studentdashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<div> <br /><br /><br /><br /><br />
    <br /></div>
    <div>
    Welcome, 
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        <br />

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<asp:ImageButton ID="ImageButton1" runat="server" Width="168px" 
            ImageUrl="~/img/balance.jpeg" Height="168px" 
            onclick="ImageButton1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:ImageButton ID="ImageButton2" runat="server" Width="168px" 
            ImageUrl="~/img/history.jpeg" Height="168px" 
            onclick="ImageButton2_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:ImageButton ID="ImageButton3" runat="server" Width="168px" 
            ImageUrl="~/img/support.jpeg" Height="168px" 
            onclick="ImageButton3_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:ImageButton ID="ImageButton4" runat="server" Width="168px" 
            ImageUrl="~/img/ticket.jpeg" Height="168px" onclick="ImageButton4_Click" />

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/img/edit.png" 
            onclick="ImageButton5_Click" />

        <asp:ImageButton ID="ImageButton6" runat="server" Height="56px" Width="164px" 
            AlternateText="Place Order" onclick="ImageButton6_Click" />

<div class="form-group">
<div class="col-md-offset-3 col-md-9">
<i class="icon-hand-right"></i>
</div>
</div>
</div>

<div><br /><br /> <br /><br /><br /><br /> <br /><br /></div>
</asp:Content>