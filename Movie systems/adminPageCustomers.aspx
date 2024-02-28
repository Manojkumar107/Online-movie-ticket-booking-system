<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminPageCustomers.aspx.cs" Inherits="MovieSystem.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <ul class="nav nav-pills navbar-dark bg-dark">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="adminPageCustomers.aspx">Customers</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="adminPageMovies.aspx">Movies</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="adminPageShows.aspx">Shows</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="adminPageTickets.aspx">Tickets</a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="Signin.aspx">Logout</a>
          </li>
        </ul>
    </div>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" CssClass="table table-success table-striped" AutoGenerateColumns="false" runat="server" ShowHeader="true">
                <Columns>
                    <asp:TemplateField HeaderText="Mobile Number">
                        <ItemTemplate>
                            <asp:Label ID="label8" Text='<%# Eval("Mobile_Num") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Age">
                        <ItemTemplate>
                            <asp:Label ID="label1" Text='<%# Eval("Age") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="label2" Text='<%# Eval("Name") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="label3" Text='<%# Eval("Email") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        <center><div id="hascustomer" runat="server" visible="false" style="color:red"><h4>There are no registered users.</h4></div></center>
        <br />
        <br />
        <br />
        <br />
            <center>Select Customer to delete:<asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList></center>
           <center>
               <br /><br />
            <asp:TextBox ID="agetf" runat="server" placeholder="Age"></asp:TextBox><br /><br />
            <asp:TextBox ID="nametf" runat="server" placeholder="Name"></asp:TextBox><br /><br />
            <asp:TextBox ID="mailtf" runat="server" placeholder="Email"></asp:TextBox><br /><br />
            <asp:Button ID="updateMovies" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="updateDetails_Click" />
               <asp:Button ID="deleteCustomers" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="deleteCustomers_Click" />
               <center><div id="Div2" runat="server" style="color:red"><h6>Warning: Tickets already booked will be canceled</h6></div></center>
        <div id="Div1" runat="server" visible="false" style="color:red"><h5>Please select ID</h5></div></center>
        <center><div id="delete" runat="server" visible="false" style="color:green"><h5>Customer Deleted successfully</h5></div></center>
        <center><div id="update" runat="server" visible="false" style="color:red"><h5>Please enter all fields</h5></div></center>
        <center><div id="issuccess" runat="server" visible="false" style="color:green" ><h5>Customer Updated Successfully</h5></div></center>

    </form>
</asp:Content>
