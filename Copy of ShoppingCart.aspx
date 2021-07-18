<%@ Page Title="" Language="C#" MasterPageFile="~/logged.master" AutoEventWireup="true"
    CodeFile="Copy of ShoppingCart.aspx.cs" Inherits="CopyShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section> 
    <div>
        <br />
        <br />
        <br />
        <br />
  
<div id="signupbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
<div class="panel panel-default">
<div class="panel-heading panel-heading-custom">
<div class="panel-title"> NEW TRANSACTION </div>
</div>
<div style="float: right; font-size: 95%; position: relative; top: -10px">
</div>
<div id="signupform" class="form-horizontal"> <br /><br />
    Welcome,
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
    <br />
    <p>
        Select Category:
        <asp:DropDownList ID="Categories" runat="server" DataSourceID="CategoriesData" DataTextField="CategoryName"
            DataValueField="CategoryID" AutoPostBack="true" />
        <asp:SqlDataSource ID="CategoriesData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
    </p>
    <asp:GridView ID="Products" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID"
        DataSourceID="ProductsData" GridLines="None" EnableViewState="False" Width="100%"
        AllowSorting="True" CellPadding="4" ForeColor="#333333">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Add To Cart">
                <ItemTemplate>
                    <asp:CheckBox ID="SelectedProducts" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ProductName" HeaderText="Product" SortExpression="ProductName" />
            <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="CategoryName" />
            <asp:BoundField DataField="UnitPrice" HeaderText="Price" SortExpression="UnitPrice"
                DataFormatString="{0:c}" />
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
<%--    <asp:Button ID="AddToCart" runat="server" Text="Select Products" OnClick="AddToCart_Click" />--%>
<div class="form-group">
<div class="col-md-offset-3 col-md-9">
<asp:Button ID="AddToCart" runat="server" onclick="AddToCart_Click" Text="Select Products" class="btn btn-info"/>
&nbsp;&nbsp;&nbsp;
<asp:Button ID="Checkout" runat="server" onclick="Checkout_Click" Text="Check Out" class="btn btn-info"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
<i class="icon-hand-right"> <br />
    </i>
    <asp:Label ID="Label2" runat="server"></asp:Label>
</div>
</div>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <%--<asp:Button ID="Checkout" runat="server" Text="Check Out" OnClick="Checkout_Click" />--%>
    <div class="form-group">
<div class="col-md-offset-3 col-md-9">
<i class="icon-hand-right">  </i>
    <asp:Label ID="Label3" runat="server"></asp:Label>
</div>
</div>
    <asp:SqlDataSource ID="ProductsData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT Products.ProductName, Products.ProductID, Categories.CategoryName, 
        Products.UnitPrice FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID 
        WHERE Products.CategoryID = @CategoryID">
        <SelectParameters>
            <asp:ControlParameter ControlID="Categories" Name="CategoryID" PropertyName="SelectedValue"
                DefaultValue="1" />
        </SelectParameters>
    </asp:SqlDataSource>
      </div>
    </div></div></div>
    </section>
    <div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
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
