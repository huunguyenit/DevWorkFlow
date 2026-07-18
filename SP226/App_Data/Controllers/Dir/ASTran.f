<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
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

  <!ENTITY CommandCheckDetailInputVATInvoice SYSTEM "..\Include\Command\CheckTaxGridDetailInputVATInvoice.txt">

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

  <!ENTITY ScriptVerifyInputVATInvoiceNumber SYSTEM "..\Include\Javascript\VerifyInputVATInvoiceNumberExternal.txt">

  <!ENTITY XMLTaxMasterFields SYSTEM "..\Include\XML\TaxMasterFields.txt">
  <!ENTITY CommandTaxGridDetailInitExternalFields SYSTEM "..\Include\Command\TaxGridDetailInitExternalFields.txt">
  <!ENTITY CommandTaxGridDetailExternalFieldQuery SYSTEM "..\Include\Command\TaxGridDetailExternalVoucherFieldQuery.txt">
  <!ENTITY CommandTaxGridDetailInserting SYSTEM "..\Include\Command\TaxGridDetailInserting.txt">
  <!ENTITY CommandTaxGridDetailUpdated SYSTEM "..\Include\Command\TaxGridDetailUpdated.txt">
  <!ENTITY ScriptTaxGridDetailCurrencyTotalFields SYSTEM "..\Include\Javascript\TaxGridDetailCurrencyTotalFields.txt">
  <!ENTITY ScriptTaxGridDetailCurrencyExpression SYSTEM "..\Include\Javascript\TaxGridDetailCurrencyExpression.txt">
  <!ENTITY TaxGridDetailTable "d32">
  <!ENTITY TaxGridDetailWhereType "loai_ct &lt;&gt; '#'">
  <!ENTITY TaxGridDetailPaymentTerm "''">
  <!ENTITY TaxGridDetailTableTax "#t32">

  <!ENTITY BeforeUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\BeforeUpdateCurrentCustomerBalance.txt">
  <!ENTITY AfterUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\AfterUpdateCurrentCustomerBalance.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCDJabWVE/EZuE08NAyg0iMxwps3lJlnFqoor58Pe7zwDHmHgMKTCJuF2CKZulIi208umuNYXa+yTho48QSFMz/w==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG3/F8ltDGwMDBwXUxq96iOpwPK6gmk5D44L+8gPGg0qOfEvENq3TBuc9eCnCPz/L770695aj2krS7Qgj4OdwzL4i/Yhhnvlociq4S+MSLTlkZ9CEjCotXwYWiS/i+AsLykOyMLRvwVfEb3ybsxMNGZIFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbibcivfkKrSb8Ljdlx4zEOXTcqCnyfrhKrrkxnZHAQF6rT61GFtU1sRcOVPU1FJO+ZBz54uydBk7DBCQ9AKRSS9Y4yIGG/EAafjfJ+OEd4fpCS8fArPCh/Vxb442UI/3loE7zzoW/6AmVLLARuVQbF7g=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDp1LeUY7D/GEkBUeaZddxxsnrM7TmQtQevDAw4TmqREhzw1BcEXbQUJvXefP1flh6Ow==FastBusiness.Encryption.End&TaxGridDetailTableTax;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4U97lVJvy5MuUJzFlmbPKGppPWMW+WnXHvcvEQh6Nj/UD9TZLDzCfeZFqJx5c8CvYg+mPGHCzUhp82Yw9c3G2Ec=FastBusiness.Encryption.End&TaxGridDetailTableTax;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22cHzeMDIkgthRKmsQo0kpcQsVDDtdvkSw+uDRyhEw7KDxwOd1afx3XZqmM9pDlGovd+betK4yCB0MuioCzMSkDy791ifYDw+JwQUxbspVEbSwl7fWnHZRWK+fjHa8xrVBaCr/OzDv50LWP9SbKVZOif/EjHEQaGrTJL9MZZfKNjuR9P018rKWXr98FvY2SEDj7zzrWsSsckHjTjMXAzcFEQuaqeflaaza2qOkXZARJ8k/5M76QwXpyvJwQNrFj698cTlvfkHLZzEubTmZpFR+gzORHN6gx7D71hYDvxii5y7sTWpfjnv/ishcIFNsAItPDvCwCILTMDimO/Qb54jLIOKXq61YVevJyaGSg7lgY2UfQKYHbGv1lhpZTFg04PVF/ywCH1mx+XV2bzKklSAApXPpr3Lb41fLt2ymZ/Q98PEmq/8MMBxaJiLwf32bksbKzSiWUjtujA1nixnfdHfCbSIp0SFcEEGeIS6WpyPxuOOLLll+kRcg3gsqV1IB4Fnhx9M4N3nGicwX+u/+Tf8Atg=FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaXSsA8MNHKsJ1gqsCW8zfkeCLI9UMD1CvGsvBFI9v2YhQ==FastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu3hqKphew81XOcqNszTkiBR6QFMtdosKn7S900/0wB2OQZpbCS3nEM7M5raCkBvHBc9Tz3VBhMZ/UJARgSQAo9idu7kmEfU1ElIHj9mJwnjETUGC7RHK+wrH+e6t2Kyanr6rIe2djzX99PLNWy25LUg=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUSEoXq01bMQnNA7AMkzvaA+jwMclBPnRtg2Z9h6hjFarURd/4k1qUoX4D0V8npXLa2jtOf7MMJYTPGYtwHTqPLkBXZIzi2PpH0ew/Mtgxfr+FastBusiness.Encryption.End">
  

  <!ENTITY CheckTaxCodeCondition "exists(select 1 from @r30 where ma_so_thue &lt;&gt; '')">
  <!ENTITY CheckTaxCodeConditionByCustomer "">
  <!ENTITY CheckTaxCodeFieldValue "'line_nbr, ma_so_thue'">
  <!ENTITY CheckTaxCodeDetailExt "
