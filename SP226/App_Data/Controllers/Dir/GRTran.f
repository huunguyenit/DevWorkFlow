<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
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
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\ExternalCheckVoucherNumber.txt">
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

  <!ENTITY CheckGeneralInputVATCondition " and @invat_yn = 1">
  <!ENTITY CommandCheckGeneralInputVATInvoiceBeginTag SYSTEM "..\Include\Command\CheckGeneralInputVATInvoiceBeginTag.txt">
  <!ENTITY CommandCheckGeneralInputVATInvoiceSelect "select @verify$InputVAT$Field = 'so_ct0', @verify$InputVAT$Invoice = @so_ct0, @verify$InputVAT$Date = @ngay_ct0, @verify$InputVAT$Code = @$ma_so_thue, @verify$InputVAT$Serial = @so_seri">
  <!ENTITY CommandCheckGeneralInputVATInvoiceEndTag SYSTEM "..\Include\Command\CheckGeneralInputVATInvoiceEndTag.txt">

  <!ENTITY CommandCheckGeneralInputVATInvoice "
    &CommandCheckGeneralInputVATInvoiceBeginTag;
    &CommandCheckGeneralInputVATInvoiceSelect;
    &CommandCheckGeneralInputVATInvoiceEndTag;">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY % ResetCustInfo SYSTEM "..\Include\ResetCustInfo.ent">
  %ResetCustInfo;

  
  <!ENTITY f "FastBusiness.Encryption.Begin$uLc6/Bny5UrSIRuDTGst3YtL+kwFi9rKn/AM0WfXdN0yatHzSjxbjyPAm7xphh2h+vRXV/2ITsAmPoe7tA0Z300xhnSXbkbt9GySVCMSuMk=FastBusiness.Encryption.End">
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCITdaq9nGUjQNNUtTw40FU54NCRXtm2tbj/Rk1LkDVooSguAjZBbAz4Q+iglwjt8QbJUTezYRLJm6FIl3F6w1JA==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG1MhC6Fnj6eZxSUB8eL9h/DWhs1pQ/RAU2lDMjocgtGwYAZHygPhHPBQRw1NZmHYMCL9bnHA2W9Ts4TTU1FDziI9MpLG9brwg+NuFzT82TlAe34GgVNEGvIQnuV1HqYcTmxVjvyAGlG/5UeO/4UxMlTlh/bIjXAqhibnU8RwwX0zYq8+F3+QQQEsvyh3eXeU/0=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiaHofGFJpbS3YoWGP8IosdaXsHVY4LAwQvxqstZPFyVa8fOE3+ActJA30mwTa9B845dyrRversQvB7x7Fp2/IKzka9UFN3tzIwJwDvMSNuyIy3tcIvlsH9Y9Wb0XrMfJRE/8ZsJuGvFcdh5jcA8BHUern5RPsOEq/3aAdO3i2mCtQlQgFQa+paPytclAs/DquFdcDpYSx2wAyMUjSJXZ3Rx8zjSwmZeXEACDkdWGubEvybcxwt99vp5Xech2Cc8l+2cxlXtM6waXcp4O6oPr+r8voMsMIdbuPsyLNM9xc27NnTSJn83MUKpzT0dVgdiagnyG7KgQSb3Lduqbm1xXEC9ZdjDo1/Tb6IiFVlYy+OnN72KpTQ8gqJ/2LLHuWE+ixfEZvTF9i1OQPKVv0pkzJl14+IAKty5va/B/NI/oG9u8k96VKcAZ0PpmYHr3sqS6GkjT/iP4Aa19efqFLf5xkzCELgPUhz9Ff1LyVmbZttR/RlgQ/NILJc7NGjhuQhPw+uU31CqzxF8mSTA7B26HjJo=FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaXJ/UdJafklGWFI7vbXICXEDnMmo5plvfyqOsvC9kMtyFBSyDn8Z/JEUM41s3iYYKWzpwHCuHS59nqANy1qUa0SiM0L4pZuLWUWWYep47xDrg==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUcwPSaWJ5qf2mxPzIM0UDOmd7dMCo8O1qyxjHXLwaugmYpXvzwEKkLKM4FS2pFMfxjHHRuZ8hnhSgWzzHCLFccc=FastBusiness.Encryption.End">
  

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
  %Extender.Include.GRTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m23$000000" code="stt_rec" order="ngay_ct, so_ct" id="HD3" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hóa đơn" e="Invoice"></title>
  <partition table="c23$000000" prime="m23$" inquiry="i23$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb67k+TwS2dOisllXXCwNXuWzo5tPV7xyV6kFJAFfSb7XDzFuaGtC9HKwMHG2uN2dMQ=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left" inactivate="false">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="ma_mau_ct" clientDefault="Default" inactivate="true">
      <header v="Mẫu hóa đơn" e="Invoice Form"></header>
      <items style="AutoComplete" controller="VoucherTemplate" reference="ten_mau_ct%l" key="status = '1'" check="1=1" information="ma_mau_ct$dmmauct.ten_mau_ct%l"/>
    </field>
    <field name="ten_mau_ct%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="so_seri" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
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

    <field name="status" inactivate="true" clientDefault="0">
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
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d23" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="146" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="GRDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="tk_thue_no" allowNulls="false" categoryIndex="-1">
      <header v="Tk đối ứng thuế" e="Corr.Tax Account"></header>
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
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
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

    <field name="ma_nvbh" categoryIndex="18">
      <header v="Nhân viên bán" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1 = 1" information="ma_nvbh$dmnvbh.ten_nvbh%l"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="18">
      <header v="" e=""></header>
    </field>

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
    <field name="ghi_chu" categoryIndex="18">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="invat_yn" type="Boolean" defaultValue="cast(0 as bit)" categoryIndex="18">
      <header v="" e=""></header>
      <footer v="Chuyển vào bảng kê thuế đầu vào" e="Post to Input VAT"></footer>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJYsw8MgVJF8llh8nasSg9irZa+SBHlF2pGqXeFSpWrgMuRN51HCugmEp7C6061pJkA==</Encrypted>]]></clientScript>
    </field>
    <field name="mau_bc" clientDefault="Default" defaultValue="3" categoryIndex="18" filterSource="Optional">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="AutoComplete" controller="VATForm" reference="ten_bc%l" key="status = '1'" check="1=1" information="mau_bc$dmmaubc3.ten_bc%l"/>
    </field>
    <field name="ten_bc%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" categoryIndex="18">
      <header v="" e=""></header>
    </field>
    <field name="ma_tc" clientDefault="Default" categoryIndex="18" filterSource="Optional">
      <header v="Mã tính chất" e="Tax Type"></header>
      <items style="AutoComplete" controller="TaxType" reference="ten_tc%l" key="status = '1'" check="1=1" information="ma_tc$v20dmtcthue.ten_tc%l"/>
    </field>
    <field name="ten_tc%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" categoryIndex="18">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="206" anchor="10" split="10">
      <item value="25, 75, 100, 29, 71, 29, 100, 8, 100, 0, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="1011000000-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="101--------1001--: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct]"/>
      <item value="1011000000-1001--: [tk].Label, [tk], [ten_tk%l], [ngay_ct].Label, [ngay_ct]"/>
      <item value="101---1-1--1101--: [so_ct0].Label, [so_ct0], [so_seri].Label, [so_seri], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="101---1-11-1100-1: [ngay_ct0].Label, [ngay_ct0], [ma_mau_ct].Label, [ma_mau_ct], [ten_mau_ct%l], [status].Label, [status], [ma_dvcs]"/>
      <item value="1010000000: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [d23]" />

      <item value="1101: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="1100-11-1: [ten_khthue].Label, [ten_khthue], [mau_bc].Label, [mau_bc], [ten_bc%l]"/>
      <item value="1100-11-1: [dia_chithue].Label, [dia_chithue], [ma_tc].Label, [ma_tc], [ten_tc%l]"/>
      <item value="1100-----: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="1100-1---: [ten_vtthue].Label, [ten_vtthue], [cookie]"/>
      <item value="1100-----: [ghi_chu].Label, [ghi_chu]"/>
      <item value="-11000000: [invat_yn], [invat_yn].Description"/>

      <item value="------1-10-1-: [t_tien2].Label, [t_tien_nt2], [t_tien2]"/>
      <item value="---11-1-10-11: [tk_thue_no].Footer, [tk_thue_no], [t_thue_nt].Label, [t_thue_nt], [t_thue], [ten_tk_thue_no%l]"/>
      <item value="------1-10-1-: [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="18" columns="100, 25, 75, 337, 8, 100, 100, 8, 0" anchor="4">
          <header v="Khác" e="Other"/>
        </category>
        <category index="-1" columns="100, 100, 9, 120,	100, 8, 100, 8, 58, 42, 8, 100, 0" anchor="2">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnbxwoOS/qU7vMcMRF9zvVgaM9B3DMO6yiuWD0AhfIY0Ghp4fqfZtjB6aPZt82ittk1Cx7UMvAvA8uvm0Nylc/WhgqwT0LpYjxEWsP/hW2uqLGcJTAQNsNWkWpF+3OpKzwzKZ85y5vybuiIlEMYw2BQfEU/3rNwmEE8ILSn7+eOfI5kRgpJ/H/ao3A8W9bZRv321s7XHJSeBvjdsuhJdLYSTUun6NS3UCrulF9rd9Xiov7AtY8RkC5kMeGZlHDc7JEiw3j6OTbleFfjSyA52H3s833HP/gwln5DiXwBH9NL6ySzJL8SCGM0AoMgvmvwKyE/viexsZKAW2butNReVfHmq1F8JgVDoOgNr7EZP96CsEuZB+ygfn1ZA0VCUpLPO2k=</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafSLs0bO1HJIAvHofjlKwNLC2nqFC9hyhHLDsh2EA2qeC4LW/4IdNmhvrGERX4emSFLQk2Qs9V7ImNBARB2Ba55ThRvwuTzyiikp5BmVGAihDwN5IuLTE4iypcpJoI1isFE5Z7bI3BmVORxLqPCpAXOaYPSoGOioELRpfMbf42WGSH2XAuXRHUA28vzz1tBE1p2PjKAJIpHurI+JyTu0sdiA=</Encrypted>]]>
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
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4ILkrc5td6coOlL4TCAsKtjy</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWd6HaL1OGauusRtQb6bqs07xG6Qjwkz8N1z0TqPoMU5IOlv0VNmfSmz2fJupDIgQPHcyrEc/MDAnl/EJMeQsIbm</Encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm41hXZtDtU3F53wv8d+v8geKADiMakiKMHs1Tp3BPgO5UpwnR1b0f7M0JXhp9u793c=</Encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5J2b7GTHk2/3HCNfXlIXpB0X8o3to6rrq+ToZiGRGjMQl6LhH2+6NonOIoBd2cpGRQ==</Encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5AKAw9c3UFooEwlECRp/GSBdL+q0MqVmYh5qqori5Qf55SfH/AKlP7o6yaqAvop2x/PwG/bRSoRdGcn4c/xIpic=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        &CheckTaxCodeDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbZaAEVT0QhLeDz6F4WpGYKmrPKoJ9B/rHQ84ejexCmVWFQ9H/4TZB9T/SkgvfpVBp06DVl+3mlMZFesGS8lTBrNDqheNMEGt+wTkN+/1jdODdmUxCHl9zpSXOF0Z3vB8iRpPRnxKMjOBaarNgjnhhk0w5GpvM7NT+rlGdZI3GP4sh9pGSm/qUYmpwBu7NtAUc8RlXtVDSuw0ntutaDK5YQr/PSHZ8HehqtZJbpPFCNKgVjuPSO14asyesUIjTbWzGNz485jdFVh/s3coa7NHntniCyXszGPYAHl11TclPxdM=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        &CommandCheckGeneralInputVATInvoice;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxVMx1846CkzxbSU4gmbG9yqdRZoJBzemZMYFJrYwsjqlh2FrHVpf/K47CIBe+8i1ono4TbRV962h9cl5Xu73UVYNddVbIMIhmjflLZl4Y/W3EY4EMh2dD6OEl9fEoPxYoeK6Cd6VOCoKrGEZjYITd9A==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIgFsRHhsiDwwtKZ5YNocdGDNskOGGz8mtQ4yFljYqFpAxFMo5lji+RwZplWOUDlmLVV/epHMf4COynmQdWPLSLOxuE5xjNyWKuMXw3qIKxazOHS1f4kT+fpCDUyJL9TxPCYX6piUNMIwBnmyUeMSzdVfYeBCpUHyBLqBMA2X8PxH3JzxdRDVIAmxP8sPIUhzXTEQXbdhvguITfBA9T9Fsw=</Encrypted>]]>
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
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        &CommandCheckGeneralInputVATInvoice;
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6H1EhmdaOQ+NGMsepA+7S1YtzabAx1m1q5HD5EvTP3XdNkiGf52EXAlhAq/f0JoBYaRjzQaftg2yK/9Uh8W/qFKTHs1Z7bY6Fyvqi1fEyutsqJ5PfxwcB4PRb4njCdBwR2GVcPae2z5G+M3Xtnde9N1fcd2o6FBuPmOvpHVvbrdu3MqpDdm/XqdkKOOInEGTHAFvOMlrI0kwpuDiZA6lGFgmh2Yawn2I93Wh5gyJLwvQBji5NJDGl/m/gDV1hzh3etpeGE8WzQBHy6aCXI9VoKs7kXL79xagEVB88/F3D63T2UJzKwVC7aQgJHBIdd7STYivNieNYDpe5i0GBygGwWjcBEQnQIGCIvjJ03As7tRvAD2Bjejr0a16KRqLnJ1n7Epak6P1L9yIvocucEE0X1yDz2LXDAkfS4qhTTumfoVAN36bh2SSRWZaJN1AlwMjE=</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ZbmoRsoVNvkmUSBDXi/IUTVAdhMIOKWmRQfVVCxRhOfCg9X2MzB4tPjMaaMQzrunl4XEVOTGLLxedVIIj8MyPCXGPVOLB3mCDplaM71mJEvOmqC+eAsMe5n6GrEIlDN0T5KdEm1A3WiMqSFHGIz4BRKQOW6JJbbjgK4OJlr8YFzV9NRh3oroh8YjPQHq7llONiHEmdK0DfZgPRGDGvjfHLhhUzUMLY7on9N73RWLui+HEpmCy2mHkCY31ccSzoU9+Vf++CavvIZxDoyIisj/uYVgH4RnRHI48ez3ZsIbAtC99H7yaPTkbSQEA7MhdQdQg==</Encrypted>]]>
        &AfterUpdate;
        &Delete;
        &Post;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6H1EhmdaOQ+NGMsepA+7S1YtzabAx1m1q5HD5EvTP3XdNkiGf52EXAlhAq/f0JoBYaRjzQaftg2yK/9Uh8W/qFzUObaavjqswYEyBwJTqoR30+ASx1OchVBTzXiFuYubccem7zc9vWQI1UiaBlk9KOGOhZ0GS3bPvNLpSRgiMBRA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0CE7nak2OvPS50roX1NfblNpnN9y9Grc3kMOCoU+lYAjqxwCVc2WuKf5E4m3qwd5uVUjS3dZbjF6s6l1GCG0KRvHSPC3Wv5USVMWH79URW/WINWxatAOEJJsPFhFjbySA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzZP3KvV201u04tYEX96laYPSACPtt4jkEiUSVE8QdO9rMtWFvvur73k1ijf2AFz4WmGZAP8IX+KRViIJhNLHZg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzUlEsA/IGtDzb1inqeoD2h0UfRPWrI20QPM93QbEBr4aArVz0I15o73DOTtqJ29YOyOmhY3i8LCz1RKA/Q1zjUVAvKk+BD+5sudbpl22mZjU3CQI3Sm8J8NotYkXFuM0JTJ0Bl24nV1fGxELJrRThY9hdoAMLq1WwsCjYOXot23H7DQIN0eT93MKdk/Asie65rqHEZxKcVDUf7fAX0BVVtfVpLLvoflVfdP8ds3Kzt5+bHw25KWD/eSnhGlMM21SAWsr3GDGEcgw3LB2ADBsaGugjInwkhBakQKNiYy7RZy3AuoynrZgQ2H02bH0Ew7q4FB8yWAXaIULYhqgzb22zVb1lBqfrN9cEmgOzUsLSMjeM+rgJheWDtNH63Wu4ga46mm6eq3PPi/x6MAl+5fDeEjC3KNzpeLzAjqFHtyg2+TS2dwNpD+Onb6zixvOvsrhE4ej/WTw26/1dp3osnMQWRSMFYHyPmqeYwQ9tj9bkTtdRej1eb8rI1mhsgvKnVOwW4LE3GokkquxF2qUlNkhPlN8eL7c/yzdjXRkoUGRlgPZgp1YT6jSV6v6st2rqgQy2Vq+Jf++F1AaOEM/Ys5idxEKW4Wqvpc3QBILzuVQlKhQQdft0exTkrxttqQXeMw8M=</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpVJ+qZbHdtsAeUOs1UnRUNtf6xkrpFDz9yr8KFiTJNxPbDMKx+uUU2uKHHRDmdQrIhTS3VM81n6gr1cvqNLON5A==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cu4ihFzjsEMULxf8NNqEHIOLnX3gLXrzxwyDQdLlP9vN5ADTtfhMzMLsap0PKh4SAzYvl2a8drLp+MQS4yphVt4RGVzvbXJYGh7sP0RPZJwYnOZ8aZdqsHzWwDZmG2qIrQnVDg7Ea8FAsISeeNvi+UV+gxx3lB4jcv7MYrLXXFXZYicX9kzX/fvPcK1pkOGhXamHieRcXm1pgGMnDFx9xYDUEassUiNFAvm0+nWHWJ6JazomtTEo2rf05xXSt5wHg==</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;<![CDATA[<Encrypted>&uGHO1INig/bVVI9tiETWT93juS17Eg3zeL5+cw5rKOgKM1T/9q05Y12zCAccNesAwLWkAfehalQZ17gFxltWUuinyyGCwpsFSe5/s8ihVhaGLymQeY1z4pUWl08v3Fnx</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWym9wbgs85nvalQ9Nb4tkNBULONFJ+rXydvRx3Exz9pxEjcZSjdGAoz8aB/KQo18IsA==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezk10Kszod3Pm1l+K3FCy95w21crbpWTlfQn65zSsFAWKmUYpHdKLoeVwLteOL/Wkze8bNlfPcB9JTe0btwO2RvgICgMzYo59/iV+N8k3C9mkH1BFpaTDLuwMq6I733xMAM1pbsW11zAfz+Oc3oQeF33MUpH6TnofFwXAVgO7gZ2OX0V0AHrwcoTyfr8K6nhd0</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7DpZ08qIx6gjDSaWiHtki5lAJFpY3lFqqNqtte/CJ/QV9BoqQBLNnz7aCjONeA03AZ/xjASnjsTvPQmd/lqQ+aA9MmYMNh2wchJQ+dy+sU82wdSLH9CyFocgWb3AbQaJwrb3JG78ihnBWinCbZsSR3hfWEhX0nWV2Lqif0uXRYiuSgT0QQrq4HdFzbWGqh3OvWXhEgSU1sahERZfNwhNofeoHMX7nYWoEjhk9MuZLCpcW6ioJO61zu6fi52XzGvdOhomanVyclCnkgOwdIEqt8WSk/nlSwSPZ6PlNlbgS/R5XLpIYNDPNUCnHanSHWq5+avnvpkvwvqaDg1zFSnziI3wf5CMKOqd5ERPksjT8jtXdFeUbY8yp4t5Z+kzPaPThK5vhqBLpNvgQ737ggDtelJs6pAlxxpIaUd2j5ZBZlXxmRYZSyagXGvEqkj7WwQD5mwWgcBCNv97Nlkz9OeIL4nyCsWtJUNWhIUXmMyknhUxJkVtc966lmz3UTBolhD/w0=</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOqrj2mNavAf9/4ESLwuki8rNCpT5ADX8tlu1K8odc9nSthS0zz7Hb5VOoLUxtLhL+c+iVbSBmOO73asdzDO0iyY</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/78z74QKqtVFGvyePhBURfrOEhTcLd0hUCJ7VU7OICgf2f</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKGnEYy+JL5B1KbP8UgJU3sHEtxrgGJ6FdpMRTYMObjVMA==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/78/v079NAbfKLY/u+/uESrrqeyud/yhMUK79nbLH/nAbp</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6zFhxqBxzr4vqs9YjDF3rXrsvKp+HNHE5pIa1AeKbOhTVvAsToM2139Bc2x4zt0nAjbVnd+MM/WETRc5ZDQYvy0FSgFF/9/C0GPd24kleIsU8xP3rXb2MZWRok6NNaX2wFvGW9m2omjaQ+p8Pc/Bwn5zPZJrndUJ0pnGnyJM3wMA8Rc4HYfZMY71DY/ClzI49YLAOv6bEWGivLous/Igha6l6XzNFq5po/t8gfggS3G232qmKRX4DPfI+iMhJpYVSlapPSdlWRIaDXderdgT//qDH9FT9Q7o+u3EYpeTgXWzARYFr72Tcepemc51X6iRaqtxYNIdPpli7H+mqt2sKHA==</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgSk1CEulnrcUS2bGJ+jOy4qcvoSc+KbiDgJqhIblRVE6pAhayUiFV/xqmW7cGszw4=</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgmAexscGIb6XmMXc+/kA9N1Nxy9w7CZRaggCOPybbNWg==</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUvZmfczXew2oSmKnIQDL8ph717iTKpoHyZD5ZilsKk/+0Qc7dz6Pyf4t3l4NvUh/aUAatTS0ZXgrYNCwEntIT/rjl4zut0mpIoGHvod5AfHo=</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnHbA4YAJEqzrz9Hpu+T+EzaIpzHVGnm9rnq9+JkGfjc/KN5i3ZGJ72FUOleoxPLAfoHhz70F1gSGXTdDxJCDFgupvHB+PUWSWm6PA0o4aGSNg==</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnEDcDukUN/hhijYpK0hqJham6DgHdAcwTU0Ba+ysbyKdE5OACRJifcesgHWxU1tEM4yuFSL/LEXjFtbxD/5jCYN</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnHYX8vcRkjNxUSY9iS3GCreMtTC9+OTX6VS3jWqv8FM8ix+LI4lvkPdXJoIH2JREmKhwuLPexQoQAFsDWlE3kBC</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnEKbQfob9VqeUf10BPNsmWB8QNOaevrqmZ18VPfdIEE95bAhQagVFmjCHwGkO32jgGBo0pGvk3ung8PxRzNHw5B</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyeuKwmm289nYweroUY3CKSq6yrRzikk/jzB+0EVs0Opp0LevaG9EVxNyqB+r5U98H//NnECRNuHGEk5t8HlQNRZX8URJjmDWOsGkqd/L1p4q//+lgGpwhpzL7sF2m72E27bCaJhFfH8B0rDIyBaV8hMc+vxbft90s7hnMdVZ6FWY</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWcQuFUkHZyRhB6HqfxXEHdPFYP5dKoTj5FnBTgJSuZ8uh+YhzCxOuZHdfrhIOs35ENC80bzPCpua64XFJDNz4jRHe/Awy+tvnQKqqnUyzAZjHv34dSnid+4KfruTeect/S1ioydoh/Vk6Q2DEqrPAxYb43Z1xT8Xtf2tiVATf8zducgksIaj9vmdnUd8GHvRhu78eEAGhhPe8sQnQ2vCmbExlXIk52xpmxvlzPLr5Asxp0T78h3cKYXipb2Dv36BRXmoAvXruUwUhJFJAheYDtokrKLRPUUnkZe9MelyVm6H+cMzD0Uy8AvDLgLubS5gtNDJjON+8cK3WfWbVh2GR3boCklMto7ytnD9DwwbAIPkurECH4sp0rJO7IoVgPwzA79D5kYIbtu2Wdnw8NJJIMU/NBIZbvhBttA4BrnU0EjSV/lL8E/5Clp6aowqwilWwxIPgIkGNG/1hbWvl8t8wElYSgUPexathnZ8j7UZAeXmSRu/EKpXV/qzfYSsEp++7Jj2LH91OZg6ROoHlkBWGA7gW9isgUkzy1sV/xit34Ucp6MNldpbTnHTuZRt3S9yLluMIvmSz6se3uEJi8gq6EpyBJ+eFsSMkmxiE5Cgnb3QeqvCAK/nsgshDz6AAR3pbA==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqasGeVT4hdwXxKLMtBGRilJ58tH7ZwMGvU44TYTVI8+F8BJ/yE2cpeAsA1BTkuH/9HYuGAcuSm9eZlFO6Xwdck2qoH+C3MARQGeyKRuUuSyeMnXY6f6i9REdeKbNpQyPKvdtDX95cI4ugI0cxZ0gBBPauvOgwqpRQ6p3BrrSei+jw09qWVPxtFKIxoJLx3zfn57LJiOMQojg89yxjJaYn9m6d49gGLXN6Ld2LYiy6wqfH2oqQKRdjBlgNmqtOM5yA2BGPNprCecWCh854aJ5u4qmLndkwO9DHFK/hznut4hzp3fVk38JM+QrIT1TKDkfcU</Encrypted>]]>
      </text>
    </action>

    <action id="CreditAccount">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35Jc8oQ9NuZIOhCca0zCH4rH7hebNeSzfibyt27Lh/W1bWjpgQc7WB+e4/RJ/h5ucFZ55y84fqV6EUesTvz1k5Qtjg==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>

</dir>