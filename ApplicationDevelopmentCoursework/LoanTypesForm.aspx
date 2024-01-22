<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="LoanTypesForm.aspx.cs" Inherits="ApplicationDevelopmentCoursework.LoanTypesForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="dvd" id="dvd" style="border-style:solid; padding:30px; margin-left: 300px; margin-right: 300px; margin-top:30px; margin-bottom:30px;">
                <p style="text-align:center; font-size:25px;"><b>Loan Types Form</b></p>
                <p>
                     <asp:Label ID="loanname" runat="server" Text="Loan Name:  "></asp:Label>
                    <asp:TextBox ID="TxtLoanName" runat="server"></asp:TextBox><br /><br />
                </p>
                <p>
                     <asp:Label ID="duration" runat="server" Text="Duration:  "></asp:Label>
                    <asp:TextBox ID="TxtDuration" runat="server"></asp:TextBox><br /><br />
                </p>
                
        
                <p style="text-align:center">
                    <asp:Button ID="BtnAddLoanType" runat="server" Text="Add Loan Type"  usesubmitbehavior="false" BackColor="#93B4F4" Font-Size="Large" OnClick="BtnAddLoanType_Click" />
            </p>

    </div>
</asp:Content>
