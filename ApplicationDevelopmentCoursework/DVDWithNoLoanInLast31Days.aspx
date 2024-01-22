<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="DVDWithNoLoanInLast31Days.aspx.cs" Inherits="ApplicationDevelopmentCoursework.DVDWithNoLoanInLast31Days" %>
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
        <h3><b>DVDs With No Loan in Last 31 Days</b></h3>
        <p>
            <asp:GridView ID="GridView1" runat="server"  BorderColor="#8EA8DB" BorderStyle="Solid" AutoGenerateColumns="False" DataKeyNames="DVD_No" DataSourceID="SqlDataSource1" ForeColor="Black" CssClass="gridView">
                <Columns>
                    <asp:BoundField DataField="DVD_No" HeaderText="DVD_No" InsertVisible="False" ReadOnly="True" SortExpression="DVD_No" />
                    <asp:BoundField DataField="DVD_Title" HeaderText="DVD_Title" SortExpression="DVD_Title" />
                </Columns>
                <HeaderStyle BackColor="#8EA8DB" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="select distinct DVDTitle.DVD_No,DVDTitle.DVD_Title from DVDTitle,DVDCopy where DVDCopy.DVD_No=DVDTitle.DVD_No and DVDCopy.DVD_No Not In(select distinct DVDTitle.DVD_No from Loan,DVDCopy,DVDTitle where DVDCopy.DVD_No=DVDTitle.DVD_No and DVDCopy.Copy_No = Loan.Copy_No  and Date_Out&gt;DateAdd(dd,-31,GETDATE()) );"></asp:SqlDataSource>
        </p>
    </div>
</asp:Content>
