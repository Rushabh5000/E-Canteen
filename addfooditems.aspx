<%@ Page Title="" Language="C#" MasterPageFile="~/logged.master" AutoEventWireup="true"
    CodeFile="addfooditems.aspx.cs" Inherits="addfooditems" %>

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
                                DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryName">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                
                                SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories] ORDER BY [CategoryName]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="RFID" class="col-md-3 control-label">
                            Name</label>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" placeholder="Name of Item "></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="RFID" class="col-md-3 control-label">
                            Price</label>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" placeholder="Price of Item "></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-3 col-md-9">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" class="btn btn-info" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:button id="btnBack" runat="server" text="Back" OnClientClick="JavaScript: window.history.back(1); return false;" class="btn btn-info"></asp:button>
                            <i class="icon-hand-right">
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
