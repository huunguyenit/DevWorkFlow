<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckClosingDate.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\ExternalCheckVoucherNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandExternalFieldDeclare SYSTEM "..\Include\Command\ExternalFieldDeclare.txt">
  <!ENTITY CommandExternalFieldSelect SYSTEM "..\Include\Command\ExternalFieldSelect.txt">
  <!ENTITY CommandExternalFieldSet SYSTEM "..\Include\Command\ExternalVoucherFieldAssign.txt">
  <!ENTITY CommandExternalFieldQuery SYSTEM "..\Include\Command\ExternalVoucherFieldQuery.txt">
  <!ENTITY CommandGetTaxRate SYSTEM "..\Include\Command\GetCreditTaxRate.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherReference.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY f ", rtrim(ten_kh) as khach_hang, rtrim(dia_chi) as dia_chi, rtrim(dien_thoai) as dien_thoai, rtrim(fax) as fax">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpChsR9eiWcF7LW/IhclRaHXtp3tmgU43yxSVHDgaiOOxJHVvcSr/3zCgtEkVQFEbMW7PD94nDo4xfygU3H6+D5nGyH8AzreQzMmxAA6fDUB9wvG6jEuU+3lTx4wexdVJYGNh1VwMQ+59IER4ZoJdyVop0ZL5NTvObgVCa5GIDPd9ATUo9Z3FMV8K/aGKjIDFtZ6KreawYdylR1iZ0rAzT0sShWaihYN55xi44ipryAFjav0VyAi4Wh9bZNxJKyunXDIOpargG+/e8zPRUNEYLuLpMKSAGQ5UhgmVy38WEbnnJ+7ulZESmQQnHQ7YX50RucHMIH9NUhdiT/vx8SvxjzDA==FastBusiness.Encryption.End">
  <!ENTITY Post "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcNX4oNt0O+KRVE3qROL8A1GAMXKwzvc9ZCAcnYGsn16DRi8QllJlPihIe1CBe44LWEKceC+DVdL0N+BbSlqAMtP6jizcDWxAvzOeDSYL25n71A94ZRrbhjWwnRjLaVwW7uvoGef3X++rNi4ImJ6FAwI=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8o+fb1oPPj3Ynqxc94XTMfiTS+ek8VBAylOQGA9WXuOVFastBusiness.Encryption.End">
  <!ENTITY CheckCredit "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcHBIOskIaIcE4b0/Bn2u9Q6WvNFwUSJnvLZxpFavLhQzjkthDprPqssRc6kxFafgAsxrk8rCSUva+e6G7+zCTGw=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8j82Gi4RnuwCx/AHckNOrQ2K7zFZZDIy8JgehUBXKcEOE+nzCVY/tdFS5lX2/ETWmlGarWEmgfon2jOOEDlyyR8=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$ZQ48w5RQriGrDGcgASRa2j5uiRqZbSJDBFVsVNKauSvUswvScSDSgUAOJqebFuZkn8dsXpWEIDf5jvqpelwLMNzBbPCSJH75RJZX8zhSeoIMGc1Py3JX5CdF4TFH+peJjP79s06QV6aL3eJ+/uLjTP4dZPbFAFejRLxBZEzLPjoXo9LLTfHEPxWHSd6b4FQ/HvNdHzNPjC8ZYwO+FmsuWs+waHv6xfo2pdE6XusGJp/ISKMMx5dbmzTun5JO6Xoux7XGIiisIf3f8tDW65gDYvBLsQJ9VUE7iNw6tXUIFBti7GEbgaIwjlf0L1JD3urHFastBusiness.Encryption.End">
  

  <!ENTITY APVController "SOApproval">
  <!ENTITY APVApprovalType "00915">
  <!ENTITY APVDetailTable "d64">
  <!ENTITY APVHisTable "a64$000000">
  <!ENTITY APVCheckCategory "case when @ma_dvcs = '' then @@unit else rtrim(@ma_dvcs) end + char(253) + rtrim(@ma_kh) + char(253) + rtrim(@ma_nt) + char(253) + rtrim(@t_tien_nt2) + char(253) + rtrim(@loai_ct)">
  <!ENTITY APVStatusNoAction "0">
  <!ENTITY APVStatusOpen "1">
  <!ENTITY APVStatusApprove "2">
  <!ENTITY APVStatusClose "6">
  <!ENTITY APVStatusPending "9">
  <!ENTITY APVCategoryIndex "18">
  <!ENTITY APVSetVoucherDefaultValue SYSTEM "..\Include\Javascript\APVSetVoucherDefaultValue.txt">
  <!ENTITY APVHandleStatus SYSTEM "..\Include\Javascript\APVHandleStatus.txt">
  <!ENTITY APVAddStatus SYSTEM "..\Include\Javascript\APVAddStatus.txt">
  <!ENTITY APVFunctionScript SYSTEM "..\Include\Javascript\APVFunctionScript.txt">
  <!ENTITY % SOApproval SYSTEM "..\Include\SOApproval.ent">
  %SOApproval;

  <!ENTITY % PostNotifyApproval SYSTEM "..\Include\PostNotifyApprovalVoucher.ent">
  %PostNotifyApproval;
  <!ENTITY PostNotifyGroup "05">
  <!ENTITY PostNotifyCreate "exec rs_CreateNotifySOTran @stt_rec, 'm64$$partition$current', 'd64$$partition$current', '#notifyContent'">

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.SOTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m64$000000" code="stt_rec" order="ngay_ct, so_ct" id="DXA" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="đơn hàng bán" e="Sales Order"></title>
  <partition table="c64$000000" prime="m64$" inquiry="i64$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Mã giao dịch" e="Transaction"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="status = '1' and ma_ct = @@id" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7k5O5X+wgEC1J/rtYldscXTB4hHMYKzspHSFOBmRtnKF+RHaq5+6oXfSG0AcrOfsU=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(kh_yn = 1 or nv_yn = 1) and status = '1'" check="(kh_yn = 1 or nv_yn = 1)" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_hd1" disabled="true" dataFormatString="@upperCaseFormat" external="true" defaultValue="''" align="right" allowContain="true">
      <header v="Số hợp đồng" e="Blanket Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="ma_tt">
      <header v="Mã thanh toán" e="Credit Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số đơn hàng" e="Order Number"></header>
      <items style="Mask"/>
    </field>

    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Order Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb568WENPdSisqRaQDoUqJSO2hkHW4E2dtclFcoV51th7w==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" inactivate="true" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Chờ duyệt" e="1. Open"/>
        </item>
        <item value="2">
          <text v="2. Duyệt" e="2. Approved"/>
        </item>
        <item value="3">
          <text v="3. Treo" e="3. Hold"/>
        </item>
        <item value="4">
          <text v="4. Đang xuất" e="4. Issuing"/>
        </item>
        <item value="5">
          <text v="5. Hoàn thành" e="5. Completed"/>
        </item>
        <item value="6">
          <text v="6. Đóng" e="6. Close"/>
        </item>
        <item value="9">
          <text v="9. Đang duyệt" e="9. Pending"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d64" external="true" clientDefault="0" defaultValue="0" rows="&h1;" allowNulls="false" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="SODetail" row="1">
        <item value="ForeignKey">
          <text v="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="ma_dc" defaultValue="''" categoryIndex="2">
      <header v="Nơi giao" e="Ship-to"></header>
      <items style="AutoComplete" controller="DeliveryAddress" reference="ten_dc%l" key="ma_kh = '{$%c[ma_kh]}' and status = '1'" check="ma_kh = '{$%c[ma_kh]}'" information="ma_dc$dmdc2.ten_dc%l"/>
    </field>
    <field name="ten_dc%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_htvc" defaultValue="''" categoryIndex="2">
      <header v="H.thức v.chuyển" e="Ship via"></header>
      <items style="AutoComplete" controller="ShipViaCode" reference="ten_htvc%l" key="status = '1'" check="1=1" information="ma_htvc$dmhtvc.ten_htvc%l"/>
    </field>
    <field name="ten_htvc%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>

    <field name="r60" external="true" clientDefault="0" defaultValue="0" rows="&h1;" allowNulls="true" filterSource="Tidy" categoryIndex="3">
      <header v="" e=""></header>
      <label v="Chi phí" e="Charges"></label >
      <items style="Grid" controller="SOCharges" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="khach_hang" external="true" defaultValue="''" disabled="true" maxLength="-106" allowContain="true" categoryIndex="4">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dia_chi" external="true" defaultValue="''" disabled="true" maxLength="-106" allowContain="true" categoryIndex="4">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="dien_thoai" external="true" defaultValue="''" disabled="true" categoryIndex="4">
      <header v="Điện thoại" e="Telephone"></header>
    </field>
    <field name="fax" external="true" defaultValue="''" disabled="true" categoryIndex="4">
      <header v="Gửi bản sao &lt;span class=&quot;LabelDescription&quot;&gt;(Fax)&lt;/span&gt;" e="Fax Number"></header>
    </field>

    <field name="ngay_hd1" type="DateTime" disabled="true" dataFormatString="@datetimeFormat" align="left" external="true" defaultValue="''" categoryIndex="18" allowContain="true">
      <header v="Ngày hợp đồng" e="Blanket Date"></header>
    </field>
    <field name="ngay_hl1" type="DateTime" disabled="true" dataFormatString="@datetimeFormat" align="left" external="true" defaultValue="''" categoryIndex="18" allowContain="true">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="status1" disabled="true" external="true" defaultValue="''" categoryIndex="18" allowContain="true">
      <header v="Trạng thái" e="Status"></header>
    </field>
    <field name="ma_nvbh" defaultValue="''" categoryIndex="18">
      <header v="Nhân viên bán" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1=1" information="ma_nvbh$dmnvbh.ten_nvbh%l"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="18">
      <header v="" e=""></header>
    </field>
    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right" defaultValue="''" categoryIndex="18" filterSource="Optional">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="18" filterSource="Optional">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>

    &APVXMLFields;

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền chiết khấu" e="Discount Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Chi phí" e="Charges"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_cp" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="&h2;" anchor="10" split="10">
      <item value="100, 30, 70, 121, 8, 58, 42, 8, 100, 0, 8, 58, 42, 8, 100, 0"/>
      <item value="1101000000-10011: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="1101000000-1001: [ma_gd].Label, [ma_gd], [ten_gd%l], [ngay_lct].Label, [ngay_lct]"/>
      <item value="1101000000-11011: [ma_tt].Label, [ma_tt], [ten_tt%l], [ty_gia].Label, [ma_nt], [ty_gia], [loai_ct]"/>

      <item value="1: [d64]"/>

      <item value="1110: [ma_dc].Label, [ma_dc], [ten_dc%l]"/>
      <item value="1110: [ma_htvc].Label, [ma_htvc], [ten_htvc%l]"/>

      <item value="1: [r60]"/>

      &ListView;
      &PostView;

      <item value="110000000: [khach_hang].Label, [khach_hang]"/>
      <item value="110000000: [dia_chi].Label, [dia_chi]"/>
      <item value="110000000: [dien_thoai].Label, [dien_thoai]"/>
      <item value="110000000: [fax].Label, [fax]"/>

      &APVSOXMLViews;

      <item value="-------1-1-10-1: [t_tien_nt2].Label, [t_so_luong], [t_tien_nt2], [t_tien2]"/>
      <item value="1-10-1---1-10-1: [t_ck_nt].Label, [t_ck_nt], [t_ck], [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="1-10-1---1-10-1: [t_cp_nt].Label, [t_cp_nt], [t_cp], [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="100, 100, 100, 453" anchor="4">
          <header v="Thông tin giao hàng" e="Shipping Information"/>
        </category>
        <category index="3" columns="769" anchor="1">
          <header v="Chi phí" e="Charges"/>
        </category>
        <category index="4" columns="100, 30, 70, 121, 8, 58, 42, 8, 100, 8, 58, 42, 8, 100" anchor="2">
          <header v="Thông tin khách hàng" e="Customer Information"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="18" columns="100, 30, 70, 121, 8, 58, 42, 8, 100, 0, 8, 58, 42, 8, 100" anchor="4">
          <header v="Khác" e="Other"/>
        </category>
        <category index="-1" columns="100, 8, 30, 70, 8, 100, 13, 100, 8, 100, 8, 58, 42, 8, 100" anchor="7">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenVoucherInit;
    &ListShowing;

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafSZKoXBsqMxMCcm/GnJvZS6Jw+L9o3i8vlXtpYszKcxmiq/zYMyXuyFs4NHmVv8A/A==</Encrypted>]]>
        &CommandGetTaxRate;
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IKlhJu6U1FZgeq8Y/CjDiFkZ2REXFPvR1sn6qhSAy0RAN8h0j2lMHU11mlkMrLkLWLQ2pQqwuQxi2936iRBVDzcdQRjuAaKi53gq3/hENh+Kg==</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWcDd6/wFUkQAwhJl3VmE6CukjLNuujC7Xi2VC9XFSV8KQv6ef0y4z75WSwRxE3kXdqBetXX6hQ2SacPkmcBflTXQaI3RyoaURyXKQpf44VB2w==</Encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcALHDWKjDupB2aTj/ctHEvvA4L8/l3Kr+ZsTXXBBtsQr4zhuB21rNKNliv+d7P2UYQJ8pRGrK+UBq70zx1N0lVDrZxEqlJkMJWA0SPQp2Yzc3z3adxEefG08d24YqSsR4Tb7Nq3CLpsGh3W/R52J9DE0DcYhszMs3cBQqp2m+6APlp7XhRvsmp4XQ3oYZ5TVeovbE/MRVKtOACLDscvvf50ZAsxZ/eXKPUehZQHlBkI2Qg+6XbDTz6HyGRT1xLt9E2oto7JwTDRlObdugheGkajTdwfu4V3r5hIGG+ngzDZFF+y0vpuo9CBNG5AmABRYJdqBA2ijNRybFonOluYUChR24u/w0lPj2+eRNiOgjPA/G2Ue1TMV/ejjkrUvc7hP9wfh6cwckkZf28EO1KOLenDJGLNCX/3r42HeoW0mUxv+9aR+RHiEKaHL8vXuUkeMfDiLBwNoBNBXOy0ZlfllblJWpHSVDhIdqB8JJmkmdf6e1MbKmYyWhAlTXv+olpMIn1040XH1jUwzvHeWGylAc2ceMfQJxwnHxzG307RAjEzE0uREBYDHS1oxIfyBD7gl7DqUDl44rt4/0rcqb98L42aUPFlEKSmxNUg5OgD1KHsyTB8BphEfw1hgxPpSrPAdlg==</Encrypted>]]>&APVInitExternalFieldsDeclare;
        &CommandExternalFieldQuery;&f;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ09+KuZRCsLMv6WpMUGbdxZv2IdKFBLgyPB+I3WrKMVpW0IsTJgZ1OcJjLBAyUwH78bmbeSsMdOVgVwueE5PjMQGcQrQXGLVDJ5+iEovqhE7b</Encrypted>]]>&APVInitExternalFieldsSelectWithComma;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5AKAw9c3UFooEwlECRp/GSBdL+q0MqVmYh5qqori5Qf55SfH/AKlP7o6yaqAvop2x/PwG/bRSoRdGcn4c/xIpic=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &APVCheckApprove;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        &CheckCredit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24Asmac4wEKePbUXfv7nLxAIG525rJrJQzlpS+8UTu/g5rLRIjOAlJNRI30o7U1DNTGKykauJt6ERac7TFiTvlQ14f686hkLMYCRftjrVOTRPbCrAtXp0aSTXht9H8Th2VLHs59K4nHqV/JfajXwsSF9flHpEZ7R8fu0uK9MkBHC9Aog==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJg+yaPiaKRMp8uOf3QcgaLNXNLvm9SstjSUuLTcChSdyVJLxBeG05DmFF+1c+gXtkc7R7W4GpYMuc0OPoIuYJEjdcSsYMrUqgON4T2dLY4F</Encrypted>]]>
        &UpdateCredit;
        &AfterUpdate;
        &Post;
        &AfterVoucherUpdate;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &APVApprove;
        &APVMailApproveInsert;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34LBQzKQN4KcYrc+EJIXzDXMcnHKF7tmNTfh0N6MUcu72yoLYU3jgI3wqjIDOOV8gbMdvFu8DParSJXqjllHZA3f</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &APVCheckApprove;
        &VoucherWhenBeforeUpdateLog;
        &BeforeVoucherUpdate;
        &CheckCredit;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku6DpTWBeP4uxE/DCXhXuuuC9sf2ZvwUItBJMZdj2ADoeQJPs2hEVQ/8P6EgWueth9cmst4AnXiBKpV90qatv3rMS9NofJqXvhknveo8LSM6+5UZa2nioWSw1FY1CKo3GraIy6JEzB5/odyTUMy3tI74k9XqwX28x4OV+LvtKusUZ7DOTHKwy1AGQeeq0nJw3z6jpbtNiFDWcjJ8dkZJg+z+pAcjzmgFY3dT1BBHjcGGyA50eJMLcHPCYKXlG9Rz9Y8Pdl/pysfxUAMqL00Kjb4lgR8avTH70oTI06BRLJlA14hAFk4DjhulLr9VwVltwoJgfjiy9hluNjXXx5yf3A4gIdlrfAhiXt/M/woJviM2G</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SGw/oFyQU7mQK1E72BWISB/9hU2GiwQItvn339Ll/YvyenWxvC7EKD8suAq9/7gDuqNhKSj8ZJjjzxmsfUqEYcnZugoaHCPCnZSBXl0OdvIezdGBdbtfjNwrSshc3hcCrI3JTnJx0nW5rtyFRZEx5Yu5Aoi/5m1TXhvVzla3S2YOp9++jhrAX4pKIK/pHLqyOh2Hld0cPZvOl5n36FUxwOzp0EhnH+ZHoPQGX4GOlWYPSmXmVp8rlXF4f0EwDVkyQ==</Encrypted>]]>
        &UpdateCredit;
        &AfterUpdate;
        &Post;
        &AfterVoucherUpdate;
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &APVApprove;
        &APVMailApproveUpdate;
        &EndUpdatedVoucherNumber;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ04YeFCuahZYGQRylWbgLHOwqWK4QsakMDmg4ogMtoGRy8eRx5C8buvtMFTQkkoVNRg==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &APVDelete;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnCxaFayYVBFbYErvia1+lh0QZu/4PftG7l2Uw3Rx5QyPTcplO2+HN2DQTvd/keE598gX9NwOBRNavlEuPoJSC4AZw5Z6IObRGrqloiiVwBc40gKSQh3iyM4myfK6RNOYs=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2v+FgL5fQft0lki2bjiO7tva9PCd2Nbt/kEVjKjLl8wTcjtdMRy0vYD3t0ywK6OxXxCJJ1bAREq8Xf5EcCkyhE=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6nskpyE/YdJfyt6cV5aexPnb3Zorbs8CELktoYvKAwy28VMq0FU7Em9bvkzMuY41bT9X94LTrltj4mVU4aAtLQ=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &VoucherLogUpdateStatus;
        &VoucherLogBeginComment;
      </text>
    </command>

    <command event="Deleted">
      <text>
        &VoucherLogEndComment;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkA5FwSGEsicb13ZKGGN0PsQqxqeUdbRMXwJRYg/Qyq9XURXs0Mnw7B+QAvPny4hLQLXI8DrG6WY0y57Le4UH4PsJg8ywe4aHQCZ9htgtDExfcXYpt58Biok7QBf1rR7O4m0ujJjq8N2+1tdE8ScVpQlhQ8KJqNZKtLKu6hZ1aGDVKJC/2G8r/6tYe7rwH4n7ge9XA50h7E/GDeZIqY6+icMC+rhlMmDUC3gxf589MSJRzxNwtCsbA0GS+SZRb916Y2UkYlVt7BZkT0W9eYO2+NmTqvewowwgHF4/uIlQnTNJmQp4zeFPE45RCjs48ppTRwAxzcJTN7m7ao2unhPgP+ehWvFN/RwoO/lKLl0j5Kq28w383REpemnERmtS6scN397nqv9+KOrzUw7f+MNAls95Mmc0Urh0BbaEdHNuVGhKWoKkfFod++y5Y0tFP+ZgdiFk/iJOmD/O1a0dDnk+X3Alv6Ln5j5fnbpNPRjH1DusThFUqpWUCbilNwsDrAgpHk6ca+8g1iLhIXBR2H8YbL99Q90d8UikqxVWvckNkuQSWqqiLQPBvrlty61CpFxDsz6+Hm/SNM8nY7wFHbNE3dcR8d3KyyWg5yoRQ2H7wyudxg1zIzOLj/RVNj9uI4hWoz1U2fejNtGQnBsLxBn1wGqQmIC6CdOlXW6/NT/XBqteSMfOtjhVT8EvoAPwD6gAPlu4naGRJqq1o4W2UUUq0UPA5WsnjSzrzeyNSM5NPY10BoznptRmkaQnTA4cpUP5vJQfMsJnsi/bKNI0zU90pLzJnm7H4gpGghoHoFqHvwKzxNBoNHUtRhsx9lqglTyqr3lk6bepRir/oxigXbTF+UDWXt2j3TdF9vlB+kThE7veNhYYTW7aiPGpkHmp0VeQDsBQ1MHLj9XEl9bAYSTzTubB15QN612JaXB4rSBEyO7kQqPlt3r6JIdcn7WHnt+6U2CtwqqBrnULLpCEsuvRY4rqIM6PGbtZP5etD+6dkqid9FJP++7wUVunZqwtAJQnGizhWowu3dc+t1m989H47MDjPdbKH0veABPSSFJBovD3L6kUlB+dLNhCimojN6CvpTtm8KWnBKQcXU7w8rElE5T3svoKBY97v884sRumWhzcvaMLVxUYVDIOhrhu19NuQbD8KYNz/nzt1+DET1bBMSjqPNXyE70SWzOh1Qy0ZRqku9O15eMsJWUe5JmTEtVswF4jG1Igjml654v9QXW9x+YkcbdoV2Dm07xEKKFoLWy6yRMRf1j8nnEZfrZpU1Tg6gfHKx4EHeMUFcpJXaAyWaEDJi8XCubvSwMzEK2KOKvvF+fzVxPm3hLajF4DAf51cBF8vDGcVl7aYy5crwJM4lVgLDO5NLJPC/HTgS2+S0pn+wpdmIils70ONLR94EBUkJUE4ShbsXnQgeU9/lr6Ydco7ZN3lWv67+5o8Ado4YO8IyVlN4RWfzt51XlRyRMFZkBYHSZta4SM8Ju6TOLgN4nm+dOA0ac3fwF2uxVXtIc40KIO9b+i0LR9CSdxPOxCjsfBQV19MiR+Rm6eHaG3nPS</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5Lpya5pYlEWWAacedGhSUOcnBzhfm6nzKORfUzKv201cW6jl/FmlybIcfGvAuN3l0IR3RWRzC1/mf3443p57/LAljrLg4nytmJB+8HUug5wJkVA==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxfKooGa3ASOCQ6gSZDzgGMclxZhxo95bo0luH+UDPM32IAcC1yQb+YmBf2o3sMSlSdBJdqC1kNzcdq/EWKCFefCmJXHc803gIMcQsW7nWuBDA==</Encrypted>]]>
      &APVSetReadOnlyFields;
      &APVHandleStatus;
      &VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>
      &ScriptScatterVoucher;
      &APVSetReadOnlyFields;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4btXzG00c5aWmpYfnDs8E1LoKsESW3fWsGFRjx9Wdn79R1U4lbzFGnKYbrI43rVxHw==</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVpcm33CbYspUl2iSbOE17851TWgxRmgfnQKlvNRAdsTtQ==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezulZE5MrqREsfGJv53i8AS1k1aZ8fTY2UcyekNbcbWEzTdyxa4h4F5sYL9yr/z1rYuEtLoL2Q6uo5i11Qp1cu9c53fYrPpuGYd+KOLI2jMG8=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UkyML8OU9Vm+C05wYc54p6z6L6KitpBA61nxTxkORMtF3hTD7th5MHrh8wMLdOt69FWkIo9K63pJNMNrabLaHGfD7XYHEq2DHqfv7Xxr1ul2iF62/tvylFUNYv0dJTLF2ragY716WzeiLEeLpB2rNI=</Encrypted>]]>
      &APVAddStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QEAUk/EKgKcaijFMxLq3AY5+Bcn2EZj5lMgHJyhGT7ujPXSbcy1AFbfmQcNT9egK+8wBVOw9HiFcIktkgJbeGZmYE8Hpkx4GjtpBj0RuOsxFRj1XTUYX1OMZVCO2EGiCE5hnd7g5vjJuy1osjyr9ZU9YGU2g+g0H49fGFbT7f+FxQ3ABE9VnT/mPEOdZMeJFF/a731M1EtZGAPRyYDN6W8nY/Nb/wT/pbcw02jokn3pQ5yvlMtdhnkuCz0W/dAbNP5WyauS6E3y0zG3eqmI9PMGn/KDOzmWzLLfvbL3U7W4m3QcFnNbjUvd9EcPh1IFqQ7+9Pxp5MRHx4HJCdUumhQJ0MEUWG39VcOg7mgXDuINJEmnilfOPCXFGV8DNQN+l4m2vuPQyT6XQ5LuZhkH7fMMdFnzZHfx9UByNFm1zyumVsXEXi2/KDGJ2pWvUl6Igbgm5+Bc1GjuRvdAYqS81EdoLj1XURA/cpbj3gZ8zDcZYRyPIK8N9Gy80jCPxhtLxbvdSQWpvCsdOb+HOTKeUQRgqXjwx0NfnKvZPkdhsd9jq1cpYn0ZC3kfdq2L4iLMAh7z/FL0qii6QjTobSac06uDrzl4+pgK27FVCu9v6L+/DE39QvFnGyknCyv10DvIfw==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOqrj2mNavAf9/4ESLwuki8rNCpT5ADX8tlu1K8odc9nSltsMzNf94IlTvA8oNzZ8EBGXfSI0YguhkdHDOtdUuJRYG74YJk6J71SWD+eZOJod3VzmEFhCSAIBwTao0EfMps=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/78z74QKqtVFGvyePhBURfrOEhTcLd0hUCJ7VU7OICgf2f</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKE0xmxIS/IwUrY0xOBnj6Ev66nf+k4JpfvRIOcTp9jzaGkXbBsSj9WmWWiFJWPT9zc=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/78/v079NAbfKLY/u+/uESrrqeyud/yhMUK79nbLH/nAbp</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGNr30plX9FPZBHE9HSHSEedonK8jF5r2rjA50iJB36H4wHuycTl22J52CnJ8hWiBy8WHLcBQ34AXf1plrCJdHd1fpBbaYZls1r5pUa02POqi0NVmuPSgBL21zGM3GVlBEso5+YN0eAB/WbOsSgSOo3BOpP9CE6gKyxge1aPsLa47bxAh9dsKzJcXBLO6jp+8ye3ZzW2mZRgOPQVttT4OwXISeaFFS8Bm3LsMvAjo5EZ7NQA4p3Wa3vkAIPwM4aeNkQ=</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;
      &APVSetVoucherDefaultValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &APVSetVoucherDefaultValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VGALXfw3Kc8Kk3w3FYNtHC0mvevEviHCNElxwFxOJA8</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dJgeUcGBXK6zcr2MH4Yp6dQE5CUfWxJ1aqyjnDiCVZy</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bKIhWweCxWZdCRwT1MjxMlqfKbKtWmGpCidRoPiue+j4tOlbJqkwd6smIvwi+4tlBbiTfN3SU64R+5DlInfqulaROh5+/P8wT/F1Q+bo4hw1PMSUd5ERY57WXuEwFcVRTfvOHTAHxBsdd5wFeEsG19uNG5L+C6L1IZs7/Cf04MHnumqMfphyJXnXgDDcszjQykAnONERReLi5RmW9r/lBI0jb4rIOqHnv7cVVYQVYaeYKGqjBOaqwromvjFCzBT8wttnH1zThcv9BYS442fkAw=</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWfC7CbSR76p13NSPM4d6wzh63H2qvzWywhAyyzfRxHRuJU0mwZmqEfodLxbvu3ERYhLUwFPO2tjFuDVQ8ob/03fX7VrH3BC/yjKnnPAUH4RUaKJYlEctiUac7UP+TspOvoOpvzdzu0uJPzY8OZkCdaJrVbFMhE0qgkc++M5t99a3T0H+v02r5Azgx3N/O61JyBHuoj7bS3rbh9rjkarT7pO0vMQlxqwTfSsp8TBQNLLpjKZTaHcj56KCOgNad7LxXjW8ycfLEboCFZGDzx5XqFbzsebgXBYKvX1MC3yeKNnWs10TnR9szLuMFU27MBrDPoV+8pXlC8Aq5vNmqrE2395URLq2HjPZKwKfY/+rxozvmiu+b/lvKGWo83zQqmLaGZagDuQ6QiU4RjhZ8NkDC5J6ELoGmyI2OURo1FPHF0t4RrYCXgyBYBLIXKjS6VDGEGgutD0FGt/GQYA/m1MF57aPY9leSWVX6+Iy22xFb7HJLq5SO2/f6OLjFQxC3DC6cfovQqSFMC9zqvzYTS3hSESwhTJRIHd6ZJXKaRs3i0fuMWPOtsbq/zQcJs6QNRkAiQ==</Encrypted>]]>&APVWhenVoucherCopying;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TgUTPZ2dcLCXC0JLs+ueAI=</Encrypted>]]>
      &APVFunctionScript;
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    <action id="Customer">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqapXv2dF/zPQRP5o3OalCwddkebjQuEWIiRC7gMr70mJ9Mw2uKvUnc2eR0XJ/FCLpr3NWnsv3LQ2DEJcqC74Mvzv3xHSdJ8+4kNwfURF+0O79wloZw4kGjH3x9moW0uXa1J5EOiO1RaB/KZP28EZpDIHmmd98L4FF9Vx3nBXiBgJFfQu3262ZiPtvqbJ0aixGhI0AMqo4BEG41dLM1azolaA==</Encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLoOpiCbdYv/LJHRk0UatSDVEBwhcTw44AVXXdh82eyGhoQnGgfDIRxuqcwBHMrSrUqIBNfNsiHXjHiu/YCXsBH2vzjYGtDnaSAABShAuID2</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&GpJqMZPqq5Hgc8e6bnuAr+cLr8CvCSXV5rYectoWj+DMR0gUf5DkFviRWEg8AiCkMU90AQSyRiwSV05HpJxKuw==</Encrypted>]]>
    </text>
  </css>
</dir>