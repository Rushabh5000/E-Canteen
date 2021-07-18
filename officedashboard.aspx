<%@ Page Language="C#" MasterPageFile="logged.master" AutoEventWireup="true" CodeFile="officedashboard.aspx.cs" Inherits="officedashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div><br /><br /> <br /><br /></div>
    Welcome,
<asp:Label ID="Label1" runat="server"></asp:Label>

<div  align="center" >
<asp:ImageButton ID="ImageButton1" runat="server" Width="168px" 
            ImageUrl="~/img/assign.jpeg" Height="168px" 
        onclick="ImageButton1_Click"  />
&nbsp;&nbsp;&nbsp;
<asp:ImageButton ID="ImageButton2" runat="server" Width="168px" 
            ImageUrl="~/img/load.jpeg" Height="168px" 
        onclick="ImageButton2_Click" />
&nbsp;&nbsp;&nbsp;
<asp:ImageButton ID="ImageButton3" runat="server" Width="168px" 
            ImageUrl="~/img/history.jpeg" Height="168px" 
        onclick="ImageButton3_Click" />
&nbsp;&nbsp;&nbsp;
<asp:ImageButton ID="ImageButton4" runat="server" Width="168px" 
            ImageUrl="~/img/refund.jpeg" Height="168px" 
        onclick="ImageButton4_Click" />
&nbsp;&nbsp;&nbsp;
<asp:ImageButton ID="ImageButton5" runat="server" Width="168px" 
        ImageUrl="~/img/block.jpeg" Height="168px" onclick="ImageButton5_Click" />
&nbsp;&nbsp;&nbsp;
<asp:ImageButton ID="ImageButton6" runat="server" Width="168px" 
        ImageUrl="~/img/reassign.jpeg" Height="168px" 
        onclick="ImageButton6_Click" />
&nbsp;&nbsp;&nbsp;
<asp:ImageButton ID="ImageButton7" runat="server" Width="168px" 
        ImageUrl="~/img/ticket.jpeg" Height="168px" onclick="ImageButton7_Click" />
<asp:ImageButton ID="ImageButton8" runat="server" Width="168px" 
        ImageUrl="~/img/balance.jpeg" Height="168px" 
        onclick="ImageButton8_Click" />
</div>

    <div><br /><br /> <br /><br /><br /><br /> <br /><br /></div>
</asp:Content>