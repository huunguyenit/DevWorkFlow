<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY % CheckSerialNumber SYSTEM "..\Include\CheckSerialNumber.ent">
  %CheckSerialNumber;

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

  <!ENTITY % Invoice SYSTEM "..\Include\Invoice.ent">
  %Invoice;
  <!ENTITY EICheckTable SYSTEM "..\Include\Command\EIEditCheckTablePXTran.txt">
  <!ENTITY EICheckDetailFieldName "d26">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY CheckGeneralInputVATCondition " and @outvat_yn = 0">
  <!ENTITY CommandCheckGeneralInputVATInvoiceBeginTag SYSTEM "..\Include\Command\CheckGeneralInputVATInvoiceBeginTag.txt">
  <!ENTITY CommandCheckGeneralInputVATInvoiceSelect "select @verify$InputVAT$Field = 'so_ct', @verify$InputVAT$Invoice = ltrim(@so_ct), @verify$InputVAT$Date = @ngay_ct, @verify$InputVAT$Code = ma_so_thue, @verify$InputVAT$Serial = @so_seri from dmkh where ma_kh = @ma_kh">
  <!ENTITY CommandCheckGeneralInputVATInvoiceEndTag SYSTEM "..\Include\Command\CheckGeneralInputVATInvoiceEndTag.txt">

  <!ENTITY CommandCheckGeneralInputVATInvoice "
    &CommandCheckGeneralInputVATInvoiceBeginTag;
    &CommandCheckGeneralInputVATInvoiceSelect;
    &CommandCheckGeneralInputVATInvoiceEndTag;">

  <!ENTITY DefaultReportForm "3">

  <!ENTITY DetailVariable "@d26">
  <!ENTITY DeclarePost "declare @post bit, @vat int
select @post = case when @status = 0 then 0 else 1 end
select @vat = case when @outvat_yn = 0 then 1 else 2 end">

  <!ENTITY f ", @taxRate as thue_suat, @taxType as thue_cn">
  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GPDSgoXZM+5GlTEqi/FDHJzXUOraPDaiPEoZDZ4G1dOHnjEnZdlcQUjnuvosQc5Aiihr7xdtjlIJ3i+GUezvdHfOKpEOXYBpfEps2ZD5E7VA5W5mBApJWLv3s15dO/jXLOPG2ml+i4CaQs/lmMM2Bqg0i1Lw2wNDimlrLXbTFXu/I3F4GXzwUPXMzCuaEHXp35COcu/25+9ndzjMOjZOYLo7yEmQG81oltGFQXILdUwoxMTleyYQRK1xN4HCCKVl5ZFLy0Bls3bDOLzLqVSD2HL7xyPPp73Fd90EOY0adCTejLKr5eblg865OxcrCBf/04c4OscDVHkQM5Ws9025vIc=FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG2XHTBQA+AXip4lq6jBdliRUrGtEO5gRQksDG6Qr2zbnyMQxQIGbTSpwIzgVlGq08VTitiQYID7AWuW3IOAaeUu+vbiP0CT05I+55YICMXrIlD7WmQYalLnDOujuMg30/XCHGLQgd2vhMgYMwAS2XJ7U/ziwkFP0YtdGMTe5Ocjl0mJGF4gMwYYytE940//AxP1m0QAU0kVVy63OberOd/y1gZH1F30nV3bzpx9G7/M2Vw27c4hqydEIxmd9Tl0HpcKq4l3VWVwY4ZtXsfAgSPt3HPZG8haN/JAtDkyyzgeIxxZCC8LITGH29hTRUDU3XX6CQ7JD6UHEWlf81u7aJgarV9Y2i0EPKdbAFgB908GMHa4vb+911MklYWdoufmrV0Wo+kkvDBbXviU78XHVmjrkSiz7Bk6V2PrfY/MDFeHq5ouKYxo/jh2hXPJl6L5uKgBSkOjlHEM5B+F3T2YSBZdLrhG0Z3vXCBcx/P40PjP4xJ1MH/mbKXdpHq9B3W+iHKvr00FfyAXo4+eRSypGrD1p6l3gY4plhH7vmzq8H3tZFEmHxC7TNQD+AXT1mLn7tFang1mmldQr+0+bjbXsJyrM1WkvBgAq+pD690daEJyaHsTP+IgIBFHmvmmu1amvw3KL3NPEY9TBCQZP+h3e2aARGBTtnoe33ShCt1iVtMvy6OCE051/N7FwE4b0sYeP7tWUVJY72YrXF1eftWPQuzszkNbywGxFhPzRYKJkZulPw==FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaXJ/UdJafklGWFI7vbXICXE+OtFAdg9QLBtu7sv47QbmQ==FastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu37+jrfsgyC2qZL5IIGCW1DwkiRrpJEJdWbipHeKEhBKiWAHba/XKQW21ovOm/8/YHXFMmXttbomTrw60rDPb9DM9FsthO6U81uwxxjBO3YjxCYfMT5COdXhl9eozEA3F9DurHQEdo568GLiSKjysqFv2uskM7/1+NXWxh+DWxl151PzMVG7vcg+UVUhBhMXLw==FastBusiness.Encryption.End&VoucherLogActionKeyString;FastBusiness.Encryption.Begin$Yg5kCMHpRxVk0phZxDQR70wgPAkFmkgrAcEMwC3BisUugfJ3oA+SMMv+mvBvszxdFastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.PXTran;
  %Extender.Ignore;
]>

