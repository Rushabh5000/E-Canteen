<%@ Page Title="" Language="C#" MasterPageFile="~/logged.master" AutoEventWireup="true" CodeFile="manage.aspx.cs" Inherits="manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton1" runat="server" Width="168px" AlternateText="Add Product"
            Height="168px" onclick="ImageButton1_Click" 
            ImageUrl="~/img/addfooditem.jpg" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton2" runat="server" Width="168px" AlternateText="Manage Product"
            Height="168px" onclick="ImageButton2_Click" 
            ImageUrl="~/img/managefooditem.jpg"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton3" runat="server" Width="168px" AlternateText="Add Category"
            Height="168px" onclick="ImageButton3_Click" 
            ImageUrl="~/img/addcategory.png" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton4" runat="server" Width="168px" AlternateText="Manage Category"
            Height="168px" onclick="ImageButton4_Click" 
            ImageUrl="~/img/managecategory.png"  />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
