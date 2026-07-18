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

  <!ENTITY % DownPayment SYSTEM "..\Include\DownPayment.ent">
  %DownPayment;

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  
  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTNoeIsrZM6JPpQhWIA2MX6DsQnyKUyCOvDu/u/eRER43uk/bGifb5Dx87UodLuumkSFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTdxdKQSrPXDWtZIyEmQiPi0vrl0W9K5vhHF9DTLCzOQeja7OIpFncAO+4vVdImQhjKHJBTRhHB+qS1b8JwpUeqIIGjhWZU9uIOOV9IH2b+XPlz2CL9P0fe1MxDehqxFmEisJFfUki98dzfRpPonwrGNdGH/37H2pNPGquwYsf7Hs2cP1O6OtgsbldV3WlGuMG2EUqHHxTzmZ0W/4g3NEo1vCmphXzKOix+NGwTa/umE4aG+ebTI7/bnMED0vhWI5P2QK46825hkHc82Jm9omhIi3mdc17yP5eqDvv6SKfjxFastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTN83FcPoMfPOnsSSvGu5HMa16EhX5Hs7dRwVCRZrjQj52QoToGfWDcrBsY2WDtP+f6FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiW6TMktm1WmsL3Yw1qo98XxQM1+claFLvKQH5WMgCFtQLMgVFG2TUTpju/Y/Q5v4071k0Dqnx+cBZ/B3rVYLa97xupWEKnD1GyDsZxLSQvEpRtQMsOOlG3oqVOv42Kucq0lnOi1sW/yznrRrPwmi7t2mON3vd7WSSwEpf/omafcKFwCVss+EC/XjcTfEkP2YC55d8RbbxQBcpkqcnOzngO2xdoDVlPhtvq+UqORRB+qSFastBusiness.Encryption.End">
  

  <!ENTITY DetailVariable "@d71&ExternalStockKey;">
  <!ENTITY DetailTable "d71$$partition$current">
  <!ENTITY StockType "1">
  <!ENTITY DeclareStock "declare @stock tinyint
select @stock = case when @loai_ct = '2' then 1 else 0 end">
  <!ENTITY DeclareStock4Delete "declare @stock tinyint
