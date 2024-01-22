<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="ApplicationDevelopmentCoursework.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dvd" id="dvd" style="border-style:solid; padding:30px; margin-left: 300px; margin-right: 300px; margin-top:30px; margin-bottom:30px;">
                <p style="text-align:center; font-size:25px;"><b>User Form</b></p>
                <p>
                    <asp:Label ID="email" runat="server" Text="User_Name"></asp:Label>
              <asp:TextBox ID="TxtEmail" runat="server"></asp:TextBox><br /><br />
          </p>
                <p>
                   <asp:Label ID="password" runat="server" Text="Password:  "></asp:Label>
              <asp:TextBox ID="TxtPassword" runat="server"></asp:TextBox><br /><br />
          </p>
                <p>
                   <asp:Label ID="usertype" runat="server" Text="User Type:  "></asp:Label>
              <asp:DropDownList ID="DropDownListUserType" runat="server">
                  <asp:ListItem>Assistant</asp:ListItem>
                  <asp:ListItem>Manager</asp:ListItem>
                    </asp:DropDownList><br /><br />
          </p>
                
        
                <p style="text-align:center">
                    <asp:Button ID="BtnAddUser" runat="server" Text="Add User"  usesubmitbehavior="false" BackColor="#93B4F4" Font-Size="Large" OnClick="BtnAddUser_Click" />
            </p>

    </div>
</asp:Content>
