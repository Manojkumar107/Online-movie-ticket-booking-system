<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="successPage.aspx.cs" Inherits="MovieSystem.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <center><h3>Your Tickets Have been booked Successfully!</h3>
        <br />
        <br />
            <asp:Button ID="Button1" runat="server" Text="Home" CssClass="btn btn-primary" OnClick="Button1_Click" />
        <br />
    </center>
    </form>
</asp:Content>