select @stock = case when loai_ct = '2' then 1 else 0 end from m71$$partition$previous where stt_rec = @stt_rec">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">

  <!ENTITY f ", @supplier as ten_ncc, @address as dia_chi, @taxID as ma_so_thue">
  <!ENTITY h1 "769">
  <!ENTITY h2 "98">
  <!ENTITY g "PVDownPayment">
  
  <!ENTITY c "FastBusiness.Encryption.Begin$UnpyrB7faeNIV3QST2LJ01ndLcpulg3XnvBY0DWl6KeErJjHl8uKKLQxjTzOnDNMxlJR48PysGaEo3/+kCx8Cm4UV/BFnmnJXzo7y+cupPqPIMiFy5cqXTYsiLSZBEmy7Fhpnc9GBlzmMW+CewJsf0KB0lLJ3Yum5XANMZA6bBtQ9fWStWRtTO1a0CjH06mvjEbbwmj1LFrRYtClrUhjkbw97NyXiFJNVXOgbeld0uM1o6gz9yLLv8BdimpJjFKIcoaim7qevwmKEz3gUDgw9oeL2DOIhk7H8B1X6xJP+Wu/oX0i6T3FSAIn2gmQ0sqfFastBusiness.Encryption.End">
  
  <!ENTITY k "''">
  <!ENTITY v "'tien0'">
  <!ENTITY i "5">
  <!ENTITY Tag "71">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCCOzqLjtZScbGOIBDKWnvdwbYyRgfT23Jgk0mi51eTjuANIQu1YyPvtf+plsHQIy/UJ8lHqSdWuwrm7vQ+ue9Uqfz1lEQmtiY5O+y5+nMRI0yLm5LKrV41CY81xJSmhIdR/0LB8PBRfEf2G1Vsb5FaWPusgztqAlX2EUM2C0qEpEn2PFhcIPOoUS0J1xoZkqHiSMSQgN25UoPupOJRk61d1AniyEy0EJQKl36KzNNMMM+NzbZiB7+Tla3xzPTedgdBbArvggj6neIoOzI+dvRMJRxCEkT9efv7ndgQbEOZOD4yHW5i/n0l0T4HuhC1Obxk/hkt8rkjLysBCYngtftE37/BDjJrCeszuXhBfrvrZZrcwVmW7HzqJB0xyOpj3Nl1ewJfkRsJVM/MrV1fhfuJBtkWgr+dQn0ZHxYk12KAj84hFW7YDTGDRgYkajKTqGZYmRFP8E9VKYrs/Oh765LNsuoJ7jslXFEUSFA8c25AoENnShDNcimZByjsdc9ViUpPXKrq7lDt3k0zVc1FNdprHjV3rS7jG4aZm7WXfBcVRUIfaASIr6zuK657FxntqYViZSHUChckJhYtE8zw0yI/jhOXbZ00Wx+YAPNA4HaLegvnRRjW+sudVQOnNX4V1mdm+m7RgJQqOuNU1rBBiyePeZBdr8zebb3AdrkutVQmwkeusxUw2DBQZeTvsJ7l5HfV17/mehk414Fk+1oxGuexGujmbaUrRnhNd04N4VbdHUItWt4xLGlBWzZ+5nQ7+qKFastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG19PLptM5duMvXkns3YoMr9wNJzNj2r4sNIW7JGswg/Ig+F64Lgai9m7GtuugKfWV2VvTqAGAVyft1xd38P4KgvY+1F3mMwgx3s4m7FdpaWJphkCb8TZYYcK/3J6SIX7RB91s3t167eUagfpEkrJfTMOpiZnlqLEnOHec88cDNYUvDhvE/xaZLukv43HSFJ02XQlhrkBmGMkioC6a9t6PrHcAgS5dQK7fuNsAwigfj4ebo6ObcEXmNuJwWw8KD+QW85D8pmrOc+exeNbpojp2N5y5iTMAerITGNb+VgNbLRgY6P0bTr+ycg+mdOtiewXq+1me8MH41jbO9JNZUfxzNKPDEKJUmbBvXKm+DgOgHLqQ63lLd+vlZD7qx9U0K+pjQ=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8tqbxv5sFc5RuHClAFi7BerKoF6uIIFYF5gOV6HnPNyMlgoWFdeRmBEtdKtdi8OAikSkCHnUKWEc5QErVV0h5QuobqWOAyVD/9MMHSb6k1ZryuwVedgvATJ+1q9cN+SPnoLnVBk8Zvp29bdwPdIbNYU=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbibcivfkKrSb8Ljdlx4zEOXTcqCnyfrhKrrkxnZHAQF6rT61GFtU1sRcOVPU1FJO+ZBz54uydBk7DBCQ9AKRSS9Z27oH8VkqM1CYHAi/S51VkXNZ4SpLrQWk0QyWEnbxQhg==FastBusiness.Encryption.End&DPCreateDifference;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=FastBusiness.Encryption.End&CommandPostingDifference;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4ac9K31h4XjQKZ5G+SkgDUrJK2mw06LzyL4ylPLikeDqeKVWk90Fm+7yytJpx1NjmgMgPXWULTfmR9zOPhDGTD4zdAdZ0iutKbupMcALGqU5m8Kgg+R3/K/JYFuWAMhHvR60Xl8l6JrN9Yfgu7HEULT1ll0jRRKp+vbJ6ugRyh5edI+uZYmZzIpORbBfpJZOeqCJHNjjZ3TroAUD4+KwPllcjPEaBzkENCPSKXqVlzdnJCxlNO3Z7Ey8yG94iyWZ2WQn6ZxbYsxTFLrpDRLjNbBBPZDJtxAZmOJO3Sh7g39UTog6YYJFjMzitjOnmKXSEaRc+biVFn0Q13nGbwl7f1vsS2OccWgvOHpGMYfcTELkseX1fB9MvoEvsZ6cmmg5Cbx5UdplD3qV32wSf/+rdNqgXgIm4B8zY6KCAWbtUN6agoY/5s18rgqzrhTvx+ehS/pgxmIwwBrVo5IlYLQa76YSedSol9bIEimXt/RXxmBcUafN1zvVQyNZfgS5QY8ib3JilVEf1YgEw60aPkYd01s=FastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22cHzeMDIkgthRKmsQo0kpcQfnaj77LlJJKZG15XOXA6LWFlQvmFZxJFspWvGY+f1qrYjaIMVrN916xYXD7L/NvoIEdxAuoC4/4JOnfgQ3WI8nlkn1VqmLMSy5SH1IlLII3BKCzWruy7+PNsYN//jmEVGLtFlhh+N+szadzYCuCm/ZgeV7VCquYIYr2zvyNcLbh5GwC13G5H3snXoirY/ABL76zcIbKkFGk6gatrxll7+0SbPsyh9aj1j0zoOKMiFcQ5jlcwyqWC0Mti9ncBS0XBlUm+jE7M11i0nQdPVjVJyLOCtzYJ7Jm8k7KuOgE+/82YoV5nkRf9B7zuVn73andYs+xDNARCoqxy10KjMdRDP+Ma11GrTb2f0PbX6nYVTkReOXfVn744RaQBDvQ2nmhd24heLzI6ekaAyyOUNR7eJegsllNQFjZ1G+6mwyn7W7g==FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaUeS2eCXWKKHcZsD3vfj0NX8TBmclwTnFhuc9VYvxbR3sd5bAe2OxsVmRv6TWqchto=FastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu3TDZKCPjSWyqXwrPR2FYM6snMXs5uTH01HyTEEThNFxQ3BQowRUDQbhHBnoF+gUoHyWVwR2+i6RVJnBeiahnWL2OHoG+R38W1UIoBM9/rAf1cOrqc5DSYlKcuH7wlSt3A==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUSk7eGZzjhUCKPR/Mh1DNUh4J2jjq2GFdrYiig5a1FEyHZjhDbGkkOvsXOr4Byc/x9evC0DcvjjLljEePRARV0A=FastBusiness.Encryption.End">
  

  <!ENTITY CheckTaxCodeCondition "exists(select 1 from @r30 where ma_so_thue &lt;&gt; '')">
  <!ENTITY CheckTaxCodeConditionByCustomer "">
  <!ENTITY CheckTaxCodeFieldValue "'line_nbr, ma_so_thue'">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.PVTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m71$000000" code="stt_rec" order="ngay_ct, so_ct" id="PNA" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hóa đơn" e="Invoice"></title>
  <partition table="c71$000000" prime="m71$" inquiry="i71$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã ncc" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and cc_yn = 1" check="cc_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người giao hàng" e="Delivered by"></header>
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
    <field name="ma_tt" categoryIndex="-1">
      <header v="Mã thanh toán" e="Debit Term"></header>
      <footer v="Mã th&lt;u&gt;a&lt;/u&gt;nh toán" e="Debit &lt;u&gt;T&lt;/u&gt;erm"></footer>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="-1">
      <header v="" e=""></header>
    </field>

    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri0" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right" >
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat">
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

    <field name="d71" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="&h2;" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PVDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r60" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="&h2;" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Chi phí" e="Charge"></label >
      <items style="Grid" controller="PVCharge" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="&h2;" filterSource="Tidy" categoryIndex="3">
      <header v="" e=""></header>
      <label v="Thuế" e="Tax"></label >
      <items style="Grid" controller="PVTax" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &DPFields;

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
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
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán" e="Total Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

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
      <item value="110---------1111: [ngay_ct0].Label, [ngay_ct0], [ma_dvcs], [ten_ncc], [dia_chi], [ma_so_thue]"/>
      <item value="1100000000-----1: [dien_giai].Label, [dien_giai], [loai_ct]"/>

      <item value="1: [d71]"/>
      <item value="1: [r60]"/>
      <item value="1: [r30]"/>

      &DPViews;
      &ListView;
      &PostView;

      <item value="------1-1-10-1-: [t_so_luong].Label, [t_so_luong], [t_tien_nt0], [t_tien0]"/>
      <item value="--------1-10-1-: [t_cp_nt].Label, [t_cp_nt], [t_cp]"/>
      <item value="--------1-10-1-: [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="1101000-1-10-11: [ma_tt].Footer, [ma_tt], [ten_tt%l], [t_tt_nt].Label, [t_tt_nt], [t_tt], [cookie]"/>

      <item value="11: [so_ct_goc].Label, [so_ct_goc]"/>
      <item value="1100: [dien_giai_ct_goc].Label, [dien_giai_ct_goc]"/>

      <categories>
        <category index="1" columns="&h1;" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="&h1;" anchor="1">
          <header v="Chi phí" e="Charges"/>
        </category>
        <category index="3" columns="&h1;" anchor="1">
          <header v="Thuế" e="Tax"/>
        </category>

        &DPCategory;

        <category index="9" columns="100, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="3" split="5">
          <header v="Chứng từ gốc" e="Include"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 70, 30, 21, 100, 8, 100, 8, 100, 8, 58, 42, 8, 100, 0" anchor="6">
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
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWd6HaL1OGauusRtQb6bqs07xG6Qjwkz8N1z0TqPoMU5IOoFDY3nwNKOqVHA66gwNgja25/CKYoVnG6NbMSTqOa2j9xpyPdCxJmSfgctPtBa9NRlFbJPPp/ZMae+L5uV4MQDvP2sobWUwAEKKKRh6rj5KtKQsBazHEWShjw/3WIrnw==</Encrypted>]]>
        &CommandExternalFieldSet;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7RAoqcW2gaQOSaoqf6bUVVj/w5BIc/qhqogwjsR0byzIMCTWDuuIoDhXFptnBai+5FCTZ2wrkXVkJduUTznY+geQfJK1Wry6K+jT0jcYBFu4IhAZY8phO7gumCH47L6HZvI6ITGQEZSaCRJgSh1vHEvj+2ZBJvHSZBqUXNFy7Dd4Ne1F7QsaLwIZWI44BAPog==</Encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<Encrypted>&TStonzNIPLtkzEJ81P9J6MO8+27j66ZwA+UiAsev1TskpEwWEeBzVYlIAeSyOAqPDG1B1PjkIz/wv6MuBk9gyfF9zW0LTPJ78E4WTnmt/FrWlg06WDdz1NCtVxdN6inD</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AsmVZ0zPSEIwBJ3YgWPBJ66Fj7gWaIhg2L1pW2mJYBCBbuh6S30OP8gh7pVoXSyts7G2MkNXfBFDSABtFxa78lQxvLlP08RIyGSe1xi51n2G1JMElVNMlksORcicsN/3YNue2X7zbq3KU5V1VhvB2KUfhdLBHxzraNHSk81q5QdyRIwEE85k4kIop9JkOgo4iirTvlHAoR10pAH6HrA6wsPkMZqqso6x4V30nTTYR6V1zwNdzu9FllEQMZy5tVArrkU=</Encrypted>]]>
        &DPWhenBeforeInsert;
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMlZAlSiZCgG1M7h3iTCVMcKHk16XkaLMIP9UAJfGCj86AHJD2GjmiisG1iCSrcZoVH85QarZe4CZaTRmYo/t8VummUgYjexueFvXFS0fz6sboSS14lv4QwWTj4QWNwv7tTdNTvY//R0Kct3Vb+oSudpEVwax1U4K0caYbAPStsmraVk2XlTCh0P+I64GW/eiOGOGiMnasvc2So+QdYWHkQ=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFQ64Qmt7Zo6Gd3HEnCCGy9J/oFWh+VbDhIQqdi1OUER1mCX/XM1ZK3XkjJTCM5CJg==</Encrypted>]]>&CommandCheckDetailInputVATInvoice;<![CDATA[<Encrypted>&savAzRAnVBFqpdoMFwcQqmpPrpwCkLwNoSA59ZKN8n74pfoe1/NSqGFxwNsK/dyfhCrTrfqcMMQXCc+WD16dbtrGL5gFEKgFBbB2gT4iH/EjZcCyqcnOCk/U3KlgqdPR/BHhFHKzAgxFjaKNCS2gDflY+8UvDRnvewI/a2z2wgMMdXHjBMhDpW1sqHptAimf</Encrypted>]]>
        &VoucherWhenBeforeUpdateLog;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku5yNcvOV0X6jJhCvtkI4kznZWgHdglQD/PPQYw3XRRLPFY/iNtQNV1uPi/Wt6KeNDTf4mrPyU2cHlX24Kvce226TWGb/C9SF4QuqNwvElIKtP3JtQ1LQSIX19wAmF7KEtpT4bJG4JtqqmzzknJWMbTZgJRNGMRma2qQD62tuTwCC+33yqQGR7VUweOpLYtEIv4HMSxx+PPS9SlOW0mvuqKp1MswtW+17OKbebTsfWitEauwb+eOYi8Xp9VvOO3vrzw8sMzs5ZKkpsLcTEn6D6beM4/bMbKP4u6gsYz8n5lVG8bKcFBXnM0YXqkZzDSiBD94TM/fjFRnl5AJqvrPKbqXW4yM2mHrbqPz5529Kytmo/eLmWSlJycEM4ipyXGBhZqxjJn7AR/fxOuzH7nvu3GDjzpX5ZfsheF8Xslm+tbB3Sh6mcYVWi7kTVGKujgzAabRAICh1WDpg7dXAwtgt4a/0tsUdNuYvsjV/osDVnH5Rrsql0nJMRNzFsFM0z/rtDjxlrn+hwnVQr+m9JpCVhs7K7zlWG6zH2WW7NR1umd+jHU47sGqvruknSPzyjXs/ag==</Encrypted>]]>
        &DPWhenBeforeUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9MFiKbaRXfhPXuXM6opLYjXpaA4v5Zm3cUR6BIg1dj0XL11ClPLKSY7lS1WaKpsG+4fpnOsAolqIFUeTLNGKaN/qtW6PQ8/uiDSPu3yuNI1Ca5ZBAKt6g0h/2uhOL4ppQFviLUHoNR6lTv5SUOI6YCa1hYj8TGLJWUgG1vAI6m8ZrLqXHtdQahuDhOWHl4EmDW6NgJWHlvIaU653DwMTIHRDgI9gyTg8Bs42cK32gptPbF+E0R8FjIdEs+v+aIGsShMkFxutrxvfPzUh/zUZgU=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TwGRFGLRtbYd+O2tdikAer0ohrFOH2w/ZGfqQPtA97w1rQ6HiotPrLvqQH8oMSOGtW0vo3BeFn3krikoNJgsV3sJof4M3pNIXa+7A84/63p7sCiATvv1PCsZeaVk4DQ2UFdt15nkG3T7P0d2JmtKH832xTV7njjCdUjZszk9i6zPBC2xNQgf/dnCPWejUfGYYYZJN0RGPo7WMVRURPj313Wa6pLrnQLYuJ8xeIHmMtdI+4qtQLWq6MBv8EnedRqhzIPBmX1EFghVf0M3Yzj46MvLRE1FGKVjOm9huvmm6GBIlgpHAvOswzy/gaYRbxQArtE7gYXgzW7jwY+WRjHxIxXaqiZjwxolsh3tZaWAnGfc4bmJCSNxZ1W9ObaxGflLXVA3pHLT00VjGbBF429ZhmfCAzCDk4TVNhZFl22yNeg</Encrypted>]]>
        &DPPostUpdate;
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH/OhakbblJHICpivHeunyEfDnaKJtdxflC5d65Gl0skw3Vjl0UTgdS+n9MA5J2TlZdZ0w6RVGmXKHWJMnuFWcL/jeXtIQVx+R0Xach3Wj9R</Encrypted>]]>&ReviseCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bj66wWvyM7CWl3sXdwt/E2Aqsd/d0CmOf/Uxg6NEEQk</Encrypted>]]>&UpdateCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4X/dT0/Jf2Dh0K7QZbadmUe7qmhObhu2jl87oY6RH4S3</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu14PKj4kTZpEXrfCacqnL7PWx6QYl9vfPUnFTlINWVQLOOiE861PfceW/mjVtOrOfjyhhua2sGXHCAo5gO3Hz042XyC0aZcpd/blIBToUUMp679sd6VB8o5ZMjFlHYHaYA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6nskpyE/YdJfyt6cV5aexPnb3Zorbs8CELktoYvKAwy28VMq0FU7Em9bvkzMuY41bT9X94LTrltj4mVU4aAtLQ=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzkqpW+w6Fc9q5gXIGvWyKd/EekOQHW51NjR6IBniEkrvjsaGswJwjmcr/AIniXg9T/5lcZxDrV6pDMZvoL+P/4=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3hVE6P6UOoVfhzyPwUF+khGxj/PjEwWGcgfSdBehggGpBmlC+ZMXpEbl41/ns1Na/OvUMGua6KjUheUDaW/weA=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKxvW5UYXguGRTwbWazQ33C0qhrwqMCmJKHSiQNsF6UXokZse7wopWQb7AwTiyNsqZIU51JujjPhRQRLd+0UsVObCNzvxXXMeEFYeL5sN78NYAYiTuSwMPdFjrRVIjx6Z0pSrrVlwn1xcOhI8cg6c/RZ5X8D0D/Zj69G48I9+Ydx1ncDPwBUx5U4ifXnMDJ417fYfGzoOaXJxXfnBp5gi7hR1FB1plN3FRWV7mYNj6NB87fz80Uz8TaR6v8K9LmqosbF/2IMumGholUqXJkuDtOy3Z3LnSWWs/vwMUZdtQ2IA/rnzIZCEfpHsdANDd8zfAj02wR3vzyh6FmGt+KnkY7CVcH8sehJIrxcQ7YOGR/2OISojLhfGY6ZhJ0HouhD7wqyhy9woSwNG4e7LeCBl4Pc8AvLVaE5s/IvTARiKrQBefT4ii3XccFD4Ver/ioIsk0NdSoHPHt5nRMTkgzXckNYpuEFxOhe7lvDDrKaFJ/TSkrYrT72O4Eis0FWwWmh24QjGV+rKeBbUh6Vu0PswXi+U4D/K4eovCeK5Yu66xr7OqKQeJT8KAwu1mUtByHSbo3tI4MG2UVd5vg+JRAHEcYZ6/JxfdeIr9bT1tXg2ufy3Mo2x0Ey2g5tW4MYDXC022s0i0CCyUDFRyIUmDLkB8+o2dTp86C6y8UI3ZZKizDeak6lGbu4DjNUiVb9zZz3fxrfR5Un7ZfWb4WqEFQG5IUWgTsQnjaDpqun+KvRh6f5jfIJdsp0lq5n0JL1YMc8BtGJStZzfJ60Q7Ran4ybWOms+RSE8+HQRG9wt1Tpfy3sYj2y98He8oC2/+RgLVkgh0O2F0beiEG+/s1NxuKnIeQIxMcuNyItibLoOlvyQBg81WzRNiTT/52TbjA9iLEEzgmpSAaXDa8+CXu3aO/jASf2YkgpDW/SHAgf8I2+WXvOw5WScqcNcz8u6uTb3RIarF+8cT3N8UkEa6YFRiCJHXdgBbrp5J70XtgcckLXabZuRsV0+uWSe6qbxHLWdqESd2/57ooswL8MPXiGkiiHkORTLNPoM8U1hOc4qKm66opz3w==</Encrypted>]]>
        &DPCheck;
        &ListChecking;
        &PostChecking;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpxEo0gX3ZSm29Pl+bEgpSSdvmRY4JJ83oEYFzir0FLMEtO6dU7oieNBQDm6EonD3bT2WAZXvRnaI9F+jp0jfjKQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxdrQf6mv4I646Gat2YetPUwR1jqAbvvg7SVrBjJouUFNyuY43+OA3yNp/NSCuUyGQU=</Encrypted>]]>&Tag;<![CDATA[<Encrypted>&ymPgYPXvzpL6Enqd4IDunK7pnavP1dtf6Ucf1UiCVptIL4FS2488MrmiXHf3zC71JHDntnHoYvoR/Gz0FCpVn060+IhIeB0abkFc1NLfbMhr7kENxZjxX69xzPnqZLE6Ugm1lYtKcl50AiuxfoHMj8VZT44JDaAfTheR9PwAS4S5sfmZB/MAjQVS7/RHymQ/7UbwCmqSvEyh9//CK6ebbg==</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&uGHO1INig/bVVI9tiETWT93juS17Eg3zeL5+cw5rKOgKM1T/9q05Y12zCAccNesAwLWkAfehalQZ17gFxltWUj/fkXwJyaW3plvGsCjbKzAyey4S32rNg6cr9hOxkLeFwcnM1hvlOPcmCcxBRJ5T+rp/T/AufR/h+l21859V46Q=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4U0qjLJlGlJJEgaKQfS7mThjrM4LNwgRV5LRSNQwiV++dZLszdHmEpdlkbiAjQb9GGc4YJ00ySCLCslMplQ2LpE30F8x1n4TqrVYB+nXhzH2IQsZ60BQ7jfgvmrzTN2QurO1/dcY7XStp2fADINT4u8HurSb7CXgsUdd3kCX5UJpE8UI9Fcx7SOIgVIbKNYT1g==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacez+4XiHeEqRoWJos9IZEEbsimLwrs2pakmUqyBl/9CGDlljo3DyLx3u3nLtteBfwvthP+AbfxITMwBkMDUv4BpCjY3CY8EtmqLFZiSltx+T3Otu0YSKV9Xo+pvaHsEYjj5VR36YpDnAOi5D69v1GsKW3RNVAH7006LciaQNKgMK9Q7ub2dbZG5hlrRBAO1j0aZZ58S3DCks084NXjnCKAKZVHXMHqMr3SornPKn2xNdK+m41yEHLEAX/FU+ojy4/C5aeE7o1A+xNRPbeYvlvjjyw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4faFOs+Xs65Ec+Ah6eR51ky57l+bjdCHquz/pty8nxIer/RslZHJHKguDfl3iy/3dA==</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7AwHTQFqeMYoxYjllYAJQtbE6gLXbJ+ZJK6qOi4ffqDfYxJvbDcHxu3/kihyaYVgbEy31L06IXJ7ESOsxO9PS0Wchi0uYtzkJ8EL70ABN8yXpO3cC+Pr+qw3yIMq+r80HiugOvO/QXIC1k8iBbrpMbAhxEw5wWdh0nfdwB6jjs11AAICLddoP7Zh51DQqq9R8eN6/i8tIyP9EVfvdqtrPEmOpj6QCFXvMJdhq2dL+pQ2nbMXd42zdJn8ysBeWgbqzUW2A4XNYANK4QOmN4Q6L5QR2dqDfAacgtUKLw5eDz10tyie9+v6XgNnutYtNxR49ZjU4HplCnoPeuem5PyrfToFiR4vXb+ZT4pkoDqMSsPFluTgH33mUP4BCLTBwOrbfDD3TVl5qZ2v1AIwhhunu0MQVEnn9b8ucDOCiOaRIrgZ+3I0yPhtF4JdGFunia2jjeSkJ8Hw34fSjTGpZg1gbeQMcunb5oWolhT+v/t5ulk4jI3ugmpLbcTFEEU3qJ8vO2AxMwWomWAlpMz89nGD5o8Qxxdbyzgd/UEyBvbw6z9keX4nViiFDi9UGUmr+yuua8=</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WqhhHt/k272dUS65C1dUznfsK8O1i7YrIRWWjQj+LFyNU9/Skv5zH8r5MJZRKUxcBjog5tL2rJcDM9sIZ0oCIaTKwqIpot2dttgArKWiIJp/1C+dGT//BLKcuMexgVdUZirQV3dQ29C9KELQqRK6yjA==</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bCbV013qAsGS952fSWRPoyvxzwp1hEiCaaUXqlSMSnMTosl6yfsWYBEFYY+Wckqf/UZKTNQRu29rVHxYHRERyZ8GN0JQkdSU+RHCAYlav5m</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxCLoaf4Gmwgn2t2ySyEa/mzMl9HG9cONPRVOw12BsUxvRHPi0ih0GUsR/9ktVk8BX</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyrbHcGKgLQlHwzG9OeaJurRpUxtRpsiU/VasauyUSukxmngDxxf8AXabWmNf8zC7QS4Gdj8LK2HlW3J2XwBp+5X+HjtBTCHPnrRqvp6OCY+0TO2/7T2c/RUNZqOlDSaD5suWN6Q8259l+mj0VRXIKId94MqDhZfKLvKO3jtTmBrnvbGzfQ2Svh5ba3KARipwCxl1mrZf+CZP8a1pxnPlLPIpUelZlURB3gTdF9iNEOHv</Encrypted>]]>&ListTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwsygCMj0NC+9aWOEuMAoGMuPGf1i2QgLtlqWPUDvUanxIwn3ThRgPm95i50JRDHjDrPiA+I0GaLoj2Sm8YzC+rYt06OLk38yuLQVFhZwQyk2MbwFi5FIlKYaOABAbEyva+IGcNmEIFKwuuCDmF3VmKY26D2+1yZgd+sfdSZWi6DWfSlGaf+pqUze9k3ZtcJfGYSJI9mPmUO0mpbwetLCjWbPDuhObQJeKvRZaYlgALb6IQ/TtGDivg1ZLdlyYoJE1/K06zRqKyVvll4avkjO5Yfo+YIWSv9bRtXqBk+H9rFvn2TdQH4HM/CNEKzpVPSg==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUvZmfczXew2oSmKnIQDL8ph717iTKpoHyZD5ZilsKk/9QOu8SmJJjJlmr2CX5xzNHbQx7GOfdvx8PdJ9p+gy80f8qP3FtskRsmxS8/Pe1xWDN8EARuj2FqyBc4zWFBuRqEsW37IqzYQRGP1zrKGSPpAsbn7rnJ/FoKdcguUOokD7oYb3SNvklIFpT7deew4seGIEx08uMdOqEa3vvhslBgV03w7IDMK/ioLq3J8ekHFmJbez4eShbfR/kaJSgpni2</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZa8L384PUkg/4jpaczSTZ5aF4A/eQkAQqWsIx+wI7joA==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgExyQQg0DrNm64fSrEZ40hGJTZSVPbC2VRZTS8KHZkASivLpaeHn6jhYRAlz6EHZgmKaJy0sh4Y+yySDilK+BQQ==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>