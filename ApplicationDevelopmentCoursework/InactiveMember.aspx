<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="InactiveMember.aspx.cs" Inherits="ApplicationDevelopmentCoursework.InactiveMember" %>
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
        <h3><b>Member Who Have Not Borrowed Any DVD in Last 31 Days</b></h3>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Member_No" BorderColor="#8EA8DB" BorderStyle="Solid"  DataSourceID="SqlDataSource1" ForeColor="Black" CssClass="gridView">
                <Columns>
                    <asp:BoundField DataField="Member_No" HeaderText="Member_No" InsertVisible="False" ReadOnly="True" SortExpression="Member_No" />
                    <asp:BoundField DataField="Member_FName" HeaderText="Member_FName" SortExpression="Member_FName" />
                    <asp:BoundField DataField="Member_LName" HeaderText="Member_LName" SortExpression="Member_LName" />
                    <asp:BoundField DataField="Member_Address" HeaderText="Member_Address" SortExpression="Member_Address" />
                    <asp:BoundField DataField="Date_Out" HeaderText="Date_Out" SortExpression="Date_Out" />
                    <asp:BoundField DataField="Days_After_Last_Loan" HeaderText="Days_After_Last_Loan" ReadOnly="True" SortExpression="Days_After_Last_Loan" />
                </Columns>
                 <HeaderStyle BackColor="#8EA8DB" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="select distinct Member.Member_No, Member.Member_FName,Member.Member_LName,Member.Member_Address,Loan.Date_Out,DATEDIFF(dd,Loan.Date_Out,GETDATE()) Days_After_Last_Loan from Member,Loan where Member.Member_No=Loan.Member_No and Date_Returned Is Not Null and Member.Member_No Not In(select distinct Member.Member_No from Loan,Member where Member.Member_No=Loan.Member_No and Date_Out&gt;DATEADD(dd,-31,GETDATE()) );
"></asp:SqlDataSource>
        </p>
    </div>
</asp:Content>
