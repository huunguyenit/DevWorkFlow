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

  <!ENTITY ScriptVerifyInputVATInvoiceNumber SYSTEM "..\Include\Javascript\VerifyInputVATInvoiceNumber.txt">

  <!ENTITY % DownPayment SYSTEM "..\Include\DownPayment.ent">
  %DownPayment;

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY f ", @supplier as ten_ncc, @address as dia_chi, @taxID as ma_so_thue">
  <!ENTITY h1 "769">
  <!ENTITY h2 "98">
  <!ENTITY g "PGDownPayment">
  <!ENTITY c ", @statement = @statement + ' declare @$tien numeric(19, 2); update #in set tien0 = a.tien0 + b.cl, @$tien = a.tien_nhap + b.cl, gia1 = case when sl_nhap = 0 then 0 else round((@$tien * he_so1)/sl_nhap, ' + rtrim(@b) + ') end, gia = case when sl_nhap = 0 then 0 else round(@$tien/sl_nhap, ' + rtrim(@b) + ') end, tien_nhap = @$tien from #in a join ' + @downPayment + ' b on a.stt_rec0 = b.stt_rec0 where nxt = 1;'">
  <!ENTITY k "''">
  <!ENTITY v "'tien0'">
  <!ENTITY i "7">
  <!ENTITY Tag "78">

  
  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTNoeIsrZM6JPpQhWIA2MX6DsQnyKUyCOvDu/u/eRER43uk/bGifb5Dx87UodLuumkSFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTm5CM0qXjv/pzsnaw1v5On8HA6K3EA+PM4nmEBHHL/T2eUYhxFKE9bB4c+lAeNMHgwEj62k5xxYca94DoI2tj53iYjW97mPRLHMOG5SnJo3kSj0G1x9zjOwz8dN5kqQqBRxz1PUZxL/u1H3ZHQXCdo=FastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTN83FcPoMfPOnsSSvGu5HMa16EhX5Hs7dRwVCRZrjQj52QoToGfWDcrBsY2WDtP+f6FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTm5CM0qXjv/pzsnaw1v5OlHm/H8WdwPngw8+9BvmK5dPDUE95WvfSDMMYdeLDqKjRL3KpkXlyz6v0UTiFDf8bJVcRORkwuLksp+iVTbY/EqQh8XF7tteKvjqHBkWerP3XgGmH7hJbNx3hgYQBvIJoE=FastBusiness.Encryption.End">
  

  <!ENTITY StockType "1">
  <!ENTITY DeclareStock "declare @stock tinyint
