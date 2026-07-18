<%@ Page AutoEventWireup="false" MasterPageFile="~/Main/MasterPage.master" Inherits="FastBusiness.ReportExtender.UI.Page"
    v="Cập nhật danh sách lao động phát sinh thanh toán theo chế độ" e="Data Entry for Social Insurance Benefits" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="FastBusiness" runat="server">
    <div>
        <asp:Panel ID="panelReport" runat="server" />
    </div>
    <FastBusiness:ReportExtender ID="MainReport" runat="server" TargetControlID="panelReport"
        ReadOnly="true" Controller="hrSocialInsuranceBenefitsEntry" FilterMode="true" />
</asp:Content>