<dir table="m26$000000" code="stt_rec" order="ngay_ct, so_ct" id="PXD" type="Voucher" uniKey="true" replication="3" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hóa đơn dịch vụ trả lại nhà cung cấp" e="Service Return to Supplier"></title>
  <partition table="m26$000000" prime="m26$000000" inquiry="i26$000000" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã ncc" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn = 1 or nv_yn = 1)" check="cc_yn = 1 or nv_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người nhận" e="Recipient"></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l" row="1"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1" allowNulls="false">
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

    <field name="d26" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="144" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PXDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="mau_bc" categoryIndex="9" defaultValue="&DefaultReportForm;" clientDefault="&DefaultReportForm;" filterSource="Optional">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="AutoComplete" controller="VATForm" reference="ten_bc%l" information="mau_bc$dmmaubc3.ten_bc%l" row="1"/>
    </field>
    <field name="ten_bc%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_tc" width="80" categoryIndex="9" filterSource="Optional">
      <header v="Mã tính chất" e="Tax Type"></header>
      <items style="AutoComplete" controller="TaxType" reference="ten_tc%l" key="status = '1'" check="1 = 1" information="ma_tc$v20dmtcthue.ten_tc%l" row="1"/>
    </field>
    <field name="ten_tc%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" >
      <header v="" e=""></header>
    </field>

    <field name="ma_thue" categoryIndex="9" filterSource="Optional">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="status = '1'" information="ma_thue$dmthue.ten_thue%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7a3GQkVRqHv7wGuR9MIrGCPYkpzPJsbrsLjxLrUDZvfA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="tk_thue" categoryIndex="9" clientDefault="Default" filterSource="Optional">
      <header v="Tk thuế nợ" e="Debit Tax Account"></header>
      <label v="Tk thuế" e="Tax Account"></label>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
      <handle key="[ma_thue] != ''" field="ma_thue"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6GY1C3pnCCmrtN16UexKCvgh4bCLk3luR6gcyHKeXAzg==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_thue%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" type="Decimal" defaultValue="0" categoryIndex="9" disabled="true" hidden="true" readOnly="true" width="0" clientDefault="Default">
      <header v="Thuế suất" e="Tax Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kh2" categoryIndex="9" inactivate="true" filterSource="Optional">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_thue%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default" row="1"/>
    </field>
    <field name="ten_kh_thue%l" readOnly="true" external="true" defaultValue="''" categoryIndex="-1">
      <header v="" e=""></header>
    </field>

    <field name="ten_vt">
      <header v="Nhóm hàng" e="Item Group"></header>
    </field>
    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="outvat_yn" type="Boolean" defaultValue="cast(0 as bit)" categoryIndex="9">
      <header v="" e=""></header>
      <footer v="Chuyển vào bảng kê thuế đầu ra" e="Post to Output VAT"></footer>
    </field>

    &EIFields;

    <field name="ma_tt" categoryIndex="-1" inactivate="true">
      <header v="Mã thanh toán" e="Debit Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="-1">
      <header v="" e=""></header>
    </field>

    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4zJUBMNX3AEb9nmrG5Zx2Q5ZX5dLza+wGcEJmtfjHPTQMiXpHOkyDK8kQbACRaDpk=</Encrypted>]]></clientScript>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7NNTM/AsgPyK8R77+aAtd3S1/pcs1Hs5nWXufwgf6YzdikxbA+5XaqCReQJmcBt4E=</Encrypted>]]></clientScript>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán" e="Total Payment"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    &ListField;
    &PostField;

    <field name="tk_cn" type="Byte" dataFormatString="0" external="true" clientDefault="Default" defaultValue="0" categoryIndex="9" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="204" anchor="6" split="8">
      <item value="25, 75, 100, 129, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="1011000-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="101-1-1-100100: [ong_ba].Label, [ong_ba], [cookie], [ma_dvcs], [so_seri].Label, [so_seri]"/>
      <item value="1011000-100100: [tk].Label, [tk], [ten_tk%l], [ngay_lct].Label, [ngay_lct]"/>
      <item value="1010000-100100: [dien_giai].Label, [dien_giai], [ngay_ct].Label, [ngay_ct]"/>
      <item value="1010000-110100: [ten_vt].Label, [ten_vt], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="1010000-110000: [ghi_chu].Label, [ghi_chu], [status].Label, [status]"/>

      <item value="1: [d26]" />

      <item value="11010000: [mau_bc].Label, [mau_bc], [ten_bc%l]"/>
      <item value="11010000: [ma_tc].Label, [ma_tc], [ten_tc%l]"/>
      <item value="11010000: [ma_thue].Label, [ma_thue], [ten_thue%l]"/>
      <item value="11010000: [tk_thue].Label, [tk_thue], [ten_tk_thue%l]"/>
      <item value="11010000: [ma_kh2].Label, [ma_kh2], [ten_kh_thue%l]"/>
      <item value="-11000-----11: [outvat_yn], [outvat_yn].Description, [thue_suat], [tk_cn]"/>

      &EIViews;
      &ListView;
      &PostView;

      <item value="---------1-10-1: [t_tien].Label, [t_tien_nt], [t_tien] "/>
      <item value="---------1-10-1: [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="1011000001-10-1: [ma_tt].Label, [ma_tt], [ten_tt%l], [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="100, 25, 75, 129, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0" anchor="7" >
          <header v="Thuế" e="Tax"/>
        </category>

        &EICategory;
        &ListCategory;
        &PostCategory;

        <category index="-1" columns="25, 75, 100, 35, 65, 0, 0, 37, 100, 100, 8, 58, 42, 8, 100" anchor="6">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvmS7r3TUtKesc3VsMI1KRQsWlKTthVu1c+eXBGMk3bMKDyF0P1rUrz25Y0/ykG9naBzp+aZIGgeFD+yb0JQFiu9Ufl+VK6xH8V7GJMGy/Fvek6iCKk4ZlC4q5jg1VAVojqEKiMSi+xFc+dxQ6n8zzOYk81GTyN8+Ar7ly/RRv9qCC29+N4+GIPXGYruIFJar49+srRBV1njMWqPnaiAnBaVUITDLS5YS2BkZTlw6Yn1Z4PTWt3lAIxhbYKVmAg7en0=</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafSLs0bO1HJIAvHofjlKwNLCF2pCFgbC6lVkVhtwzOutcXBZMx7RxPyDGu6bdMQEbTH9M2yXpz6e5gZ3/YgF3N+LCUTet8l6Joj8oQW0KG5TO</Encrypted>]]><![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKMAds6aqnmxULF40FeVOjKI0Dv1LdqG8lfFl48R2ingkO1+Id4qlmdE4vBDTw+wV6PBdZcVQdDJ8k/mhPfSVLpYqmf/XQmwE/hgyimJFEa70yV7CR5VyaibAioWsRle2h6IOmVFx5ERA/mHihPhVcoZoaOqzNmrp492O1Ib6646hfUyXFCnNS/uSedq+SGgxColczDGmDVGTHXz+jIHnTvv7qVvggNRDb3PVvyRIwaWp05bJy1LHPPWov9IVwuQ3g==</Encrypted>]]>&DefaultReportForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR79MMjgMMed48qw/yIIamPeI1nIw3+wkARwUM1zzMzOisABiZVFcf49jQvWHGMv0UUw36Zx1cCxPWkUtOB4w9eVU1ReMeKv8ViTQyfODDpzyYQAdYJJ71iWo3WjEcSip6e6bDIWqXcdifo9tYGNCV05uai8izUBFaIhQZKyAAH/zwL4zc611aAMHhOEv/Uz9sAqF7EkdpfUGHyR9z/xtH/ZkVHP5B7UA4sDANYgWFKTNIUc7jQejG3n0D9R06ul91uTwKl2YRv0VifwzWGsaNKif4Nw+DPeyHps8viq+YLeP5tRlG8/zVCprcuZdkQgxOvmMBjGvurXbJaPhxWNKQ6CCQgOMLyTnmuLlnoMR9LTfHjVHQT76/Dex7WqBD5jC611sWrMpCIzvbyW17hqJeNXUEPNh3On59MKKPRsS8ZY44k/5kmVfskgVPKTJoldwie6Tm//sLOvTTtfc2Hk2uUfk3/ZesASHpywh91x+6TvJBGboDgGuZeQU1lH1OFdO/HUtEIeo4cBlUA7Gbzg2Q53q2/m/B3G6MTfWeVvlG0JEt</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        &ESWhenBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        &ESWhenBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IIN9NHpqFyfDalh8R+f49igDX61jPHd5cloUQkOXL/VagkqSBvKfV0RP4Z0QWgR9EsXiyGxlytrjceznNfqha9N</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWcSuauURHWxntFbDY7fkuMGMxjAYrux0CZ00PgkHWandJBiD8+C/N/5XF0By7PN5t9yX0qFIyfv/+r21QM9KM0VweqGTV9+LzF7k6AudwUt/Q==</Encrypted>]]>
        &CommandExternalFieldSet;
        &ESInitExternalFieldsSet;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHOdC9Wwdon1n9pLwnB/xAtTqteWbmaTsYsY/FFh9GmC+z659yupBEUFbmiO5/vXaBjCBxjkIoxmDD7bkNJ5vIapkfRERAmtRUfO1loRzSmTKuaTz+DXZ5R7/fsL5WHSzeUfz0yA5/wZpivdp2/hDnzFpEaOwyQCnHXwPDKQ1uURoilaYfyrnNLiV6wukiMTkA==</Encrypted>]]>&CommandExternalFieldQuery;&f;&EIInitExternalFields;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJmqsAk72Ii7Myu4XNWxBZ7LFRJnpRsOvqw+sGYYBmMK</Encrypted>]]>
      </text>
    </command>
    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu85loT3gNpYhPh8NVBlcf3+5CGdJ6s/GPE1I+GIZCpmBN3Fy3ofj9/whlYzCA/8K9kFIBKHttgrr2dAuxssjDS74VtaJyN9EIPegSHOTOAwSZwiXO6T0SBj3aI0xct3zjL4wXBUEJ1OQxT1flCjqwJ35hGLMxFqmvDVfD0QwuG0pLmSwkSxMOKJI/Tqst6HF6KddoD013B1fbySU1txGC8la4y/QqAzLCAlW+kens+puWerVoakAdxmpymic2afFi7hnyamwyRmR4Wt0zPCSVuCvhzhuwhHVxUPO9xCMTJPnirYwa7iITaLPbplS6GwP7zuuLemIgdmH/RK7V9pPxw3purzf+4FMfOf4zaoGY87y</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &EIWhenBeforeInsert;
        &CommandCheckVoucherNumber;
        &CommandCheckGeneralInputVATInvoice;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcO5gpt6SUJF7HKa+7SYvpDnWChLngV+k6MacHMi+wDYdVdmX2e3yC4cIXeqJXgcaJxP0Za1MQdx9A4SW0dUnf+Yrt+/bu8diTi5gR+0HEqb2QYM2fDdBNSyis2AzX8xW3eYsrOBR8ziMF5wgWM2diGhb/QepVaSQXz3XpI2XlK2FIts7bvJ+pyBTXliR5nCqKkwTHm2U/Y5I96/aUXpx0AY5ZWp1YrHmuL8Jd6AewWeD</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNe0GNA167bnS+J4RNzjAwGGpmHPgwWG+JEJuQGbv94zpoo8p8NHeCxVOgIgaagjnw==</Encrypted>]]>
        &ESPostInsert;
        &AfterUpdate;
        &DeclarePost;
        &Post;
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
        &ESWhenBeforeUpdate;
        &CommandCheckVoucherNumber;
        &CommandCheckGeneralInputVATInvoice;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6K/NxMej34l5DwSGBQV7zdpHeMY0hZzLlD1wfY3jE0VkczA0zmhbuga1bqT5aPAI62MNz7Ta81C5I3U1HL46biL29fk50BAjX20I0KQ29QEe5lRejgnLv3YpauG6QzClgdvz5FA5VsTn5xEpb/3HSM</Encrypted>]]>&VoucherWhenBeforeUpdateLog;&EIWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22eu2GlrqgCFFF552GzaMzGLRyiireYo3g4u33mx2T5tJnrb3vc6FdMugQchl7Uc7QZd4GXzbYity2GPSO5JtlzUJPo5C9ngVa1fPdo+Alnodh4pSSxZG7IXn/7muoB7NrBULMTZNJEIBOV5QEHV1NrgxeGdF9fl13/urjtTnYgxzYX1CBbGnAMTe583QhjCZykg6FjUN5PUYQwTaOdWkns+s1KKoauEV71+ryt8ME/HS6k12btR/NxmkiclESRAA5A==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22T7ndSHWBUZ7Od16LPZ+ceA2MNNVq0PTI3uyoqSntLJxO+cTotSn7qzMiTPYSfeY1H+yjozKW2kLM5j25HMXZi4VPZtZHAE4KawQREcZs0dA2LOF8WQsNNEust7bS9MAAor+XrGE3xHLZBoI+QI3S47InHh/MYM6OTRBJuKQpWONzialpp4zh5bZodZdI34CsA==</Encrypted>]]>
        &ESPostUpdate;
        &PrintAdjustUpdate;
        &AfterUpdate;
        &DeclarePost;
        &Delete;
        &Post;
        &EIEditUpdateAfterPost;
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
        &ESWhenBeforeDelete;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6K/NxMej34l5DwSGBQV7zdpHeMY0hZzLlD1wfY3jE0VkczA0zmhbuga1bqT5aPAI62MNz7Ta81C5I3U1HL46bifCl0m/gZGbKPEEIkdyuVfwYAsRR03dI6f8agfwNSQzvr6mDy4burwZ0Os0pDhBWpMOgrzhFflFA3PUJXvJnR/Kl+vx/wFNveENjNims6+UKcQvTatCqttjbsnvAED78bPo4o35WdCUUJ27VkvGQB8NTxN5KoOAQYhFrPLmZNIas=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu18Fnd9w/GHsLtws+rUc2Av541ILYLyuTAvMTo3SisZblIEwtMt3du7LRBxLkVPRWA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0BHZDKtOXl2Wac70ebHJfTBydegaZzaKDeK3bV7sRa4rqK92hF00c+2a8ZtIZu/fw==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &ESPostDelete;
        &PrintAdjustDelete;
        &Delete;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22X9euTvmH3eAzer2+ZvDJbE=</Encrypted>]]>&UsedVoucherLog;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHlVLeUx/SiCrmNhc9JEQW7o4r2hriSaciiI9GeThDnT/fLYAhVqorHkhL6T4FTZF8hpnWgjlMtsBFAcwBC3CvXlAWC9hjH9pVtnIYpryMbUaLbOrpbs9FHSF3GUhb9a3/ELCMKRO6i9A+yxJ36voZlOX/usBFSM0raJr8FcAJwah0VsYF4bv7hXraqrM47S9Q//i5/h8LTljT568tumwKMjfvolo3I+DuyqQdgppUay8phP1H9E0F56DcCatO7cLfCrg9Ds0Rk/oAgqpkkJdmg4=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzUlEsA/IGtDzb1inqeoD2h0UfRPWrI20QPM93QbEBr4chDxR3rm0LyJTsBoFYr+j6REp0ugmfTXh/YbCoqsM7MoepgKfNeaE6vJe1A+prOi5JxVTVJBAfpMaUVcrs/C6mRjP24J1azMFIz+8IruhMWj9jvIaFpdiaRoHQ3A8AdlZuH7ZFwrstCS8g2KdZmq+3zV+ACs0gFB2zI7zxANgUb/UJqGaR2nCvoo9rWGwWL7FSWkDho1Zqzjp9OAhXckN7D+liN6JsCwc+pAcNlL+1uJVJSMBCOdgGn483wtdPCQwr7VtPwpq5OYcf1h8X4ENJO/xzKrsV5sx16aapSJQHVoROCN9BdhRIzbKJlHzpOczMLh+XTVT+N9Czhg52YSCga8jSgg1fWZTq2FzUdp9CpVjC9d5adjcUWoMZw+HXOMAkcB0947EQRhjnYtsJz3PKPR5dzXF4wfOEMFMgr5bEulJeU/qfc9G71wB6CgPWGKesCpZHS8D3XkzVrA4i9s1ICdoEM/tjXYsvokwfvrAtrjeMvcKV6l+RTCPl5tpVV3hMIMZvEcqJPSpT1VgAo3XOBc5uRUW4ADVGyjK7qQsNPegzpG7+aXWAro2INzvc7dJDZ9Dw709T3OMZQUAYeqKc=</Encrypted>]]>
        &EISetAuthentication;
        &ListChecking;
        &PostChecking;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpVJ+qZbHdtsAeUOs1UnRUNtf6xkrpFDz9yr8KFiTJNxPbDMKx+uUU2uKHHRDmdQrIhTS3VM81n6gr1cvqNLON5A==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxcwvJojyiCnqZOV0nBAexsp+qk5qnvs8gJtDlTchN0EGw==</Encrypted>]]>&EISetFieldsReadOnly;&EISetFormButtonEdit;&VoucherLogHandleStatus;&CancelStatusDefault;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&EISetFieldsReadOnly;&EISetFormButtonEdit;&VoucherLogHandleStatus;&CancelStatusDefault;<![CDATA[<Encrypted>&kgSH0HK8qzKbg/rQtWUzkcaCcsvJu22Pi+AZMfxkPyG91JBm7hCuI6IG6QkHwgailUFQBUh3S2nb4v56zADrnORM1Sjw1qQnTaW0kK3zmqs=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacez2tvzH0CYgUlDN65Wq1DLvslpyRvCZgd9hf/djo4VnbKQcO8Xi60bklppk23xHeuI3gOYfDB4mHIN+0uQdUExZnPt+PjV76VZfIPfExlQiy4=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwCxcYd2J0gZdsN1luN6RUUTexsBacGoigdG19vBp3H4GXLgenFniOq7TKpRnZrdT4sacW12UOzNSOZrJIvSbPjee+JeYMbs9EOhcnvkpsDdAl4Ixrx0I693wnRuupkZsn5FIx8O/m7E0Ou0oByH0qCdIqlTctYTy9Y1186U0o/W1GD2MEq4ObG5USAOfhPVIUNfLxnmIURNnQPrGtXqpo6LfHUDPndhdjrjXfZFdM1LNEeNgcmiNkJzz8fddjAcfj80UpHj8/tUzBWRcmRoqOYRZDXpaPUTk1D9XSTSd9sJOrUdtEICn/YfOzVAjpjttUgt8NBeCJwmh8RkE4Iyo3ABgf+ZhSr/aa7DCQzzd3JPJSl8AWTa+y5WYVtUcgCvw==</Encrypted>]]>&CancelStatusExplore;&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7DpZ08qIx6gjDSaWiHtki5l2c8NIvdLRiYbGk9fwjvBLbJWivSlg//ihqIEXm63KdqFCl/H87x99wAtDtUWDwcrgej5qiP8KrVvDeROYjJcTnW/7BJOyhtas0qGmCaMTaQJT7SC/QVeKT2Lp3YeR+jSnQF6T+W5NcNj9sooLSXsdWP40t+StdYJqiEhg/Xe2Dop1cDwLu71tVPLetxvZ5mrC1pUg2cWPsJqkbx+bdWEZQ4DYL/006N4Y4T/Fcm0lpSb07jqshmsgYCRFvPcT3vm6e6KpqBA6L4dddWmo4Lk4JepRSVUzqf4zINSNLs3nPMZ647sQ2yBJsCedKHvruPIvAEgdELpAcADihu5h/86iaElB2mN17YH8KhBeVtM+XLWZ8JKhYYDpQle2mrC0BpSRDYJcJ0VLwA6FRWpu9Ryi+qjlhRVh3nA65Ix/iJQ7zAyej71mjr8nOiNzjNUCpJaKyx3cTecUkJFgEeol/99plHaaKYJD1VA4mddgn1wCEg=</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOrsXsm3Kv9ZxtQnRDwdvrZErETJUkEAC2Qqp0YxJbih+Gwf93rlS8qXPTfs7xnksZqOpNL8gaTi6itPPptrOCt4Ujd53JAfazREUzXZj4x1mpdFdoN2Yhp5cD29ZGQenLmyCLzJ22GKhpdYJF9WIi5D</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Tceafg9l15/ifmNmrsk5YprSI46C0AYd9BSYyq9+3JdrT1ebtBu8VKHbeP7bzgl3di3f0Af756WIJB3DWAGqhcSupO86Saq/Mzp2aa8DXofBTZ65oeWeKJOSzXhk191NwwOfhacXDxwFC2dSHpwQ8s=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22W2+9RBrh/eJsIvq6SkVcffFtSjxjQppjdJDhoGK42gbAgq5VE7Y4drGoZMyfaqfEOIdg6tdB2YAaQPgifVchbe7iDelvxCvrQAYiaCEVS9hwh8sFcXgKJQefzRfpneNzA==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwsygCMj0NC+9aWOEuMAoGMuPGf1i2QgLtlqWPUDvUanxIwn3ThRgPm95i50JRDHjDrPiA+I0GaLoj2Sm8YzC+rYt06OLk38yuLQVFhZwQyk2MbwFi5FIlKYaOABAbEyvwfZ7E6yGhtz7iocPai6oeRn1zepqudcH2IhbQVDlhAzC9Em6riFrQJnDsFnKiJE8ezMdjtREPIj4INT0Tc/EB6z5sAxXufvEw5BVqj5cBcY8UpmA5oUcqFlbwuXS8Bk4J8QLrjZ8tZwNICf1eXJYUbUR2tvw6MhmhFt/i4K//F34kIsE7nYbyBfQP9yzuixEsK0nOoY74Z90cGcxnmVcB6uDA8XUNcppi9YqzL11I0Efybrki5NxQ32xtKm0X+AkgKTVTj9/t3+ETtbzeQgruMbQul7xVWTCWhKPK6aFdB4YZ+ygKHlI2UX6ZHguoDRrXSPKWSAy3bkGU02pCRYswJ/POYbuECJwODnWEtQzM9lbyCS4EmNP3WLMEG5ldEQb2ol22NOrz0AlaaZJi0nqob/b6Y2ccfp9jiP8RlsBYu8n23OyTHMTbWtq3o2LCj6xNg/mW90TIkomMwp9Lf9snOWLPHi0rDZJERgC6HcLfX0b9kKf4yfOoU7X0pMzSX8StukWJX5ir3UUHgHTF2AGOiaTWwWdY28/qJeZ28LPHp</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgSk1CEulnrcUS2bGJ+jOy4qcvoSc+KbiDgJqhIblRVE6pAhayUiFV/xqmW7cGszw4=</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgSk1CEulnrcUS2bGJ+jOy4UK15f3MUTXsv6blKUQdQun7I3omA7+RjXRWrH/BXVDC1osMWNf35Hc0I0TCbnNOu</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUvZmfczXew2oSmKnIQDL8ph717iTKpoHyZD5ZilsKk/+ndAN89eqxyJMY0nH/5wCTEb1njt9nAfIBY1VsT14sKzjypxJZnl8Ha6gC4GjeKto=</Encrypted>]]>&EICustomerResponseComplete;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Z1zODGtJ33Gpb+V+wQ57sV3WKyJOksGno2j8vPcBHXE12DXW4AbG0tDTUhX/5h9dJBjwgrD3I0hVHLD98uEk7/TuDAnn+9XFqXPnwtiiutpUbB0lihSPFS839KL/0almEo0mvXSqWhhGVhASHo+vl3NVVS6n2JDAT92ShaNObpkXeTnLN/OhZfS1OzJ5YshUh6TwKF24tsVe0hU12KyAcMHgj0bRikyr6vwn/RkgcrpII6dgOgMADxfSBRXrXwRradV9T8BQAtGqx1BhiKU5Teibc9r/QrH37WU4KaMxBI90T5iHZsEkw3dG05YACJ19TZ8VxnCk+hcNh6siHd8LCugXpBURge9SirsqtmOahbC</Encrypted>]]>&EIResponseCompleteChecking;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmboxd+mIxZOHQ7J1LJG+JAKFcS2VJUwxwcWWovjFpd6o6mdiYvySN3ylMqCCEpW9mYaRT2JSsYvPX2k2vwhmMGKMINgK3LMNqBqJQSB7xSQqs/Gfw1dlUv1fRjz7X5O+fPWoQJ0mJbY5kMekwCbt2cTJh9qcd1tiwIh73FNdN9OT+HeMLb3uVnPB4sZrB9azuK5E+ffxKFlxpkvmrVbEUSoEMYkE3ez1456SQ7di5Hay/HfLZxKINZNjorhfA5fjaT8D1foZ38NBsedV+L7RcA9eLRxOKU6ZzRCZp4MTd3Y8oOkJIQg4UeTFHGmbuWuJS+uc+bO577lMx/n5icuiBUhHx8mq1Hg/mIKflbLisqIWVs3CCffmzR/cZJYE2X5uHH67N30Q/VzCFSAflL5PGKvXFFx/P5+5d1ddWn3PEYl9jeV1lyhKtR5YIcEFpOKZKydJAVhnf1p4EOIlxyc84IK0YbLZr3XcWeo0CaNKc0iv2zkxN0/oFd9RKZZfPAm5Aw=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0Eqaxtk81KWB7g2dSY6ulSogGjyg4675u17CsTbA7Ec6b521Xzv+WvtJV1zchaqPkn7t</Encrypted>]]>&EICustomerResponseExists;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4anGmzLKQnuNqtSxOBqkpbpl2ErVOwttbA0Y5nr/YXrn3Vaa6qL7qjB2Z+xKIPATwh6kmvBHKvRzGGNqYDo7Y4E=</Encrypted>]]>&EICustomerResponseValue;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5Cjdr5IYdZSFmfi1WQdWzVA6aTCkjIPRXu5MgAWxZw7CZXhwJg66yNxPG7DevAe9NsgPHIS4FG0CPE2MbjxqpIknPgtXtLx4onPW2FOci1X/</Encrypted>]]>
      </text>
    </action>

    <action id="TaxCode">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm571/REZW6SEdohQZWf/Ft/g03DzPbtCaIuoRiMHA2yF3Gy7ptq9lBOeV/ACdzZ8tCfT/ftxAiyPeRoYoBbqOxhrwKk56mJVZgSlE+zL1VEkH7LThGcQQa1RrGXH28aEOUQw4zv0yWWtFRVQtN0HdWfVdvaUn++sHJbHogaKb5m6FowfYvO6xedFONBvYPo/CnTunYdEJpEwaOfIkcF8xxR</Encrypted>]]>
      </text>
    </action>

    <action id="TaxAccount">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35JcelMjUXjbsN66gI6cf7w0AxNedibGxE/xHU+oo5RmSTxzFygLBjuVkDfVn7wIxz3sGcSjzh8S3crd0maZFYO2Og==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>