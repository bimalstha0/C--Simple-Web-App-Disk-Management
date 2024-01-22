<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="ApplicationDevelopmentCoursework.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="login.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
         <section class="vh-100">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="login.png" class="img-fluid" alt="Sample image">
                    </div>
                <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">

                   <h1>Login</h1><br />

                  <!-- Email input -->
                  <div class="form-outline mb-4">
                      <asp:Label ID="email" runat="server" Text="Username"></asp:Label>
                      <br />
                      <asp:TextBox ID="TxtUserName" runat="server"></asp:TextBox><br /><br />
                  </div>

                  <!-- Password input -->
                  <div class="form-outline mb-3">
                      <asp:Label ID="password" runat="server" Text="Password"></asp:Label><br />
                      <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password"></asp:TextBox><br /><br />
                  </div>

                    <asp:Label ID="error" runat="server" ForeColor="Red" Text="Invalid Credentials" Visible="False"></asp:Label>
                    <br />

                    <asp:Button ID="BtnLogin" runat="server" Text="Login" usesubmitbehavior="false" OnClick="BtnLogin_Click" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
                </div>
               </div>
             </div>
        </section>
    </body>  
</asp:Content>
