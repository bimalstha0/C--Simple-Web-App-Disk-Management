<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="DVDCopyLastLoan.aspx.cs" Inherits="ApplicationDevelopmentCoursework.DVDCopyLastLoan" %>
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
        <h3><b>DVD Copy's Last Loan</b></h3>
        <p>
            <asp:Label ID="copyNumber" runat="server" Text="Copy Number:  "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Copy_No" DataValueField="Copy_No" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="SELECT [Copy_No] FROM [DVDCopy]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:GridView ID="GridView1" runat="server" BorderColor="#8EA8DB" BorderStyle="Solid"  DataSourceID="SqlDataSource2" AutoGenerateColumns="False" ForeColor="Black" CssClass="gridView">
                <Columns>
                    <asp:BoundField DataField="DVD_Title" HeaderText="DVD_Title" SortExpression="DVD_Title" />
                    <asp:BoundField DataField="Member_Name" HeaderText="Member_Name" ReadOnly="True" SortExpression="Member_Name" />
                    <asp:BoundField DataField="Date_Out" HeaderText="Date_Out" SortExpression="Date_Out" />
                    <asp:BoundField DataField="Date_Due" HeaderText="Date_Due" SortExpression="Date_Due" />
                    <asp:BoundField DataField="Date_Returned" HeaderText="Date_Returned" SortExpression="Date_Returned" />
                </Columns>
                 <HeaderStyle BackColor="#8EA8DB" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="select DVDTitle.DVD_Title, Member.Member_FName+' ' + Member.Member_LName as Member_Name , Loan.Date_Out,Loan.Date_Due,Loan.Date_Returned from Member,Loan,DVDCopy, DVDTitle where Loan.Member_No=Member.Member_No and DVDTitle.DVD_No=DVDCopy.DVD_No and DVDCopy.Copy_No=Loan.Copy_No and DVDCopy.Copy_No=@CopyDropDown  and Date_Out = (select max(Date_Out) from Loan Where Copy_No = @CopyDropDown );">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="CopyDropDown" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </div>
</asp:Content>