if exists(select 1 from @d32 where ma_so_thue &lt;&gt; '') begin
  select line_nbr, rtrim(ma_so_thue) as ma_so_thue into #d32Tax from @d32 a where ma_so_thue &lt;&gt; '' and (a.ma_kh = '' or exists(select 1 from dmkh b where a.ma_kh = b.ma_kh and b.khong_kt_mst = 0))
  exec FastBusiness$System$CheckTaxCode &CheckTaxCodeFieldValue;, @t_yn output, @col output, '#d32Tax'
  if @t_yn = 0 and @$taxCodeInvalid is not null begin
    if @$taxCodeInvalid = '2' begin
      if isnull(@col, 0) &lt;&gt; 0 select @$taxCodescriptConflict = 'var f = this;var z = this.getItem(\''&TaxGridDetailTable;\'')._controlBehavior;var l = z._getColumnOrder(\''ma_so_thue\'');f._errorWarningObject = z._getItem(' + rtrim(@col) + ', l);if (f._errorWarningObject) {f.focus(\''&TaxGridDetailTable;\'');f._errorWarningObject.focus();}'
      select '' as field, @$taxCodeInvalidConflict as message, @$taxCodescriptConflict as script
      return
    end else &CheckTaxCodeTableQuerySelectWarning;
  end
end
">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;

  <!ENTITY APVTaxStatus "@status">
  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.ASTran;
  %Extender.Ignore;
]>

