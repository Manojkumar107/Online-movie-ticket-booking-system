<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="movieDetails.aspx.cs" Inherits="MovieSystem.WebForm4" %>
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
    <form id="form1" runat="server">
        <asp:Image ID="Image1" runat="server" Height="400px" Width="800px"  CssClass="rounded mx-auto d-block"/>
        <br />
        <br />
        <div style="text-align:left;">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Movie]"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-dark table-striped">
            </asp:GridView>
        </div>
        <div style="margin-left:47%"> 
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Book Tickets" class="btn btn-primary"/>
        </div>
    </form>
</asp:Content>
