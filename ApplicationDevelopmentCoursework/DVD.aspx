<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="DVD.aspx.cs" Inherits="ApplicationDevelopmentCoursework.DVD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dvd" id="dvd" style="border-style:solid; padding:30px; margin-left: 300px; margin-right: 300px; margin-top:30px; margin-bottom:30px;">
                <p style="text-align:center; font-size:25px;"><b>Add new DVD Title to System</b></p>
                
                <p>
                    <asp:Label ID="category" runat="server" Text="Category: "></asp:Label>
                    <asp:DropDownList ID="DropDownCategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="Category_Desc" DataValueField="Category_No">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="SELECT * FROM [DVDCategory]"></asp:SqlDataSource>
            &nbsp;&nbsp;
                    <asp:Button ID="BtnAddCategory" runat="server" Text="Add Category" OnClick="BtnAddCategory_Click" />
            </p>
                <p>
                    <asp:Label ID="studio" runat="server" Text="Studio: "></asp:Label>
                    <asp:DropDownList ID="DropDownStudio" runat="server" DataSourceID="SqlDataSource2" DataTextField="Studio_Name" DataValueField="Studio_No">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="SELECT * FROM [Studio]"></asp:SqlDataSource>
            &nbsp;&nbsp;
                    <asp:Button ID="BtnAddStudio" runat="server" Text="Add Studio" OnClick="BtnAddStudio_Click" />
            </p>
                <p>
                    <asp:Label ID="producer" runat="server" Text="Producer: "></asp:Label>
                    <asp:DropDownList ID="DropDownProducer" runat="server" DataSourceID="SqlDataSource3" DataTextField="Producer_Name" DataValueField="Producer_No">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="SELECT * FROM [Producer]"></asp:SqlDataSource>
            &nbsp;&nbsp;
                    <asp:Button ID="BtnAddProducer" runat="server" Text="Add Producer" OnClick="BtnAddProducer_Click" />
            </p>
                <p>
                    <asp:Label ID="Label1" runat="server" Text="Please Select the Cast Members for the Movie "></asp:Label>
                <br /><br />

                    <asp:Label ID="Label2" runat="server" Text="Actor: "></asp:Label>
                    &nbsp;
                    <asp:DropDownList ID="ActorDropDown" runat="server" DataSourceID="SqlDataSource4" DataTextField="Actor_Name" DataValueField="Actor_No">
                    </asp:DropDownList>
            &nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" Text="Add New" OnClick="BtnAddActor_Click"/>
            &nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="Add To Cast" OnClick="BtnAddCast_Click"   /><br />
                    <asp:Label ID="castlbl" runat="server" Text="Cast Members: "></asp:Label>
            </p>
        <p>
                    <asp:Label ID="title" runat="server" Text="Title: "></asp:Label>
                    <asp:TextBox ID="TxtTitle" runat="server"></asp:TextBox>
                &nbsp;</p>
            <p>
                <asp:Label ID="date" runat="server" Text="Date Released: "></asp:Label>
                <asp:TextBox ID="datereleased" runat="server" TextMode="Date"></asp:TextBox>       
            </p>

            <p>
                <asp:Label ID="stcharge" runat="server" Text="Standard Charge: "></asp:Label>
                <asp:TextBox ID="TxtStandardCharge" runat="server" TextMode="Number"></asp:TextBox>       
            </p>

        <p>
                <asp:Label ID="ptcharge" runat="server" Text="Penalty Charge: "></asp:Label>
                <asp:TextBox ID="TxtPenaltyCharge" runat="server" TextMode="Number"></asp:TextBox>       
            </p>
        
                <p style="text-align:center">
                    <asp:Button ID="BtnAddTitle" runat="server" Text="Add Title"  usesubmitbehavior="false" BackColor="#93B4F4" Font-Size="Large" OnClick="BtnAddTitle_Click" /><br />
                    <asp:Label ID="Success" runat="server" Text="DVD Added To the System" Visible="False" ForeColor="Green"></asp:Label>
                </p>
                <asp:Panel ID="Panel1" runat="server" Visible="False" >
                    <p>
                    <asp:Label ID="AddActorLbl" runat="server" Text="Please Select the Cast Members for the Movie "></asp:Label>
                <br /><br />

                    <asp:Label ID="actor" runat="server" Text="Actor: "></asp:Label>
                    &nbsp;
                    <asp:DropDownList ID="ActorDropDown1" runat="server" DataSourceID="SqlDataSource4" DataTextField="Actor_Name" DataValueField="Actor_No">
                    </asp:DropDownList>
            &nbsp;&nbsp;
                    <asp:Button ID="BtnAddActor" runat="server" Text="Add New" OnClick="BtnAddActor_Click"/>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="select Actor_FName+' '+Actor_LName as Actor_Name ,Actor_No from Actor"></asp:SqlDataSource>
            &nbsp;&nbsp;<br />
                    <asp:Button ID="BtnAddCast" runat="server" Text="Add To Cast" OnClick="BtnAddCast_Click"   />
            </p>
                </asp:Panel>
                

    </div>
    
</asp:Content>
