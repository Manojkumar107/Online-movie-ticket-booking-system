<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminPageShows.aspx.cs" Inherits="MovieSystem.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <ul class="nav nav-pills navbar-dark bg-dark">
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="adminPageCustomers.aspx">Customers</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="adminPageMovies.aspx">Movies</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="adminPageShows.aspx">Shows</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="adminPageTickets.aspx">Tickets</a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="Signin.aspx">Logout</a>
          </li>
        </ul>
    </div>
    <form runat="server" id="form1">
        <div>
            <asp:GridView ID="GridView2" CssClass="table table-success table-striped" AutoGenerateColumns="false" DataKeyNames="Show_Id"
            runat="server" ShowHeader="true">
                <Columns>
                    <asp:TemplateField HeaderText="Show ID">
                        <ItemTemplate>
                            <asp:Label ID="label1" Text='<%# Eval("Show_Id") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Screen ID">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Screen_Id") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Occupied Seats">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("occupied_seats") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Free Seats">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("free_seats") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Show Day">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("show_day") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Show Time">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("show_time") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cost Per Ticket">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("cost") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <div class="card text-center">
            <div class="card-header">
            Update Show
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="card-body">
            <asp:TextBox ID="id" runat="server" placeholder="Screen ID"></asp:TextBox><br /><br />
            <asp:TextBox ID="day" runat="server" placeholder="Show Day"></asp:TextBox><br /><br />
            <asp:TextBox ID="time" runat="server" placeholder="Show Time"></asp:TextBox><br /><br />
            <asp:TextBox ID="cost" runat="server" placeholder="Ticket Cost"></asp:TextBox><br /><br />
            <asp:Button ID="updateShow" runat="server" Text="Update" CssClass="btn btn-success" OnClick="updateShow_Click"/>
            <center><div id="Div1" runat="server" style="color:red"><h6>Warning: Tickets already booked will be canceled</h6></div></center>
            </div>
        </div>
        <center><div id="update" runat="server" visible="false" style="color:red"><h5>Please enter all fields</h5></div></center>
        <center><div id="issuccess" runat="server" visible="false" style="color:green"><h5>Show Updated Successfully</h5></div></center>
    </form>
</asp:Content>
