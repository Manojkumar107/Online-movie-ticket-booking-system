<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="MovieSystem.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <ul class="nav nav-pills navbar-dark bg-dark">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="dashboard.aspx">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="myTickets.aspx">My Tickets</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="changePwd.aspx">Change Password</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Signin.aspx">Logout</a>
          </li>
        </ul>
    </div>
    <form id="form1" runat="server">
        
        <div style="margin-left: 46%; font-size:larger">
            Now Screening
        </div>
        <div style="margin-left:37%">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick">
        </asp:Timer>
                <asp:Image ID="Image1" runat="server" Height="30%" Width="40%"/>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        
        </div><br /><br />
        <div style="margin-left: 47%; font-size:larger">
            Book Tickets
        </div>
        <div style="margin-left:20%">
                <div class="card" style="width: 18rem;float:left">
                <asp:Image ID="Image2" runat="server" />
                <div class="card-body">
                <center><asp:Button ID="screen1" runat="server" CssClass="btn" Text="Book Now!" OnClick="screen1_Click"></asp:Button></center>
                    </div>
                </div>
            <div class="card" style="width: 18rem;float:left">

                <asp:Image ID="Image3" runat="server"/>
                <div class="card-body">
                <center><asp:Button ID="screen2" runat="server" CssClass="btn" Text="Book Now!" OnClick="screen2_Click"></asp:Button></center>
                    </div>
            </div>
            <div class="card" style="width: 18rem;float:inline-start">
                <asp:Image ID="Image4" runat="server" Height="505px"/>
                <div class="card-body">
                <center><asp:Button ID="screen3" runat="server" CssClass="btn" Text="Book Now!" OnClick="screen3_Click"></asp:Button></center>
                    </div>
                </div>
        </div>
    </form>

    <style>

        .btn{
    position: relative;
    padding: 15px 30px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    border: none;
    font-family: monospace;
    background-color: rgb(235, 235, 67);
    left: 5%;
    bottom: 5%;
}

        #tab2 td{
    width: 5%;
    background: rgba(110, 104, 104, 0.15);
    z-index: -1;
}

#tab2 td:hover{
    background-color: rgb(237, 240, 105);
}
    </style>
</asp:Content>
