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

  <!ENTITY CommandCheckDetailInputVATInvoice SYSTEM "..\Include\Command\CheckDetailInputVATInvoice.txt">
  <!ENTITY CommandPostingDifference SYSTEM "..\Include\Command\PostingDifference.txt">

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

  <!ENTITY ExternalStockKey SYSTEM "..\Include\Command\ExternalStockKey.txt">
  <!ENTITY AdditionStockKey SYSTEM "..\Include\Command\AdditionStockKey.txt">

  <!ENTITY UpdateCurrentStock SYSTEM "..\Include\Command\UpdateCurrentStock.txt">
  <!ENTITY ReviseCurrentStock SYSTEM "..\Include\Command\ExternalCurrentStock.txt">
  <!ENTITY DeleteCurrentStock SYSTEM "..\Include\Command\DeleteCurrentStock.txt">

  <!ENTITY ScriptVerifyInputVATInvoiceNumber SYSTEM "..\Include\Javascript\VerifyInputVATInvoiceNumber.txt">

  <!ENTITY % EnvironmentTax SYSTEM "..\Include\EnvironmentTax.ent">
  %EnvironmentTax;
  <!ENTITY EnvironmentTaxType "1">
  <!ENTITY EnvironmentTaxTag "72">
  <!ENTITY EnvironmentTaxValidExpression "g.validExpression(o, [g.$a.mt_tg, g.$a.thue_nt, g.$a.thue], [g.$a.t_thue_mt_nt, g.$a.t_thue_mt], [g.$a.t_tt_nt, g.$a.t_tt]);">

  <!ENTITY % DownPayment SYSTEM "..\Include\DownPayment.ent">
  %DownPayment;

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  
  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTNoeIsrZM6JPpQhWIA2MX6DsQnyKUyCOvDu/u/eRER43uk/bGifb5Dx87UodLuumkSFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTdxdKQSrPXDWtZIyEmQiPi0vrl0W9K5vhHF9DTLCzOQeja7OIpFncAO+4vVdImQhjKHJBTRhHB+qS1b8JwpUeqIIGjhWZU9uIOOV9IH2b+XPlz2CL9P0fe1MxDehqxFmEisJFfUki98dzfRpPonwrGNdGH/37H2pNPGquwYsf7Hs2cP1O6OtgsbldV3WlGuMBjKQyN+lZZ4YM3xV/mlzoaIHHfH2aFqJ/a8Kw8bPtubo46IzJOH6j35mtpveQGpPfZxvERO2uMMXLXe1IDxjmHAmNMioxLN/MjrIuBq8/fhFastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTN83FcPoMfPOnsSSvGu5HMa16EhX5Hs7dRwVCRZrjQj52QoToGfWDcrBsY2WDtP+f6FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiW6TMktm1WmsL3Yw1qo98XxQM1+claFLvKQH5WMgCFtQLMgVFG2TUTpju/Y/Q5v4071k0Dqnx+cBZ/B3rVYLa97xupWEKnD1GyDsZxLSQvEpXmYK/CF7oKo0a+iJkmN733KjBVZmiCI4Nt3He/Do/Vkb4Zh8JtkXRI+/carFtJJ7YA0Lx1Bo0/MaeDyEahqqOJBVgG1ui2z8ELUBFi9h98CJsfjSotqb/2a+BRelbZuQFastBusiness.Encryption.End">
  

  <!ENTITY DetailVariable "@d72&ExternalStockKey;">
  <!ENTITY DetailTable "d72$$partition$current">
  <!ENTITY StockType "1">
  <!ENTITY DeclareStock "declare @stock tinyint
select @stock = case when @loai_ct = '2' then 1 else 0 end">
  <!ENTITY DeclareStock4Delete "declare @stock tinyint
