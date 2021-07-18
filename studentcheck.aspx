<%@ Page Title="" Language="C#" MasterPageFile="~/logged.master" AutoEventWireup="true"
    CodeFile="studentcheck.aspx.cs" Inherits="studentcheck" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <br />
        <br />
        <br />
        <br />
    </div>
    <div id="signupbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
<div class="panel panel-default">
<div class="panel-heading panel-heading-custom">
<div class="panel-title"> NEW TRANSACTION </div>
</div>
<div style="float: right; font-size: 95%; position: relative; top: -10px">
</div>
<div id="signupform" class="form-horizontal"> <br />
    Welcome,
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    Available Balance is:
    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="Basket" runat="server" AutoGenerateColumns="False" GridLines="None"
        EnableViewState="False" ShowFooter="True" DataKeyNames="ProductID" OnRowCreated="Basket_RowCreated"
        CellPadding="4" ForeColor="#333333" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Remove">
                <ItemTemplate>
                    <asp:CheckBox ID="RemovedProducts" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product" SortExpression="ProductName">
                <ItemTemplate>
                    <asp:Label ID="ProductName" runat="server" Text='<%# Eval("ProductName") %>' />
                </ItemTemplate>
                <FooterTemplate>
                    <strong>Total Price: </strong>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price" SortExpression="UnitPrice">
                <ItemTemplate>
                    <asp:Label ID="UnitPrice" runat="server" Text='<%# Eval("UnitPrice", "{0:c}") %>' />
                </ItemTemplate>
                <FooterTemplate>
                    <strong>
                        <asp:Literal ID="TotalPrice" runat="server" />
                    </strong>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <br />
    <%--<asp:Button ID="RemoveProduct" runat="server" Text="Remove From Basket" OnClick="RemoveProduct_Click" />--%>
    <div class="form-group">
<div class="col-md-offset-3 col-md-9">
<asp:Button ID="RemoveProduct" runat="server" onclick="RemoveProduct_Click" Text="Remove From Basket" class="btn btn-info"/>
<i class="icon-hand-right">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </i>
<asp:Button ID="ConfirmPurchase" runat="server" onclick="ConfirmPurchase_Click" Text="Confirm Purchase" class="btn btn-info"/>
</div>
</div>
    <asp:Label ID="Label2" runat="server"></asp:Label>
    <asp:Label ID="Label3" runat="server"></asp:Label>
    <asp:Label ID="Label8" runat="server"></asp:Label>
    <asp:Label ID="Label9" runat="server"></asp:Label>
    <br />
    <asp:Label ID="Label4" runat="server"></asp:Label>
    <br />
  <%--  <asp:Button ID="ConfirmPurchase" runat="server" Text="Confirm Purchase" OnClick="ConfirmPurchase_Click" />--%>

    <asp:Label ID="Label5" runat="server"></asp:Label>
    <asp:SqlDataSource ID="BasketData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>">
    </asp:SqlDataSource>
    </div></div></div>
     <div>
         <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
         <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /> <br /><br /><br /><br /> <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        </div>
</asp:Content>
