<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="MovieSystem.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <center>
        <h3>Oops..Something went wrong. Please Login again.</h3>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" CssClass="btn btn-primary"/>
        <br />

    </center>
    </form>
</asp:Content>
