<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="DVDCopiesOnLoan.aspx.cs" Inherits="ApplicationDevelopmentCoursework.DVDCopiesOnLoan" %>
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
        <h3><b>DVD Copies Currently On Loan</b></h3>
        <p>
            <asp:GridView ID="GridView1" runat="server" BorderColor="#8EA8DB" BorderStyle="Solid" AutoGenerateColumns="False" DataKeyNames="Copy_No" DataSourceID="SqlDataSource1" ForeColor="Black" CssClass="gridView">
                <Columns>
                    <asp:BoundField DataField="Copy_No" HeaderText="Copy_No" InsertVisible="False" ReadOnly="True" SortExpression="Copy_No" />
                    <asp:BoundField DataField="DVD_Title" HeaderText="DVD_Title" SortExpression="DVD_Title" />
                    <asp:BoundField DataField="Member_FName" HeaderText="Member_FName" SortExpression="Member_FName" />
                    <asp:BoundField DataField="Date_Out" HeaderText="Date_Out" SortExpression="Date_Out" />
                    <asp:BoundField DataField="Total_Loans" HeaderText="Total_Loans" ReadOnly="True" SortExpression="Total_Loans" />
                </Columns>
                <HeaderStyle BackColor="#8EA8DB" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="select DVDCopy.Copy_No, DVDTitle.DVD_Title, Member.Member_FName, Loan.Date_Out,Count(Loan.Loan_No) as Total_Loans from (select Member_No,Loan_No as dvd1 from Loan )cpy, DVDCopy,DVDTitle,Loan,Member where cpy.Member_No=Member.Member_No and Loan.Member_No=Member.Member_No and DVDCopy.DVD_No=DVDTitle.DVD_No and DVDCopy.Copy_No=Loan.Copy_No and Date_Returned Is Null group by Loan.Member_No,DVDCopy.Copy_No, DVDTitle.DVD_Title, Member.Member_FName, Loan.Date_Out order by Loan.Date_Out Desc,DVDTitle.DVD_Title;
"></asp:SqlDataSource>
        </p>
    </div>
</asp:Content>
