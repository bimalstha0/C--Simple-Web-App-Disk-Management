<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="ActorDetailsForm.aspx.cs" Inherits="ApplicationDevelopmentCoursework.ActorDetailsForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
        .gridView{
            margin-left:auto;
            margin-right:auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="dvd" id="dvd" style="border-style:solid; padding:30px; margin-left: 300px; margin-right: 300px; margin-top:30px; margin-bottom:30px;">
                <p style="text-align:center; font-size:25px;"><b>Actor Details Form</b></p>
                <p>
                    <asp:Label ID="firstname" runat="server" Text="Actor First Name:  "></asp:Label>
                    <asp:TextBox ID="TxtFirstName" runat="server"></asp:TextBox><br /><br />
                </p>
                <p>
                    <asp:Label ID="lastname" runat="server" Text="Actor Last Name:  "></asp:Label>
                    <asp:TextBox ID="TxtLastName" runat="server"></asp:TextBox><br /><br />
                </p>
                
        
                <p style="text-align:center">
                    <asp:Button ID="BtnAddActor" runat="server" Text="Add Actor"  usesubmitbehavior="false" BackColor="#93B4F4" Font-Size="Large" OnClick="BtnAddActor_Click" />
            </p>
                <p style="text-align:center">
                    <asp:GridView ID="GridView1" runat="server"   BorderColor="#8EA8DB" BorderStyle="Solid" AutoGenerateColumns="False" DataKeyNames="Actor_No" DataSourceID="SqlDataSource1" ForeColor="Black" CssClass="gridView">
                        <Columns>
                            <asp:BoundField DataField="Actor_No" HeaderText="Actor_No" InsertVisible="False" ReadOnly="True" SortExpression="Actor_No" />
                            <asp:BoundField DataField="Actor_Lname" HeaderText="Actor_Lname" SortExpression="Actor_Lname" />
                            <asp:BoundField DataField="Actor_Fname" HeaderText="Actor_Fname" SortExpression="Actor_Fname" />
                        </Columns>
                        <HeaderStyle BackColor="#8EA8DB" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="SELECT * FROM [Actor]"></asp:SqlDataSource>
            </p>

    </div>
</asp:Content>
