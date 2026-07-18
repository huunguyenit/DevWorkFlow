<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
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

  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
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
  <!ENTITY h2 "122">
  <!ENTITY g "PFDownPayment">
  
  <!ENTITY c "FastBusiness.Encryption.Begin$UnpyrB7faeNIV3QST2LJ02bJUacW/BhbsNCPpu0EdA7RBEQaMwXvrHRO/QrbAhcwPicvhgyY/dTaKlHkvS+vfxu3BmsQ2bOPJsMsS4o5gRHeVzbhoV8GKTTQHMImY1j/aKGTLq08O408YesZq9Bs1fVBvh9dF16MgI6y8wdurRovc4OfJDMfN6jtUa42uTHPQng+Qs7guMsbVFsK18JZcalBjQpVjQbK9/xXFgZ0AN/fqDGC+8S4Gme591iXBn9aFtIcSJ9m8mWUCSNmrD1VvQ==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$a3ZxZDp8MeuhFrXoqr5r7gGK03dUqV2n1tJozmS/ZrtwfExKbtW5bIiKA7pvs26lcuTgAzCFfTzMsSr1om+MK9KC8Z8n6B8bt43NOSTTlwM=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$a3ZxZDp8MeuhFrXoqr5r7gGK03dUqV2n1tJozmS/Zru0EZ9YxGfIuDzEH6zmI8aWeMciTUGt5iVaOI8idx1EROkv5hV+jX9AjMs9dNQg1ao=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$hPv6Y6uTjH/Lj6MC2a2HkFt3GNxcz5zllHMPPbWqmwCo9CfOo3bwVeaTdbaTaXaVbBicrdaCf9UNzVVOKDBBgvUoBAItmjcFoo/URL540iGgsxGmRirBdeHiPgD2q0uKzUsbK6y1pNf4+MJh/9fyLf5kIJ81a+UfvjCAxbvEne9G0M8oBHuHLoe3RsDMQdQtOTBnNQsVZd2PpVJbn652gHiaimWwuyj8fetExVQIBdkyYajwYVL7Jjuwlp5Z2+e0hLgrPErSWIBdf0HtjhsyZGfXESRYScQ3gpncb41Pgr0=FastBusiness.Encryption.End">
  
  <!ENTITY k "''">
  <!ENTITY v "'tien0'">
  <!ENTITY i "7">
  <!ENTITY Tag "73">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCduJ8HHuzfTiG5MxzBWaQGywdeTbC+bASFv1bY1/TV7UvJZun6JcLKhLIs+sG2QOgMkTQLKnXONOXM2VBckNZ0J/0QpVPyVPaqEBPFCADVmYFT4mruhd4cA+DrmmCyN6x7PGTT/UCOKTWdJT9C7yOAg1iWGrkiAra6liSorsQz9ihbcBHDYUizqPk5HqmSNdsjyEpIY/d4zd5dy9gz4ucwrPQMmbFo3gzs+HxAmyiQduhwm8GKch0L9pEUtUXbcJbfU+6fgT6bwS2cyhyFDpRW6B2ZA9yZXU3uCxtj50BoudOObOe6gt3FKVxicyCe41OmNLR5trmVCB+ZAnwdides0lF9mcdiNP+3MLj1SLZOtlmG1M9nyTdslCuZNVr0qZt7xFSE3Hn38rII3fEYCwhzg==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiR4FKLqwtHu2HSIxFed/99na71u6vlYZwk4kvSkWGmPVZGSZiBwey7K5kiLGaSS+RQQ2TsJh4YiqWtGhkafcHVjnfiPZV9e+6ERjrAS2D1z5gvLJYrt2fJ4/hmxlpoGdsThICE+b0x7xGUmSoD8Flsl0xpJNAE5FVeHaO6Cs7f8neDmNqfeUfXo56ovuHP/9MHyMKXGPtx35PiMmfTRsgi93GL4EzlVuNyvK0VBArLYgrnz5kJOM3kpQMIuJPExIx3b98yqyg8Pz10jVvlwF003CLo/4lGfSTeM7NGL8F8RYA3QZOS2NvjjqReA01Lsingz7l5oBH8e6tBWjLJMWibW45EDSKXe2XVMYDZdSVEi+xz9RRPRq56ox5CLl42ay92Ldy7e4rpdIQ+TaSMErwb3+OcvmxDKolZvmZNcF7gyhuTP/jmJljZ2sHGY4Wwv1SWs7gTRnKUVwpQrhXDjO1Gu6HvqwdcP5g58ukQaf+RRQz7eRBOCMRJ6fguwVWr+v7g==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG19PLptM5duMvXkns3YoMr9wNJzNj2r4sNIW7JGswg/Ig+F64Lgai9m7GtuugKfWV2VvTqAGAVyft1xd38P4KgvY+1F3mMwgx3s4m7FdpaWJphkCb8TZYYcK/3J6SIX7RB91s3t167eUagfpEkrJfTMOpiZnlqLEnOHec88cDNYUvDhvE/xaZLukv43HSFJ02XQlhrkBmGMkioC6a9t6PrHcAgS5dQK7fuNsAwigfj4eUTcIorR5moiba1Rd8WMR0li+s7QE5cFmS8WEHNPrFtZFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbibcivfkKrSb8Ljdlx4zEOXTcqCnyfrhKrrkxnZHAQF6rT61GFtU1sRcOVPU1FJO+ZBz54uydBk7DBCQ9AKRSS9ZevQmAEeQ801wyeL6gexiU9u8U/0RCPSu1jwX8es52gQ==FastBusiness.Encryption.End&DPCreateDifference;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4ac9K31h4XjQKZ5G+SkgDUrJK2mw06LzyL4ylPLikeDqqdd2rZnI+J84lmeEt1zSIX7twGEd1QiZ5MmVplqDFUFcuVLwxn/Sc7HeC/tMmdoQgzj5pVUrmD57LYm3rJpYArYFiN5LRudlPAlj77RhywO5bm5qYOjCdfGt7oyX5dPRmylWHOuBvosS48glyPkODA70yL3eVo/5cCtluEKhtJP1zp8m9N0nfG3tfpzH+odozi1RUw9HYVobsfxrhsbhMiLoXMUR2tIfWWRHsLrb72Ml6x9fSns+mbEWwBGJ/MvI7AptCDfkXBVrLCkOFx6H3XKBzeq/5lGBAJryVBT8/gfdqCfo8fng4PCr6nVAN4GCemIpv+YQKAbB8jN1Rfal49x46iuZn6HwyEs0kYQCo/Rsa4C4iX9lRH7CLy8foc5d4IA4DExRjuB2wEG9NRszHHYgAnPk2aOmwaLyQd+odrAzkJL0czujMKnLEgRyGvN2ja1PFSG4bD6ITrqMsL2vBJPEQGGei42xRHpCicwbuFz354oFWhFl1szdwQFoMZUEjrD1IGXiaeU9NYyvf6/IHExPzxzEyidYICfMxUEfLMoeQrr3PE91IZbDetNGLIY8d1eNUmDiSdsbx/yoYwvBDB5tkjuKwBb2VcpBl2AjWZDs4TrR4Raq1Vsco4G7vV7RjkBpemZQbGTAnqevsiqKdH/kgT36m5okADuFZnL6uXQsi/LG+dV19KLocgT6dMuTsDpHgTh0eKCr2PEVK8MTz89blCOBVqYWyOgHOtbE8/V5kmea5xUK1+I2VFS/MrUmXMkeyierQ174wXP56sj/bpx1cYmy/W9cOqp75RXEczEFN4TYhombB3qxj66drBeOrYA8Wj4ekhnWQfSJ3ULIYHSdjNBL/nVaxtXE9+DEO2I=FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaUeS2eCXWKKHcZsD3vfj0NXSG+VJwFxIklBbB+5JCl7eSGrrmE47ZLXnQieWn9ObRI=FastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu3TDZKCPjSWyqXwrPR2FYM6snMXs5uTH01HyTEEThNFxQ3BQowRUDQbhHBnoF+gUoHyWVwR2+i6RVJnBeiahnWL2OHoG+R38W1UIoBM9/rAf1cOrqc5DSYlKcuH7wlSt3A==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUdJdy/vBMw8eDcCZQerUnogOA0ZZozSVfTD7Rt7FS87DtSJQDRpEAphYjsNICTQTxXubG06fRlDu5aQZKKstXic=FastBusiness.Encryption.End">
  

  <!ENTITY CheckTaxCodeCondition "exists(select 1 from @r30 where ma_so_thue &lt;&gt; '')">
  <!ENTITY CheckTaxCodeConditionByCustomer "">
  <!ENTITY CheckTaxCodeFieldValue "'line_nbr, ma_so_thue'">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.PFTran;
  %Extender.Ignore;
]>

