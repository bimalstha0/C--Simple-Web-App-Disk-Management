<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="ActorDVD.aspx.cs" Inherits="ApplicationDevelopmentCoursework.ActorDVD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .gridView{
            margin-left:auto;
            margin-right:auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dvdtitle" id="dvdtitle" style="text-align:center;">
        <h1>DVDs</h1><br /><br />
        <p>
            <asp:Label ID="actorLastName" runat="server" Text="Actor Last Name: "></asp:Label>
            <asp:DropDownList ID="ActorDropDown" runat="server" DataSourceID="SqlDataSource2" DataTextField="Actor_Lname" DataValueField="Actor_No">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="SELECT * FROM [Actor]"></asp:SqlDataSource>
            &nbsp;
            <asp:Button ID="BtnSearch" runat="server" Text="Search" usesubmitbehavior="false" OnClick="BtnSearch_Click"/>
        </p><br /><br />
    </div>
    <div class="gridview1" id="gridview1" style="text-align:center;">
        <h3>Title of DVD with Actor Last Name</h3>
        <p>
            &nbsp;
            <asp:GridView ID="DVDGrid" runat="server" AutoGenerateColumns="False" BorderColor="#8EA8DB" BorderStyle="Solid" DataKeyNames="DVD_No" DataSourceID="SqlDataSource1" ForeColor="Black" CssClass="gridView">
                <Columns>
                    <asp:BoundField DataField="DVD_No" HeaderText="DVD_No" InsertVisible="False" ReadOnly="True" SortExpression="DVD_No" />
                    <asp:BoundField DataField="DVD_Title" HeaderText="DVD_Title" SortExpression="DVD_Title" />
                </Columns>
                    <HeaderStyle BackColor="#8EA8DB" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="select DVD_No,DVD_Title from DVDTitle where DVD_No in (Select DVD_No from CastMember where Actor_No = @ActorDropDown);
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ActorDropDown" Name="ActorDropDown" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </div><br /><br />
    <div class="gridview2" id="gridview2" style="text-align:center;">
        <h3>Title and Number of Copies of DVD with Actor Last Name</h3>
        <p>
            <asp:GridView ID="CopyGrid" runat="server" AutoGenerateColumns="False" BorderColor="#8EA8DB" BorderStyle="Solid"  DataSourceID="SqlDataSource3" ForeColor="Black" CssClass="gridView">
                <Columns>
                    <asp:BoundField DataField="DVD_Title" HeaderText="DVD_Title" SortExpression="DVD_Title" />
                    <asp:BoundField DataField="Available_Copies" HeaderText="Available_Copies" ReadOnly="True" SortExpression="Available_Copies" />
                </Columns>
                <HeaderStyle BackColor="#8EA8DB" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="select  DVDTitle.DVD_Title,Count(cpy.dvd1) as Available_Copies  From (select DVD_No,Copy_No as dvd1 from DVDCopy where Copy_No  Not In (Select Copy_No from Loan where Date_Returned Is Null))cpy, DVDTitle  where DVDTitle.DVD_No=cpy.DVD_No and  DVDTitle.DVD_No in (Select DVD_No from CastMember where Actor_No = @ActorDropDown) group by DVDTitle.DVD_No,DVDTitle.DVD_Title ;
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ActorDropDown" Name="ActorDropDown" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </div>
</asp:Content>
