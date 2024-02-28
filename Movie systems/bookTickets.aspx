<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bookTickets.aspx.cs" Inherits="MovieSystem.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <ul class="nav nav-pills navbar-dark bg-dark">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="dashboard.aspx">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="myTickets.aspx">My Tickets</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="changePwd.aspx">Change Password</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Signin.aspx">Logout</a>
          </li>
        </ul>
    </div>
    <br />
    <br />

    <br />

    <form id="form1" runat="server">
    <div style="text-align:left;">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [occupied_seats], [free_seats], [show_day], [show_time], [Show_Id] FROM [SHOW]"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" CssClass="table table-success table-striped" AutoGenerateColumns="false" runat="server"  EnablePersistedSelection="True" OnRowCommand="GridView1_RowCommand" DataKeyNames="Show_Id">
            <Columns>
                <asp:TemplateField HeaderText="Show ID">
                        <ItemTemplate>
                            <asp:Label ID="label8" Text='<%# Eval("Show_Id") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Booked Seats">
                        <ItemTemplate>
                            <asp:Label ID="label1" Text='<%# Eval("occupied_seats") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Available Seats">
                        <ItemTemplate>
                            <asp:Label ID="label2" Text='<%# Eval("free_seats") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Show Date">
                        <ItemTemplate>
                            <asp:Label ID="label3" Text='<%# Eval("show_day") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Show Time">
                        <ItemTemplate>
                            <asp:Label ID="label4" Text='<%# Eval("show_time") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                <asp:TemplateField>
                    
                        <ItemTemplate>
                            <asp:Button runat="server" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" Text="Book Tickets" CssClass="btn btn-success"/>
                        </ItemTemplate>
                    </asp:TemplateField>
            </Columns>
            </asp:GridView>

        <center><div runat="server" id="seatavailable" style="color:red" visible="false"><h5 forecolor="red">Selected Show currently unavailable</h5></div></center>
        </div>
        </form>
    
</asp:Content>
