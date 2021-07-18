<%@ Page Language="C#" MasterPageFile="logged.master" AutoEventWireup="true" CodeFile="load.aspx.cs"
    Inherits="load" %>

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
                        LOAD AMOUNT
                    </div>
                </div>
                <div style="float: right; font-size: 95%; position: relative; top: -10px">
                </div>
                <div id="signupform" class="form-horizontal">
                    <br />
                    <br />
                    <div class="form-group">
                        <label for="RFID" class="col-md-3 control-label">
                            RFID NO.</label>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" placeholder="RFID NO."></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                ErrorMessage="*" ForeColor="#990000"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2"
                                ErrorMessage="Enter value in Digits only." ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="AMOUNT" class="col-md-3 control-label">
                            AMOUNT</label>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" placeholder="AMOUNT"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                ErrorMessage="*" ForeColor="#990000"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2"
                                ErrorMessage="Enter value in Digits only." ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-3 col-md-9">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" class="btn btn-info" />
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                            <asp:Label ID="Label2" runat="server"></asp:Label>
                            <i class="icon-hand-right">
                            <asp:Label ID="Label3" runat="server"></asp:Label>
                            </i>
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
        </div>
</asp:Content>
