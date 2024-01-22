<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="OldDvds.aspx.cs" Inherits="ApplicationDevelopmentCoursework.OldDvds" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .gridView{
            margin-left:auto;
            margin-right:auto;
        }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="gridview" id="gridview" style="text-align:center;">
        <h3><b>Year Old DVD Copies</b></h3>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderColor="#8EA8DB" BorderStyle="Solid" DataKeyNames="Copy_No" DataSourceID="SqlDataSource1" ForeColor="Black" CssClass="gridView">
                <Columns>
                    <asp:BoundField DataField="Copy_No" HeaderText="Copy_No" InsertVisible="False" ReadOnly="True" SortExpression="Copy_No" />
                    <asp:BoundField DataField="DVD_Title" HeaderText="DVD_Title" SortExpression="DVD_Title" />
                    <asp:BoundField DataField="Days_After_Purchase" HeaderText="Days_After_Purchase" ReadOnly="True" SortExpression="Days_After_Purchase" />
                </Columns>
                <HeaderStyle BackColor="#8EA8DB" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="select DVDCopy.Copy_No, DVDTitle.DVD_Title,DATEDIFF(dd,DVDCopy.Date_Purchased,GETDATE()) as Days_After_Purchase from DVDCopy,DVDTitle where DVDTitle.DVD_No=DVDCopy.DVD_No and DATEDIFF(dd,DVDCopy.Date_Purchased,GETDATE())&gt;365 and DVDCopy.Copy_No Not in (select Copy_No from Loan where Loan.Date_Returned Is Null) ;
"></asp:SqlDataSource>
        </p>
        <p>
            <asp:Button ID="BtnDelete" runat="server" Text="Delete All" BackColor="Red" OnClick="BtnDelete_Click" />
        </p>
    </div>
</asp:Content>