select @stock = case when loai_ct = '2' then 1 else 0 end from m72$$partition$previous where stt_rec = @stt_rec">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">

  <!ENTITY f ", @supplier as ten_ncc, @address as dia_chi, @taxID as ma_so_thue">
  <!ENTITY h1 "769">
  <!ENTITY h2 "98">
  <!ENTITY g "PMDownPayment">

  
  <!ENTITY c "FastBusiness.Encryption.Begin$UnpyrB7faeNIV3QST2LJ01ndLcpulg3XnvBY0DWl6KeErJjHl8uKKLQxjTzOnDNMxlJR48PysGaEo3/+kCx8Cm4UV/BFnmnJXzo7y+cupPqPIMiFy5cqXTYsiLSZBEmy7Fhpnc9GBlzmMW+CewJsf0KB0lLJ3Yum5XANMZA6bBtQ9fWStWRtTO1a0CjH06mvjEbbwmj1LFrRYtClrUhjkbw97NyXiFJNVXOgbeld0uM1o6gz9yLLv8BdimpJjFKIcoaim7qevwmKEz3gUDgw9oeL2DOIhk7H8B1X6xJP+Wu/oX0i6T3FSAIn2gmQ0sqfFastBusiness.Encryption.End">
  

  <!ENTITY k "''">
  <!ENTITY v "'tien0'">
  <!ENTITY i "7">
  <!ENTITY Tag "72">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCAr/7zAOWiljGE4fN8S4f33/oNm3gZU5Xx9I48h3NhXxSexuL/9aqwsUG1MyIDEN0J3M+srl2+EsppNzqWO3kbMCrhUOtriWBoY7jir6PBqZEgXPr3nUFWkuvUbVmaImbfAZe9amEZBvAnVXZcIbw/pQDsKlFyPmCSUwz11HelBpZEbKWi9s74wUgdKX1O1HUWaoZj3dFUzNrHIqtSnSSslnr+aSv5k5DGJYWdiJtg2cHvl7k6kfsayJ/Q/IAemY3lN87lJc0uMol1vFmHraP+gHbg9pDs5rI+qj7pT6LadOl3xxvWB1qlobmBVLEI988vrNFUEeD1HcQh6DpIUA2LvzHqCqf4VV0Y8AEmoqREBcTCyctsDnydZLOQ5auOWK/M/TLwNl9rkrqvUEoP0IAPywoksvL+IGxShGN/VFK27c3zNz2Al6Lb0YLJVcvbVCf5CcxUcMxZ13qnbW4wgoG6ABeDDLwFY4Ad6lP0HqpOz0ERreBlbLUwdoQQNIg9/CA3j4FmMSn2bgEl7ohk4k61xdwT7klxuEHtZiWxlTMbeEeYRU/ZejSFEQILW+AgH50FastBusiness.Encryption.End&EnvironmentTaxAfterUpdate;FastBusiness.Encryption.Begin$1rW9cqd0FxI1BaZJjCE5+2v88QFiQqHiTbUtQ3VvK7HKHVs3t0+wCEGpoFmNE4RnWAtxCUpCWCtRFnKl470ngQ==FastBusiness.Encryption.End&EnvironmentTaxAfterUpdateFC;FastBusiness.Encryption.Begin$M+kvXi/dU/Pm/PVr5kRbNHPTwAobiaFbVuAzf9k6uqjB6v5IrJsg7iudlOp1svJPgM7THR1AbRIZFaZzaBsX9CacGbi+jNJq1PbaZ7OR4zewL1SfsPdQ4PIwhQ4+5qFnkazSfIMayv86aTOPn0OotZ0gN6ICiILvkD1boqL8CpfBSe6+PHobV0d6dpsPl/uF8CkrW+7RKYzX6joRalIKVcMgYfpKDViSjffT5k07+Q/t6+ZTnHL3yugNJK3KlTEvMMpuTkrJCTA23VrjHuzp+LozP3SvSNht6LdOVO9tGr6PO4+zwEbuc+/8XWEnGWftPmQVOI56go3+wzGagcwaVg==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG19PLptM5duMvXkns3YoMr9wNJzNj2r4sNIW7JGswg/Ig+F64Lgai9m7GtuugKfWV2VvTqAGAVyft1xd38P4KgvY+1F3mMwgx3s4m7FdpaWJphkCb8TZYYcK/3J6SIX7RB91s3t167eUagfpEkrJfTMOpiZnlqLEnOHec88cDNYUvDhvE/xaZLukv43HSFJ02XQlhrkBmGMkioC6a9t6PrHcAgS5dQK7fuNsAwigfj4ebo6ObcEXmNuJwWw8KD+QW85D8pmrOc+exeNbpojp2N5+IolYRjWpFXZT6REZUbPla0rt3FUiL+LsKNwdyjscKztAGx+XeFhnFEA/otjoGQLTKwbT0DQkJRoFXOdHZiHRctKFMqlLxUbTXxBVgNWF8I=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8qUWcisOZVMuqLBzpNZohTQ6/6++Gj747Ef6HqS3QMXYXGNPWc1cHOW7ch6bh3lhH0ukpj3EEJoXyycLfOYmB7j7bviBMCnz7IYT2MT8svl/WeCM4CnreVC+3PrdwX2PQCifg8k4X7dqkeQEiZvbi3E=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbibcivfkKrSb8Ljdlx4zEOXTcqCnyfrhKrrkxnZHAQF6rT61GFtU1sRcOVPU1FJO+ZBz54uydBk7DBCQ9AKRSS9bvKE+x2aBjbcA8d3Bc7gWcBveCuXrtnPrYN2NMqRhglg==FastBusiness.Encryption.End&DPCreateDifference;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=FastBusiness.Encryption.End&CommandPostingDifference;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4ac9K31h4XjQKZ5G+SkgDUrJK2mw06LzyL4ylPLikeDqeKVWk90Fm+7yytJpx1NjmgMgPXWULTfmR9zOPhDGTD4zdAdZ0iutKbupMcALGqU5m8Kgg+R3/K/JYFuWAMhHvR60Xl8l6JrN9Yfgu7HEULT1ll0jRRKp+vbJ6ugRyh5eiEy+KIxfdFjFNzh3MBsv2OAKqR9UeevwA+VjTbY/NhkKrVw3uPDO0PIYp8K8s1f9zBTb5iv69xrkn41AAdPbnIFGTB0GAZaHKJMs4J2h/AxLe1wArGe7zWPiCyCi+0ZRV0X6S10Rdoi5LC9J1dKOF5ZVOsDBClFmqmyz/FPRMWEW0kxzMl/x7e4LKt89k8lY/Wbv6PfQYuOe9wKtL8y1WXehu1YZILBa7P06xr+gOuidLpUYqPGv5FyEJLiEa+uJRirWht9Yfj7cUTq/UPks8bNKtrxuE7xpILuWeYL4O0brVq1Uk7DQy/5Aq/svj1iO8OrTRcrsjUH5A7bohdK9WrMzjBl4GMs9K3VHyJaxdig=FastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22cHzeMDIkgthRKmsQo0kpcQfnaj77LlJJKZG15XOXA6LWFlQvmFZxJFspWvGY+f1qrYjaIMVrN916xYXD7L/NvoIEdxAuoC4/4JOnfgQ3WI8nlkn1VqmLMSy5SH1IlLII3BKCzWruy7+PNsYN//jmEVGLtFlhh+N+szadzYCuCm/ZgeV7VCquYIYr2zvyNcLbh5GwC13G5H3snXoirY/ABIjYWqFrDDhK+7BBa1sTQk9Se64dwcXZulSlKs6vDgkwZvqYeu+pRE0zay48OhFKKsKkXr5BIu1EI9Qdd1IOpnLqTNsQjmH0qSzr4R7/5aPXy3gimDVSmirtvu2kjflvCL3gtrJKGDedkVmmf+2ND/tGluIpu2wKosG7oTUHgdw3pZC9OL35zNjA4i06kOPIW9Bzi7zMLYkENMAsfx+cyCXvo/r3AA2BkV7wnQVOmooYQ==FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaUeS2eCXWKKHcZsD3vfj0NXY9t0jItRJHOGMH7RKr5nuVJLjoXDKUAdgHDhdq3EtO1UhIrK9b8Qb0D29nmZOIWvFastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu3yFQMdW515oBWkzpOFtTiMT8VTcX7N1EPMgK7MYDDS+embNJZEj6sxRMD1+3VR8Rb0By7plO25YKphFAgGDOXvy5gA3btkCgol1mrZtHt6WFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUSk7eGZzjhUCKPR/Mh1DNUh4J2jjq2GFdrYiig5a1FEyHZjhDbGkkOvsXOr4Byc/x9evC0DcvjjLljEePRARV0A=FastBusiness.Encryption.End">
  

  <!ENTITY CheckTaxCodeCondition "exists(select 1 from @r30 where ma_so_thue &lt;&gt; '')">
  <!ENTITY CheckTaxCodeConditionByCustomer "">
  <!ENTITY CheckTaxCodeFieldValue "'line_nbr, ma_so_thue'">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.PMTran;
  %Extender.Ignore;
]>

