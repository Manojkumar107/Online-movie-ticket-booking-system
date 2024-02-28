<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MovieSystem.WebForm1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <form id="form1" runat="server">
            <div class="card text-center">
        <div class="card-header">
            Create New Account
        </div>
        <div class="card-body">
            <p>
                <asp:TextBox ID="TextBox1" runat="server" TextMode="Number" placeholder="Mobile Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="TextBox1" ValidationGroup="insertGroup"></asp:RequiredFieldValidator><br>
            </p>
            
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ErrorMessage="Invalid Mobile Number" ValidationExpression="[0-9]{10}" ControlToValidate="TextBox1"></asp:RegularExpressionValidator>
            <br />
            <br />
            
            <p>
                <asp:TextBox ID="TextBox2" runat="server" placeholder="Age"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="*" ControlToValidate="TextBox2" ValidationGroup="insertGroup"></asp:RequiredFieldValidator><br>
            </p>
            
            <asp:RangeValidator ID="RangeValidator1" runat="server" ForeColor="Red" ErrorMessage="Age must be Above 13" ControlToValidate="TextBox2" MinimumValue="13" MaximumValue="100" Type="Integer" ></asp:RangeValidator>
            <br />
            <br />
        
        
            <p>
                <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="TextBox3" ValidationGroup="insertGroup"></asp:RequiredFieldValidator><br>
            </p>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ForeColor="Red" runat="server" ErrorMessage="Invalid Password" ValidationExpression="[a-zA-Z][0-9a-zA-Z@#$%&]{5,12}" ControlToValidate="TextBox3" ValidationGroup="insertGroup"></asp:RegularExpressionValidator>
       
            <p>
                <asp:TextBox ID="TextBox6" runat="server" TextMode="Password" placeholder="Reenter Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" ErrorMessage="*" ControlToValidate="TextBox6" ValidationGroup="insertGroup"></asp:RequiredFieldValidator><br>
            </p>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red" ErrorMessage="Passwords don't match" ControlToValidate="TextBox6" ControlToCompare="TextBox3" Operator="Equal"></asp:CompareValidator> 

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
        
            <p>
                <asp:TextBox ID="TextBox4" runat="server" placeholder="Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="*" ControlToValidate="TextBox4" ValidationGroup="insertGroup"></asp:RequiredFieldValidator>
            </p>
            
            <br />
            <br />
            <p>
                <asp:TextBox ID="TextBox5" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="*" ControlToValidate="TextBox5" ValidationGroup="insertGroup"></asp:RequiredFieldValidator>
            </p>
        
            
            <center><div id="duplicate" runat="server" visible="false" style="color:red"><h5>User already exists</h5></div></center>
            <center><div id="issuccess" runat="server" visible="false" style="color:green"><h5>Registration Successful</h5></div></center>
            <p>
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Back" CssClass="btn btn-danger" />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" class="btn btn-success" ValidationGroup="insertGroup"/>
            </p>
        </div>
        </div>
        </form>
</asp:Content>
