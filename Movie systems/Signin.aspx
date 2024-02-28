<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Signin.aspx.cs" Inherits="MovieSystem.WebForm2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="card text-center">
        <div class="card-header">
            Enter Credentials
        </div>
        <div class="card-body">
             <p class="card-text">
                 <asp:TextBox ID="TextBox1" runat="server" TextMode="Phone" placeholder="Enter Mobile Number"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="*" ControlToValidate="TextBox1" ValidationGroup="insertGroup"></asp:RequiredFieldValidator>
             </p>
            
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ErrorMessage="Invalid Mobile Number" ValidationExpression="[0-9]{10}" ControlToValidate="TextBox1"></asp:RegularExpressionValidator>
            <br />
            <br />

            <p class="card-text">
                <asp:TextBox ID="TextBox2" runat="server" style="margin-left: 1px" TextMode="Password" placeholder="Enter Password:"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox2" ValidationGroup="insertGroup"></asp:RequiredFieldValidator>
            </p>
            
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ErrorMessage="Invalid Password" ValidationExpression="[a-zA-Z][a-zA-Z0-9@#$%&]{5,12}" ControlToValidate="TextBox2"></asp:RegularExpressionValidator>
        <br /><br />

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Password] FROM [Customer] WHERE ([Mobile_Num] = @Mobile_Num)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Mobile_Num" PropertyName="Text" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            <center><div id="nouser" runat="server" visible="false" style="color:red"><h5>User doesn't exist</h5></div></center>
            <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" ValidationGroup="insertGroup" class="btn btn-success"/>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Register" class="btn btn-primary"/>
        </div>
        </div>
    </form>
</asp:Content>
