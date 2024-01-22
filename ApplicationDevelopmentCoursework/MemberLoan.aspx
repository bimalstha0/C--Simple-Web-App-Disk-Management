<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="MemberLoan.aspx.cs" Inherits="ApplicationDevelopmentCoursework.MemberLoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
           .gridView{
            margin-left:auto;
            margin-right:auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="loan" id="loan" style="text-align:center;">
        <h1>Member's Loan</h1><br /><br />
        <p>
            <asp:Label ID="memberName" runat="server" Text="Member Name: "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Member_LName" DataValueField="Member_No">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>
            &nbsp;
            <asp:Button ID="BtnSearch" runat="server" Text="Search" usesubmitbehavior="false"/>
        </p><br /><br />
    </div>
    <div class="gridview1" id="gridview1" style="text-align:center;">
        <h3><b>Member Loan in Last 31 Days</b></h3>
        <p>
            <asp:GridView ID="GridView2" runat="server" BorderColor="#8EA8DB" BorderStyle="Solid" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" ForeColor="Black" CssClass="gridView">
                <Columns>
                    <asp:BoundField DataField="Member_LName" HeaderText="Member_LName" SortExpression="Member_LName" />
                    <asp:BoundField DataField="DVD_Loaned" HeaderText="DVD_Loaned" ReadOnly="True" SortExpression="DVD_Loaned" />
                    <asp:BoundField DataField="Copy_No" HeaderText="Copy_No" ReadOnly="True" SortExpression="Copy_No" />
                </Columns>
                <HeaderStyle BackColor="#8EA8DB" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="select Member.Member_LName,STRING_AGG(dl,',') as DVD_Loaned,STRING_AGG(cc,',') as Copy_No from (select Loan.Member_No as mn, STRING_AGG(DVDCopy.Copy_No,',')  as cc from Loan,Member,DVDCopy where Loan.Member_No=Member.Member_No and   DVDCopy.Copy_No=Loan.Copy_No  group by Loan.Member_No )ccs,(select  Loan.Member_No as mn, STRING_AGG(DVDTitle.DVD_Title,',')  as dl from DVDTitle,Loan,Member,DVDCopy where Loan.Member_No=Member.Member_No and Member.Member_No= @MemberDropDown and DVDTitle.DVD_No=DVDCopy.DVD_No and DVDCopy.Copy_No=Loan.Copy_No  group by Loan.Member_No )dls,Member where dls.mn=Member.Member_No and ccs.mn=Member.Member_No group by Member.Member_LName;
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="MemberDropDown" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </div>
</asp:Content>
