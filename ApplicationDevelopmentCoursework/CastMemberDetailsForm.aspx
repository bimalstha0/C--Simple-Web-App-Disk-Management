<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="CastMemberDetailsForm.aspx.cs" Inherits="ApplicationDevelopmentCoursework.CastMemberDetailsForm" %>
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
                <p style="text-align:center; font-size:25px;"><b>Cast Member Details Form</b></p>
                <p>
                    <asp:Label ID="dvdname" runat="server" Text="DVD Name:  "></asp:Label>
              <asp:DropDownList ID="DropDownDVDName" runat="server" DataSourceID="SqlDataSource1" DataTextField="DVD_Title" DataValueField="DVD_No"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="SELECT * FROM [DVDTitle]"></asp:SqlDataSource>
                    <br /></br>
          </p>
                <p>
                   <asp:Label ID="actorname" runat="server" Text="Actor Name:  "></asp:Label>
              <asp:DropDownList ID="DropDownListActorName" runat="server" DataSourceID="SqlDataSource2" DataTextField="Actor_Name" DataValueField="Actor_No"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="select Actor_FName+' ' + Actor_LName as Actor_Name, Actor_No from Actor"></asp:SqlDataSource>
                    <br /></br>
          </p>
                
        
                <p style="text-align:center">
                    <asp:Button ID="BtnAddCastMember" runat="server" Text="Add Cast Member"  usesubmitbehavior="false" BackColor="#93B4F4" Font-Size="Large" OnClick="BtnAddCastMember_Click" />
            </p>
                <asp:GridView ID="GridView1" runat="server" BorderColor="#8EA8DB" BorderStyle="Solid" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" ForeColor="Black" CssClass="gridView">
                    <Columns>
                        <asp:BoundField DataField="DVD_Title" HeaderText="DVD_Title" SortExpression="DVD_Title" />
                        <asp:BoundField DataField="Actor_Name" HeaderText="Actor_Name" ReadOnly="True" SortExpression="Actor_Name" />
                    </Columns>
                    <HeaderStyle BackColor="#8EA8DB" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="select DVDTitle.DVD_Title,Actor_FName+' '+Actor_LName as Actor_Name from DVDTitle,CastMember,Actor where CastMember.DVD_No = DVDTitle.DVD_No and CastMember.Actor_No = Actor.Actor_No"></asp:SqlDataSource>

    </div>
</asp:Content>
