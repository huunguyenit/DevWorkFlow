<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenCashCopying.xml">
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
  <!ENTITY ScriptExchangeRate SYSTEM "..\Include\Javascript\ExchangeRate.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherDate.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">
  <!ENTITY BeforeUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\BeforeUpdateCurrentCustomerBalance.txt">
  <!ENTITY AfterUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\AfterUpdateCurrentCustomerBalance.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCKA3U1Z+tD/IjMUyeX4NWOzM6TVcxdvzD1UBb0cSNDtnBFhsshAnzBp30h9yhTxPYJqqT0XGW1XO+lEENFcYQ4w==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7UaEs8H7Gb0PN++mJKIn9frwuuPad9X4jB2/rw5eYEUif1QdjVnwovpk9UQxUt4y17kC5wYNaLt47CyFi0MbsJc0hB/m4F3P8xt2Qb1yDZuRDwqwRm+SVWyAk469zpEW8MS8qawGd3ZO9PIjGqRP2v00eA7wLbBGFf67AVhc1/UFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$knoOckCk6knYGNO/UXETAzxNorSsf/WfjJv4XJH4EpxtVyWMpgSzJmBaMHxwS2dm9UvSqecdbmsfHOyE/SGL4XHwclQqpd/ORH1DfskGoOfMf+fbqwS2k7TvaP2Edzidsd+kKlJFVdxCGtF+L9sgqoFaWT+oECUvXJlh37YlgFQ=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiaHofGFJpbS3YoWGP8IosdaXsHVY4LAwQvxqstZPFyVa8fOE3+ActJA30mwTa9B845dyrRversQvB7x7Fp2/IKwBCiNyQJ2rerMVheAhw7/iMhi2IJ3w1E65nOPKE0wJUvPM/GjQUMi9sEUawVkikH/FNjPxSllV7ZJ0WB6MH8fOSd6NWLVVwNI15Sy13GyFzZNMFEjb5k33KU9E4vNsbGv4s7BDx5VsiIZN4Xc4QT9s+SSAPoKcxXfJpdJ4CrbYuxUOMoPUjmjoSK1KJL7Gn9ekRxscKdtqXwD9C/2AWr1r7J70nwPlbRIYG2XcH8eq2iEaYVSlnAGb4DWfFRzfsSVSnEOexPcvC+xbxinKEMksqRSY+sCFa7e8ItktnEo9rrNLC4B2Jo2bEu+D8wJ6D7I=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbifM/+VqapwAfKVezvG0zuLHSAKcGhKTlgDI12W+tFKfasHelOivDpsFHyDXOxyX8vQxRviKz2dBm6pxuXs9YyX+kkFZ6SHaTyOH1wBUjbnZP+UpqEuX/2Q3A+XGn41H2uxQMnKsDbPjd2mRj+FFK0Ye8FdMAvadrbnTp2L0+xdIdxOumQreMh/+1CSO0LHoY2w==FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaVe2PDhdzCC3mxaXsooeDGm8vVjgn3mktt81CRfX0D7IozjH3D/Cl3KYCVw05tah5HsnSM0fCYzoOWB7Iiz0juUtfcpRQXAPlmXk+PTJOVH4QfOq9dQxmIWpV0noCIJ/k8=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUTWTmxkl/+1EmfZzjOc0vxY4eWMIPCuhlGBOv0fNlGxSOgw6SZ9nqmKi/+H5VpnuYA==FastBusiness.Encryption.End">

  <!ENTITY CalculateBookExchangeRate "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5teddOpp4IPAroYCkT/JKhj0QXBsyUYQ70ObM6+LeIptpVk957tE1Q0SVln1g1GVWMOAN15T8Bbgr3B880hNxyfYIqyca4BFx/WyeO2PDZCrX4XANke46dzeHuDFdNwYLxuzlQQjNZ8VwK05mBsOe5bvk8qs+bmpwTRoWTxP680hI+YihxQokuHuQtXqj1FGHXauBbuoC/bOTI6zwodRUx6lMhW/K5Yqc5V8mLUvSUD61VbBUSJHPHwJEV6FhmNX8bWx2GeqVYwxTdgND0EoWf8MwyINUs9DZ34315CBiy44vNj+iRHjqxFkEEfhUhbmz7D7GgCzxJ0LM+HJ3H3XURUpi0UEpQRcRJQAvd1DGUnwkUglj8H0PV6LzeAv43m8gHCEEcZ6BWA32CsArs87uySOilCi4Z20hvO5SFuCPRwfwbROofJF2p/3Sk683Bnyw==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$TsvsXuBB21DvVUoCpdbLx5hjOaO4cpNFHBJ0jdvV4NN4aSP3K/+UlV+mvnzJok2gcX3Sfzw/V965ytgcZS5ZGzwkf1F5cip6qbZubYWQw5CpCJxwyuEt7J781qOMmSxgTe4qNzga6b5bngWh3UVimy0bdDR5fD85gjk7QFaLPUMm86lIKRMo3Bxdzm3ZUffuOo7Rvol1dVuThI0QPUiFcA==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$TsvsXuBB21DvVUoCpdbLx6l7KS3Lv+uUjjerQmolft2gyEtT07qpMTVidC/2N9fkPFeT1QEOZn4NDTM7BYdS3f4kX6k9SqfLnUBpZTC3XvrBoms/r2UO3XbgvnlmUV6J23YOfpdIy5cnSijvEAWCO4O2zgmIoMh2jnVLoU3OWr2yRGrNxWPFoAJvBABO8ipixUZj0W9UaDN+0yHfNLSTe4TNQFMiVSYTYSFmGLBe7khiAHhL4GbQmWZaUIunvngHlvjJ8a61uxDJFsPuFO/K2LKB4js2eAdsRE6bpPLcfHFI/InKxLJMPSjr78z/obeyVo6RZ7v7LFjhwVchz32yZlPqcFhaSIDZ8uTlctYEuyMFI6v5+qeoHv2g9+C94bXItNJkFDpcjvPGO/qfDR6EYWRgwo1VroJqPpcecyDFynnUC8Ne889ynJe3x8jC+24m3HNx9Nsu+DQBK0aIRPoZJw==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$kEFDDs/h+4ZHLYm5skR13o4O3aQe+UWuJOzV+bTkr/MCY7rcT/Qm7hHZJOURJx46O346CkaCFj++2X6q5z3UQb+x+DvS3rqJTz6UhCYA8U7IQDeZxNM5fFCjuKXTXeRK/jNDchacHfDFxgMtGVztTsfjpGKSYaT5m0zsVd3yFd2qSInq7/NHhX5UIVTSDFoHq5iE3hqOKLed5uj/B4K44uPo5f4VJDKRL3khgA1L94fTW+Ci2DoZiI1ySQHLsToymqjvAuKwUz+fEcPRyK2m/xB9G4jOmNqn067B7WC30hfyVZaxinSQs4TlWSPsBFpNlA1ict3nisqp2dHFVOK2QKAOp6z2T7bvYEsyNUp2QwTccCiP1NdPodrmwDtaRzTv0PICfsx2rBuIFNzQomrI/uOJ5B3GresrkEHJyn6X7AebNJDN+kKPqroy58vHwmAlQCpwSdCHb/kTtAS/0ndkxNLbwNvLmllN+IvZH4aPAOtQ4Jkjga77HRaaGL5DsFVGFastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.CITran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m48$000000" code="stt_rec" order="ngay_ct, so_ct" id="PT2" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="bút toán điều chỉnh giảm công nợ" e="Credit/Debit Memo"></title>
  <partition table="c48$000000" prime="m48$" inquiry="i48$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <field name="so_ct_goc" type="Decimal" dataFormatString="##0" clientDefault="0">
      <header v="Kèm theo" e="Include"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai_ct_goc">
      <header v="Chứng từ gốc" e="Document(s)"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6oCvCyvGNeTkvFCI1bz32ZJ8lXhThkCwWNnPFWt5zZ3A==</Encrypted>]]></clientScript>
    </field>
    <field name="tk" allowNulls="false" clientDefault="Default">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" allowNulls="false" clientDefault="Default" defaultValue="2" >
      <header v="Loại chứng từ" e="Transaction Type"></header>
      <items style="AutoComplete" controller="TransactionType" reference="ten_loai_ct%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="loai_ct$dmloaict.ten_loai%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4WPBY9Z4E2DttbNSMn4AfgyYnyMgEYD7WWfqa1ULxcB4azdnVto0vLlgYjf4L7+rk=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_loai_ct%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5BYwfrIxe7sbc0hyR4eVljmUTDHmx22aCjIAbE49BcDg==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="sua_tg_yn" type="Boolean" categoryIndex="-1">
      <header v="Sửa tỷ giá ghi sổ" e="Edit Book Exchange Rate"></header>
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

    <field name="status" inactivate="true" clientDefault="1">
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

    <field name="d48" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="194" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="CIDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    &ListField;
    &PostField;

    <field name="ma_dvcs" hidden="true" readOnly="true" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="tk_ex" external="true" hidden="true" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ten_tk_ex" external="true" hidden="true" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="serialize" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="254" anchor="6" split="10">
      <item value="100, 100,9, 120, 100, 0, 0, 8, 100, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="111000000-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk], [tk_ex]"/>
      <item value="111000000-100111: [loai_ct].Label, [loai_ct], [ten_loai_ct%l], [ngay_lct].Label, [ngay_lct], [stt_rec], [ten_tk_ex]"/>
      <item value="111000000-10011: [tk].Label, [tk], [ten_tk%l], [ngay_ct].Label, [ngay_ct], [cookie]"/>
      <item value="11--------11011: [so_ct_goc].Label, [so_ct_goc], [ty_gia].Label, [ma_nt], [ty_gia], [ma_dvcs]"/>
      <item value="110000000-11001: [dien_giai_ct_goc].Label, [dien_giai_ct_goc], [status].Label, [status], [serialize]"/>
      <item value="110000000------: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [d48]" />

      &ListView;
      &PostView;

      <item value="1100-1-10-1-: [sua_tg_yn], [sua_tg_yn].Label, [t_tien].Label, [t_tien_nt], [t_tien]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="25, 75, 100, 25, 212, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="5">
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
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IL62DQvW4Sx5tOA6CAsKEIQ0RN1cX5jsQICKgqUtgBNMcvcBz03aGIY3cAF85BBnwk=</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWd6HaL1OGauusRtQb6bqs07xG6Qjwkz8N1z0TqPoMU5IOoFDY3nwNKOqVHA66gwNgi+ov6YV6nwDT9MIu2eLGlVMoZdpHU1/ClFeUiYsbBmQ/W2xAgx3X/VpT2fXOoMRH7EHj+9Ql8Caa/AkKSEaYh/KKgElKRfej1EbUizdZd93WcZgPkiHbOHEbMjv3BrEyOPQueAnmICEgPEQRZf9BlG</Encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0z4sFwF7cdKnIcbhLvJe3kpBMrwoKl7v0r37zxXuk921dT12aszdw03eoOmZRSsqrG6W+BDjTb9p+NDiJdXvFEI=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbZaAEVT0QhLeDz6F4WpGYKmrPKoJ9B/rHQ84ejexCmVWFQ9H/4TZB9T/SkgvfpVBp06DVl+3mlMZFesGS8lTBrNDqheNMEGt+wTkN+/1jdODdmUxCHl9zpSXOF0Z3vB8iRpPRnxKMjOBaarNgjnhhk0w5GpvM7NT+rlGdZI3GP4sh9pGSm/qUYmpwBu7NtAUc8RlXtVDSuw0ntutaDK5YQr/PSHZ8HehqtZJbpPFCNKgVjuPSO14asyesUIjTbWzGNz485jdFVh/s3coa7NHntniCyXszGPYAHl11TclPxdM=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxkW8sDrYa7jtl7JPjw97A4kf4yyll/zk4Ipgz7w9PC700XJUr//DBLtLUOcj3l0w+sxSbE5HBHDwlIx3z3BrteTU8SVbRWCu+YhHFTJJoin9dFf4mIH+UBaIzOCDU3AsAmv/ujcg5OWqmvZwk95uong==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHZoYqG+FRLUHBvWr9O5u/ac6bsBVizVKn/26KfYUd7pIF/QANRWlRdklleZ1YRN+BFF1CzQi0hdozKQBgkX5nA=</Encrypted>]]>
        &AfterUpdate;
        &CalculateBookExchangeRate;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
        &ListDeclare;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758Fep+k/xlMRtKIcdPXjvqf9zafrCrnRrZdzIFWnN9IbuS11a7vSak4u60TilLgtg46PXAS+wTP/+3Rf2X/3p7w=</Encrypted>]]>
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ06Ke8n4vPs/ehmIOGgPHPqcMEhqFAT/BWR9WpMhwyr1bcL/bXh09/Q891ozl5l76y4JVkKGj1yP/PqFiwA6WE81dccpuo/PobSIyrIL9hkDCqLgRdHsgRjy4Puk6l1smS4WFUTQlwlbyQy+86RHS/JdtMDrfBB0qhyThOlbFgWQ6</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5s0y2UOo+ZT5K16pLLsdqCXtGqNx9BZEMwxMpAXEByzdjrfmy4/wdQHsNPErddYZ+oOmboeVNm2IPlr7fHAXO6Q6S5cGWkd5xlwEo3E3guyJj8TQFE2pKTsjBN3Fib8zZnsAovzwTDquVtkbV2D425lnWDb1zaf45PlSv3Oe+MrA==</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku6kH71f+UccTY++PWRtWHbhLN9Auyf4N6S9M9LNeSPM5zYFNTMTKOnH45M3iIxPvF+ijOevp221cMwRel06qyINt0FgJ6wVWoY0VUzfS/68Rlj5RCsvArAF0jfn5lzX0tQu17gAd25n22oYeCgmBYA1484ZCH+Mhf/O/FCZQDZXe+86f3t1ogu+muNgAnzP01aWs8YJDoGsNIud3I48tMMQ=</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aGhLNhPfr6PIpUr1gRCWjQOAdDksGor6iYLgx0kvKO0XGYMCduwUe5XKPg5Z7yMoXotvRA1QfwTknc+y3ywsngswi7H9q9uNkxGUKxZ1zai9UPfti6/vy5GsfIcRSdGSMWFbzJWloEutkDQwiXcfytKtMo4qaNFBTx+n09VeGyvWp8x/HgtyjTlf6f2riOQ+dPf2dlNqfYADbpaFMcQvOjSFRRkFtoWmSf5fZLNr4FB</Encrypted>]]>
        &AfterUpdate;
        &CalculateBookExchangeRate;
        &Delete;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        &EndUpdatedVoucherNumber;
        &ListDeclare;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758Fep+k/xlMRtKIcdPXjvqf9zafrCrnRrZdzIFWnN9IbuS11a7vSak4u60TilLgtg46PXAS+wTP/+3Rf2X/3p7w=</Encrypted>]]>
        &ListWarning;
        &ListCommand;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ01+OSZdDG39YiPtd29YZ6nuj+6nzgq7KWj2ItOQkHDzRX8mN0rcTa4otQsLvt/Yb3IGfzI5OG8haPcDoo8XrXe3F8w2tLI3UMgSRq5Ko8P466GU8NhD7NqeR062wp786sA==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5s0y2UOo+ZT5K16pLLsdqCXtGqNx9BZEMwxMpAXEByzdjrfmy4/wdQHsNPErddYZ+oOmboeVNm2IPlr7fHAXO6B4VBHFvXqJoO3PgiEkfvZUvGf57SzwPHeo2mCCedM8FRktkYCbGa+cmh9SOkeNdnRW9r/b53uO4y/YYe6P6BqRn5SZYOS/zmo6XrHvfbr/0/MAbcYEeYmrHCiHcYPg5cPS8KXti3SBGMBLF8MyCxg17/jPfqdz8GRq6oESJBtq8=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyTxBC4LoKl9bRDlLBCizsYxeCzvvqtJUDxFGi2nmtWcd8p30nNZqwYCl4x79U9ZuXgEcmqlSYV3+AEwSO+Ltjw=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EcC2Reti8lbzdZKpOM2XcPtyqfedDAKFTy0VepLk2E63hZJoAwpIY+oLxHyD+eZnlcijkfhIWbPGNyHKSKR0+OUKfo+Lf/nWVzW/4r7ITcIo/UOwsaPsFy1pSSE9CSRS+wBv3ZhegSDTBNXRtKAiM8ed4zP9IGtm7xJZNVyY4c3ZWeLNAl/9xOxjD1V7DRtwYHCEEhGBi4aU+yy7SvOVhnBItsH/TQUT+zZoaOF1C5pEcCftz2DTSnr4udZ/6k1Iahp2mOMnKakZ5WOLTmTBS7b8b4m2G0HlrCRTOzdVGjoklw7VbjMNlniZFPcKR44LmIDeb9buZeAyibewcHu+rwK6Nw8m1sMOu53q6st/jjnR8G+dFDURcJWhrDSQNiOxz0ljm+KsQz4IHlFeBA7EikTJIKO4yGhzplOiAytQB/LjjC4KPMstNqRJhwG6CeWCqxZ0X4u6uwfBwgzuVZObcuksuAjCVPCZoTJUHL8TUbllZ3FBddPPHLMUj+dvM9ZIbiP7n++ETwVG3o6W9ZCzUJ2nFHAWzOWun4AkFds9uF9zne+jwtNe+aFOky7kTEghA3Bxa7JxLYziFsY48rJxph29XeQWfbF/4InK5JDKh1pDNL8YsQGqLg7r4pJGrHsP5g==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5Lpya5pYlEWWAacedGhSUOcnBVTepPq/RK0ZHcGx3vzmWllaktrR3ayTGRTqYfyAsr3y6NUQ/SSM6kMR3XW4HBooYbVAdvctE+8GLSKkiSttRbQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4X9orcRVBii7ARQmjGxn20qBOMgHd6TNcBujfjxzuG4YDVekkKFV18s/ThnGlM29R3+j4+5ABykrb3i9LiIAgcRI8eHqqroYYu8fvCCzjwnFme21Fx/iL6j7Ru6ECz/+OL7UQlkf/udSQrJLRaLLEhjH8gGFG84xO1OKFlzWCRol</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWym9wbgs85nvalQ9Nb4tkNBULONFJ+rXydvRx3Exz9pxEjcZSjdGAoz8aB/KQo18IsA==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTt8CxOYpB9Eq91yWrQdgpPxBtHugNNVkdcCZ5MkLwgt722bYPTMj1j5z1fIVCybV+h7fzQdgtZKMF36dGRqgAOQQ==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezZHs+gamM1qST+MWD5y1xBJvE0aYKhrk7CKJKP74mF5YPgPQ6TvghVC4MI5ee/A3PQZGB8GpnVbRgsjIFWPMs6iWqyvEdaGr1lHFMfpEcO43/k+cWpxXIw/0lfXb+jNxdssOOit2MEXMiCpQoIRhCXAbRlE/ijrQYl3Gkop3Dqg9+WX/5bwVDYwhK7MhZc6CX2IOssA+ODUlNAZVpo5oUnpGWmWU2D3LFIlNvPrJESSoRlTKiA9yhWqcWxvQA1bsC</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KApgGJvPb1DW+53xCFh87q4Cts1wNIpklhNvYvCE8W6oN+MfPqjdHIErI3jRIkO06ywAi1SCQeGTnocLNxcD+0A==</Encrypted>]]>
      &ScriptVoucherNumber;
      &ScriptExchangeRate;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7DpZ08qIx6gjDSaWiHtki5lvjlglUFE06C7p6pdCjlujXEGQM0Wrh7HlcCVIMu7nX6fvt1F5jyiCRU7NoCJqisDV0ZPd18cC1zA6Oiha6ZM6v3PEvm7qKlynIPARhdcQqy04/5lNTfETA6MTx7PUC5ad6xGSKiMW8XT+UqWKeL8194UVfK/FnapHn1244OHFASRkCeGbCEZa21JILl+1hl0cfXSGx3b6l/eH6MF6tP9Ug7gq5IGcvpd2PYoTA2d8eMk30dziVXbGMuEZK8Fq6fOT9o/8qKdEKE5A3f1G4096LeiznfQkt1tysLbw7plxopUNym/IKULSDYsKCQjB7YisD0xD6D1lKt25476a0SBwnfxg4Dl3keHXNwlb8I7/do2ByY9kRGoX2aAqXaimr4Lpo0TEvqdu4xO0+4FaWeaVSWtJpFjIxJk2ZITLXP0rty9AMwui30K2oZP0qcLFndk+OHG9e0MV1C59cwqYfEAv5dSV1PqY83LYRrB7I2By48gMCMGs7j8isDpMtRi9BYybDsxyvvoIkGLHZqNrI1sWHVfSYNZOhuPUvKXvEfJRbLsTynvg9JeZtNLzfhERbJ6JeybLNqj8CWCdTASnquqOXdC+hwLS4v/qwUBkGWhsL7xYtdCoBBGSf1AbgbeC7YLr97flE6hVJxYdvNa7C/hSfggncXG8moWEfjNDLZRwL65lc7mxmXDTLPN1g7vLCX1R9/TYXBO/KDTwuo/50Q6AA==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKFq5Q0AMDCQyIlENJwe/+m40ugIlLjUBMhrRw6BYaKLwz6886bA34WrfV2EOfu5O/g=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6EHefn2QMKuKKJPQcG/URqpyFqpeqboTmw5axERgN3+fhxIanO/AAGIgj9iO0gbekUIC4TtiKB6UdCP+zXmU6lG7gvzf2fSoOwNDy3edQ6Ljo0BPB5C6uK7ucmnLOcHoIF4Q9NYmv5MRsyC++BsORRDRwSyOd3Zg3D+bCxu55xyv/6NOcLGzZE8UsjFytHpabUTYNT9S8g4ETGzJqNGrur/h6VmrqfwnFlEVqQEoJ0UDubxwo8i6ToFqFkrsArus9kkvhmomusPyVIloPOxoZRPK6V5wGw0xeDamad9JCG60k7NvNQalHDjYthIskpQ67WelO3cRI7Gh0Z+cRRxJxyOwJeu8PEdn21PBV9I6TjRUZsQRSsYwlr+vZ6oty48mUz6sUluM54C6ZJuS0MW1O8e4BMc3yNYNUmng6wdTf6hoGq5/B1OFaNdCQFGNmrMM/bdapwr4MEqublQiq3nQBrVH4I4tvUcBYUmtIaoQ6BWgG2YRv+seom7E/tYpT/YKeOeXwJuPATF+fkoXGcXep2ym2XrdTKFRUdevjg05NieFeGbJPjh5UduzJucHBMFaT64+b/KUbhELkR3AOrNPsMaNPfXqd3qfbQm/pcXpeGQn1ose08imwz+Y/OUQeyO30MzVP0cCVewdqTzq39P4Anbg9eCmkGti/OsFWqT4wIBldKosytzQFbRTERpQRZmVF45u/g2Wvuq+IcOPAG+oKrg==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UdLEWneIMq+BbTz7tb9bjI+l2vImLMAch5p7c8GE+7Rs5muoCprDL3yuKCWkrUFgOCT9Ows9w/YBnMxXUdt9w32stx/vge04c70uY6C0RuK</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bAU1aExzCN185HTaWw87fvittoEZBpN2oBaAC/2a1Ant5R12GBLeUFQmaF9yjfCKg==</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtiWc4eoifAc4qI4klKzvKGTXgKH+XQjG0bVKf+45ZHAQq7RHwbyr1hgvg9iGSHVukO2VSJ0G7F2nXSiHO1EeP4x5UqBKwtrgmoiC9bg21lcy0KU2F2egcY5F0h/h/iA1dSd7nOzSbHAJ91bnk0la2aKdMlRJfP3PVZCZ/BTZ81qpA==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZa8L384PUkg/4jpaczSTZ5aF4A/eQkAQqWsIx+wI7joA==</Encrypted>]]>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtS4aLN9cilX/JX+cTK+0kHgze8NFdlqjoHUhhzhQjjWO572NJ2pTP88AfEd7nmQeIz9564n462IlI7lyg6LJB6qFbZrKji8OYQ8Y6uf/6ZeNu68H+Ghu/aOei0Aof6CIfffmqJt4MstUP1jPIwNiGNLgGLnKjwb+sATCHDj2va3D0pfaivuyAY4S9bK8cRhsi9C+G+C9QaPn8C5Kr/6L34zG34jYJSPLkj94C0Bb6LGG1RWc+jFnjoU1PzI4WDwbvkJ6XLQvsyyFcP13ckLru6pMIb0eTjxvMfJHJhKpWnTzZ7XO7fzwTmXPC056l2XTkK7QekycTabFhDCQbhlRPwUx/iXx75wOZ2E2Vuq3OgnbUpADZNfRHbxpkcla0wNk5MD7p1PZMcxDpHgd8sDcrpyMYocyb6nUpSc1x9xPcZV+6dBeyS5eGxQ1uujSjjp6QeZT84OhfMOiltMr4oOjeeKPnE6zUkbe+i/So69oxnNe61IVLI+O1Iw1v3sVsfgq5Jiys4L/FGV/XNGSAgZfwmnA69XZcHc/HRoCvSoMUZz5/yOxiIdKEXXCvhV+3gzy7OgIJzQ9QAx7ix2qj0cv2GA3hXEE9P8h6lC4TjIIO5yWsR9Kveql781YcXfb0zAS8uI8pTVtBZjLkW7mUVXd8NKsdPjFdMcciyHorswF8G00rRahIy56tsKOrWlLy62Yx4uC8U4bWY98cyU4hrE/JDmvChYPKgPdFba40+wzAI//jGx//NPxYXluhEqVpGo9DZbm30/PXXud2s4DPpnuMaPmQkQr4+/a23f+L1CfUZ17MtpPSJn57D50TFy6wZShhipZDkByTmIxVf/PQT9gRmF0aaYDv5PGLyTBBOmEZ0vSpnaF7lcN9Wc2vorXuJvZ7As95gE16qOlOSV/+XnTRZHQdTqqddCOfbzZfc0vGnfb</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqapXv2dF/zPQRP5o3OalCwdVv/5VHmA6j8IRiGURqNI/1shCcKJtktK4i6UvB/wO9pHcaZ0FHRWsVuCyifLXB1yWIETZl6d7B9aKc0GG0cGFA9rzgAqfICqkWvFAqpY5pEVKPpVCEAhcB5O3lSRYE5QA==</Encrypted>]]>
      </text>
    </action>
    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>