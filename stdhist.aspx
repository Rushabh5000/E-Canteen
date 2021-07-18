<%@ Page Title="" Language="C#" MasterPageFile="logged.master" AutoEventWireup="true" CodeFile="stdhist.aspx.cs" Inherits="stdhist" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div> <br /><br /><br /><br /></div>
<div>   <br />
        Welcome,
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
    <div align=center>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" Width="85%" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="rfid" HeaderText="RFID" SortExpression="rfid" />
            <asp:BoundField DataField="date" HeaderText="DATE OF TRANSACTION" SortExpression="date" />
            <asp:BoundField DataField="dept" HeaderText="DEPARTMENT" SortExpression="dept" />
            <asp:BoundField DataField="amount" HeaderText="AMOUNT" SortExpression="amount" />
            <asp:BoundField DataField="summary" HeaderText="SUMMARY" SortExpression="type" />
            <asp:BoundField DataField="type" HeaderText="TYPE OF TRANSACTION" SortExpression="type" />
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
        SelectCommand="SELECT [rfid], [date], [dept], [amount], [summary], [type] FROM [txn] WHERE ([email] = @email)">
        <SelectParameters>
            <asp:SessionParameter Name="email" SessionField="email" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
    </div>
    <div align="center">
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2">
            <series>
                <asp:Series ChartType="Pie" IsValueShownAsLabel="True" Legend="Legend1" 
                    Name="Series1" ToolTip="#TOTAL" XValueMember="type" YValueMembers="Column1">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
            <Legends>
                <asp:Legend Name="Legend1" Title="Type">
                </asp:Legend>
            </Legends>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT type, count(*) FROM txn WHERE (email = @email) GROUP BY type">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="email" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
    <div> <br /><br /><br /><br /><br /><br /><br /></div>
</asp:Content>