<%@ Page Title="" Language="C#" MasterPageFile="~/logged.master" AutoEventWireup="true"
    CodeFile="managefooditems.aspx.cs" Inherits="managefooditems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <br />
        <br />
        <br />
        <br />
        <div id="signupbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading panel-heading-custom">
                    <div class="panel-title">
                        MANAGE FOOD ITEMS
                    </div>
                </div>
                <div style="float: right; font-size: 95%; position: relative; top: -10px">
                </div>
                <div id="signupform" class="form-horizontal">
                    <br />
                    <div class="form-group">
                        <br />
                        <label for="Email" class="col-md-3 control-label">
                            Select Category</label>
                        &nbsp;<div class="col-md-6">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" placeholder="Email Address"
                                DataSourceID="SqlDataSource1" DataTextField="CategoryName" 
                                DataValueField="CategoryName" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories] ORDER BY [CategoryName]">
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="RFID" class="col-md-3 control-label">
                            Name</label>
                        <div class="col-md-6">
                            <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" CssClass="form-control"
                                placeholder="Product Name" DataSourceID="SqlDataSource2" DataTextField="ProductName"
                                DataValueField="UnitPrice" Height="100px">
                            </asp:ListBox>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                
                                SelectCommand="SELECT Products.ProductName, Products.UnitPrice FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID WHERE (Products.CategoryID IN (SELECT CategoryID FROM Categories AS Categories_1 WHERE (CategoryName = @CategoryName))) ORDER BY Products.ProductName">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList1" Name="CategoryName" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="RFID" class="col-md-3 control-label">
                            Enter Product Name if you want to add new product</label>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" placeholder="Name of Item "></asp:TextBox>
                        </div>
                    </div> <div class="form-group">
                        <label for="RFID" class="col-md-3 control-label">
                            Price</label>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" placeholder="Price of Item "></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-3 col-md-9">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" 
                                class="btn btn-info" />
                            <i class="icon-hand-right">
                                &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Delete" 
                                class="btn btn-info" />
                                &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Update" 
                                class="btn btn-info" />
                                &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnBack" runat="server" class="btn btn-info" 
                                OnClientClick="JavaScript: window.history.back(1); return false;" 
                                text="Back"/>
                                <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="Button" />
                                <br />
                                <br />
                            </i>
                            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="Label2" runat="server"></asp:Label>
                            <asp:Label ID="Label3" runat="server"></asp:Label>
                            
                            
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
