<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="MemberDetailForm.aspx.cs" Inherits="ApplicationDevelopmentCoursework.MemberDetailForm" %>
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
                <p style="text-align:center; font-size:25px;"><b>Member Details Form</b></p>
                <p>
                     <asp:Label ID="fName" runat="server" Text="First Name:  "></asp:Label>
              <asp:TextBox ID="TxtFName" runat="server"></asp:TextBox><br /></br>
                </p>
              <p>
                     <asp:Label ID="lName" runat="server" Text="Last Name:  "></asp:Label>
              <asp:TextBox ID="TxtLName" runat="server"></asp:TextBox><br /></br>
                </p>
                <p>
                        <asp:Label ID="address" runat="server" Text="Address:  "></asp:Label>
                        <asp:TextBox ID="TxtAddress" runat="server"></asp:TextBox><br /><br />
                </p>
                <p>
                   <asp:Label ID="dob" runat="server" Text="Date of Birth:  "></asp:Label>
                     <asp:TextBox ID="TxtDOB" runat="server" TextMode="Date" Height="25px"></asp:TextBox><br /><br />
                 </p>
              <p>
                   <asp:Label ID="cat" runat="server" Text="MemberShip:  "></asp:Label>
                   <asp:DropDownList ID="MemberShipDropDown" runat="server" DataSourceID="SqlDataSource1" DataTextField="MemberShipCategoryDesc" DataValueField="MemberShipCategoryNo">
                   </asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="SELECT * FROM [MemberShipCategory]"></asp:SqlDataSource>
                  <br /><br />
                 </p>
                
        
                <p style="text-align:center">
                    <asp:Button ID="BtnAddMember" runat="server" Text="Add Member"  usesubmitbehavior="false" BackColor="#93B4F4" Font-Size="Large" OnClick="BtnAddMember_Click" />
            </p>
                <p style="text-align:center">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Member_No" DataSourceID="SqlDataSource2"  BorderColor="#8EA8DB" BorderStyle="Solid" ForeColor="Black" CssClass="gridView">
                        <Columns>
                            <asp:BoundField DataField="Member_No" HeaderText="Member_No" InsertVisible="False" ReadOnly="True" SortExpression="Member_No" />
                            <asp:BoundField DataField="Member_Name" HeaderText="Member_Name" ReadOnly="True" SortExpression="Member_Name" />
                            <asp:BoundField DataField="Member_Address" HeaderText="Member_Address" SortExpression="Member_Address" />
                            <asp:BoundField DataField="Member_DOB" HeaderText="Member_DOB" SortExpression="Member_DOB" />
                            <asp:BoundField DataField="MemberShip" HeaderText="MemberShip" SortExpression="MemberShip" />
                        </Columns>
                         <HeaderStyle BackColor="#8EA8DB" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Ropey_DVDsConnectionString %>" SelectCommand="SELECT Member.Member_No, Member_FName+' '+Member_LName as Member_Name,Member_Address,Member_DOB,MemberShipCategory.MemberShipCategoryDesc as MemberShip  FROM Member,MemberShipCategory where Member.MemberShip_Category_No = MemberShipCategoryNo"></asp:SqlDataSource>
            </p>

    </div>
</asp:Content>
