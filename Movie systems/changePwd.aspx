<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="changePwd.aspx.cs" Inherits="MovieSystem.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <ul class="nav nav-pills  navbar-dark bg-dark">
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="dashboard.aspx">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="myTickets.aspx">My Tickets</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="changePwd.aspx">Change Password</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Signin.aspx">Logout</a>
          </li>
        </ul>
    </div>
        <br />
        <br />
    <div>
        <form id="form1" runat="server">
            <div class="card text-center">
        <div class="card-header">
            Change Password
        </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                <div class="card-body">
             <p class="card-text">Registered Mobile Number:       
            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="true"></asp:TextBox></p>
            <br />
            <br />
            <p class="card-text"><asp:TextBox ID="TextBox2" runat="server" TextMode="Password" placeholder="Current Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="TextBox2" ValidationGroup="password"></asp:RequiredFieldValidator>
            </p><br />
             <p class="card-text"><asp:TextBox ID="TextBox3" runat="server" TextMode="Password" placeholder="New Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="TextBox3" ValidationGroup="password"></asp:RequiredFieldValidator>
            </p><asp:RegularExpressionValidator ForeColor="Red" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Password" ValidationExpression="[a-zA-Z][a-zA-Z0-9@#$%&]{5,12}" ControlToValidate="TextBox3" ValidationGroup="password"></asp:RegularExpressionValidator>
            <br />
                    <br />
                    <br />
            
            <p class="card-text"><asp:TextBox ID="TextBox4" runat="server" TextMode="Password" placeholder="Re-enter new Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="TextBox4" ValidationGroup="password"></asp:RequiredFieldValidator>
            </p><asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red" ErrorMessage="Passwords Don't Match" ControlToValidate="TextBox4" ControlToCompare="TextBox3" Operator="Equal" ValidationGroup="password"></asp:CompareValidator>
            <br />
            <br />
                    <br />
            <center><div id="invalidpwd" runat="server" visible="false" style="color:red"><h5>Current Password is Incorrect</h5></div></center>
                    <center><div id="success" runat="server" visible="false" style="color:green"><h5>Password changed successfully</h5></div></center>
            <asp:Button ID="Button1" runat="server" Text="Change Password" OnClick="Button1_Click" ValidationGroup="password" class="btn btn-success"/>
                </div>
                </div>
        </form>
    </div>
</asp:Content>
