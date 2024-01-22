<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="ProducerDetailForm.aspx.cs" Inherits="ApplicationDevelopmentCoursework.ProducerDetailForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
           .gridView{
            margin-left:auto;
            margin-right:auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="producer" id="producer" style="border-style:solid; padding:30px; margin-left: 300px; margin-right: 300px; margin-top:30px; margin-bottom:30px;">
                <p style="text-align:center; font-size:25px;"><b>Producer Detail Form</b></p>
                <p>
                    <asp:Label ID="name" runat="server" Text="Producer Name: "></asp:Label>
                    <asp:TextBox ID="TxtProducerName" runat="server"></asp:TextBox>
                &nbsp;</p>
         <p style="text-align:center">
         <asp:Button ID="BtnAdd" runat="server" Text="Add" BackColor="#93B4F4" Font-Size="Large" OnClick="BtnAdd_Click" />
         </p>
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderColor="#8EA8DB" BorderStyle="Solid" DataKeyNames="Producer_No" DataSourceID="SqlDataSource1" ForeColor="Black" CssClass="gridView">
             <Columns>
                 <asp:BoundField DataField="Producer_No" HeaderText="Producer_No" InsertVisible="False" ReadOnly="True" SortExpression="Producer_No" />
                 <asp:BoundField DataField="Producer_Name" HeaderText="Producer_Name" SortExpression="Producer_Name" />
             </Columns>
             <HeaderStyle BackColor="#8EA8DB" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="SELECT * FROM [Producer]"></asp:SqlDataSource>
    </div>
</asp:Content>
