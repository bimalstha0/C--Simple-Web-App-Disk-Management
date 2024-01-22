<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="LoanForm.aspx.cs" Inherits="ApplicationDevelopmentCoursework.LoanForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="dvd" id="dvd" style="border-style:solid; padding:30px; margin-left: 300px; margin-right: 300px; margin-top:30px; margin-bottom:30px;">
                <p style="text-align:center; font-size:25px;"><b>Loan Form</b></p>
                <p>
                       <asp:Label ID="member" runat="server" Text="Member: "></asp:Label>
                        <asp:DropDownList ID="MemberDropDown" runat="server" DataSourceID="SqlDataSource1" DataTextField="MemberName" DataValueField="Member_No">
                        </asp:DropDownList> 
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="SELECT  Member_FName+' ' +Member_LName as MemberName, Member_No FROM [Member]"></asp:SqlDataSource>
                </p>
                <p>
                     <asp:Label ID="Label1" runat="server" Text="DVD: "></asp:Label>
                    <asp:DropDownList ID="DVDDropDown" runat="server" DataSourceID="SqlDataSource2" DataTextField="DVD_Title" DataValueField="DVD_No" AutoPostBack="True">
                    </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="SELECT * FROM [DVDTitle]"></asp:SqlDataSource>
                </p>
                <p>
                    <asp:Label ID="dvdcopy" runat="server" Text="DVD Copy: "></asp:Label>
                    <asp:DropDownList ID="CopyDropDown" runat="server" DataSourceID="SqlDataSource3" DataTextField="Copy_No" DataValueField="Copy_No">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="select * from DVDCopy where Copy_No Not In (select Copy_no from Loan where Date_Returned Is Null) and DVD_No = @DVDDropDown
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DVDDropDown" Name="DVDDropDown" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </p>
                <p>
                    <asp:Label ID="loantype" runat="server" Text="Loan Type: "></asp:Label>
                    <asp:DropDownList ID="LoanTypeDropDown" runat="server" DataSourceID="SqlDataSource4" DataTextField="Loan_Type" DataValueField="Loan_Type_No">
                    </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="chargeBtn" runat="server" Text="Find Charge"  usesubmitbehavior="false" BackColor="#93B4F4" Font-Size="Large" OnClick="chargeBtn_Click"  />
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="SELECT * FROM [LoanType]"></asp:SqlDataSource>
&nbsp;</p>
                <p>
                    <asp:Label ID="Labelcharge" runat="server" Text="The Total Charge For the Loan Will Be Rs. " Visible="False"></asp:Label>
                    <asp:Label ID="chargeLbl" runat="server" Text="00.00" Visible="False"></asp:Label>
                </p>
                
        
                <p style="text-align:center">
                    <asp:Button ID="BtnAddLoanForm" runat="server" Text="Loan Copy"  usesubmitbehavior="false" BackColor="#93B4F4" Font-Size="Large" OnClick="BtnAddLoanForm_Click" />
            <br />
                    <asp:Label ID="Success" runat="server" Text="Loan Succesful." Visible="False" ForeColor="Green"></asp:Label><br />
                     <asp:Label ID="AgeError" runat="server" Text="User Needs To be Over 18 to Loan this Copy." ForeColor="Red" Visible="False"></asp:Label><br />
                     <asp:Label ID="LoanCountError" runat="server" Text="Already Loaned The Maximum Number of Copies." Visible="False" ForeColor="Red"></asp:Label><br />
            </p>

    </div>
</asp:Content>
