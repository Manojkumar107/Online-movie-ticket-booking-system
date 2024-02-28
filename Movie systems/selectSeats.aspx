<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="selectSeats.aspx.cs" Inherits="MovieSystem.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <ul class="nav nav-pills navbar-dark bg-dark">
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="dashboard.aspx">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="myTickets.aspx">My Tickets</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="changePwd.aspx">Change Password</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Signin.aspx">Logout</a>
          </li>
        </ul>
    </div>
    <div>
        <form id="form1" runat="server">

            <%--<asp:Label ID="Label1" runat="server" Text="Select Seat Class:   "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Diamond</asp:ListItem>
                <asp:ListItem>Gold</asp:ListItem>
                <asp:ListItem>Silver</asp:ListItem>
            </asp:DropDownList>--%>
            <div class="card text-center">
        <div class="card-header">
            Select Seats
        </div>
                <div class="card-body">
            <p class="card-text">Number of Free Seats:</p>
            <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True"></asp:TextBox>

            <br />
            <br />
            <p class="card-text">Cost per Ticket:</p>
            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>

            <br />
            <br />
            <br />

            

            <p><asp:TextBox ID="TextBox2" runat="server" TextMode="Number" OnTextChanged="TextBox2_TextChanged" AutoPostBack="true" placeholder="Enter Number of seats"></asp:TextBox></p>

            <asp:CompareValidator ID="seat" runat="server" ErrorMessage="Seat Limit exceeded" ControlToValidate="TextBox2" ForeColor="Red" ControlToCompare="TextBox4" Operator="LessThan" Type="Integer" ValidationGroup="seatsgroup"></asp:CompareValidator>
            <div id="div1" runat="server" visible="false" style="color:red"><h4>Invalid Number</h4></div><br />
            <br />
            <br />
            <p class="card-text">Total Cost:</p>
            <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True"></asp:TextBox>

            <br />            
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [free_seats], [cost] FROM [SHOW]"></asp:SqlDataSource>
            <asp:Button ID="Button1" runat="server" Text="Book Tickets" OnClick="Button1_Click" ValidationGroup="seatsrgoup" class="btn btn-success"/>
        </div>
                </div>
                    </form>
    </div>
</asp:Content>
