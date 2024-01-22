<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="ReturnOfDVDCopy.aspx.cs" Inherits="ApplicationDevelopmentCoursework.ReturnOfDVDCopy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .gridView {
            margin-left:auto;
            margin-right:auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="gridview" id="gridview" style="text-align:center;">
        <h3><b>Return of DVD Copy</b></h3>
        <br />
            <asp:Label ID="MemberNo" runat="server" Text="Member Number:  "></asp:Label>
            &nbsp;&nbsp;
            <asp:DropDownList ID="MemberDropDown" runat="server" DataSourceID="SqlDataSource1" DataTextField="Member_LName" DataValueField="Member_No" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click1" />
            <br />
        <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  BorderColor="#8EA8DB" BorderStyle="Solid" DataKeyNames="Loan_No" DataSourceID="SqlDataSource2" ForeColor="Black" CssClass="gridView">
                <Columns>
                    <asp:BoundField DataField="Loan_No" HeaderText="Loan_No" ReadOnly="True" SortExpression="Loan_No" />
                    <asp:BoundField DataField="DVD_Title" HeaderText="DVD_Title" SortExpression="DVD_Title" />
                    <asp:BoundField DataField="Copy_No" HeaderText="Copy_No" SortExpression="Copy_No" />
                    <asp:BoundField DataField="Date_Due" HeaderText="Date_Due" SortExpression="Date_Due" />
                </Columns>
                <HeaderStyle BackColor="#8EA8DB" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="select Loan.Loan_No,DVDTitle.DVD_Title,Loan.Copy_No, Loan.Date_Due from Loan,DVDCopy,DVDTitle where Member_No= @MemberDropDown and DVDCopy.Copy_No=Loan.Copy_No and DVDCopy.DVD_No=DVDTitle.DVD_No and Date_Returned Is NULL;">
            <SelectParameters>
                <asp:ControlParameter ControlID="MemberDropDown" Name="MemberDropDown" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p>
            <asp:Label ID="copyNumber" runat="server" Text="Loan Number:  "></asp:Label>
            &nbsp;&nbsp;
            <asp:DropDownList ID="LoanDropDown" runat="server" DataSourceID="SqlDataSource3" DataTextField="Loan_No" DataValueField="Loan_No">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="select * from Loan where Date_Returned Is Null and Member_No=@MemberDropDown">
                <SelectParameters>
                    <asp:ControlParameter ControlID="MemberDropDown" Name="MemberDropDown" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ChargeBtn" runat="server"  Text="Check Charges" OnClick="ChargeBtn_Click1" />
        </p>
        <p>
            <asp:Label ID="lblpen" runat="server" ForeColor="Red" Text="The penalty charge for the loan is Rs. " Visible="False"></asp:Label>
            <asp:Label ID="penalty" runat="server" ForeColor="Red" Text="00.00" Visible="False"></asp:Label>
        </p>
        <p>
            <asp:Button ID="ConfirmReturnBtn" runat="server" Text="Confirm Return" OnClick="ConfirmReturnBtn_Click" />
        </p>
        <p>
            <asp:Label ID="success" runat="server" ForeColor="Green" Text="Return Successful." Visible="False"></asp:Label>
        </p>
    </div>
</asp:Content>
