<%@ Page Language="C#" MasterPageFile="logged.master" AutoEventWireup="true" CodeFile="canhist.aspx.cs" Inherits="chist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div> <br /><br /> <br />
    <br />
    <br /></div>
        Welcome, 
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>        
        <br />
        <div>
         <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" 
                Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Large">
             <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="date" HeaderText="date" SortExpression="rfid" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="rfid" />
            <asp:BoundField DataField="rfid" HeaderText="rfid" SortExpression="rfid" />
            <asp:BoundField DataField="dept" HeaderText="dept" SortExpression="dept" />
            <asp:BoundField DataField="amount" HeaderText="amount" SortExpression="amount" />
            <asp:BoundField DataField="summary" HeaderText="summary" SortExpression="type" />
            <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
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
        SelectCommand="SELECT [date], [email], [rfid], [dept], [amount], [summary], [type] FROM [txn] WHERE ([dept] = 'canteen')">
        <SelectParameters>
            <asp:SessionParameter Name="dept" SessionField="name" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
<div> <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /> <br /><br /><br /><br /> <br /><br /><br /><br /> </div>
    </asp:Content>