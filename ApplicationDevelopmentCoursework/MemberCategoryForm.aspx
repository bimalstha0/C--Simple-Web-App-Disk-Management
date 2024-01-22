<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="MemberCategoryForm.aspx.cs" Inherits="ApplicationDevelopmentCoursework.MemberCategoryForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="dvd" id="dvd" style="border-style:solid; padding:30px; margin-left: 300px; margin-right: 300px; margin-top:30px; margin-bottom:30px;">
                <p style="text-align:center; font-size:25px;"><b>Member Category Form</b></p>
                <p>
                    <asp:Label ID="id" runat="server" Text="Member ID:  "></asp:Label>
              <asp:TextBox ID="TxtMemberId" runat="server"></asp:TextBox><br /></br>
          </p>
                <p>
                   <asp:Label ID="membertype" runat="server" Text="Member Type:  "></asp:Label>
              <asp:TextBox ID="TxtMemberType" runat="server"></asp:TextBox><br /><br />
          </p>
                <p>
                   <asp:Label ID="totalloan" runat="server" Text="Total Loan:  "></asp:Label>
              <asp:TextBox ID="TxtTotalLoan" runat="server"></asp:TextBox><br /><br />
           </p>
                
        
                <p style="text-align:center">
                    <asp:Button ID="BtnAddMemberCategory" runat="server" Text="Add Member Category"  usesubmitbehavior="false" BackColor="#93B4F4" Font-Size="Large" />
            </p>

    </div>
</asp:Content>
