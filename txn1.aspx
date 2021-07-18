<%@ Page Title="" Language="C#" MasterPageFile="akshara.master" AutoEventWireup="true"
    CodeFile="txn1.aspx.cs" Inherits="txn1" Async="true" %>

<script runat="server">
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <br />
    <div id="signupbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-default">
            <div class="panel-heading panel-heading-custom">
                <div class="panel-title">
                    NEW TRANSACTION
                </div>
            </div>
            <div style="float: right; font-size: 95%; position: relative; top: -10px">
            </div>
            <div id="signupform" class="form-horizontal">
                <div class="form-group">
                    <br />
                    <br />
                    <label for="RFID" class="col-md-3 control-label">
                        RFID NO.</label>
                    <div class="col-md-7">
                        <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" placeholder="rfid no."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="*" ForeColor="#990000"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="Enter value in Digits only." ForeColor="#990000" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                        <br />
                    </div>
                </div>
                <div class="form-group">
                    <label for="ORDER" class="col-md-3 control-label">
                        ORDER
                    </label>
                    <div class="col-md-7">
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" placeholder="course"
                            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem Text="Samosa" Value="Samosa"></asp:ListItem>
                            <asp:ListItem Text="Sandwich" Value="Sandwich"></asp:ListItem>
                            <asp:ListItem Text="Paneer Roll" Value="Paneer Roll"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select the item"
                            ForeColor="#990000" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="QUANTITY" class="col-md-3 control-label">
                        QUANTITY
                    </label>
                    <div class="col-md-7">
                        <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" placeholder="QUANTITY"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2"
                            ErrorMessage="Enter quantity in numbers only." ForeColor="#990000" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="amount" class="col-md-3 control-label">
                        amount
                    </label>
                    <div class="col-md-7">
                        <asp:TextBox runat="server" ID="TextBox3" CssClass="form-control" placeholder="amount"
                            Enabled="False"></asp:TextBox>
                        <br />
                    </div>
                </div>
                <div class="form-group">
                    <label for="ORDER" class="col-md-3 control-label">
                        ORDER
                    </label>
                    <div class="col-md-7">
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" placeholder="course"
                            OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem Text="Select Item" Value="select" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Samosa" Value="15"></asp:ListItem>
                            <asp:ListItem Text="Sandwich" Value="30"></asp:ListItem>
                            <asp:ListItem Text="Paneer Roll" Value="45"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label for="QUANTITY" class="col-md-3 control-label">
                        QUANTITY
                    </label>
                    <div class="col-md-7">
                        <asp:TextBox runat="server" ID="TextBox4" CssClass="form-control" placeholder="QUANTITY"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox4"
                            ErrorMessage="Enter quantity in numbers only." ForeColor="#990000" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="amount" class="col-md-3 control-label">
                        amount
                    </label>
                    <div class="col-md-7">
                        <asp:TextBox runat="server" ID="TextBox5" CssClass="form-control" placeholder="amount"></asp:TextBox>
                        <br />
                    </div>
                </div>
                <div class="form-group">
                    <label for="ORDER" class="col-md-3 control-label">
                        ORDER
                    </label>
                    <div class="col-md-7">
                        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" placeholder="course"
                            OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem Text="Select Item" Value="select" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Samosa" Value="Samosa"></asp:ListItem>
                            <asp:ListItem Text="Sandwich" Value="Sandwich"></asp:ListItem>
                            <asp:ListItem Text="Paneer Roll" Value="Paneer Roll"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label for="QUANTITY" class="col-md-3 control-label">
                        QUANTITY
                    </label>
                    <div class="col-md-7">
                        <asp:TextBox runat="server" ID="TextBox6" CssClass="form-control" placeholder="QUANTITY"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox6"
                            ErrorMessage="Enter quantity in numbers only." ForeColor="#990000" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="amount" class="col-md-3 control-label">
                        amount
                    </label>
                    <div class="col-md-7">
                        <asp:TextBox runat="server" ID="TextBox7" CssClass="form-control" placeholder="amount"></asp:TextBox>
                        <br />
                    </div>
                </div>
                <div class="form-group">
                    <label for="Others" class="col-md-3 control-label">
                        OTHERS
                    </label>
                    <div class="col-md-7">
                        <asp:TextBox runat="server" ID="TextBox8" CssClass="form-control" placeholder="OTHERS"></asp:TextBox>
                        <br />
                    </div>
                </div>
                <div class="form-group">
                    <label for="TOTAL AMOUNT" class="col-md-3 control-label">
                        TOTAL AMOUNT
                    </label>
                    <div class="col-md-7">
                        <asp:TextBox runat="server" ID="TextBox9" CssClass="form-control" placeholder="TOTAL AMOUNT"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-3 col-md-9">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Total Amount"
                            class="btn btn-info" />
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Submit" class="btn btn-info" />
                        <i class="icon-hand-right"></i>
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