<dir table="m32$000000" code="stt_rec" order="ngay_ct, so_ct" id="PN2" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu thanh toán tạm ứng" e="Payment of Advanced Amount"></title>
  <partition table="c32$000000" prime="m32$" inquiry="i32$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người giao hàng" e="Delivered by"></header>
    </field>

    <field name="loai_ct" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Loại chứng từ" e="Voucher Type"></header>
      <items style="AutoComplete" controller="TransactionType" reference="ten_loai%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="loai_ct$dmloaict.ten_loai%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7foBrYLz29FA9i96TY/Tpl1SikzWH7jS9ukReWE5AxoW0zEDqCM2Jl7z61Oy2ZbF4=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6oCvCyvGNeTkvFCI1bz32ZJ8lXhThkCwWNnPFWt5zZ3A==</Encrypted>]]></clientScript>
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
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d32" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="168" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="ASDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="168" filterSource="Tidy" categoryIndex="9">
      <header v="" e=""></header>
      <label v="Thuế" e="Tax"></label >
      <items style="Grid" controller="ASTax" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế nt" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán nt" e="Total"></header>
      <items style="Numeric"/>
    </field>

    &XMLTaxMasterFields;
    &ListField;
    &PostField;

    <field name="ma_dvcs" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="228" anchor="4" split="5">
      <item value="100, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0"/>
      <item value="1110-10011: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="11---10011: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>

      <item value="1110-10011: [loai_ct].Label, [loai_ct], [ten_loai%l], [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
      <item value="1110-11010: [tk].Label, [tk], [ten_tk%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="1100-1100: [dien_giai].Label, [dien_giai], [status].Label, [status]"/>

      <item value="1: [d32]" />
      <item value="1: [r30]" />

      &ListView;
      &PostView;

      <item value="---1-10-11: [t_tien].Label, [t_tien_nt], [t_tien], [ma_dvcs]"/>
      <item value="---1-10-1-: [t_thue].Label, [t_thue_nt], [t_thue]"/>
      <item value="---1-10-11: [t_tt].Label, [t_tt_nt], [t_tt], [cookie]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="769" anchor="1">
          <header v="Thuế" e="Tax"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="3">
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
        &CommandExternalFieldDeclare;
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5GQ3ujB+G6PxUXu8157QrM80oDxL7nZWZ0KcNjPaGZd8t27x9Y2mLmnui7AH1AcP+yFfPP7SYl/3SJ7ZjsfEiIY=</Encrypted>]]>
        &CommandExternalFieldSet;
        &CommandTaxGridDetailInitExternalFields;
        &CommandExternalFieldQuery;&CommandTaxGridDetailExternalFieldQuery;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJmqsAk72Ii7Myu4XNWxBZ7LFRJnpRsOvqw+sGYYBmMK</Encrypted>]]>
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
        &CommandCheckDetailInputVATInvoice;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxkW8sDrYa7jtl7JPjw97A4kf4yyll/zk4Ipgz7w9PC700XJUr//DBLtLUOcj3l0w+AsIspox2HVfJktYCIx0mfWAzFJLYpl1KGlpUz3OnrQchwh6DPa2GDCMYxp/RInwdYRzeFmpRW5YQA1iBn/tNTudeoWCs38j326vL/OB+n273JkieB78MODpTgyQSl0W1cfKUNDPValomedOGnqY0oEUtqQJMuviXcvy2YjDpcbpbDBSsTD/OSntsrdzzVCrg</Encrypted>]]>
        &CommandTaxGridDetailInserting;
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcB8rcG+nVrX6UyMQqkIOL4qd6CdOPXh57wyjrvgJ4C7r2zqJw8t/PlmkG/xJIvPByvBBzD4PO9oex73MVhGlxNwBN1G7ICYYezfetpEVDWQB</Encrypted>]]>
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
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XXWFyhs69eHzp8/i9wp1tobbnNvqfo70W6adms42OAra7UHtD6NwdmDAMvWSDlxy4pMi9zkVNFQ0CH7PJQSYMI=</Encrypted>]]>&CommandCheckDetailInputVATInvoice;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22eFQ+FudFLqOJ1ZESJzYLQEwH4yZZWrB0it+JxwHcPXfsgEU8OkasiB78lFDDclvF+TvQLGsI0lHnngPTmOX2Af0e/0djCdzpMbrZ4iMBAbMQUkyQh9UdEviIZvWUXEqZ5Wzr/2t+BqX+x03RK7pwHc579R8+oUsLWv6mEhCvIYhkjzXzZ9yRiyBXIZ/wSb3Hw==</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8ekuwD96Xx+hEywUeXNdSHSs8eQ/Skv9bglzc1DuNMbMiZMqvw7FmVcgdpJ8vcIf1hkd7IU6Q+6yyE/DRoyU89FqGg/tvd4eEnV458CyHT7FfpFLfG7QCDwcZKJW+DzjIqM7Q==</Encrypted>]]>&TaxGridDetailWhereType;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WjKvkqb9h7Fbg3EpXheaSx4LO+F84/73qkwd4Rrej3oKqvoPhIcYR+xvtpszous4LpEx6b+guMUBCgNzwG2EvoU5qzqNNGQzkec6n2VVKqZMoXKqNTZML9cApZqyPQ0n86i5XuGyWegI08ur6amRuHc6fGxCX72bKt/cA2img8lAJDwXvmMBpeuz4WfIdNF3mJ6NdsHgL6FOK0hoYsFfHF95Nwnb1kHFFPq8x5LiBTC6+s0moa80cZw5+L6Mk528rVfy9oW0vdCrr75qK6xORnG1cNXz2eBlo1xJLuWJWDpfGx4kPVeIDW2vVocvAJbbmFLRV2vFan4xG9+p1Fa3ApDznAAW39h2IEW8cUkAjKiJgOWLDivN0ErpeBXruCalCvyc0hqIfc/WV0xP8Fpw2M=</Encrypted>]]>&TaxGridDetailWhereType;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WewbsLXaFFdDrXw5epIQm15Z+iSXaaqRoKoWe2/DbC9wRSMnbJf0ePzglnfb2OTdkLjsTf+I++HqOCXeNUJtIIPfdwgiGJiL2im4K/10IsXAoxwps1y9ZCaqv9dlRWc5m+fUYsfuW+lwjNOO32j0dov4Xx1QlxpJvIzYdI3iplF/NY11lCjQE72RqSnEt/FJukKvHlcBEeKcgMZNMM6b8Dp7wrQJtqWnZpYv4CYBXPr6y0V+PlgoWY/u7A91G3ZO0JSZIQtj5kf/3gPHXXtAZ8PkZZVWMPlnvgEEIvUEbXl</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YlejlzHL0sW6aVjQYfxllTVmY0u3k5eE77upg+1kYLG0n12fkf9XhLMVmbC/QDyP8Jhc5lD6lBqlqQL5EtkPhRUXsyemWiQv6B6XceRJTIaG+wYt9ei7umX/GK302BPAVswub74eRL2+Z1jaChQNxA1Dl0VN9LRtO1eU1aXPURiTxoPbBL2wRFAOrxB43OA61faGUZeEgNKedrWKxMGWoNUIXZJtsFq1+fwhXD+O+h5EfGMySi6KBDUB1jtho+JBQ==</Encrypted>]]>
        &CommandTaxGridDetailUpdated;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5s0y2UOo+ZT5K16pLLsdqCXtGqNx9BZEMwxMpAXEByzdjrfmy4/wdQHsNPErddYZ8TtS0IgHRUVIcpYeec9gtmrr8FymJ2MdkhaAss/CajGM1d/mx1ZrIG0noUstyzo1eM52BB9HsSzl7LFDOM3PbBkz7P8y3ZONRVc87nK9iwMKDrRywM8d6yj/ilZWpQiQ1Px2qnVu4aUXq/YBJZC67M</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6FqLmxdUqWMprrBIG6/HYFinpJPEB8cj84H3G55ed+iHo7ircZxQGlEbFIHT+9c8+KYsue9AArTTerxJVbfoyY=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
        &VoucherLogUpdateStatus;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22X9euTvmH3eAzer2+ZvDJbE=</Encrypted>]]>&UsedVoucherLog;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHvFSNzMHd24rwNP4C3O42rNuZFwCg+sUIeCXnhwJ1OmwZI+oNZod8XdQ9cr3iMapBFNb6Sc91b6FmZ7ywPZZRVDHJZ8R8avoZT1GgUxGg79g0HZqt0nzFdMoWSc+xTm5rfI1I1GH7YC61DFBzi5RFIkTwOpLRa8X4HhjTZqBzTS2RZVW4cO59qv5pR9rVPA4ie43gfceQEUwOU14nBWNJvzkmQFPqR/275U4J+BuOlqB</Encrypted>]]>
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
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpkYx3sBKeFvn5xF7ZfQgDKIcLM2heSpZT/z4Yu3FikqpiwV/kVvGT8jNidhhdtcwNnSPIfpTzAio0/RN9m47VxQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxfy528jw3Nghg8SJellebIwOe9zxCzddzVNzv5G8wXnH9j0ehRX9HpjsfU428X8OT6KabSO6vB2kYSgh717tgXOIA8wJFMMnlDWQPbO4W0JGA==</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWym9wbgs85nvalQ9Nb4tkNBULONFJ+rXydvRx3Exz9pxEjcZSjdGAoz8aB/KQo18IsA==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WUdrEx4Ddkm0kC3THp0yudYFP+zOHtVAOZ0aJI7YHypl4qGMkGtxxUAps7uaAh2rE/N0uXixCanzTZtcGt2P+OXnPtFBnmf0jhRWl6MMs2RSbVbbIlKn/VEYtDNMSVR4yFnSVGm6t396GVAiPhcnQIpcKjbCDJv8fKM+3pAvZsQC6KVHfGMVK/YlHiMpia4uWF7XwZVKuAOfE2wEq3PTrQ=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Q97JImtt+Xw1HQpbeFFL8ZguyfClehHL70gb5kekB04TVVesmFsTLx+kGcWLDsw3gpMP2tzGJgRgzRPDz3/4se7zf6uegi22X8ZFiegcmpV3nSgAbHxR9ean77tujy9f3GA8altJADkfKV9bsPqi/gJbrDdmtszKtZpM9dZ+0nX328xroNyVOjab0kofR9L9OTcF+qiwOYdMhDkKNNCAecg9yUTjw2kEKdnfZRZFwsH3ABocQ5eq1YYt/5UyY3ptpSrZTK3LIHeBXj0aPahUO4GSdmmo7wI/PhYiByfeVxN/scNJEQmTPczlQ9AiF+Dxw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4faFOs+Xs65Ec+Ah6eR51ky57l+bjdCHquz/pty8nxIer/RslZHJHKguDfl3iy/3dA==</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KTJutaPtjQs/mQWQxHEkl3LKtZXEat0e4dSUQz6xAPalabZEFQjMukx9X3Qkr1+Dt60qwLUFuKcS/f0OmeVdLecUwPugSi4utbMJXn+kt5/ogBlTey2hpIzOmwF/ayAIQryp27mO1crW2kGckSql4ah2fWG9R5qOUnqAvcQv1G1gZw9ZD6WL7cwsu9ltW95AkbPexB3g8WPRQOiALIDSjeM5+so6KOGiD4yzoTycp1XKvd2QkkdKUVMJTzWgSvYLv</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7BvHCz6LZw5zw3oF/HOmTHALjBZBMb/bCklVQ0J//xpT7DUkJmPcCiofYuqzhsCyaTSHYUbXw0IJGSIlroWdRbEr54TF3tZ4fBl9TdB0BhkOsSd7qGm9+LUtlsgHh/K9hbzWaGLW6qyT/ZMsU5ESjQB+r7GDc/EPPqY2ASvFs1LbOa1AV+iEGKLSmNidb6gR+aLnEmRX7bpZZyTD/xkcNAGX743OgCUx6MOjr2c8LeN7hliHxQWMkfngxA+D6MNaKaetrsId3OY8wDN5VuonuRAgHFK7sSruR9SPB1ikiRq1wTGXIX6WjgUC9utYMcS6pWSA3YBs4DLzWyLFXGhzTwNP1ts+THsUAYx2KZ+ALGoSw==</Encrypted>]]>&ScriptTaxGridDetailCurrencyTotalFields;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WO2x0PzqIPvQIyIdiWgwvW0OynztEXBPBMI3im5r7JnQWn8b4C9LP2hNjJjcSSrIw==</Encrypted>]]>&ScriptTaxGridDetailCurrencyExpression;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOqrj2mNavAf9/4ESLwuki8rNCpT5ADX8tlu1K8odc9nSh9/zDSpE6KbTFVMNaQxoEqzFABN0tF7CgGbHm41cSJplgu7fDB1t1cPZ7ZNV6mLCQ==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UuA/TaprI5bZfQQ/n3Voe7UqnvAf6GMlru2UPsktsgZxoleE9qPZK2kI+Xya5N0yp5upE2SUrD4xBrLM1ZVn6NAJCka+kz5y6sui8/nyZ/+/JmuLw8IOlbaULPFeCGwj3XArKdPHafjqgt7tgnXqb0=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP8tlib1OD4QSA5Sl9Qe01zs=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyoZGEdv/qnNM7x93FQGFuUmuRnC8y1cHn+cj3SHdKqe7F6cwJWZ0QUeXds6IhEoRHaQOONX0iCn4F5DuLD6V2sbze6YmHc9NNuKqxpDOjjnslTlNcuJ4YZkWjLChYCtLu5UmNaxFyezKKJpFUDniQRCt7ydkQlQteONhpsTJOK7h06XRwr//JyP6Ur58TGr4tk9rs503eH6Qf6isuofX8zz06eRpmz+L0pw1kVX7TNrmOYf/RsqIcSPUrvufjox3vZSKe6W4GHYQLzdoZKVxOvfmEREkXC2mGwC7AGQXHUoy+TE/GAsNRCEL340v9xs3AGh6MXygMIQvB7PK9bSVd2IMuscE9+dQ5Q8dQFh1Jlvnh/whutZvLC8GVsHs2aHeUGxeiEuNNbR0B0E9/8ITN3CUeoxQI4Oj1ISg/DA4Z1yYKrzBvEWaPotlehAqupN1g6ApeGftkswaAbb9QhZASjVrh0nRrMoGzDh2aVjJVKPghz7RpeBDEaq4mdmflXLHsA==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUvZmfczXew2oSmKnIQDL8ph717iTKpoHyZD5ZilsKk/+ndAN89eqxyJMY0nH/5wCT4bYqlaTiUGXGh994zRa+umvjVABwSyu+0CnQrUAOVSzDEVfo/4jEV0hcSNBjGIpmKuEplM+L+z4Is0rTgeMQ5A==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZa8L384PUkg/4jpaczSTZ5aF4A/eQkAQqWsIx+wI7joA==</Encrypted>]]>
      &ScriptVerifyInputVATInvoiceNumber;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqapXv2dF/zPQRP5o3OalCwdVv/5VHmA6j8IRiGURqNI/2QkoZ029IK4MKrDMvEj+zyaTpcGKwfh4R8Lcby3od87JH3ytaAMCwJdb5PJl1Z8sbnzFmgcKxWXvREEkIpcSvbEtd51dZGVgiduZN90ZygbZwdLzJ1uSDGeyt38AMK3Dg=</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>