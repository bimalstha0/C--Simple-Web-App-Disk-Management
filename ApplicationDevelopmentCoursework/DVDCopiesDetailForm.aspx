<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="DVDCopiesDetailForm.aspx.cs" Inherits="ApplicationDevelopmentCoursework.DVDCopiesDetailForm" %>
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
                <p style="text-align:center; font-size:25px;"><b>DVD Copies Details Form</b></p>
                <p>
                     <asp:Label ID="dvdcopyname" runat="server" Text="DVD :  "></asp:Label>
              &nbsp;
                     <asp:DropDownList ID="DVDDropDown" runat="server" DataSourceID="SqlDataSource2" DataTextField="DVD_Title" DataValueField="DVD_No">
                     </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="SELECT * FROM [DVDTitle]"></asp:SqlDataSource>
                     <br /><br />
                </p>
              <p>
                    <asp:Label ID="Label1" runat="server" Text="DVD Copy No:  "></asp:Label>
              <asp:TextBox ID="TxtCopyNo" runat="server"></asp:TextBox><br /><br />
                </p>
                <p>
                     
            
        
                <p style="text-align:center">
                    <asp:Button ID="BtnAdd" runat="server" Text="Add DVD Copies Detail"  usesubmitbehavior="false" BackColor="#93B4F4" Font-Size="Large" OnClick="BtnAdd_Click" />
            </p>
                <p style="text-align:center">
                    <asp:GridView ID="GridView1" runat="server"  BorderColor="#8EA8DB" BorderStyle="Solid" AutoGenerateColumns="False" DataKeyNames="Copy_No" DataSourceID="SqlDataSource1" ForeColor="Black" CssClass="gridView">
                        <Columns>
                            <asp:BoundField DataField="Copy_No" HeaderText="Copy_No" ReadOnly="True" SortExpression="Copy_No" />
                            <asp:BoundField DataField="DVD_Title" HeaderText="DVD_Title" SortExpression="DVD_Title" />
                            <asp:BoundField DataField="Date_Purchased" HeaderText="Date_Purchased" SortExpression="Date_Purchased" />
                        </Columns>
                 <HeaderStyle BackColor="#8EA8DB" Font-Bold="True" ForeColor="White" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="select DVDCopy.Copy_No,DVDTitle.DVD_Title,DVDCopy.Date_Purchased from DVDCopy,DVDTitle where DVDCopy.DVD_No=DVDTitle.DVD_No "></asp:SqlDataSource>

      
                       </p>

    </div>
</asp:Content>
