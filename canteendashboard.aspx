<%@ Page Title="" Language="C#" MasterPageFile="~/logged.master" AutoEventWireup="true"
    CodeFile="canteendashboard.aspx.cs" Inherits="canteendashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <br />
        <br />
        <br />
        <br />
    </div>
    Welcome,
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
    <br />
    <div align="center">
    <asp:ImageButton ID="ImageButton1" runat="server" Width="168px" ImageUrl="~/img/order.png"
            Height="168px" onclick="ImageButton1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton2" runat="server" Width="168px" ImageUrl="~/img/balance.jpeg"
            Height="168px" onclick="ImageButton2_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton3" runat="server" Width="168px" ImageUrl="~/img/history.jpeg"
            Height="168px" onclick="ImageButton3_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton4" runat="server" Width="168px" ImageUrl="~/img/support.jpeg"
            Height="168px" onclick="ImageButton4_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton5" runat="server" Width="168px" ImageUrl="~/img/ticket.jpeg"
            Height="168px" onclick="ImageButton5_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton7" runat="server" Height="168px" AlternateText="Manage Canteen"
            Width="168px" onclick="ImageButton7_Click" 
            ImageUrl="~/img/managecanteen.PNG" />
             <br />
        <br />
             
    </div>
    <div>
        <br />
        <br />       
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>
