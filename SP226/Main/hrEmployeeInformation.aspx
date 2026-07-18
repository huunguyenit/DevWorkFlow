<%@ Page AutoEventWireup="false" MasterPageFile="~/Main/MasterPage.master" Inherits="FastBusiness.ReportExtender.UI.Page" v="Thông tin nhân viên" e="Employee Information" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Css/ViewPanel.css" rel="stylesheet" type="text/css" />
    <script src="../ClientScript/ViewPanel.js?v=3" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="FastBusiness" runat="server">
    <FastBusiness:ReportExtender ID="MainReport" runat="server" TargetControlID="panelReport" ReadOnly="true" Controller="hrPIGeneralInformation" InitScript="initInformation(this,'stt_rec','ma_bp, status, ten_nv, ma_nv, vi_tri, ma_bac, nv_ql, nh_vtr1, nh_vtr2, nh_vtr3, cmnd_so, gioi_tinh, quoc_tich, hon_nhan, ma_tdhv, ma_nn, nv_cd_yn','ngay_vao1, ngay_vao2', '../AppService/ViewPanelService.asmx','GetTreeItem','GetViewPage')" />

    <div id="line" style="margin:0px; padding:0px;background-color:#B8B6B6;position:absolute;width:100%;height:1px;"></div>
    <div id="divSplitter">
        <table cellpadding="0" cellspacing="0" style="height:100%;width:100%;">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
                        <tr>
                            <td id="topLeftPanel">
                                <div id="topLeftView" class="TreePanelContainer">
                                    <div id="treeDept" style="height:auto;width:0;padding-top:10px; padding-bottom:10px;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td id="bottomLeftPanel">
                                <div id="bottomLeftView" class="TreePanelContainer">
                                    <div id="treeFunc" style="height:auto;width:0;padding-top:10px; padding-bottom:10px;"></div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
                
                <td>
                    <table cellpadding="0" cellspacing="0" style="width:100%;height:100%;">
                        <tr>
                            <td id="topRightPanel">
                                <div id="topRightView" style="overflow:auto;">
                                    <asp:Panel ID="panelReport" runat="server" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td id="bottomRightPanel">
                                <div id="bottomRightView" style="height:100%;overflow:auto;padding:0;margin:0;background-color:#EDF5FF;"></div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <div id="splitter0" style="margin:0;padding:0;width:1px;top:0;cursor:e-resize;background-color:#B8B6B6;position:absolute;"></div>
        <div id="splitter1" style="margin:0;padding:0;height:1px;left:0;cursor:n-resize;background-color:#B8B6B6;position:absolute;"></div>
        <div id="splitter2" style="margin:0;padding:0;height:1px;right:0;cursor:n-resize;background-color:#B8B6B6;position:absolute;"></div>
    </div>
    
    <asp:Panel ID="ResourcePanel" runat="server" Width="0" Height="0"></asp:Panel>
    <script runat="server">
        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            Dim f As String = AppDomain.CurrentDomain.BaseDirectory & "\App_Data\Controllers\Include\Extender.txt"
            If IO.File.Exists(f) Then
                Dim v As String = IO.File.ReadAllText(f)
                If v = "INCLUDE" Then
                    ResourcePanel.Controls.Add(LoadControl("ExtenderControls.ascx"))
                End If
            End If
        End Sub
    </script>
</asp:Content>