<dir table="m72$000000" code="stt_rec" order="ngay_ct, so_ct" id="PNB" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hóa đơn" e="Invoice"></title>
  <partition table="c72$000000" prime="m72$" inquiry="i72$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã ncc" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and cc_yn = 1" check="cc_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người giao" e="Delivered by"></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="Default">
      <header v="" e=""></header>
    </field>

    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_tt" clientDefault="20" categoryIndex="-1">
      <header v="Mã thanh toán" e="Debit Term"></header>
      <footer v="Mã th&lt;u&gt;a&lt;/u&gt;nh toán" e="Debit &lt;u&gt;T&lt;/u&gt;erm"></footer>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right" >
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri0" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right" >
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left" >
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
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

    <field name="d72" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="&h2;" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PMDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r60" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="&h2;" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Chi phí" e="Charge"></label >
      <items style="Grid" controller="PMCharge" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="&h2;" filterSource="Tidy" categoryIndex="5">
      <header v="" e=""></header>
      <label v="Thuế" e="Tax"></label >
      <items style="Grid" controller="PMTax" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &DPFields;

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Thuế gtgt" e="VAT Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
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

    <field name="t_tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng tiền vốn" e="COGS Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt3" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền tính thuế" e="Taxed Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien3" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="t_nk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Thuế nhập khẩu" e="Import Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_nk" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ttdb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="&lt;span id='idf_t_ttdb_nt'>Thuế tiêu thụ đb&lt;/span>" e="&lt;span id='idf_gt_da_kh'>Excise Tax&lt;/span>"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ttdb" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    &EnvironmentTaxFields;

    <field name="so_ct_goc" type="Int32" dataFormatString="##0" clientDefault="0" external="true" defaultValue="0" allowContain="true" categoryIndex="9">
      <header v="Kèm theo" e="Include"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai_ct_goc" external="true" defaultValue="''" allowContain="true" maxLength="-110" categoryIndex="9">
      <header v="Chứng từ gốc" e="Document(s)"></header>
    </field>

    &ListField;
    &PostField;

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_ncc" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="dia_chi" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_so_thue" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="158" anchor="10" split="10">
      <item value="100, 70, 30, 21, 100, 8, 100, 8, 100, 0, 8, 58, 42, 8, 100, 0"/>
      <item value="1101000000-10011: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110--------10011: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="1101000000-10010: [ma_gd].Label, [ma_gd], [ten_gd%l], [ngay_ct].Label, [ngay_ct]"/>
      <item value="1101000000-11010: [tk].Label, [tk], [ten_tk%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="110---1-1--11000: [so_ct0].Label, [so_ct0], [so_seri0].Label, [so_seri0], [status].Label, [status]"/>
      <item value="110--------11111: [ngay_ct0].Label, [ngay_ct0], [cookie], [ma_dvcs], [ten_ncc], [dia_chi], [ma_so_thue]"/>
      <item value="1100000000-----1: [dien_giai].Label, [dien_giai], [loai_ct]"/>

      <item value="1: [d72]"/>
      <item value="1: [r60]"/>
      <item value="1: [r30]"/>

      &DPViews;
      &ListView;
      &PostView;

      <item value="110-1-10---1-10-1: [t_so_luong].Label, [t_so_luong], [t_tien_nt0], [t_tien0], [t_nk_nt].Label, [t_nk_nt], [t_nk]"/>
      <item value="-10-1-10---1-10-1: [t_tien_nt3].Label, [t_tien_nt3], [t_tien3],[t_ttdb_nt].Label, [t_ttdb_nt], [t_ttdb]"/>
      <item value="-10-1-10---1-10-1: [t_cp_nt].Label, [t_cp_nt], [t_cp], [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="110100000--1-10-1: [ma_tt].Footer, [ma_tt], [ten_tt%l], [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

      <item value="11: [so_ct_goc].Label, [so_ct_goc]"/>
      <item value="1100: [dien_giai_ct_goc].Label, [dien_giai_ct_goc]"/>

      <categories>
        <category index="1" columns="&h1;" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="&h1;" anchor="1" split="1">
          <header v="Chi phí" e="Charge"/>
        </category>
        <category index="5" columns="&h1;" anchor="1" split="1">
          <header v="Thuế" e="Tax"/>
        </category>

        &DPCategory;

        <category index="9" columns="100, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="3" split="5">
          <header v="Chứng từ gốc" e="Include"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 30, 70, 8, 100, 8, 13, 87, 0, 13, 8, 100, 8, 58, 42, 8, 100" anchor="9">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvk+TU+VhVo8TVn6/RBWefPcn8x2DLWd9M/OHp9yol9ulvKo9VEhv7vpacgotbCsCrE7btrcsO/M5OWuHUqp27qBe3oSyeNR6cFbE9gx7vZNDxvqYk5MqBlXw1U9rytBMHM=</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafVfUr29wdYs4ZnufjL6jy2wmrSu/FWkgEwnlxDXfbo8oNweNqWXPky5ClqxTTSgAMJiBkxr/9/TXJsmRBZArPsl3qn9NIuCJRDELzISv5Z6MLs4MY0hWLrzWwZkfK3mwqm7OLvjNMF7TcMMRvCzumig=</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IJ+zPBW2k+1o75apxCZqtKhJmhWiYUXX+nzPiaqU7TjRffvqobsaZ7vWCU3/WHGCQc=</Encrypted>]]>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7RAoqcW2gaQOSaoqf6bUVVj/w5BIc/qhqogwjsR0byzIMCTWDuuIoDhXFptnBai+5FCTZ2wrkXVkJduUTznY+geQfJK1Wry6K+jT0jcYBFu4IhAZY8phO7gumCH47L6HZvI6ITGQEZSaCRJgSh1vHEvj+2ZBJvHSZBqUXNFy7Dd4Ne1F7QsaLwIZWI44BAPog==</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWd6HaL1OGauusRtQb6bqs07xG6Qjwkz8N1z0TqPoMU5IOoFDY3nwNKOqVHA66gwNgja25/CKYoVnG6NbMSTqOa2j9xpyPdCxJmSfgctPtBa9NRlFbJPPp/ZMae+L5uV4MQDvP2sobWUwAEKKKRh6rj5KtKQsBazHEWShjw/3WIrnw==</Encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;&f;<![CDATA[<Encrypted>&TStonzNIPLtkzEJ81P9J6MO8+27j66ZwA+UiAsev1TskpEwWEeBzVYlIAeSyOAqPDG1B1PjkIz/wv6MuBk9gydKoeAnjKCORRWcpR3Q4oSbixvQMtcpBaFFqd4u3UPF+</Encrypted>]]>
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
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckLockedDate;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        &CommandCheckDetailInputVATInvoice;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AsmVZ0zPSEIwBJ3YgWPBJ66FzzU1zY11lQtZ6jHCGX0ZHoHhn2G8J3zxc8uEteMagDj7OfkaPi+sKKu3wA7p6Kn45T1Kt3h4XAU4KSe2Q4JLZkKNyfP34TcqwexXh5b/biOHxTDaFIX+2GX8cIZmUmE9pgeoXnTt82WNvm15wj+zdjFT2mG+hVwtneZ6WdIz9bvNe6THDxUv2ScdpXkNt5HuF6b+9zYBFYHioPfjvITQtQ==</Encrypted>]]>
        &DPWhenBeforeInsert;
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGf7R1S1poFTURP+C/JfC52+ZrEJ++jQ0rsk0o2hGmtnpF8WtF5a/LMmgr16MB1M57JW/1Lj4GO+r1/5e13Y555Ro/qi4WJ/ik5Ee47jjk+J1b2Qq37YrGumh7NRE3aWoqN10QZEspmtFEbqgbvgFArcdYhO//D78TQ5UWXi0kwqh2Q5/uN/OQhIGxPYCBhvVNNinZaHpMJHFLJeu3BhzvQ=</Encrypted>]]>
        &DPPostInsert;
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        &UpdateCurrentStock;
        &Post;
        &AfterVoucherUpdate;
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
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckLockedDate;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XXWFyhs69eHzp8/i9wp1totf8UdWkIJzDEa5aGRjVzxdbsKnQA4NvAWVRJEtwopfg==</Encrypted>]]>&CommandCheckDetailInputVATInvoice;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22eFQ+FudFLqOJ1ZESJzYLQHAonl12OcAa1gV0AuSXQHAufUdZspFsj14RsIZEDSQlskc+ccfHDaJIOKKrgiwu5iFIQs6dafO5yHzO2plv7SZqTkTGcea8d9P1YwcHaXQUch7LjcKMtN/m2la++k/JcWQlCqyHAlhqq8bsSzzz6k1</Encrypted>]]>
        &VoucherWhenBeforeUpdateLog;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku5yNcvOV0X6jJhCvtkI4kznZWgHdglQD/PPQYw3XRRLPFY/iNtQNV1uPi/Wt6KeNDfNWulKjyl5v8t7zRy0mEPh6Pim/0r7nNwdrBdxme6a7YQAZKcPxXH8Ici8JEJ7w7TWORXE3hlW/JKRTXu2Su/WLqubBTDQFX6RSLm47woTlyOnY4n/5Qhynk6aLCpa4irTx6CAPyrFc1/uE89zst92iaKD0bu15EZ9InbHUb9lFxlYdNcN9xoMCILq09CSNn8rzIeTlJyGnKMciM1ChLWTG5IaXofzeV4qqarvOM5ZRiuVFG5xVmzTfjjCS8DhPp/uUpkQC39anA5XTQPqZiliBV+Zrq3YcMQfCvzioxSSFpI/K8kYMF5mFsVdoorDhVr6d6Fuwp65fhszQRFN2bywWz6d1Hms40ValPaSasjFF3NXokKg+/0OITA05WZBxfGgwFHPi6JST0YYy7oyVt2NTBsPeEcsH0YAf5oAo9ohhoxNg5fkeiLhOLkrQyQqVxPAtZ0UbKGICBhgUMj2nXB9rHSqrBFUUlCscK6bnOeOSE9oYz9Gu0ouJnGaW47kPVw==</Encrypted>]]>
        &DPWhenBeforeUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9MFiKbaRXfhPXuXM6opLYjXpaA4v5Zm3cUR6BIg1dj0KfphkZVkuoeOBsCsH6RP0sTfEQIP/9bYw9kO6CIetQ66LZhrJB58TQ/90TdEnJTsnIuf2aUZMGn+IkWVy2pgRNaGbgkREmRrbrRinzBXgPCEOgXkgm1T7X11HDcT3ZvHATyVpI5OU4kDmm/3FQib6fJn+OU0zNCN4wwRPy/oDOXj1ewfLmotAPjwGGAxBBxBF5C0JOc23l5tW19Ksjb6/Dh+igRlCYeriL76arNanGw=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22R8lO2VZUxL6zu2GJX0G+ikItljH+djpVlCqJ2qC8uO6RE0uGdalSBikzirkXDNXRVl734hzaOKX4lkgp27IZWXSnvKF5jqwcI7Fkk4aIYEl32htK6Cej+cTzfYuRfXCbBeIYZfp/IrQak12nuIq7wsr/MycNNhlcyNRW4uOEP4jFWgmE84ipyzi9mLd5vxCgGyJf2JEWkRBX2pAP/f5XixRXUge57IBNLC3r2hEJ63aQACYR6+Wkhsg0iJ5nNqHf+J5Ayk/YIqdDhTlr45JoqZgWTm+foFr3yj15zaDD9ac/W1i0tmD1hwCVemD2z7BDpPt6z4/cmSFEhhhODXsIQShub6bxZQFRvOIb50v2quis1lR44CTlk2KSIv1oI6r0n3dLzqAlEWPScaNMvv6wl8/GuqstgbCQJr2mQwDNHic</Encrypted>]]>
        &DPPostUpdate;
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH/OhakbblJHICpivHeunyF23BwdjUkPG+FTrwJSamgnIKto70OJ1kgs9uMWBlG4fU0DpprInX9jqvv2DU+/yHBTyPEGb/obgEX7brXtpdF6</Encrypted>]]>&ReviseCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bj66wWvyM7CWl3sXdwt/E2Aqsd/d0CmOf/Uxg6NEEQk</Encrypted>]]>&UpdateCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4X/dT0/Jf2Dh0K7QZbadmUe7qmhObhu2jl87oY6RH4S3</Encrypted>]]>
        &Delete;
        &Post;
        &AfterVoucherUpdate;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5rTN1z2TAvRcHxKacuqFDub75yfUOIVdYhafe50GNA9ruqs1WQTgIAIbs0WiAncaCQbTo0AGWUuzhgcgcUH8JgwHGUhxY6MPV9m/tHG6Fk/Gehwoku/lG+ZVKQ5OrLBpkJX75ZgQ2+zP7soRV6RI5w</Encrypted>]]>
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu14PKj4kTZpEXrfCacqnL7PWx6QYl9vfPUnFTlINWVQLBec1rIllyQANSnixSGcz4OM94b8PJ+L8f+2Z4jwmEKiCBDUITAwv2Jio3bYO7M4YIxcwts1+jcqbdrVnsr/7Aw==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1pvM72hhTvRsxrEjkR2sEKurM4FKeDC9XmQhcn+Bgtq+IBhIYCv8OGldfae16S5xJkbCtmy/e1i/7nGiHMN/9s=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6py6r25aH/B4IHP8jTJy70rcwIFwpcOBjc5h2naIVsR50Hd1WLgM0m+rPcH6Ql85XvRoibfTxGD6Zc+TIWJork=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3hVE6P6UOoVfhzyPwUF+khGxj/PjEwWGcgfSdBehggGpBmlC+ZMXpEbl41/ns1Na/OvUMGua6KjUheUDaW/weA=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &DPPostDelete;
        &DeclareStock4Delete;
        &DeleteCurrentStock;
        &Delete;
        &VoucherLogUpdateStatus;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22X9euTvmH3eAzer2+ZvDJbE=</Encrypted>]]>&UsedVoucherLog;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHvFSNzMHd24rwNP4C3O42rNuZFwCg+sUIeCXnhwJ1OmwZI+oNZod8XdQ9cr3iMapBFNb6Sc91b6FmZ7ywPZZRVDHJZ8R8avoZT1GgUxGg79g0HZqt0nzFdMoWSc+xTm5rb4v01+KOWtHXQL/1QmKR2yWpPM2umCDWz5L9FRsueq0NLsvx5/wz0PLAgMQsefzsg==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKx+0ZgooVR0OGD7rMK4B4SIoyYlDksAslXQQ4u2fgmRnlgeZho3iWZ0nf2nQbniUCIetxnUc9hjYMqKRc//MnLsuU2lZ3ByQjz1iKciQ0Iu6AyYwkpk7vPLU8hNAL9v+W/VwFcKPZE+y/fmAgx8+3kt16yUHi3x92gNMo9TihFplywo7/UVyAoPVAcoTOpkSgb1cam2EJkubtRGEUJNEGc06veXmnDgIUOf8s49cGUwY9JdyS9R/s6VhrcaD8v6Q6SoSl7zlWuCXTHufAEY42LpT3Qj4kCZwgZ1rpWlJAuzKP5CWK436Afy/8f4waOf1esGSqyMDsjMa2waBEDzA7TN2ce5LC/hhmdgUOJKpQVGcHklp/hllc2rSnIydjW+NSJtqpvQlOwq+O6lxoCLLR33MqKDLpiXV7AxWO/tv2Al/P6aDaWXrQcp3WwZvAa7zTCvv5qBWsKQlc1ox/TTXLbcrNvHUoaqxYBLajYHXM5XzCRejOQkC10mDrV+eiAZz2dJaP1uSsIxV/q7diyLnflYUPby1Z5KdXxJfUjIENWhyL42D5HR4lccffyyTIGjiVej0iCKX0FpRR4cn39m3LhWlU6ZNn04TJjToR5ceLAVYBSD291IO2tQ0BUuQvq6z0+9q227Ux4iCXnSzhytZDodLoZ2AW35hDj75SnByzsYlygaMmdCSAH+zZHwx3UMPnT4/Ee/PiXe7IM6flPo5A0au5lXs2pDu6A/kkgEtHQID4BfNWa7Bx4DVszIf2XWTv/jBEqJLyPvE9AJgsS80o5J0ZhJadH6As5/CKvmsQ6y6SJjO5cugxaEmlB5Rjnm6eDnLje/SDcNai5BvmhbHl3arr3967ZhMfWfx3UAGPjaFjm3JJnFJqDyt6VPAYqdahZZyHEYpAyN6nCqbjlRRTUF9dwbgkK+gpOt/upyfRl6k2A66a+tA2/cMwf4523ThgwQquq+c8Kppt9RKvXjn+QH2yVri7bfWVPSyeXWSw4PPGSHLFPllzOZUp69eVvUK5eQ8UvALVP9Q13SzKYwyqjI985aU1/Mlf0b1WGlCpRIJUNn4e2r3ztLO3G49jw8EAmq42EsbRcguQ+aZQ/3xRqViYLQZy+MhttW4jX69eJzfeubWahFHSbWq76ysCvvEbzKvXjPEYg00pFiYyLZiaGqRpG5rSivWaSe22FiEuoCAOKE7nWEXy6+H6FaiTRoew9mDuKx8suCNgOs75EpeS1wMzRshXhVVO0aG+pkpnYyLh8nNohKpkMY1Etr/Q5ELMIxadhU5TZZhLPn/KIAuS2N</Encrypted>]]>
        &DPCheck;
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpxEo0gX3ZSm29Pl+bEgpSSdvmRY4JJ83oEYFzir0FLMEtO6dU7oieNBQDm6EonD3bT2WAZXvRnaI9F+jp0jfjKQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxdrQf6mv4I646Gat2YetPUwR1jqAbvvg7SVrBjJouUFNyuY43+OA3yNp/NSCuUyGQU=</Encrypted>]]>&Tag;<![CDATA[<Encrypted>&ymPgYPXvzpL6Enqd4IDunK7pnavP1dtf6Ucf1UiCVptIL4FS2488MrmiXHf3zC71JHDntnHoYvoR/Gz0FCpVn060+IhIeB0abkFc1NLfbMisbDlbz+yi6qaUpq8rxuWLVWFsx1dO7wEWgjUr3sWVScmv5j8GjVlUkAB+7iRDeeF2+2dATvQA40452xyaXoBylyWYAXBwtx/u8H4IPqzj7lMl1hlqtBSdOBaNFm4Ze/QW6tLgkP/TbXQ2Sl36gS3L4nAY6agR8YhCI/J2toBozQ==</Encrypted>]]>&EnvironmentTaxAddRender;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&uGHO1INig/bVVI9tiETWT93juS17Eg3zeL5+cw5rKOgKM1T/9q05Y12zCAccNesAwLWkAfehalQZ17gFxltWUj/fkXwJyaW3plvGsCjbKzAyey4S32rNg6cr9hOxkLeFwcnM1hvlOPcmCcxBRJ5T+rp/T/AufR/h+l21859V46Q=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4U0qjLJlGlJJEgaKQfS7mThjrM4LNwgRV5LRSNQwiV++dZLszdHmEpdlkbiAjQb9GGc4YJ00ySCLCslMplQ2LpE30F8x1n4TqrVYB+nXhzH2IQsZ60BQ7jfgvmrzTN2QurO1/dcY7XStp2fADINT4u8HurSb7CXgsUdd3kCX5UJpE8UI9Fcx7SOIgVIbKNYT1g==</Encrypted>]]>&EnvironmentTaxRemoveRender;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezKH0NOatQHWHVELvUYi3b1TwUdSt2Fng+cG6S67vmGHj7MxD5mxkkZnoKsyH3OygX6xyDNaXlZrjDJQJIMMUDeKO+rHF9/HhS6r72QFP30/vfquyqjU7jF8oeVAlFKCGcPgnvdIui2GTdVj8fcT6Mv1ggqykFaquE+Qx9PoxWRHjQsfZ+uFkN0VQI3b30AAnep1irCYpgK4Q5kI6mtTUifUaiRCGbDbOty0UXGvFPhZJA1dIFeWj+yHPJt0diYTn5jghevzlJvlaATMLweQue8g==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4faFOs+Xs65Ec+Ah6eR51ky57l+bjdCHquz/pty8nxIer/RslZHJHKguDfl3iy/3dA==</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7AwHTQFqeMYoxYjllYAJQtbUC6+gVFlnjbJ1BmUXocaGrdO0Vb+YIYIzlRD0/23i5uiE9arfa0THydXurpSgNPJ9i+EAM2Aw09vW653IfTH6r6lXa+SQV1JtmXmRbJhLMREFRyA9Q+8q7VI/7egqLXtn0dPPksXQWtnLoTy1kGwth27p6RboeTJD7HsHTYyoAXE+CpBmIJXXl/nHcM+vdKqfpOanKFVe92FD4DfV9vm7dVa06LzGYGzvQS+ylbBrInvXXz8RwMT5VvMQp9Fuiof2Y7KZyGksoZR61pfSe0xaKAaqdm0hDcKvb+L79SjydSHBsZfBdVfX4bimM/QVKg/W6gz2vYsYEMaM8V8SOysASzjikc/J4U29eLv8PLVAIrA3jfSOFLBUbG0ckoHC0IeLcgMxBcXyY1Qs/KQIx1uKijQG5QICqE6aUopMszStIFFXVY7cjwZ0yI056yZKHlitLtphE5uN+msCxTOHj+t1NVMgJySOmZt8Qrs7EWHZyc=</Encrypted>]]>&EnvironmentTaxGridFields;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d4aEzc+kNDOY8Tw2/ryc8rav+ex2jnap8Y0XHUhG4CHkbBCphZ5BfuDctfZ/54pKTI+mh7FELIn8QxpUsp6rjZ9IP4oa2IwX3CyhHOLGiwPatFhl4tmI0TQNIWlO4Uk6D6/YWBoX1KobCM/v8iVaH22+upzdhnx4htSPQHIp7P9pQE/qiI4zXXyrpMRgo8AZQfLNHvS7+/FliVCv4yYgHFnV5jwzW2fN5AA8CQGxtBu3BqiLoDpvZ34RFMSaZ87y7T2I+/+RDhmcxdBlYkUhf+wUBFhH1W7vbHbLOjmV4dV</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WqhhHt/k272dUS65C1dUznfsK8O1i7YrIRWWjQj+LFyNU9/Skv5zH8r5MJZRKUxcBjog5tL2rJcDM9sIZ0oCIaTKwqIpot2dttgArKWiIJp/1C+dGT//BLKcuMexgVdUZirQV3dQ29C9KELQqRK6yjA==</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bCbV013qAsGS952fSWRPoyvxzwp1hEiCaaUXqlSMSnMTosl6yfsWYBEFYY+Wckqf/UZKTNQRu29rVHxYHRERyZ8GN0JQkdSU+RHCAYlav5m</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxCLoaf4Gmwgn2t2ySyEa/mzMl9HG9cONPRVOw12BsUxvRHPi0ih0GUsR/9ktVk8BX</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyrbHcGKgLQlHwzG9OeaJurRpUxtRpsiU/VasauyUSukxmngDxxf8AXabWmNf8zC7QS4Gdj8LK2HlW3J2XwBp+5VX+e2T1J/D5WWrs+4MAYsJJsFSn2wTWqboqK6VcOCOQam5glh+q3Q5upvF6dwvrkKChx9dCNGEOzQea2udNy31iKzLaAKc71ACHXl/RS21apbLOWbFXkVt2PQcbja3p5d8GHncvqfGx4sSiWZvmfEV</Encrypted>]]>&ListTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwsygCMj0NC+9aWOEuMAoGMuPGf1i2QgLtlqWPUDvUanxIwn3ThRgPm95i50JRDHjDrPiA+I0GaLoj2Sm8YzC+rYt06OLk38yuLQVFhZwQyk2MbwFi5FIlKYaOABAbEyva+IGcNmEIFKwuuCDmF3VmKY26D2+1yZgd+sfdSZWi6DWfSlGaf+pqUze9k3ZtcJfGYSJI9mPmUO0mpbwetLCjWbPDuhObQJeKvRZaYlgALb6IQ/TtGDivg1ZLdlyYoJE1/K06zRqKyVvll4avkjO5Yfo+YIWSv9bRtXqBk+H9rFvn2TdQH4HM/CNEKzpVPSg==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &EnvironmentTaxCurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUvZmfczXew2oSmKnIQDL8ph717iTKpoHyZD5ZilsKk/9QOu8SmJJjJlmr2CX5xzNHbQx7GOfdvx8PdJ9p+gy80f8qP3FtskRsmxS8/Pe1xWDN8EARuj2FqyBc4zWFBuRqEsW37IqzYQRGP1zrKGSPpAsbn7rnJ/FoKdcguUOokD7oYb3SNvklIFpT7deew4seGIEx08uMdOqEa3vvhslBgV03w7IDMK/ioLq3J8ekHFmJbez4eShbfR/kaJSgpni2</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZa8L384PUkg/4jpaczSTZ5aF4A/eQkAQqWsIx+wI7joA==</Encrypted>]]>   &EnvironmentTaxFunction;
      &ScriptVerifyInputVATInvoiceNumber;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0Eqaxtk81KWB7g2dSY6ulSogGkq4W7OP571jRmvm0/OLjKgqbssKw5OsRyiF4R941MElhnVZDOPZGcUPrINBsd3tkOnHsY+NZcy4ZKLboZEUrxxcrI/CLbywrTX8w450F7ZmBqPI39uAv4trbmVhkZZR7z/cqqCLbpDbbytiUMVpBMaIPWGUbScg1NQzywN6mEyhEw+zfqpziDppKFY50yLx3Y+XxrwZXyQzTZsiDXhCXjJcbY2OTy57YexIaVBdM88g5pj4Jj7pkDoHNoAR6lUn3g==</Encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgdnBqGoMasjZupHuNMl13HngfWvYt/i9PolUqSZc15ypx9HzyapN16I/oW7cFKqRubL1OrPqNxzYhh0QsjiBcEA==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>