select @stock = case when @loai_ct = '2' then 1 else 0 end">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCcFH0mCrB+axAT/p5zR0H7z8mqVOBUh2cJ1iqcgv5UPxDjSq+67ZSDtdF1HL7VId+y9g51/PT8J4ewmCa7Im4SIPqREyfqX3hkhdKUiT/iDBaCG9TWJ17bKZWxDtrNdVaQGiW4ykTEQ17Cf/PPpuAOH1VaTQ+mS+tO7pwBufGkzDsMSTfiphBmwfXm+JfFAlswBcXYzvD924wkwovbAF/Aq5rlvdl/BKepO3FRydt1XFDMs9xAp8U/9VKyufKk+S6V5cinOr0/o1IrbQ/yJTUu3keW3NzaRG0aYnuOv6rFbH26Z8cRJF1BTrbVfGD/a2CxSbVsI350EiqnXJiSmd4/F6tnEUf+8LjUjp2YcRmfhyIAE6nwBcL/+rgmDVsbkJ1WbiEIxvXgQvU1zfJBCH1ii1Mg1f+Bsmo7Pih4P3x7dClGjd6lksm3gjPOAPEoSWIG7XlmEkAedn/XIsUWX/Z0Kos81reANrki9e18rVYgWaaKklMXTczMgpPFQvHtwPT3dnD7Ibu05MFUTyLBepe979efyZl8aeFlcrFGXgrvHR9PQ2EcAv+eANCQG8XYRS0I1NWT5DRYp0k9BEN+Qnz/AD6hfZbHMzemyS6WAsoJ79jF122P+8K4WMszm6MlkrvYBQeTYir8x0clKFoKdRxaKFPfknGiSiaNyS1gKkO8S0/Ax7lIr7RV/3tf1y0VRWo5TpozHT/bYGJ7dLVL/720Q==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG2XHTBQA+AXip4lq6jBdliR+51Z+Y9nM5DOJuuTdONIktF7YUl/kOmS2EEKOKldF6Jlsjmh5vK/7UjR3h60HG4SVZk1K+91QgGdmiMMftQqwsjNsf22LTHfQPSzzGIf0MbNiJuIH89L2/ceqb6MvNIXTCnCYLH8iS3+Y4vmc4qgreNvtveS0fw2DJ8yQCnFa4cZC2CrMhGHsfoNi40Wij0idSkd/LYUVujv4CwGsZyugw2boG4DBwJBQp8tY1M7ittvbPM+bbumqQcwzMZgYXVG6udYcCEc9jOZvDqr2turN1h5ELu3n8v/QYSbMq195/PivgKYZM3xpdXZiFu8tnfIf8zH3CMf5NaWx9r5Eus1cYQq7FWyL0mPpyYH7BsH67XcxLZ8+HhHZ+4D3a0vnPE3FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbibcivfkKrSb8Ljdlx4zEOXTcqCnyfrhKrrkxnZHAQF6rT61GFtU1sRcOVPU1FJO+ZBz54uydBk7DBCQ9AKRSS9Z27oH8VkqM1CYHAi/S51VkXNZ4SpLrQWk0QyWEnbxQhg==FastBusiness.Encryption.End&DPCreateDifference;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XoeAfPKbExth0bd5RtGWuuFz31LzyeuMvxI1uD1wuQmJ8v0IKoXwCES6rGInG0b/YL5vyhlf/ovQF/lv4am2M8BhA7Gq9u+Xqcnj8yxaENO5caEjUyo6XOBXw4RhtNOOkL/WU5DTNp9tRU60hQi6Y0g40t/3s2S3eZzT2dAmhqCfPv5GSw9fN/eSZiMpvMPIeDaWJ0DEaUTMNBtoD8wj7IZid3GVkyx6bRaGE8PRDVVTmD4m3Ht4SS1dJUX/MA2fzEI2njNaV1pKa2Pmx/QkeHttAIn9keKTWwaEf6UFt4eNBW8lzYzUT/q5RCJGXBJpxYVC5fu2XkwYOQKr7gUlzVqE5KjuzkdWVYwkfNAfaL2sb36u4PI9jmsKyZFu5OiNYxKWdRF+SNdOsjkNurm/I6d27sDvJTDhlcnjlpPtdVqhsXwSwsV5zOu934I4X5h3Fw1+eqohclquUr1sYufEJWlIR+/++iU4OON0n1YgA6Hz8WF+NOZiu6dmOxlN+2kzdTzRsJZlTiRKDFwmZ898F9pI9XEzY6ZZp0MaRUCa/7IFVrKfCTtgEajUcOFfldWN7OFiHwGE9434kA7SgLjE+AM7xJqPPqf9cnzlJFlq+nRUExG+TDEqd3mk9thx9ZaiIgGqozCXbbI7jnprvgOzdNNmmR2n78XEjikII3xPifq9N4A0IDfdM3DrT0gGTtVPtEdbKwrMeWf4mKTyujWMGOWkmhK4TnHiulXFwslVSKoq0YoS/UimnCKMua4qtnZh6faQ22H6+Y/BBJd9Nj/tyeXKNTPtZzhTQhSsJYdVnOtaNS6JjOhdoCAl9mZBxEWpghu5K8oetsOTLPsFGtG6eqFArVYYJmUlohsxju3B0s6GQJLz1fk0n+NcquJzoLiV/yzAgPNZ+MQUHErXmDj24gwk95I+20NQo6YvdLThOapFastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22cHzeMDIkgthRKmsQo0kpcQfnaj77LlJJKZG15XOXA6LWFlQvmFZxJFspWvGY+f1qrYjaIMVrN916xYXD7L/NvoIEdxAuoC4/4JOnfgQ3WI8nlkn1VqmLMSy5SH1IlLII3BKCzWruy7+PNsYN//jmEVGLtFlhh+N+szadzYCuCm/ZgeV7VCquYIYr2zvyNcLbh5GwC13G5H3snXoirY/ABLdLG9pTWZqolQBdC9ACvvVhzGMYt0FOAcG8RGzjooBVNF0WXCq0C1WhpsgCVTjUTk1tKgdF76io7yP2yPkWs7v5UgZBYT2bN7pa/h/gBM+c09vIlyHxdfwFwMN4Tq+whSSIsqjR6qLy4XNP6L1ahLBzWKFPmju2xPkJvnJgqQ+aydOJMauJsRj7eFuRxldcaRQArYGEuZ3PlBE8uZi14rAzodG9XBnr9bN4PQVYNRYjOFRXKTV3tLKWU3eBxC3mTJQDXDqZeFPzYnjIq3qGiHLtmcXIAJmKwfIN3Zp49j65STJUJPfXLHIbntq893TR1Q=FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaXfvycQerbdVkFyV+5dR60Lb+Tdaat31xSJYJehj1v6T9ArHXCyzYroKxEDgTs5wxofn9oUJqViCpNF1LIuLQWJmP5amO7J8s95JUE5iz0CeQ==FastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu3TDZKCPjSWyqXwrPR2FYM6snMXs5uTH01HyTEEThNFxQ3BQowRUDQbhHBnoF+gUoHyWVwR2+i6RVJnBeiahnWL2OHoG+R38W1UIoBM9/rAf1cOrqc5DSYlKcuH7wlSt3A==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUSHB5OdcSneFtVWd633m+MYTerNhD/WN3a5DULH1n41BoXmIByNtjemZ7LpmY0dZxbTWMHrwDhUS29gOyFP9b7+L+flfVBiv6QhuIiTdgdHiZBOxRFBqXAKkcVHHV/Tl50RX9Vfc6LA360enzuhvJZQQOt5ELaqOoJkLnTXWTOaxFastBusiness.Encryption.End">
  

  <!ENTITY CheckTaxCodeCondition "exists(select 1 from @r30 where ma_so_thue &lt;&gt; '')">
  <!ENTITY CheckTaxCodeConditionByCustomer "">
  <!ENTITY CheckTaxCodeFieldValue "'line_nbr, ma_so_thue'">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.PGTran;
  %Extender.Ignore;
]>

