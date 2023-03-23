﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProviderView.aspx.cs" Inherits="WebApplication1.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
    <style>      
        .navbar {
        background-color: #333;
        overflow: hidden;
                height: 48px;
            }
      .navbar a {
        float: right;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        font-size: 17px;
      }
      .navbar a:hover {
        background-color: #ddd;
        color: black;
      }</style>

    <title>Provider View</title>
</head>
<body>
    <div class="navbar">
      <a href="#">About Us</a>
      <a href="#">Contact Us</a>
      <a href="PatientLogin.aspx">Patient Login</a>
      <a href="ProviderLogin.aspx">Provider Login</a>
      <a href="HomePage.aspx">Home</a>
    </div>
    <br />
   <h1 id="welcomeHeader" runat="server"> </h1>
    <br />
    <br />

    <form id="form1" runat="server">
        <div>
            <h1>Upcoming Appointments</h1>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AppointmentID"
                OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="appointmentID" HeaderText="AppointmentID" />
                    <asp:BoundField DataField="PatientName" HeaderText="Patient Name" />
                    <asp:BoundField DataField="OfficeLocation" HeaderText="Office Location" />
                    <asp:BoundField DataField="Approval" HeaderText="Approval Status" />
                    <asp:BoundField DataField="Time" HeaderText="Time" />
                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:d}"/>
                    <asp:ButtonField Text="APPROVE" CommandName="ApproveAppointment" HeaderText="Approval" />
                    <asp:ButtonField Text="DENY" CommandName="DenyAppointment" HeaderText="Denial" />

                </Columns>
            </asp:GridView>
        </div>
        <div>
            <h1>Referral Review</h1>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="AppointmentID2"
                OnRowCommand="GridView2_RowCommand">
                <Columns>
                    <asp:BoundField DataField="appointmentID2" HeaderText="AppointmentID" />
                    <asp:BoundField DataField="PatientName2" HeaderText="Patient Name" />
                    <asp:BoundField DataField="Specialist" HeaderText="Specialty" />
                    <asp:BoundField DataField="Referral" HeaderText="Referral Status" />
                    <asp:BoundField DataField="Doctor" HeaderText="Doctor" />
                    <asp:ButtonField Text="APPROVE" CommandName="ApproveAppointment2" HeaderText="Approval" />
                    <asp:ButtonField Text="DENY" CommandName="DenyAppointment2" HeaderText="Denial" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
