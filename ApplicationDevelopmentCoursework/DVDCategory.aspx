<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="DVDCategory.aspx.cs" Inherits="ApplicationDevelopmentCoursework.DVDCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <style>
        .gridView{
            margin-left:auto;
            margin-right:auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="category" id="category" style="border-style:solid; padding:30px; margin-left: 300px; margin-right: 300px; margin-top:30px; margin-bottom:30px;">
                <p style="text-align:center; font-size:25px;"><b>DVD Category Details Form</b></p>
                <p>
                    <asp:Label ID="name" runat="server" Text="Category Name: "></asp:Label>
                    <asp:TextBox ID="TxtCategoryName" runat="server"></asp:TextBox><br /><br />
                    <asp:CheckBox ID="agerestriction" runat="server" Text="Age Restriction" /><br />
                &nbsp;</p>
         <p style="text-align:center">
         <asp:Button ID="BtnAdd" runat="server" Text="Add" BackColor="#93B4F4" Font-Size="Large" OnClick="BtnAdd_Click" />
         </p>
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderColor="#8EA8DB" BorderStyle="Solid" DataKeyNames="Category_No" DataSourceID="SqlDataSource1" ForeColor="Black" CssClass="gridView">
             <Columns>
                 <asp:BoundField DataField="Category_No" HeaderText="Category_No" InsertVisible="False" ReadOnly="True" SortExpression="Category_No" />
                 <asp:BoundField DataField="Category_Desc" HeaderText="Category_Desc" SortExpression="Category_Desc" />
                 <asp:CheckBoxField DataField="Age_Restricted" HeaderText="Age_Restricted" SortExpression="Age_Restricted" />
             </Columns>
              <HeaderStyle BackColor="#8EA8DB" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="SELECT * FROM [DVDCategory]"></asp:SqlDataSource>
    </div>
</asp:Content>
