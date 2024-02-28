<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminPageMovies.aspx.cs" Inherits="MovieSystem.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <ul class="nav nav-pills navbar-dark bg-dark">
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="adminPageCustomers.aspx">Customers</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="adminPageMovies.aspx">Movies</a>
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

    <form runat="server" id="form1">
        <div>
            <asp:GridView ID="GridView2" CssClass="table table-success table-striped" AutoGenerateColumns="false" DataKeyNames="Movie_Id"
            runat="server" ShowHeader="true">
                <Columns>
                    <asp:TemplateField HeaderText="Movie ID">
                        <ItemTemplate>
                            <asp:Label ID="label1" Text='<%# Eval("Movie_Id") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Movie">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Movie_Name") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Language">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Movie_Language") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Director">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Movie_Director") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cast">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Movie_Cast") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Certificate">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Cbfc_Certificate") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Duration">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Movie_Duration") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <div class="card text-center">
            <div class="card-header">
            Update Movies
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="card-body">
            <asp:TextBox ID="mvname" runat="server" placeholder="Movie Name"></asp:TextBox><br /><br />
            <asp:TextBox ID="mvlang" runat="server" placeholder="Movie Language"></asp:TextBox><br /><br />
            <asp:TextBox ID="mvdir" runat="server" placeholder="Movie Director"></asp:TextBox><br /><br />
            <asp:TextBox ID="mvcast" runat="server" placeholder="Movie Cast"></asp:TextBox><br /><br />
            <asp:TextBox ID="mvcert" runat="server" placeholder="Movie Certificate"></asp:TextBox><br /><br />
            <asp:TextBox ID="mvdur" runat="server" placeholder="Movie Duration"></asp:TextBox><br /><br />
            <asp:Button ID="updateMovies" runat="server" Text="Update" CssClass="btn btn-success" OnClick="updateMovies_Click" />

            <center><div id="Div1" runat="server" style="color:red"><h6>Warning: Tickets already booked will be canceled</h6></div></center>
            </div>
        </div>
        <center><div id="update" runat="server" visible="false" style="color:red"><h5>Please enter all fields</h5></div></center>
        <center><div id="issuccess" runat="server" visible="false" style="color:green"><h5>Movie Updated Successfully</h5></div></center>
    </form>
</asp:Content>