<dir table="m73$000000" code="stt_rec" order="ngay_ct, so_ct" id="PNC" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu nhập chi phí mua hàng" e="Purchase Expense Transaction"></title>
  <partition table="c73$000000" prime="m73$" inquiry="i73$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã ncc" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and cc_yn=1" check="cc_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default" row="1"/>
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

    <field name="tk" allowNulls="false">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri0" dataFormatString="@upperCaseFormat" align="right">
      <header v="&lt;div style=&quot;text-align:right&quot;&gt;Ký hiệu&lt;/div&gt;" e="&lt;div style=&quot;text-align:right&quot;&gt;Serial Number&lt;/div&gt;"></header>
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

    <field name="d73" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="&h2;" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PFDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r60" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="&h2;" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Chi phí" e="Charge"></label >
      <items style="Grid" controller="PFCharge" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="&h2;" filterSource="Tidy" categoryIndex="3">
      <header v="" e=""></header>
      <label v="Thuế" e="Tax"></label >
      <items style="Grid" controller="PFTax" row="1">
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

    <field name="t_cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng chi phí" e="Charges"></header>
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

    &ListField;
    &PostField;

    <field name="xtag" hidden="true" categoryIndex="-1">
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
    <view id="Dir" height="182" anchor="8" split="9">
      <item value="100, 30, 70, 129, 100, 8, 100, 0, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="11010000-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk], [stt_rec]"/>
      <item value="110------100111: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct], [ma_dvcs], [cookie]"/>
      <item value="11010000-1001--: [ma_gd].Label, [ma_gd], [ten_gd%l], [ngay_ct].Label, [ngay_ct]"/>
      <item value="11010000-1101--: [tk].Label, [tk], [ten_tk%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="1101--1--1100-1: [so_ct0].Label, [so_ct0], [so_seri0].Label, [so_seri0], [status].Label, [status], [loai_ct]"/>
      <item value="110------------: [ngay_ct0].Label, [ngay_ct0]"/>
      <item value="11000000----111: [dien_giai].Label, [dien_giai], [ten_ncc], [dia_chi], [ma_so_thue]"/>

      <item value="1: [d73]"/>
      <item value="1: [r30]"/>
      <item value="1: [r60]"/>

      &DPViews;
      &ListView;
      &PostView;

      <item value="------1--10-1-1: [t_cp_nt].Label, [t_cp_nt], [t_cp], [xtag]"/>
      <item value="------1--10-1--: [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="11010-1--10-1--: [ma_tt].Footer, [ma_tt], [ten_tt%l], [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

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
        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 30, 70, 129, 100, 8, 100, 1, 7, 58, 42, 8, 100, 0, 0" anchor="5">
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
        &CommandExternalFieldQuery;&f;
      </text>
    </command>

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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxVMx1846CkzxbSU4gmbG9yqdRZoJBzemZMYFJrYwsjqlh2FrHVpf/K47CIBe+8i1oqbrvtP+EOGt8AUuvKWhG4nwQeRV7cjsJigCsgACb1VnovomWj6aOBlQGqHtuv4c23qaFIvL0qiGl5TGCHnC7by8mX9tONVrGW0BKW6UTSWUvjzlQ4qcIhighV6RA++EKKN+wIrJTXwyPlf1lO89x8ubVUd3vuhfbsV9noGCC/Myp16K7ylTBMMDexW2PtNMsXtG8GyWXb8GR8HPtX1bLCRVmsJdZklHO+kl4UzU17aU=</Encrypted>]]>
        &DPWhenBeforeInsert;
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCbd1ArUfJ+PRsiLeOe2mEyjIEtj5+xKaJE6Kp3XZJHkEGNjGxeClk17eQKsgq704fhcsreXvRezgRq/YGB3kl+ahI4jwWZ7agbyZY2XLfar</Encrypted>]]>
        &DPPostInsert;
        &AfterUpdate;
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
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckLockedDate;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XXWFyhs69eHzp8/i9wp1totf8UdWkIJzDEa5aGRjVzxdbsKnQA4NvAWVRJEtwopfg==</Encrypted>]]>&CommandCheckDetailInputVATInvoice;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22eFQ+FudFLqOJ1ZESJzYLQHAonl12OcAa1gV0AuSXQHAufUdZspFsj14RsIZEDSQlskc+ccfHDaJIOKKrgiwu5iFIQs6dafO5yHzO2plv7SZqTkTGcea8d9P1YwcHaXQUch7LjcKMtN/m2la++k/JcWQlCqyHAlhqq8bsSzzz6k1</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku7rB9Uo2GFNXRR6Yh/0TaxwRzseXwtKP0wnnyDuJOnzhsRDKnSgckEY/OULbvFyWbviIKhgL4XUaOYjWfPMByplCIyV7Fcq9IK0vjq+JTqGoXrL8mdq/p3rU/MTMvBNbDljwApeikqvG4Es9zEcPSG0wboK7H+7YnfBJCRfEtBiXanOQAv7oRSbnkdt/nIDRA0cNbaTqCkoBAxXpbgcbO+mS6dMNTl2J5hf2syObHF3t22C1UVMqZv3Qdmex6CHJ6+PeckOyI8C8lUslxKpZyp8/81+msk77W6ysOT4rGbBPypAFOitVtYvRmjPzMaf0ghFNEp0b4DMDa339zhEvMB1p5Xulf3+4lIdm5qx2xc5NvYZJ/+PwHaZ4VhVK2PR9XhrO9gtDABvslX+o4vjfTzt6nv2LDq5ikkkyUnf3iCIs6ziKWQaA7GkWj6//qgyoHghl+JhnCGH9dPf8w/NXUc6HXQMfiu5DJCCrIaClFsUBnA0Zoz81hd5zx4M/eFBEqw==</Encrypted>]]>
        &DPWhenBeforeUpdate;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aXQIfuV4zwRmdeqUv+hAbjdRh4WLVeqHrCxzfLcemgFhoORu51lH+ejBqSMCo4EzozcklXImIf/NSUZZ/cjnT4DIJYff3heFGiu1iwIJHJpvTtljohLnxrSlwv34O+Fvc2clxqVjYpGyL21n8UkFwQUL3I760KTJovUdblLMQ1pHOTosHo6XG48UZKHrf/rRwzj0a8IGIu+E0tw5mIhwIXCja07yp84YnCr2WSEgZ5KXmyJRrgY8qsQ8SZOGqFv4HAmP6TkDU0DRp3IKzFWj3Q=</Encrypted>]]>
        &DPPostUpdate;
        &AfterUpdate;
        &Delete;
        &Post;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5rTN1z2TAvRcHxKacuqFDub75yfUOIVdYhafe50GNA9ruqs1WQTgIAIbs0WiAncaCQbTo0AGWUuzhgcgcUH8JgwHGUhxY6MPV9m/tHG6Fk/GeB/zNyxa3ZgsL/Nqkao37qkwfTsPs+/VMIQDbuVfpijn56XjJbz2h6VrSzO9dfaCrmKb6PNZcCwrhdj2oCSCY=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6nskpyE/YdJfyt6cV5aexPnb3Zorbs8CELktoYvKAwy28VMq0FU7Em9bvkzMuY41bT9X94LTrltj4mVU4aAtLQ=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu39RtoHcjEUu+0AuYTu2SNRVX+Jm7KYFl4rR5+5JL4alR7RYItYtrlGB/8w5GWt+eTaOyhSRAkjEkhBeMsw/W6M=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkCWC1lbyXQU/cRhvaeUBzBycFw70N1ZcpZaJ8pUSTg6GbzBy5UquQXacjpsFcLOJHNYzSqSUDNQ0qaltZh8bEBmIhy3ppZ8h+RFvaRUHiGzx/PRU6EnF5CVMja3JaidPJI8GwgYkhoGytZ0VkRh1Zoaie+iMIno/ApNBP2W/X+ZOXBFUevwUl51k7pyAxVPXpeKBcHJgCOO5/UmpTo8JXzEFPxPZEbhxuTwbBXLKOh/Urw9HERe+NE7JX4ic512fbaEriH0loruyANev+dw1MXOSS+q0LMKlgE1PhIqEYOlbZI6EbOGsPxgav7s4i/D5KdH2MEKgTQP6rQudoVp3R2IM5k5d359ojgBPJ6BIIj81iAA7pcZ9+7tpNCJUdua2RgL8YTF30VmwNtoQBxHbWKYdbTfigs/brKiTpdtjMRd2Q==</Encrypted>]]>
        &DPCheck;
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpWhQoUpad73yGdQDMg5nLt1K4cGdln6SF1SuZSG7epIY/7tpV4cywc7RHgVAY8mbV3a5YJC8bBh91x5DFLb6nQg==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxdrQf6mv4I646Gat2YetPUwR1jqAbvvg7SVrBjJouUFNyuY43+OA3yNp/NSCuUyGQU=</Encrypted>]]>&Tag;<![CDATA[<Encrypted>&ymPgYPXvzpL6Enqd4IDunK7pnavP1dtf6Ucf1UiCVptIL4FS2488MrmiXHf3zC71JHDntnHoYvoR/Gz0FCpVn060+IhIeB0abkFc1NLfbMhr7kENxZjxX69xzPnqZLE6Ugm1lYtKcl50AiuxfoHMj8VZT44JDaAfTheR9PwAS4S5sfmZB/MAjQVS7/RHymQ/y1LX9G8EK7CnqptH3DJ8cy6cbnOmhATZMxpB9rSbd6E748yOwk3uKQzoS3FOdvSY</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&uGHO1INig/bVVI9tiETWT93juS17Eg3zeL5+cw5rKOgKM1T/9q05Y12zCAccNesAwLWkAfehalQZ17gFxltWUlYSK9vusa1KX7lidETlw21cUMvoya6+RuQadwc6YB5QMyVg7kt6pu1pc1BcEcTr9HtnfGyhOrtNlF3+37vigMxj+yAgO67uC9sTga33JklF</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4U0qjLJlGlJJEgaKQfS7mThjrM4LNwgRV5LRSNQwiV++dZLszdHmEpdlkbiAjQb9GGc4YJ00ySCLCslMplQ2LpE30F8x1n4TqrVYB+nXhzH2IQsZ60BQ7jfgvmrzTN2QurO1/dcY7XStp2fADINT4u8HurSb7CXgsUdd3kCX5UJpE8UI9Fcx7SOIgVIbKNYT1g==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezx0vmRigl8Bzx81hnSSBcpzybdsCS0w2yDU1V7yc3z8DhAQi/qdTGcvQMh7sXgZomKCavRIHC2KIHsVK1SN3xn3bfAzdHeVtsJ1apNUqVgkSn2kNOcQ8CwNqtF9tCy7f1OT+s4GAL7J7KavXM9a99WPiuuDzBMBK0scwKB8iKjEUGqO/QIN6dmLSj68VhF7JIM1TW7NRGbexpvraocKXwYI4HgMe/EmuyQlbINiSJnJGmrTcrP3VgPb/qeEo4wVsENCUlrvuz4fsJ/+UVHGcCsw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4faFOs+Xs65Ec+Ah6eR51ky57l+bjdCHquz/pty8nxIer/RslZHJHKguDfl3iy/3dA==</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7AwHTQFqeMYoxYjllYAJQtblfURIN6BLq2+8FInYDX/EXtNpT8haj0o35tu4fHRMLmiLPAcyheYwd7JYaDNxHc9/5DsAP+BOfy5tTVPsqASGPOLJkwaKK5IyM0u0sSbMol2XIyBNtGB5rnqQdDjo3oFGytAqjaMrkD//c70A5qf/J1DGz6NdNVEKb4Vncs/TEXNJrI2C61x4SkYwdJ04zFkN0zQdpDeywIQCktIsLEF/LBl/866ohHLrxPVO23j1sKfwhNSrcsq/FEbrCPfoNGxld/CK6sIhC9w1fxfp1IpXITujUZr2zEMjQnNg1sYgFG36/TNh34FJuhhwn3JBRzsjPM59zb/SEutbPAAonF1fiVGm3DOT4uEw6K/KgzeYtDcaKb3vcvZS7wM/YzKrlXebSBn73qeFf19b8s1RKbWIMY8Ba6J/Bl5m8XKme3ashbOWEZsJ0TRjST0w/yFWY65rhqLyGBCV14ckqY5mW3vnUSaaKa4leDXcRfxD9lEAKKBXbiFCiM+axnEu5VHsk1UbyoUhcgCGwtFLe7L+nNM9w==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WqhhHt/k272dUS65C1dUznfsK8O1i7YrIRWWjQj+LFyNU9/Skv5zH8r5MJZRKUxcBjog5tL2rJcDM9sIZ0oCIaTKwqIpot2dttgArKWiIJp/1C+dGT//BLKcuMexgVdUZirQV3dQ29C9KELQqRK6yjA==</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bCbV013qAsGS952fSWRPoyvxzwp1hEiCaaUXqlSMSnMTosl6yfsWYBEFYY+Wckqf/UZKTNQRu29rVHxYHRERyZ8GN0JQkdSU+RHCAYlav5m</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxCLoaf4Gmwgn2t2ySyEa/mzMl9HG9cONPRVOw12BsUxvRHPi0ih0GUsR/9ktVk8BX</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyrbHcGKgLQlHwzG9OeaJurRpUxtRpsiU/VasauyUSukxmngDxxf8AXabWmNf8zC7QS4Gdj8LK2HlW3J2XwBp+5WNJ9r+Zcb7orcBdPDMiU+e/ahYOzjB9nfOKnSIwk9WjjsPaWmraC5HZuxY0/bqvLFGdsaGc7HkI2x6cAXE1N66vjzNNT8J6P6ymBoEAOtITlkWZgy03S+SIHTl6NiU1VA=</Encrypted>]]>&ListTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwsygCMj0NC+9aWOEuMAoGMuPGf1i2QgLtlqWPUDvUanxIwn3ThRgPm95i50JRDHjDrPiA+I0GaLoj2Sm8YzC+rYt06OLk38yuLQVFhZwQyk2MbwFi5FIlKYaOABAbEyva+IGcNmEIFKwuuCDmF3VmKY26D2+1yZgd+sfdSZWi6DWfSlGaf+pqUze9k3ZtcJfGYSJI9mPmUO0mpbwetLCjWbPDuhObQJeKvRZaYlgALb6IQ/TtGDivg1ZLdlyYoJE1/K06zRqKyVvll4avkjO5Yfo+YIWSv9bRtXqBk+H9rFvn2TdQH4HM/CNEKzpVPSg==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUvZmfczXew2oSmKnIQDL8ph717iTKpoHyZD5ZilsKk/9QOu8SmJJjJlmr2CX5xzNHbQx7GOfdvx8PdJ9p+gy80f8qP3FtskRsmxS8/Pe1xWDN8EARuj2FqyBc4zWFBuRqEsW37IqzYQRGP1zrKGSPpAsbn7rnJ/FoKdcguUOokD7oYb3SNvklIFpT7deew4seGIEx08uMdOqEa3vvhslBgV03w7IDMK/ioLq3J8ekHFmJbez4eShbfR/kaJSgpni2</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aLBCPwkYiAIfGsR6fUsyM1YwnmjxulmsY/rWr8TJxUUuEzPGVGkkOuZI/g1ohkMiG+hSL/yAdwaRjZGE1zv+W2XM3sHlfr+uFzdVGacY+WUttrCck7eJzntNjL38hAS5fsjMBZgluy3Aw//9Ax8Ixzkr/7o+upoGQjSw2DK54apSltIjJszuyLs7BEK0jRVhDJmBEm7B9n1VqC05dDFDJ69m3zbIlwTzobwK5gz498Z9L8r1pr/JLePgvsz6vUelsBVJ0AeyKdJTFrTPuIut4gwJdimA18+oHGl/NneCgjG0xomy3AxHMW2JM+yrWzOMV8l2Jxila8JBkpa/j3eUzNUZ6Rr/bZjEyZ5evEc/AFAQZD6LG42JDvoSs6VddvyWGIzoIUab3Sxpm/i4Q/CbMu1l6ZK98YbEDrtKkNpkl6GLUPr1OAMU4yyXb8I0cbx5WD/fIIjJd7Or6qpmLgodAZAfLDZgXi0Ly1khSkvSoGGvWB8p5gFA68qVT135nQgxIptmUFEi0UsZ/ZYJY1vcVTRoZ0Q3YOTkR77S+PDrqv4UtiXjxxpf4KBCmVZ2eWzwp+IJDSOgYeWlAzk81bN1oJ13y53N175vdBrv0Mepa76</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgR2NIYcdwcgoIXBSdu8Ly27M61MBb9lIo7IsQ8fAlD7NvRvNRJuapmp92qxiCL9fLX1Ldc25tHap66d3Bydi3dg==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>