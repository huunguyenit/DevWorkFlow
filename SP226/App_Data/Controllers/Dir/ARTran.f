<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY % CheckSerialNumber SYSTEM "..\Include\CheckSerialNumber.ent">
  %CheckSerialNumber;

  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLGetTaxRate SYSTEM "..\Include\XML\GetCreditTaxRate.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\CheckSerialNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandExternalFieldDeclare SYSTEM "..\Include\Command\ExternalFieldDeclare.txt">
  <!ENTITY CommandExternalFieldSelect SYSTEM "..\Include\Command\ExternalFieldSelect.txt">
  <!ENTITY CommandExternalFieldSet SYSTEM "..\Include\Command\ExternalVoucherFieldAssign.txt">
  <!ENTITY CommandExternalFieldQuery SYSTEM "..\Include\Command\ExternalVoucherFieldQuery.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherDate.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">
  <!ENTITY BeforeUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\BeforeUpdateCurrentCustomerBalance.txt">
  <!ENTITY AfterUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\AfterUpdateCurrentCustomerBalance.txt">

  <!ENTITY % DownPayment SYSTEM "..\Include\DownPayment.ent">
  %DownPayment;

  <!ENTITY % Invoice SYSTEM "..\Include\Invoice.ent">
  %Invoice;
  <!ENTITY EICheckTable SYSTEM "..\Include\Command\EIEditCheckTableARTran.txt">
  <!ENTITY EICheckDetailFieldName "d21">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY % Export SYSTEM "..\Include\Export.ent">
  %Export;

  <!ENTITY % ResetCustInfo SYSTEM "..\Include\ResetCustInfo.ent">
  %ResetCustInfo;

  <!ENTITY f "&ExportQueryFields;, rtrim(ten_kh) as ten_khthue, rtrim(dia_chi) as dia_chithue, rtrim(ma_so_thue) as ma_so_thue, isnull(@listNo, '') as so_bk, @listDate as ngay_bk">
  <!ENTITY h1 "769">
  <!ENTITY h2 "120">
  <!ENTITY g "ARDownPayment">
  <!ENTITY i "4">
  <!ENTITY Tag "21">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCV6+rUgNmEsUNZ02j6kVZ76fInDJURFA88CZAX/U3FU52Wfq0dqa8JMr6iLvSKocTDMhW3/qr9Dow55SS5bGU6w==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG0zXlmT/X5o5sHm3fx0wwsjNfmt4fDaLNEjyFUIXEPNQceZl51EUAHanM0qDvOa2Jdfi8wz4YCxErwCN7gkuoyTAmWuCWB4INidmGYvYmu5igA1UWAVunyXARwbG0jjbf7dX6LtuJQwKaOBMmx0Iw3hFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiaHofGFJpbS3YoWGP8IosdaXsHVY4LAwQvxqstZPFyVa8fOE3+ActJA30mwTa9B845dyrRversQvB7x7Fp2/IKzka9UFN3tzIwJwDvMSNuyIy3tcIvlsH9Y9Wb0XrMfJRE/8ZsJuGvFcdh5jcA8BHUern5RPsOEq/3aAdO3i2mCtQlQgFQa+paPytclAs/DquFdcDpYSx2wAyMUjSJXZ3RxbpDQv1GlEAFFt+mh3YbU7haB9Try4EfTBuJsv88H00nI2esd4r0Cj8GO+0sYHX9bUl39JYZV7I6t1/GjChZ2cOrSKBKkvyYg91rK97yz+msudNsU5XT/5HPSTB43Ry9LQ6zatjmYyhpJ+bx3hGFAlZxAfOQRTzKsy/iuD0PTYDunvgCbHT0S0TlCx3XuPvftyoriD6at5QbH2CuYmB9RLpqJBNtCoNUTP2IpXFB1oVw==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8iZU1ghRPCaDyQwgcCkCLcSSSfkrwNEfbFRoil3mgt2+sDJ1qFNcwsIVQnoTX/YxbL15dVdoc8jXJuo+l0GobDEg3l9P4Cz891VF4Dyl+OOq67JDarWgdoQlrq02rSIRow==FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaXJ/UdJafklGWFI7vbXICXEELthRMiruRCyAZOvQCquFYCGXtFPpX2xKhny+iEIzcQ=FastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22aGIq/tl9AJXl2nDyZJ2TSsRImomVT2hriNrratcT+tPWI2okEpwye7BNQdboStzaA==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUe+JXsHX0DRDgaqo9U1LkkgRDncCPEmvkPONQ3Xqt8l5vYYkuA82+TOuKRHfbTd1JZpcIVZztLf2fCGd9iXUtEY=FastBusiness.Encryption.End">
  

  <!ENTITY CheckTaxCodeCondition "@$ma_so_thue &lt;&gt; ''">
  <!ENTITY CheckTaxCodeConditionByVAT "">
  <!ENTITY CheckTaxCodeFieldValue "@$ma_so_thue">
  <!ENTITY CheckTaxCodeTableValue "default">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.ARTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m21$000000" code="stt_rec" order="ngay_ct, so_ct" id="HD1" type="Voucher" uniKey="true" replication="3" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hóa đơn" e="Invoice"></title>
  <partition table="c21$000000" prime="m21$" inquiry="i21$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(kh_yn = 1 or nv_yn = 1) and status = '1'" check="kh_yn = 1  or nv_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người mua" e="Buyer"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6oCvCyvGNeTkvFCI1bz32ZJ8lXhThkCwWNnPFWt5zZ3A==</Encrypted>]]></clientScript>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5YY8x8nj+VPSBWZl5VU0MqAtjYlrQnM+K2orqWBPqy4nMR5Ji5T20Sn7ludWMuH8U=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_tt">
      <header v="Mã thanh toán" e="Credit Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Invoice Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
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

    <field name="status" inactivate="true" clientDefault="2">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Chuyển KTTH" e="1. Release Later"/>
        </item>
        <item value="2">
          <text v="2. Chuyển sổ cái" e="2. Release"/>
        </item>
        &CancelStatusItem;
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d21" allowNulls="false" external="true" clientDefault="0" defaultValue="0"  rows="&h2;" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="ARDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &ExportFields;

    <field name="tk_thue_no" allowNulls="false" categoryIndex="-1">
      <header v="Tk đối ứng thuế" e="Corr. Tax Account"></header>
      <footer v="&lt;u&gt;T&lt;/u&gt;k đối ứng thuế" e="Corr. &lt;u&gt;T&lt;/u&gt;ax Account"></footer>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
    </field>
    <field name="ten_tk_thue_no%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>

    <field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" disabled="true" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" disabled="true" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_nvbh">
      <header v="Nv bán hàng" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1 = 1" information="ma_nvbh$dmnvbh.ten_nvbh%l"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="18">
      <header v="" e=""></header>
    </field>

    &DPFields;
    &EIFields;

    <field name="ten_khthue" external="true" defaultValue="''" categoryIndex="18" maxLength="-106" allowContain="true">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dia_chithue" external="true" defaultValue="''" categoryIndex="18"  maxLength="-107" allowContain="true">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ma_so_thue" external="true" defaultValue="''" categoryIndex="18"  maxLength="-108" dataFormatString="@upperCaseFormat" allowContain="true">
      <header v="Mã số thuế" e="Tax Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_vtthue" categoryIndex="18">
      <header v="Nhóm hàng" e="Item Group"></header>
    </field>
    <field name="ghi_chuthue" categoryIndex="18">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="t_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền chiết khấu" e="Discount Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="so_bk" dataFormatString="@upperCaseFormat" align="right" external="true" defaultValue="''" allowContain="true" maxLength="32" categoryIndex="18">
      <header v="Số bảng kê" e="List Number"></header>
      <items style="Mask"></items>
    </field>
    <field name="ngay_bk" type="DateTime" dataFormatString="@datetimeFormat" external="true" defaultValue="null" allowContain="true" categoryIndex="18">
      <header v="Ngày bảng kê" e="List Date"></header>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="180" anchor="6" split="10">
      <item value="100, 100, 9, 120, 100, 0, 0, 8, 100, 8, 58, 42, 8, 100, 0"/>
      <item value="111000000-10011: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="11--------10011: [ong_ba].Label, [ong_ba], [so_seri].Label, [so_seri], [stt_rec]"/>
      <item value="111000000-1001-: [tk].Label, [tk], [ten_tk%l], [ngay_lct].Label, [ngay_lct]"/>
      <item value="111000000-1001-: [ma_tt].Label, [ma_tt], [ten_tt%l], [ngay_ct].Label, [ngay_ct]"/>
      <item value="111000000-11011: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l], [ty_gia].Label, [ma_nt], [ty_gia], [ma_dvcs]"/>
      <item value="110000000-11001: [dien_giai].Label, [dien_giai], [status].Label, [status], [cookie]"/>

      <item value="1: [d21]"/>

      &ExportViews;

      <item value="--------1-10-1-: [t_tien2].Label, [t_tien_nt2], [t_tien2]"/>
      <item value="--------1-10-1-: [t_ck_nt].Label, [t_ck_nt], [t_ck]"/>
      <item value="---11---1-10-11: [tk_thue_no].Footer, [tk_thue_no], [t_thue_nt].Label, [t_thue_nt], [t_thue], [ten_tk_thue_no%l]"/>
      <item value="--------1-10-1-: [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

      &DPViews;
      &EIViews;

      <item value="110000000-1001: [ten_khthue].Label, [ten_khthue], [so_bk].Label, [so_bk]"/>
      <item value="110000000-1001: [dia_chithue].Label, [dia_chithue], [ngay_bk].Label, [ngay_bk]"/>
      <item value="110000000------: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="110000000------: [ten_vtthue].Label, [ten_vtthue]"/>
      <item value="110000000------: [ghi_chuthue].Label, [ghi_chuthue]"/>

      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="&h1;" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ExportCategory;
        &DPCategory;

        &EICategory;
        &ListCategory;
        &PostCategory;

        <category index="18" columns="100, 100, 9, 120, 100, 0, 0, 8, 100, 8, 58, 42, 8, 100, 0" anchor="6" split="10">
          <header v="Khác" e="Other"/>
        </category>
        <category index="-1" columns="100, 100, 9, 120, 100, 0, 0, 8, 100, 8, 58, 42, 8, 100, 0" anchor="3">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvmS7r3TUtKesc3VsMI1KRQsWlKTthVu1c+eXBGMk3bMKGzF8UsdqrsQD94Kz9tLzQEC0Cwxg8cuP8Zcehii6ODa68+C7SFHBSrV6r2v87Rl3w==</Encrypted>]]>&ExportLoading;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIGzyZwz0KhxdFricfLVUPUmUIF8nIVt3pVcxezXDrOjeE1gjBueMW6yg9HT8Ef4pat00jlTeiPdowIEyhdRdjDemRc5ADZ9M6TlQzDI27lGk3pa07Gl/5smBI+TfxgVcOgTLOX/mD3c79iFoXvqdtI=</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafSLs0bO1HJIAvHofjlKwNLC2nqFC9hyhHLDsh2EA2qeCz0wR5wFxh+Luqqx6wHd5BNpRNEfoTLTQ3Y1VpRlKZS6iixJu6zgvPTCWcRsZtZG2FU/8n7ZsD/zN9Sr8O0nnskUrLL1TUYhngN5GDKRLrm4=</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        &EIWhenBeforeEdit;
        &DPLoading;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        &EIWhenBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4ILkrc5td6coOlL4TCAsKtjy</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWd6HaL1OGauusRtQb6bqs07xG6Qjwkz8N1z0TqPoMU5IOlv0VNmfSmz2fJupDIgQPHcyrEc/MDAnl/EJMeQsIbm</Encrypted>]]>
        &CommandExternalFieldSet;

        &ExportInitExternalFields;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMux95gNn3/hU/ujKcCYTskUP/Z+oz9NUb1tiZp3Lv3E+fktvgy/MbGRoUWTN1Us5lneeDtGMYOhEGGNhMLkK13pPzhG9LPDLhVWzJ2Mmr5aX/IhcIj/7sm8GNUAW7eFjoE/HdSGGQp2YxRtr/ihdsXmo=</Encrypted>]]>
        &EIInitExternalFieldsSet;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm41hXZtDtU3F53wv8d+v8geKADiMakiKMHs1Tp3BPgO5UpwnR1b0f7M0JXhp9u793c=</Encrypted>]]>&CommandExternalFieldQuery;&f;&EIInitExternalFields;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5J2b7GTHk2/3HCNfXlIXpB0X8o3to6rrq+ToZiGRGjMQl6LhH2+6NonOIoBd2cpGRQ==</Encrypted>]]>&CommandExternalFieldQuery;&f;&EIInitExternalFields;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5AKAw9c3UFooEwlECRp/GSBdL+q0MqVmYh5qqori5Qf55SfH/AKlP7o6yaqAvop2x/PwG/bRSoRdGcn4c/xIpic=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        &CheckTaxCodeDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbedeqtOW6CN+2gPgsxH1O32bKDbUiZL+vhz0uMlM7E48pkNeuM0locPGyJGeIvJzTXI/hkY9xltIjF6M5+mMb2JlfNQdIpEipr5+ZbNhyggKaL/uMnj29zGfat36p5qqugVQ5uJh61r7IaXHAy2jTOxxj4FhaGpoaIKhkeVmGqsg+mdC38ewhy1A/XUlKvsad31sy1txFNTbMnmf7/SIPAMyVCLhSEmhZx4D0khB8UZbqdSN1Z901JeyS38hen2f2nzNgAAxxA1XCHaognQ4Vv9dgwqhFKa2B4JhCzf4DDtZcYGXfl5/sY8L+9OQaQnc7lSgWGo39snBqfn89FD5YZugU5EGG6t9LrGY1CBxSmwqWVTU1IFgYFU4lsP2B5KE7</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &EIWhenBeforeInsert;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxVMx1846CkzxbSU4gmbG9yqdRZoJBzemZMYFJrYwsjqlh2FrHVpf/K47CIBe+8i1ofxinvbUY+YF02ZxDM2L9e+IVCDxySdrdh2BYvTFl2UtYbvpxI840ih+SQZ4kre+bE9C5Z7rAJ0q6Pta0dhilkw==</Encrypted>]]>
        &DPWhenBeforeInsert;
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIgFsRHhsiDwwtKZ5YNocdGDNskOGGz8mtQ4yFljYqFpAxFMo5lji+RwZplWOUDlmLVV/epHMf4COynmQdWPLSJVlweGwWUPWg5Rzl2dSm0sGeoaa3mjnIrfX6qoshGqh/pzAswLAj6aQcP+QCbERDSmSeLqA8bmaVurca2/67c9cv/7uLc0Vaz9TcyNQ1ghqRzHa/1Gdukh12hdVpf/P08=</Encrypted>]]>
        &ExportInsert;
        &DPPostInsert;
        &EIPostInsert;
        &AfterUpdate;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34JmodDlEVwoSSM8lPeIilp5rykxi1xP8tCTX0t8Ctu4cOsjPaH2SZ/u+e+TIYb8Dac=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &EIWhenBeforeUpdate;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6+gKVSHKTYLEnzobjFJwLlwklAhAgHwpAHDkx315UYnof0d7GkeMZ1ry1e+ZQwZhbDCq4izAzsCg+FxAjFr0zT9aQDuHNdMj3z2kzLZKmbHHoH64ZXaJeCXfTXFL/yS9Y=</Encrypted>]]>&EIWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku00xzPXqUd/Hu8Od5aN4M5yMoVuIYNB3FZ6UbJyYl6o5v/3ICjyBP2e6In7d75k9KxePzgiU4xEjMsxXVcstaWDsT8D9HbrAjgKxUT7/arS6E4tUQPt6XioF7GkMIKbIdIpOgsg5hu6+2eLrM3L5rNJ+FYKIwDSFJCggAmy2+QhEOu+tFj4I1qu7qvnAQKhcfhbrrL+Nn1fttiWxC6aXUgU=</Encrypted>]]>
        &DPWhenBeforeUpdate;
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UZVmIm/7zMJc5BgNBzFCSYwA+4czsLeOaN+xQtFraf4/qPSMJW8yhzfk7OqeuWExXGAyHJI4Q4Kjyua0d6p8Y7oG1+8aba4rDyjnIEtZtD8bXTfwP8d8lal2nTuGwfECOcaw5Q69dIxdzhWUv57B7YJx/ldstyidjgPaZWQGrOORvbdWB45p4c50lB7huSaZi9378nWyo32rsNOE/Uhis1waHgC2ztZ6w6GTTigo3yVKZx8ZrX0dZlYxGgSA6XIVjzWQYc4dRJjB0VxRSWonr7B8rJB0MyxIji1CEJU02BS+qNxp100yzylLxqBSB77Xc3bTubJTI9o86vUzc1VhJtoxiDW35g9vb8RduzL/lkVAjioIqH4/NoScagxl3W7wgSx19gRCsUnM4GPazAAvvcZnm+meQti/sdhE0Wrdw5F</Encrypted>]]>
        &ExportUpdate;
        &DPPostUpdate;
        &EIPostUpdate;
        &PrintPostUpdate;
        &AfterUpdate;
        &Delete;
        &Post;
        &EIEditUpdateAfterPost;
        &AfterUpdateCurrentCustomerBalance;
        &EndUpdatedVoucherNumber;
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &EIWhenBeforeDelete;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6+gKVSHKTYLEnzobjFJwLlwklAhAgHwpAHDkx315UYnsOgem/fX7147WxJnjBDFWDxHyF4FrtkHNnyZvO6Ceggogp5ETItKfBw+c34Qz2ZpEMXANH/t/8JcQIE4wxqzXYD87K5QiYNgQR8Kcy6YL72</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0CE7nak2OvPS50roX1NfblJQedj1RzaFKs8VA34X//DUFkhMM3KuxMXbWKgT4T6YYGneCQVBQUqEo6oj9QP9zc1RBVR/wY/uNLcFzpBqI12</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxgwdqXVLROh1A5Xdi6K25Uv11LN+fX7W7xMnAmgvPHuMi4T4F+2q7Xwbj567N3pY3iPb1CgcVyvfSq82SHOouw=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxcL2ICQ5VtmpNrpmyf+nmKszjHg3UUYUV9+oOJ8xro862r5GHGambguQ/TJqZ98ng==</Encrypted>]]>
        &ExportDelete;
        &DPPostDelete;
        &EIPostDelete;
        &PrintPostDelete;
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkCWC1lbyXQU/cRhvaeUBzByP8WQXmu9CPPoTRbxG4d1CWY2scQ4b9z52cVRFymfpZ6orydtB732zK8c/3yRTS3T</Encrypted>]]>
        &ListChecking;
        &PostChecking;
        &DPCheck;
        &EISetAuthentication;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpWhQoUpad73yGdQDMg5nLt1K4cGdln6SF1SuZSG7epIY/7tpV4cywc7RHgVAY8mbV3a5YJC8bBh91x5DFLb6nQg==</Encrypted>]]>&ScriptActiveVoucher;&ExportActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cu4ihFzjsEMULxf8NNqEHIOLnX3gLXrzxwyDQdLlP9vN5ADTtfhMzMLsap0PKh4SAzYvl2a8drLp+MQS4yphVt4RGVzvbXJYGh7sP0RPZJwYnOZ8aZdqsHzWwDZmG2qIrQnVDg7Ea8FAsISeeNvi+WSsrWTv8D523R+cPwWvE/pHANpt354elnhWJBvq4berupKhGmDfVYaJfZTmuwLeNg=</Encrypted>]]>&Tag;<![CDATA[<Encrypted>&ymPgYPXvzpL6Enqd4IDunK7pnavP1dtf6Ucf1UiCVptIL4FS2488MrmiXHf3zC71JHDntnHoYvoR/Gz0FCpVn060+IhIeB0abkFc1NLfbMgEx+1uATrU/SHNVFQJWeQYXgy8i9EjcILV0Y593r+NWkuKZ6fQQpyaoXTytLhiOjoOfgQv6wL5U+jDbeWbAobw</Encrypted>]]>
      &EISetFieldsReadOnly;&EISetFormButtonEdit;&VoucherLogHandleStatus;&CancelStatusDefault;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;<![CDATA[<Encrypted>&uGHO1INig/bVVI9tiETWT93juS17Eg3zeL5+cw5rKOgKM1T/9q05Y12zCAccNesAwLWkAfehalQZ17gFxltWUuinyyGCwpsFSe5/s8ihVhaGLymQeY1z4pUWl08v3Fnx</Encrypted>]]>
      &EISetFieldsReadOnly;&EISetFormButtonEdit;&VoucherLogHandleStatus;&CancelStatusDefault;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVpcm33CbYspUl2iSbOE17851TWgxRmgfnQKlvNRAdsTtQ==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4U0qjLJlGlJJEgaKQfS7mThjrM4LNwgRV5LRSNQwiV++dZLszdHmEpdlkbiAjQb9GGc4YJ00ySCLCslMplQ2LpE30F8x1n4TqrVYB+nXhzH2IQsZ60BQ7jfgvmrzTN2QurO1/dcY7XStp2fADINT4u8HurSb7CXgsUdd3kCX5UJpE8UI9Fcx7SOIgVIbKNYT1g==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezG5b40RXvyaPad0IBgTF3feOegC1SNbjtlNrUDLNhkQuJHeccrN9XVBYnzvuQyrRHHHAR/uJev7HZOfl1rpJLwr1409tI/xCW60sw5/57piMOGpifWL5/6VUm/rFO+uNUz7ZtpIsWsgvuINfMroYk95Zkgf+TRH3+xpIoloyeTqZDorUUvS/mOgT9dy0iBRVNpz14VsdgliPpcIlj3A9vp+1vg1mxK+SaaiXykEl7JDQ=</Encrypted>]]>&CancelStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwXUnCUx92M6SraZTlzb/zxXRpZLTWY0UXHO4HbXc/4ubv6Ir7z+4YTJEMszAh7ViRDC+I8f7QUmusbJN19gA78Sn2R+Qyw4VQ5fQ+PdweDD3tU+dEHFaYXY19O8R5GYR2FSqLIICr456pO96x3OKE3U21zgUyVutJO1spshTpDLnH3gZkvP+Ijnd5d3wRim1Tr+7Nek8Ozh1CFzm1qJ/gi</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7DpZ08qIx6gjDSaWiHtki5ldjLEeFtQKqvlNN8Q5Zj7RN5unVoMzzXUYtORbVYyMpD+bzINQ0kR09ZXfpKrIj2FQlF8AsycmR8EADS2+JR/s7XXcTHD9yVSxkXvaNiYbsJTQ3d3X+LSYy8qCbkDHdwHKdpUVvh7DJ3p8BHgInwZ3lZBERG4kx/wDcfoFoe0VRTJqNzfYkLRsGOwkhZqObHMLvI+U55vZy6CPWW3v/0Oh43jIzcvGzbfp40tIVOQMqTb1OlegwWjzx0evMyHqwQpWXwDCEkjWpm4D4Aey6XeuB02ga5rkwrZrkmKnYf2ANRrLhKkqhP9yTpBdzBsuASw8rIVBrfIfKWKFLLzBHo1qA5Djd18hRlDvEgBf6mX9VIx0OuIki6QbfGyEFPo/iA8jLWWYr51o95mzgrvmD5dzsAEyzFbJAwkfcxxUghIcByJNQKRwnVD+bAYIRJMMNiS3NU6hZe8U9yqyeRHtBbfg85Q3UvXe3CgWkdUCLgBcBdOgm6IDAMRSU87ZnGjAYMLEw/NGhFqayxqoob5NJ1jGQ==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WqhhHt/k272dUS65C1dUznfsK8O1i7YrIRWWjQj+LFyNU9/Skv5zH8r5MJZRKUxcBjog5tL2rJcDM9sIZ0oCIaTKwqIpot2dttgArKWiIJp/1C+dGT//BLKcuMexgVdUZirQV3dQ29C9KELQqRK6yjA==</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bCbV013qAsGS952fSWRPoyvxzwp1hEiCaaUXqlSMSnMTosl6yfsWYBEFYY+Wckqf/UZKTNQRu29rVHxYHRERyZ8GN0JQkdSU+RHCAYlav5m</Encrypted>]]>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxCLoaf4Gmwgn2t2ySyEa/mzMl9HG9cONPRVOw12BsUxvRHPi0ih0GUsR/9ktVk8BX</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyrbHcGKgLQlHwzG9OeaJurRpUxtRpsiU/VasauyUSukxmngDxxf8AXabWmNf8zC7Qe/kI0vwIUUsOKhHc1gpLHUC7tofdRB+Ern8f30hVIvFrqI8ihOL7fFXW4UYhPko35Wf744iCQzzNlacAgPPD0g=</Encrypted>]]>&ExportFocusVoucherTab;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UZqpfc5fQD2KVG4MRowswM0biNzn7Lx4077THpKT4cR5CRcTkRPt45eCVYD90h4swBscQH6QiSsINzj18558hG3axkx5bV2nxCGcJHE5Shm5LiP+JqrhIp1RdujCnsbzQ==</Encrypted>]]>&ListTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4U+qAd8gO4wvvAG+qT02v10OGZUQib1vGOK5hRJMlWV+5NyQdbcM4Rq24jIRYRaRyYo5coFLUhiUoe9c2jZ04D7xXwMjStfzRI1Ndq4a6g4ktvvrFzfwJUO4NCMBUEGzy2LnXDfOh2iDDSZpnB2po6KY/baEuaWZGhyJI3ga/zuibMBZH0ZV2BSPHfWaPivlwD2P3Uv37B6DYZg5zGIsUo6cku5RO/HpCpjeJQdtN8959BKGt9Uma82+WZ76Ndf/Anh3C5YMK9EGA3BLbJLV+yxz5xIMS2UjrEadPKOFOPfSluFvzheDOu3exeEKkCnR5JQrkv6SRBlYtB+4FlwcXfNq+gEHParYDUuzSSFmQgzm7roW3IaGDC6HI54AF3cqiw==</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUvZmfczXew2oSmKnIQDL8ph717iTKpoHyZD5ZilsKk/+0Qc7dz6Pyf4t3l4NvUh/aUAatTS0ZXgrYNCwEntIT/rjl4zut0mpIoGHvod5AfHo=</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnHbA4YAJEqzrz9Hpu+T+EzaIpzHVGnm9rnq9+JkGfjc/KN5i3ZGJ72FUOleoxPLAfoHhz70F1gSGXTdDxJCDFgupvHB+PUWSWm6PA0o4aGSNg==</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnEDcDukUN/hhijYpK0hqJham6DgHdAcwTU0Ba+ysbyKdE5OACRJifcesgHWxU1tEM4yuFSL/LEXjFtbxD/5jCYN</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnHYX8vcRkjNxUSY9iS3GCreMtTC9+OTX6VS3jWqv8FM8ix+LI4lvkPdXJoIH2JREmKhwuLPexQoQAFsDWlE3kBC</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnEKbQfob9VqeUf10BPNsmWB8QNOaevrqmZ18VPfdIEE95bAhQagVFmjCHwGkO32jgGBo0pGvk3ung8PxRzNHw5B</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyR2stLfIV4JzBhdcb3jrxTQ=</Encrypted>]]>&EICustomerResponseComplete;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Z1zODGtJ33Gpb+V+wQ57sV3WKyJOksGno2j8vPcBHXEUW7+LS3QPgTOv3/8fiN3vqh6iw50CNgWjmucTEF2kn9BbVl3CPVr8i5VzFazALE8X8/8wsL1jNdEkGegRSthsf7SY7u4V/ZsM+8YWiBN00GXKyOB5cwXTtfdPImY/EJB</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=</Encrypted>]]>&EIResponseCompleteChecking;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZa8L384PUkg/4jpaczSTZ5aF4A/eQkAQqWsIx+wI7joA==</Encrypted>]]>
      &DPScript;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqasGeVT4hdwXxKLMtBGRilJ58tH7ZwMGvU44TYTVI8+F8vPhS5lLt7k6XT2IoXdCWeJ37Qbt42J+K4NzaaEIgwgQ==</Encrypted>]]>&EICustomerResponseExists;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4anGmzLKQnuNqtSxOBqkpbpl2ErVOwttbA0Y5nr/YXrnx7esI+QUC5Y0OPGMaquC8tph/WdSshi9Q70kFe+II3AYKXpcKUMiZKg603NC827bhkDOKcqAnKENHVtI/zeqX3bgfx5Hldaaza1ocfwQIqg/3IT65TRJxMnzoucIzb6/</Encrypted>]]>&EICustomerResponseValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Rl6rnBdXhs/O4KhrfS0vekNrZjHqubvjrt97/i55Id9s1Z43JvGF8FvLnQBXNvuMsLLZLx8gkUv4jRO54cGR37J6mYu6IvdRu1fXktxm7VaNbkQCf74pDlxZfgnoglOttSsom+U9+/95qGSPWvgyus=</Encrypted>]]>
      </text>
    </action>

    <action id="DebitAccount">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35Jc8oQ9NuZIOhCca0zCH4rH7hebNeSzfibyt27Lh/W1bWjpgQc7WB+e4/RJ/h5ucFZ55y84fqV6EUesTvz1k5Qtjg==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>

</dir>