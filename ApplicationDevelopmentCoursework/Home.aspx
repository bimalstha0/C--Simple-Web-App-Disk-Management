<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="ApplicationDevelopmentCoursework.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!DOCTYPE html>

<html>
    <head>
        <title></title>
        <style>
            .container {
  position: relative;
  text-align: center;
  color: white;
}
            /* Centered text */
.centered {
  position: absolute;
  top: 50%;
  left: 50%;
  font-size:50px;
  transform: translate(-50%, -50%);
}
        </style>
    </head>
    <body>
        <div class="container">
           <img src="homeimages.jpg"
                  class="img-fluid" alt="Home Page image" style="height:450px; width:100%; margin-top:50px; margin-bottom:50px;">
          <div class="centered">Welcome to Ropey DVDs</div>
        </div>
    </body>
</html>
</asp:Content>
