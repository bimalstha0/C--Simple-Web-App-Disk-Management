<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="DVDList.aspx.cs" Inherits="ApplicationDevelopmentCoursework.DVDList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .gridView{
            margin-left:auto;
            margin-right:auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="gridview" id="gridview" style="text-align:center;">
        <h3><b>List of DVDs</b></h3>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderColor="#8EA8DB" BorderStyle="Solid" DataKeyNames="dvd1" DataSourceID="SqlDataSource1" ForeColor="Black" CssClass="gridView">
                <Columns>
                    <asp:BoundField DataField="dvd1" HeaderText="dvd1" InsertVisible="False" ReadOnly="True" SortExpression="dvd1" />
                    <asp:BoundField DataField="DVD_Title" HeaderText="DVD_Title" SortExpression="DVD_Title" />
                    <asp:BoundField DataField="Producer_Name" HeaderText="Producer_Name" SortExpression="Producer_Name" />
                    <asp:BoundField DataField="Studio_Name" HeaderText="Studio_Name" SortExpression="Studio_Name" />
                    <asp:BoundField DataField="Cast_Members" HeaderText="Cast_Members" ReadOnly="True" SortExpression="Cast_Members" />
                    <asp:BoundField DataField="Date_Released" HeaderText="Date_Released" SortExpression="Date_Released" />
                </Columns>
                <HeaderStyle BackColor="#8EA8DB" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="select DVDTitle.DVD_No as dvd1,DVDTitle.DVD_Title, Producer.Producer_Name, Studio.Studio_Name,STRING_AGG(cm,', ') as Cast_Members,DVDTitle.Date_Released from (select DVDTitle.DVD_No as dvd2, STRING_AGG(Actor.Actor_Lname,',') within group (order by Actor.Actor_Lname) as cm from DVDTitle,CastMember,Actor where Actor.Actor_No=CastMember.Actor_No and CastMember.DVD_No=DVDTitle.DVD_No  group by DVDTitle.DVD_No )cms, Producer,Studio,DVDTitle where cms.dvd2=DVDTitle.DVD_No and Producer.Producer_No=DVDTitle.Producer_No and Studio.Studio_No = DVDTitle.Studio_No group by DVDTitle.DVD_No,DVDTitle.DVD_Title, Producer.Producer_Name, Studio.Studio_Name,DVDTitle.Date_Released  order by DVDTitle.Date_Released Asc;
"></asp:SqlDataSource>
        </p>
    </div>
</asp:Content>
