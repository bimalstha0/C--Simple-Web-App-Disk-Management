<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="MemberDetail.aspx.cs" Inherits="ApplicationDevelopmentCoursework.MemberDetail" %>
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
        <h3><b>Member Details</b></h3>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Member_No" BorderColor="#8EA8DB" BorderStyle="Solid" DataSourceID="SqlDataSource1" ForeColor="Black" CssClass="gridView" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Member_No" HeaderText="Member_No" InsertVisible="False" ReadOnly="True" SortExpression="Member_No" />
                    <asp:BoundField DataField="Member_Name" HeaderText="Member_Name" ReadOnly="True" SortExpression="Member_Name" />
                    <asp:BoundField DataField="Member_Address" HeaderText="Member_Address" SortExpression="Member_Address" />
                    <asp:BoundField DataField="Member_DOB" HeaderText="Member_DOB" SortExpression="Member_DOB" />
                    <asp:BoundField DataField="MemberCategory" HeaderText="MemberCategory" SortExpression="MemberCategory" />
                    <asp:BoundField DataField="Alowed_Loans" HeaderText="Alowed_Loans" SortExpression="Alowed_Loans" />
                    <asp:BoundField DataField="TotalLoans" HeaderText="TotalLoans" ReadOnly="True" SortExpression="TotalLoans" />
                </Columns>
                <HeaderStyle BackColor="#8EA8DB" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="select Member.Member_No,Member.Member_FName+' ' +Member.Member_LName as 
Member_Name,Member.Member_Address,Member.Member_DOB,MemberShipCategory.MemberShipCategoryDesc as MemberCategory,MemberShipCategory.MemberShipCategoryTotalLoans as Alowed_Loans, lc.TC as TotalLoans from (select Member_No,count(*)as TC from Loan group by Member_No)lc,Member,MemberShipCategory where Member.Membership_Category_No=MemberShipCategory.MemberShipCategoryNo and lc.Member_No=Member.Member_No;
"></asp:SqlDataSource>
        </p>
    </div>
</asp:Content>