<dir table="m78$000000" code="stt_rec" order="ngay_ct, so_ct" id="PNG" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hóa đơn nhập mua - xuất thẳng" e="Purchase Receipt - Direct Issue Invoice"></title>
  <partition table="c78$000000" prime="m78$" inquiry="i78$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <field name="ong_ba" hidden="true" readOnly="true">
      <header v="Người giao hàng" e="Delivered by"></header>
    </field>
    <field name="ma_kh_x" allowNulls="false">
      <header v="Mã khách xuất" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_x%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh_x%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
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
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1 = 1" information="ma_nt$dmnt.ten_nt%l"/>
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

    <field name="d78" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="&h2;" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PGDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r60" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="&h2;" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Chi phí" e="Charges"></label >
      <items style="Grid" controller="PGCharges" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="&h2;" filterSource="Tidy" categoryIndex="5">
      <header v="" e=""></header>
      <label v="Thuế" e="Tax"></label >
      <items style="Grid" controller="PGTax" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &DPFields;

    <field name="ma_tt" categoryIndex="-1">
      <header v="Mã thanh toán" e="Debit Term"></header>
      <footer v="Mã th&lt;u&gt;a&lt;/u&gt;nh toán" e="Debit &lt;u&gt;T&lt;/u&gt;erm"></footer>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="-1">
      <header v="" e=""></header>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thanh toán nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_cp" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Chi phí" e="Charges"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Chi phí nt" e="FC Charges"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế nt" e="FC Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán nt" e="Total in FC"></header>
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

    <field name="loai_ct" hidden="true" width="0" clientDefault="Default">
      <header v="" e=""></header>
    </field>
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
      <item value="1101000000-10011: [ma_kh_x].Label, [ma_kh_x], [ten_kh_x%l], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="1101000000-10010: [ma_gd].Label, [ma_gd], [ten_gd%l], [ngay_ct].Label, [ngay_ct]"/>
      <item value="1101000000-11010: [tk].Label, [tk], [ten_tk%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="110---1-1--11000: [so_ct0].Label, [so_ct0], [so_seri0].Label, [so_seri0], [status].Label, [status]"/>
      <item value="110---------1111: [ngay_ct0].Label, [ngay_ct0], [ma_dvcs], [ten_ncc], [dia_chi], [ma_so_thue]"/>
      <item value="1100000000-----1: [dien_giai].Label, [dien_giai], [loai_ct]"/>

      <item value="1: [d78]" />
      <item value="1: [r60]" />
      <item value="1: [r30]" />

      &DPViews;
      &ListView;
      &PostView;

      <item value="------1-1-10-1-: [t_so_luong].Label, [t_so_luong], [t_tien_nt0], [t_tien0]"/>
      <item value="--------1-10-1-: [t_cp].Label, [t_cp_nt], [t_cp]"/>
      <item value="--------1-10-11: [t_thue].Label, [t_thue_nt], [t_thue], [ong_ba]"/>
      <item value="1101000-1-10-11: [ma_tt].Footer, [ma_tt], [ten_tt%l], [t_tt].Label, [t_tt_nt], [t_tt], [cookie]"/>

      <item value="11: [so_ct_goc].Label, [so_ct_goc]"/>
      <item value="1100: [dien_giai_ct_goc].Label, [dien_giai_ct_goc]"/>

      <categories>
        <category index="1" columns="&h1;" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="&h1;" anchor="1">
          <header v="Chi phí" e="Charge"/>
        </category>
        <category index="5" columns="&h1;" anchor="1">
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AsleycUhtVRfei6ZM5woLbuZcoKqhEGKj1g/F4qcnk5/QYTmGaFrLl/EC95OvFGoh7frY48au/9gBKyfMefqgE+78duBKU9yMO7G6nwa82/n6tAPei3R271ofWfC9+v+ersJ40eSRK7u4P59f2WVBtPLiM4PJYjDFFkJNe+0TcG4iMvs6N/Qxd8nHk6U51HXwkKnk5jmyf5Qxi+w4ll87AREMbIT5+DsgyhUEAlkWaz3PzP33wyP7+wXh4LQGqrF8NM=</Encrypted>]]>
        &DPWhenBeforeInsert;
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBmXLfKPXo596AzfwPZaCZsyYxmumV2/73QwqehzzGDFamSiLz/7MhuDql0czvuLS8ZVIsFeAlSWrbBvi4sLo/2hqdQB3e/nGGpU5vxvM15lw+jkOOXFLYpYY8ijkVExh6mYQPOayCiGWE+tpoRgoJuSkjDnFdZ+jFVmOc4d2djK4rjq91gFdmKibxTZ01hG3WksGqGtcvGkCGVpR4mO2TM=</Encrypted>]]>
        &DPPostInsert;
        &AfterUpdate;
        &DeclareStock;
        &Post;
        &AfterVoucherUpdate;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&DvRREx0byGFTh0ib/N1q1ekaji/p9O/pHONIeFpvhGuuBLZk9bLcmiBWbheRMA2wQcP1WDvieJWkUt6ViJZ+LfnB3Z5kNGLPoRTxQ6BiDF4=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku5yNcvOV0X6jJhCvtkI4kznZWgHdglQD/PPQYw3XRRLPFY/iNtQNV1uPi/Wt6KeNDYcGBHQPTPmLM3U9x/PC+c3CyCH7eP++DKPXpTNczde6OFITv4/lP0kppPGdEVd+Xt/JctdRXISyuhAuhdfdAXm+/zhygpuushr5phEQvDG1jq3sehOm5YhdOir1G9g35rPJcHVWwZ3riufE3IxnBJC9kZ1R4LyF1hS7kiTPR7VNsXajVMWoJzfFpfJLbeaSniwwQgJAeJwwX/rfvQ9b4BCEcjj/6+gvSaf6+otfK7f5r0ikDOcGLqHLEZYV+JfruVJlDkROFoV9BFbpLy9yZCU0jxuZ7q1QJy4eyWwH9ZwPP1UD7XRgkTHmy4vH/m9cgpkJosasFtE9B49I2AdCMAXZa1yR027Wi0UJW7ydz+GOVrAnDL5G45Tfi6fD3N/eEF/7vmcl6jnn33aNMUW/sMqh5mI0XMmxdGE0ftEUfzatUlMpdUiXrfcYB2L55FLbjcBTdiB6LT8F7ScEP8U1hPDW8wGc5/F/ZRL2lWorsR2qdf0zE4wYITPX31sN+YWSTfD9WmM1G4XssKI3m6Gt2t4=</Encrypted>]]>
        &DPWhenBeforeUpdate;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XPKZrYrI/CclSbCeG3G9JqDD8yYO4Dr8+g+iSWBIg77C+AM16DdehEruJY3gI5Zy21FLT8laWd+XNxs28oWmAYFEym/KvCHHnUUypSYWmuhfpFKRlftxo+PXsCYlYBrjaZvsQJlG2rzMFvRTMBtaw1HZS4PCxR49KkSsrn90drRHK3BwX4l3dDY2bS2WRy0xMjEIjtP/GB8B+pSCAO3ws1Lx+HdrNVtLrVTvdJu+7SXN+KqB+IppwrAFq6hic8ScQ5QN428U+cO5T5qubCQTi8LRP7TlrbSlXAPOK5yGTpiNiwcDYxsOXiLk2/jBlUIg9t+UEseXOi3YbISWSiEJpJaitnG8Zlx9VTL/m6c3ElH4wNLp9zcCE37h95nGp3YoIunf0ygpeCHSu+ZuXVzMVieGmoWQoJZFu/ShV2BkwId</Encrypted>]]>
        &DPPostUpdate;
        &AfterUpdate;
        &DeclareStock;
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu14PKj4kTZpEXrfCacqnL7PWx6QYl9vfPUnFTlINWVQLOOiE861PfceW/mjVtOrOfjyhhua2sGXHCAo5gO3Hz042XyC0aZcpd/blIBToUUMp679sd6VB8o5ZMjFlHYHaYA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6nskpyE/YdJfyt6cV5aexPnb3Zorbs8CELktoYvKAwy28VMq0FU7Em9bvkzMuY41bT9X94LTrltj4mVU4aAtLQ=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz+vIkhdYzHDFhoZV7pRfWINnjafMtXvkxDML6CLQ4gdHzSNvNaxLGVJvzbuvl+/BdIfiEwwg2ZidZPvH92vngA=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3hVE6P6UOoVfhzyPwUF+khGxj/PjEwWGcgfSdBehggGpBmlC+ZMXpEbl41/ns1Na/OvUMGua6KjUheUDaW/weA=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &DPPostDelete;
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
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKxvW5UYXguGRTwbWazQ33C0qhrwqMCmJKHSiQNsF6UXorNas6sJR5u5dK9WnKzhBXCrhZ8chTVaER/fQa3ujH6kdYSprr66amLcqkBngxzZdb/34m6FMheLxpJC6bjIucO4n6vycTurF1gXiKnw25AtuPo2HqLdVKwaQB2uRGk403IOgaklLCD/L4iJDnfyFAzBWjKqnuoN+ZmUDt4hIUNOEN2aY1wBt6MuJL0xsHVivoe9Y0S8eG25bgAtHiHLTXLdlgykMfWTfiNJWzjrDI511+TATeTgKhJq2I0cBu0ltWr1JIPLGLN7CP6FNrcFq/JtZDpSQ+yuNLQ4vDrkbJMtktKXHwixpp5HUrW+8/4Q7fsX4jtRm+tFQVC0wDGCZxMffsNXoLSCBP0nhFQMYeU6Waa+IesoR4InYnHVjgxff/swfrkFgcXGRw4BuzdsOStXZow64C+ailEdEKHqCN2IwtnI1I4MPH1VWGgqD9PkUQRalZIKpChdlj0NWQ/8J2ti6KUurB5Se8y9sXh3ZZ+3WJ9KnD3PfAWT6Kv9NQUWEGB20VxuE/3XzwMdd2DAuMDFIM7AU4lvgNK0GXdJdZ6jh65KLTLTiaoZFvAHD6Ww7LYqc88rmvu6PL3OteCq7GyYsD6ZMdQ2piF3SB7a7tItyJvLOtdPsyBi6B7yzUZvE96MZnkuPbaoyzhiaEYoFZB9a5aYnRRCYjLbUttwqA2x64H5YR1c9hPou0jJYxv8htXlmEjrAAIkHr4YBLoyfpJZcZ2r3/fd8JU0zS0lzgJgITlTUCJzXRlly+y6Bxdmau8Fr5lQ5BcHqElKtFr79OsnDfUFLfQeQbUmnTDxeIqcaBihSb/LlJzmtPbLITGqAh5pRiwkikVul+Q8Nf/PodDiwSr6Tj/jGuNrfHcFcoU8VoV6dYdd2ISjB5H6yIQkH9mffG/s3KPre2aicKUex3bgcm5zXUTJExEWCIOKasEoR1+9NEsa2170un7uidPWdmct2NHbwEqzh3Ct6io8rVs=</Encrypted>]]>
        &DPCheck;
        &ListChecking;
        &PostChecking;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpxEo0gX3ZSm29Pl+bEgpSSdvmRY4JJ83oEYFzir0FLMEtO6dU7oieNBQDm6EonD3bT2WAZXvRnaI9F+jp0jfjKQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxdrQf6mv4I646Gat2YetPUwR1jqAbvvg7SVrBjJouUFNyuY43+OA3yNp/NSCuUyGQU=</Encrypted>]]>&Tag;<![CDATA[<Encrypted>&ymPgYPXvzpL6Enqd4IDunK7pnavP1dtf6Ucf1UiCVptIL4FS2488MrmiXHf3zC71JHDntnHoYvoR/Gz0FCpVn060+IhIeB0abkFc1NLfbMhr7kENxZjxX69xzPnqZLE6Ugm1lYtKcl50AiuxfoHMj8VZT44JDaAfTheR9PwAS4S5sfmZB/MAjQVS7/RHymQ/7UbwCmqSvEyh9//CK6ebbg==</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&uGHO1INig/bVVI9tiETWT93juS17Eg3zeL5+cw5rKOgKM1T/9q05Y12zCAccNesAwLWkAfehalQZ17gFxltWUj/fkXwJyaW3plvGsCjbKzAyey4S32rNg6cr9hOxkLeFwcnM1hvlOPcmCcxBRJ5T+rp/T/AufR/h+l21859V46Q=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4U0qjLJlGlJJEgaKQfS7mThjrM4LNwgRV5LRSNQwiV++dZLszdHmEpdlkbiAjQb9GGc4YJ00ySCLCslMplQ2LpE30F8x1n4TqrVYB+nXhzH2IQsZ60BQ7jfgvmrzTN2QurO1/dcY7XStp2fADINT4u8HurSb7CXgsUdd3kCX5UJpE8UI9Fcx7SOIgVIbKNYT1g==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezM1Jk7LPQoU3Fa0nqy7b52V6y0+uQEYkj/8R8eg3B5jWoHEoN51+d/wzp/WWgUXER/4xlgwQXvOHJv0vap+EvN3TYyDhb4eJ41Dwc+JReypRau6Ex2J24V1taQqoJ/YglwI02U3TnlRsE71K5oTT1BqG7P/ARrPNNMH/n2ZLsu3Oyiru5Zr7BVM48wp5rp641XfePi+c5YLvTkjdUFJUKbAeu8OF84TAbjVtrtVq+P8o+8zHftjyTwcVoGFgBdDOQKJEUXzuVPfqm6th0Y6ZqgQ==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4faFOs+Xs65Ec+Ah6eR51ky57l+bjdCHquz/pty8nxIer/RslZHJHKguDfl3iy/3dA==</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7AwHTQFqeMYoxYjllYAJQtbMo1LVUk9xQtF3IKxwU216a3JtyIpf+6sdOg5u474Y9ihqcSV/KHkZ4RG9EzsrPR9g7LwJ65SAPlIn+68KlJIWHuhLs9sFBg3sCVSR613V0cIdsI5Dz86Hk2pX1P/3PAn+4jOjN24HDq873GQCo8xwgLSTNTz3b0yc+iPq/h7dL1tsFC9HhDSPvXRegUzzZrJoPSx8iKU59qd28rN237EVeXSTDrZzNozjROaNOwHb85Q31PbJp1y87Fc4FOzINAlE9cmco7pYZVsYyiOHnFectNA5oCcD3MKLg3rzpxVx4fav/yIhzSc4KZ7SwdQwjB0T092EHXXLKJmZUfuHfYEHuBnmXGYtza/JOOhqeGh3TvKYPc2eF68jFBPOywXxianQds4oEIKOB/C0v+JpqgEpINjMaJVMzOBu0AiSS6oVTd3uDqKJFM9hSU7GKunX1XvYkmRQAbvIt/Q97A487nG4qDnZOH5QPIv1zytQsfeAMD5CFJzp9CH0JDN1gfvL0BjR2H3y83QIFak6DbGzjKWrPKPWreO7khTkyr2S3/tECk=</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WqhhHt/k272dUS65C1dUznfsK8O1i7YrIRWWjQj+LFyNU9/Skv5zH8r5MJZRKUxcBjog5tL2rJcDM9sIZ0oCIaTKwqIpot2dttgArKWiIJp/1C+dGT//BLKcuMexgVdUZirQV3dQ29C9KELQqRK6yjA==</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bCbV013qAsGS952fSWRPoyvxzwp1hEiCaaUXqlSMSnMTosl6yfsWYBEFYY+Wckqf/UZKTNQRu29rVHxYHRERyZ8GN0JQkdSU+RHCAYlav5m</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxCLoaf4Gmwgn2t2ySyEa/mzMl9HG9cONPRVOw12BsUxvRHPi0ih0GUsR/9ktVk8BX</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyrbHcGKgLQlHwzG9OeaJurRpUxtRpsiU/VasauyUSukxmngDxxf8AXabWmNf8zC7QS4Gdj8LK2HlW3J2XwBp+5WHWdyaEgRGaE0hiqyAdXpXXUt/25Ran8vmm2c/GrBX1MFWLzRyUPD5FyYzEizQNMsKji5PxByaOrZPVkbF6j9q3SwvqufLDTJP7GYF+XEnc1rCk15hHfq+QH89LW8OGtyoohT9gZ7OyVyAtC9tuG4U</Encrypted>]]>&ListTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwsygCMj0NC+9aWOEuMAoGMuPGf1i2QgLtlqWPUDvUanxIwn3ThRgPm95i50JRDHjDrPiA+I0GaLoj2Sm8YzC+rYt06OLk38yuLQVFhZwQyk2MbwFi5FIlKYaOABAbEyva+IGcNmEIFKwuuCDmF3VmKY26D2+1yZgd+sfdSZWi6DWfSlGaf+pqUze9k3ZtcJfGYSJI9mPmUO0mpbwetLCjWbPDuhObQJeKvRZaYlgALb6IQ/TtGDivg1ZLdlyYoJE1/K06zRqKyVvll4avkjO5Yfo+YIWSv9bRtXqBk+H9rFvn2TdQH4HM/CNEKzpVPSg==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgHxdsQdLxMxJ87hyMmT2JY7EudMshSG7GIuVWpuQO85xuw9fuyhpzz1+ZITISz/yt31rLyQMzYvGJ65n8HUgwrw==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>