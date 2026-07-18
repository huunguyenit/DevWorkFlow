<%@ Page AutoEventWireup="false" MasterPageFile="~/Main/MasterPage.master" Inherits="FastBusiness.ReportExtender.UI.Page" v="Truy vấn thông tin nhân viên" e="Query Employee Information" %>
<%@ Register Assembly="FastBusiness.QueryExtender" Namespace="FastBusiness" TagPrefix="FastBusiness" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="FastBusiness" runat="server">
  <FastBusiness:ReportExtender ID="MainReport" runat="server" TargetControlID="initGrid" ReadOnly="true" Controller="EmployeeInformation" />
  <FastBusiness:QueryExtender runat="server" TargetControlID="queryMainContainer" ID="EmployeeInformation" GridID="MainReport" Controller="EmployeeInformation" />
  <div id="queryInitGrid" style="display: none;">
    <asp:Panel ID="initGrid" runat="server" />
  </div>
  <asp:Panel ID="queryMainContainer" runat="server" CssClass="QueryMainContainer" />
</asp:Content>
