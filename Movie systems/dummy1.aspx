<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dummy1.aspx.cs" Inherits="MovieSystem.WebForm12" %>
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
        </ul>
    </div>

    <form runat="server" id="form1">
        <div>
            <asp:GridView ID="GridView2" CssClass="table table-success table-striped" AutoGenerateColumns="false" DataKeyNames="Movie_Id"
            runat="server" ShowHeader="true" OnRowEditing="GridView2_RowEditing" OnRowCancelingEdit="GridView2_RowCancelingEdit"
                OnRowUpdating="GridView2_RowUpdating">
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
                        <EditItemTemplate>
                            <asp:TextBox ID="mvname" Text='<%# Eval("Movie_Name") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Language">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Movie_Language") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="mvlang" Text='<%# Eval("Movie_Language") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Director">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Movie_Director") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="mvdir" Text='<%# Eval("Movie_Director") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cast">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Movie_Cast") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="mvcast" Text='<%# Eval("Movie_Cast") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Certificate">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Cbfc_Certificate") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="mvcert" Text='<%# Eval("Cbfc_Certificate") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Duration">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Movie_Duration") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="mvdur" Text='<%# Eval("Movie_Duration") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button runat="server" CommandName="Edit" CssClass="btn btn-primary" Text="Edit"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button runat="server" CommandName="Update" CssClass="btn btn-success" Text="Update" />
                            <asp:Button runat="server" CommandName="Cancel" CssClass="btn btn-danger" Text="Cancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</asp:Content>
