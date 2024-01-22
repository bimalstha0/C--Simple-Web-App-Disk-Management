<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="ApplicationDevelopmentCoursework.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <style>
           .gridView{
            margin-left:auto;
            margin-right:auto;
            margin-bottom:50px;
        }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <h1 style="text-align:center;">My Profile</h1>
         <p style="padding-left:40px; font-size:25px;">Username:&nbsp;&nbsp;   
             <asp:Label ID="LabelUsername" runat="server" Text="Label"></asp:Label>
         </p>
         <p style="padding-left:40px;  font-size:25px;">UserType:&nbsp;&nbsp;   
             <asp:Label ID="LabelUserType" runat="server" Text="Label"></asp:Label>
         </p>
                <p style=" border-style:solid; padding:30px; margin-left: 40px; margin-right: 40px;" __designer:mapid="481">
                    <asp:Label runat="server" Text="Change Password" Font-Bold="True" Font-Size="15pt" ID="Label1"></asp:Label><br __designer:mapid="483" />
                    <asp:Label runat="server" Text="Old Password:" ID="Label2"></asp:Label><br __designer:mapid="485" />
                    <asp:TextBox runat="server" ID="pwTxtBox"></asp:TextBox>&nbsp;
                    <asp:Label ID="pw" runat="server" Text="Incorrect Old Passsword" ForeColor="Red" Visible="False"></asp:Label><br __designer:mapid="487" /><br __designer:mapid="488" />
                    <asp:Label runat="server" Text="New Password:" ID="Label3"></asp:Label><br __designer:mapid="48a" />
                    <asp:TextBox runat="server" ID="newPwTxtBox"></asp:TextBox><br __designer:mapid="48c" /><br __designer:mapid="48d" />
                    <asp:Label runat="server" Text="Retype New Password:" ID="Label4"></asp:Label><br __designer:mapid="48f" />
                    <asp:TextBox runat="server" ID="confirmPwTxtBox"></asp:TextBox>&nbsp;&nbsp;
                    <asp:Label ID="match" runat="server" Text="New Passwords Doesnt Match" ForeColor="Red" Visible="False"></asp:Label><br __designer:mapid="491" />
                    <br __designer:mapid="492" />
                    <br />
                    <asp:Button runat="server" Text="Change Password" ID="ChangePwBtn" OnClick="ChangePwBtn_Click" /><br />
                    <asp:Label ID="success" runat="server" Text="Password Changed Successfully." ForeColor="Green" Visible="False"></asp:Label>
                </p>
            <br />

        <asp:Panel ID="AdminPanel" runat="server" Visible="false">
            <h1 style="text-align:center; text-decoration:bold;">Users</h1>
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="User_No" DataSourceID="SqlDataSource1" BorderColor="#8EA8DB" BorderStyle="Solid" ForeColor="Black" CssClass="gridView" >
                 <Columns>
                     <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                     <asp:BoundField DataField="User_No" HeaderText="User_No" InsertVisible="False" ReadOnly="True" SortExpression="User_No" />
                     <asp:BoundField DataField="User_Name" HeaderText="User_Name" SortExpression="User_Name" />
                     <asp:BoundField DataField="User_Type" HeaderText="User_Type" SortExpression="User_Type" />
                     <asp:BoundField DataField="User_Pw" HeaderText="User_Pw" SortExpression="User_Pw" />
                 </Columns>
                  <HeaderStyle BackColor="#8EA8DB" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [User_No] = @User_No" InsertCommand="INSERT INTO [Users] ([User_Name], [User_Type], [User_Pw]) VALUES (@User_Name, @User_Type, @User_Pw)" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [User_Name] = @User_Name, [User_Type] = @User_Type, [User_Pw] = @User_Pw WHERE [User_No] = @User_No">
                <DeleteParameters>
                    <asp:Parameter Name="User_No" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="User_Name" Type="String" />
                    <asp:Parameter Name="User_Type" Type="String" />
                    <asp:Parameter Name="User_Pw" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="User_Name" Type="String" />
                    <asp:Parameter Name="User_Type" Type="String" />
                    <asp:Parameter Name="User_Pw" Type="String" />
                    <asp:Parameter Name="User_No" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>

        <asp:Panel ID="StaffPanel" runat="server" Visible="false">
            <div id="password">
            </div>
        </asp:Panel>
</asp:Content>
