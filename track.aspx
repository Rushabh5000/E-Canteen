<%@ Page Language="C#" MasterPageFile="logged.master" AutoEventWireup="true" CodeFile="track.aspx.cs" Inherits="track" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div> <br /><br /><br /><br /></div>
    <div id="signupbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
<div class="panel panel-default">
<div>Welcome,
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
    </div>
<div class="panel-heading panel-heading-custom">
<div class="panel-title"> TRACK SUPPORT TICKET</div>
</div>
<div style="float: right; font-size: 95%; position: relative; top: -10px">
</div>
<div id="signupform" class="form-horizontal"> <br /><br />
<div class="form-group">
<label for="NEW RFID" class="col-md-3 control-label"> ENTER REQUEST ID.</label>
<div class="col-md-6">
<asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" placeholder="REQUEST ID"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="#990000"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="Enter value in Digits only." 
            ForeColor="#990000" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
</div>
</div>
<div class="form-group">
<div class="col-md-offset-3 col-md-9">
<asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" class="btn btn-info"/>
<i class="icon-hand-right"></i>
</div>
</div>

</div>
</div>
</div>
        <div>
            <br /><br /> 
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                    <asp:BoundField DataField="reqid" HeaderText="reqid" InsertVisible="False" 
                        ReadOnly="True" SortExpression="reqid" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="message" HeaderText="message" 
                        SortExpression="message" />
                    <asp:BoundField DataField="status" HeaderText="status" 
                        SortExpression="status" />
                    <asp:BoundField DataField="reply" HeaderText="reply" SortExpression="reply" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [query] WHERE ([reqid] = @reqid)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="reqid" PropertyName="Text" 
                        Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        </div>
        </asp:Content>
