<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminPageTickets.aspx.cs" Inherits="MovieSystem.WebForm14" %>
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
            <a class="nav-link" href="adminPageShows.aspx">Shows</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="adminPageTickets.aspx">Tickets</a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="Signin.aspx">Logout</a>
          </li>
        </ul>
    </div>
    <div>
        <form id="form1" runat="server">
            <div runat="server"  id="isticket" visible="false">
                <center><h3>There are No Tickets Booked Currently</h3>
                 </div>
            <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Ticket]"></asp:SqlDataSource>--%>
            <asp:GridView ID="GridView1" CssClass="table table-success table-striped" AutoGenerateColumns="false" runat="server" DataKeyNames="Ticket_Id" ShowHeader="true">
                <Columns>
                    <asp:TemplateField HeaderText="Ticket_Id">
                        <ItemTemplate>
                            <asp:Label ID="label8" Text='<%# Eval("Ticket_Id") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Number of Seats">
                        <ItemTemplate>
                            <asp:Label ID="label1" Text='<%# Eval("Num_of_seats") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ticket Price">
                        <ItemTemplate>
                            <asp:Label ID="label2" Text='<%# Eval("Total_cost") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Movie">
                        <ItemTemplate>
                            <asp:Label ID="label3" Text='<%# Eval("Movie_Name") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Language">
                        <ItemTemplate>
                            <asp:Label ID="label4" Text='<%# Eval("Movie_Language") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CBFC">
                        <ItemTemplate>
                            <asp:Label ID="label5" Text='<%# Eval("Cbfc_Certificate") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Show Date">
                        <ItemTemplate>
                            <asp:Label ID="label6" Text='<%# Eval("show_day") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Show Time">
                        <ItemTemplate>
                            <asp:Label ID="label7" Text='<%# Eval("show_time") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                   <%-- <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button runat="server" CommandName="Delete" Text="Cancel Tickets" class="btn btn-danger"/>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                </Columns>
                
            </asp:GridView>
            <center>Select Ticket to delete:<asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server"></asp:DropDownList></center>
             <center><asp:Button ID="deleteTickets" runat="server" Text="Delete" CssClass="btn btn-success" OnClick="updateMovies_Click" />
        <div id="Div1" runat="server" visible="false" style="color:red"><h5>Please select ID</h5></div></center>
        <center><div id="delete" runat="server" visible="false" style="color:green"><h5>Ticket Deleted successfully</h5></div></center>
        </form>
    </div>
</asp:Content>
