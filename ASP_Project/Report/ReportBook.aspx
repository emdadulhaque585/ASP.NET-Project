<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="ReportBook.aspx.cs" Inherits="ASP_Project.Report.ReportBook" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../aspnet_client/system_web/4_0_30319/crystalreportviewers13/js/crviewer/crv.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <br />
    <br />
    <h1>Book Report Page</h1>
    <br />
    <div class="container">
        <asp:DropDownList ID="ddlCategoryName"  runat="server" DataSourceID="Reportcategory" DataTextField="Name" DataValueField="CategoryId"></asp:DropDownList>
        <asp:SqlDataSource ID="Reportcategory" runat="server" ConnectionString="<%$ ConnectionStrings:AspProjectContext %>" SelectCommand="SELECT DISTINCT * FROM [Book_Category]"></asp:SqlDataSource>
    <asp:Button ID="btnReport" runat="server" Text="ShowReport" />
    </div>
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />



    <br />
    <br />
</asp:Content>
