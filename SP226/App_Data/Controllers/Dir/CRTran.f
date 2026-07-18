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

  <!ENTITY BeforeVoucherUpdate "if exists(select 1 from @@prime$partition$previous where stt_rec = @stt_rec and status &lt;&gt; '0') exec FastBusiness$Voucher$BeforeUpdate$PaymentRequest @@prime$partition$previous, 'd41$$partition$previous', @stt_rec, @@action, '57', @@userID">
  <!ENTITY AfterVoucherUpdate "if exists(select 1 from @@prime$partition$current where stt_rec = @stt_rec and status &lt;&gt; '0') exec FastBusiness$Voucher$AfterUpdate$PaymentRequest @@prime$partition$current, 'd41$$partition$current', @stt_rec, @@action, '57', @@userID">

  <!ENTITY PaymentRequestCheckingTitle.v "Thông tin mã khách của phiếu thu phải giống với đề nghị thu tiền.">
  <!ENTITY PaymentRequestCheckingTitle.e "Cash receipt should have same customer information as customer payment request.">
  <!ENTITY % PaymentRequest SYSTEM "..\Include\PaymentRequest.ent">
  %PaymentRequest;

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCtmMPkKg/8igaQObaaL7CtwoQEU1MZUni2tq5LhODeXd9Wkl/pNqRsXxlEl6Z7yvUUtRVhtLjyikg3d2xBxofGg==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7UaEs8H7Gb0PN++mJKIn9frwuuPad9X4jB2/rw5eYEUif1QdjVnwovpk9UQxUt4y17kC5wYNaLt47CyFi0MbsJc0hB/m4F3P8xt2Qb1yDZuRDwqwRm+SVWyAk469zpEW8MS8qawGd3ZO9PIjGqRP2v00eA7wLbBGFf67AVhc1/UFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$knoOckCk6knYGNO/UXETAzxNorSsf/WfjJv4XJH4EpyznFYx6AlmeKPz0uoyagj4+l2PD4NOluybJJi/hKXpnQKzcZWkgZWnggtQN+Wnucqq1ZFV4KtkfDyGc27/oAGGs08v+7hsAn9DbXyOH5voH3/SeWc2Z7wiq1XZiBU0vCs=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiaHofGFJpbS3YoWGP8IosdaXsHVY4LAwQvxqstZPFyVa8fOE3+ActJA30mwTa9B845dyrRversQvB7x7Fp2/IKwBCiNyQJ2rerMVheAhw7/iMhi2IJ3w1E65nOPKE0wJUvPM/GjQUMi9sEUawVkikH/FNjPxSllV7ZJ0WB6MH8fOSd6NWLVVwNI15Sy13GyFzZNMFEjb5k33KU9E4vNsbGv4s7BDx5VsiIZN4Xc4QT9sBZQYB0xpHJa0EVFV4eiTic32BioV6zScTqxg74FKTMuRHtDIrSl5H9p7RROvWjKQXeRcfrsHYV0Tvpto80gbNxTLqlRLE4KZq4ipLAPZbbDom1S0wirqWlQMjgOrzt4GtFU0MWps/XmuNKV3gdKXKiDT5bOWQ5uBjStqCQ3MkGA=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbifM/+VqapwAfKVezvG0zuLHSAKcGhKTlgDI12W+tFKfasHelOivDpsFHyDXOxyX8vfgLe1OaJ3cGkYedco1u4pVMxPg7CmmZnEsQeuwp/fsPcSMZaXj3Wy80iqOLKbhMPw/vZMdesHawQW4aGdcQhGdtcq6uxNERCAFJj9UHlzuvtXuDWDhMygyKqveqPMo9Aw==FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaVe2PDhdzCC3mxaXsooeDGm8vVjgn3mktt81CRfX0D7IozjH3D/Cl3KYCVw05tah5HsnSM0fCYzoOWB7Iiz0juUtfcpRQXAPlmXk+PTJOVH4QfOq9dQxmIWpV0noCIJ/k8=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUTWTmxkl/+1EmfZzjOc0vxY4eWMIPCuhlGBOv0fNlGxSOgw6SZ9nqmKi/+H5VpnuYA==FastBusiness.Encryption.End">

  <!ENTITY CalculateBookExchangeRate "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5teddOpp4IPAroYCkT/JKhj0QXBsyUYQ70ObM6+LeIptpVk957tE1Q0SVln1g1GVWMOAN15T8Bbgr3B880hNxyfYIqyca4BFx/WyeO2PDZCrX4XANke46dzeHuDFdNwYLxuzlQQjNZ8VwK05mBsOe5bvk8qs+bmpwTRoWTxP680hI+YihxQokuHuQtXqj1FGHXauBbuoC/bOTI6zwodRUx6lMhW/K5Yqc5V8mLUvSUD61VbBUSJHPHwJEV6FhmNX8bWx2GeqVYwxTdgND0EoWf8MwyINUs9DZ34315CBiy44vNj+iRHjqxFkEEfhUhbmz7D7GgCzxJ0LM+HJ3H3XUR743MqTM0gv0nZMhjwt9QQ2I0cIBxwfHb5LVcc7voFog4oBMjh0V21KTBS2jepZv2EznZk6J5csD/O2hnnBDqV+YwD01rupou4HLPwjp0Q6Q==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$TsvsXuBB21DvVUoCpdbLx5hjOaO4cpNFHBJ0jdvV4NN4aSP3K/+UlV+mvnzJok2gcX3Sfzw/V965ytgcZS5ZG016ouuskZ8WWitJdDIDCQt+dZG7b2fjorinvCqPpwWpOMt9dnu5QSRmiwzCQ/hl2Ly1aHJ2Lj2gLBxJY8YOC2t9WLAveZgVShoZlUkFp74HIr8Y6HqOOfwug3N/C6VmxQ==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$TsvsXuBB21DvVUoCpdbLx6l7KS3Lv+uUjjerQmolft2gyEtT07qpMTVidC/2N9fkPFeT1QEOZn4NDTM7BYdS3f4kX6k9SqfLnUBpZTC3XvrBoms/r2UO3XbgvnlmUV6J23YOfpdIy5cnSijvEAWCO4O2zgmIoMh2jnVLoU3OWr2yRGrNxWPFoAJvBABO8ipixUZj0W9UaDN+0yHfNLSTe4TNQFMiVSYTYSFmGLBe7khiAHhL4GbQmWZaUIunvngHPcMj9gP4wsMJsCP5SEJe74C+m8/EiVzupa++2oeZVUZsrXfU0Eikr65T97uwf8zulmzHEE/rSXSYzP3zRVWjzSbqVmpjmHqPUr57X1+xtkzqVmVcGobvg+ubIIwqp3lMBtoStv7XD1y42HpcYu9tp5ybUnhUzk19DWgXj0t3v+CUzM7SIpC9vOpk5DyWKb8HQryeda0SC6V4C0ZyNSIh6w==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$kEFDDs/h+4ZHLYm5skR13o4O3aQe+UWuJOzV+bTkr/MCY7rcT/Qm7hHZJOURJx46O346CkaCFj++2X6q5z3UQb+x+DvS3rqJTz6UhCYA8U7IQDeZxNM5fFCjuKXTXeRKvBQDRzVdhivCS3xB3bHjje32a8u7uv3J2ydp3ize7ezfWylafCQb3KLOe57ko5cVFN6ZqYwY2il04t6dY/vy4v+qPltVrI1QIFz3gUbbRu0UfAjLh0/LEy5ijr9HOUC6w4GLsD1tXpNAJrvY1Ukur1OcSlzulxeZIFaxLA8F1cza49nkftl5NlOiNrfx4WMUqg6kOyVNEHQ+Ka66jRNWsCu6qH2krLmyHAWFDpFAwYdBGXktRCpVLNFMaWbar2uim234WVY4wSEd8iagspsMW9U6TsaUYiwlCvNmhV+gmhTZH82VG2D4t57TERRA53EJy18z7dsEh5xtQCR2BdvpUmcZpGGDhouVN0AUZHQIIyC8Z4Iolq/hvcJPAgG/gBt3FastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.CRTran;
  %Extender.Ignore;
]>

<dir table="m41$000000" code="stt_rec" order="ngay_ct, so_ct" id="PT1" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu thu" e="Cash Receipt"></title>
  <partition table="c41$000000" prime="m41$" inquiry="i41$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <field name="dia_chi" defaultValue="''" >
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ong_ba">
      <header v="Người nộp tiền" e="Payer"></header>
    </field>
    <field name="dien_giai">
      <header v="Lý do nộp" e="Pay for"></header>
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
      <header v="Loại phiếu thu" e="Voucher Type"></header>
      <items style="AutoComplete" controller="TransactionType" reference="ten_loai_ct%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="loai_ct$dmloaict.ten_loai%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4WPBY9Z4E2DttbNSMn4AfgyYnyMgEYD7WWfqa1ULxcB4azdnVto0vLlgYjf4L7+rk=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_loai_ct%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu thu" e="Voucher Number"></header>
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

    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right" categoryIndex="3">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left"  categoryIndex="3" filterSource="Optional">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="ma_tt" categoryIndex="3" filterSource="Optional">
      <header v="Mã thanh toán" e="Payment Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="hd_yn" type="Boolean" categoryIndex="-1">
      <header v="Theo dõi thanh toán" e="Payment Control"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJYsw8MgVJF8llh8nasSg9irUUqUUJilQAvJcTSxGsqm4fEFF0rHh1sl206GVPwGozt3N+0zZfCxUh8uUGFa0nGI=</Encrypted>]]></clientScript>
    </field>
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

    <field name="d41" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="194" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="CRDetail" row="1">
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

    <field name="so_ct_goc" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="9">
      <header v="Kèm theo" e="Include"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai_ct_goc" categoryIndex="9">
      <header v="Chứng từ gốc" e="Document(s)"></header>
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
    <field name="ma_tt0" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_tt0" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="254" anchor="6" split="10">
      <item value="100, 100,9, 120, 100, 0, 0, 8, 100, 8, 58, 42, 8, 100, 0"/>
      <item value="111000000-10011: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110000000-10011: [dia_chi].Label, [dia_chi], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="11--------10011: [ong_ba].Label, [ong_ba], [ngay_ct].Label, [ngay_ct], [tk_ex]"/>

      <item value="110000000-11011: [dien_giai].Label, [dien_giai], [ty_gia].Label, [ma_nt], [ty_gia], [ten_tk_ex]"/>
      <item value="111000000-1100-: [loai_ct].Label, [loai_ct], [ten_loai_ct%l], [status].Label, [status]"/>
      <item value="111000000-0000-: [tk].Label, [tk], [ten_tk%l]"/>

      <item value="1: [d41]" />

      <item value="110111-10-1-: [hd_yn], [hd_yn].Label, [sua_tg_yn], [sua_tg_yn].Label, [t_tien].Label, [t_tien_nt], [t_tien]"/>

      <item value="11100000-------: [ma_tt].Label, [ma_tt], [ten_tt%l]"/>
      <item value="11-------------: [so_ct0].Label, [so_ct0]"/>
      <item value="11--------11111: [ngay_ct0].Label, [ngay_ct0], [ma_tt0], [ten_tt0], [cookie], [ma_dvcs], [serialize]"/>

      <item value="11: [so_ct_goc].Label, [so_ct_goc]"/>
      <item value="1100: [dien_giai_ct_goc].Label, [dien_giai_ct_goc]"/>

      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="3" columns="100, 100,9, 120, 100, 0, 0, 8, 100, 8, 58, 42, 8, 100, 0" anchor="6" split="10">
          <header v="Thanh toán" e="Payment"/>
        </category>
        <category index="9" columns="100, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="5" split="5">
          <header v="Chứng từ gốc" e="Include"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxkW8sDrYa7jtl7JPjw97A4kf4yyll/zk4Ipgz7w9PC700XJUr//DBLtLUOcj3l0w+wU/+V+ji0f1Tr6LM7m3aL5Tfam5faJYG9D9YZPvUH1npwauHXR51BhhI6tRjU5gkMlihTHO8ws08qVNU2pVB+Q==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDO08r/7SPA19v33B9k2jYu0Tv5zOfmrvxDzpqzoQZyAX/LMi+WnYZnElKAt+ZwTqXguzRuJsaV/m0lc5sNd4e0=</Encrypted>]]>
        &AfterUpdate;
        &PaymentRequestAfterVoucherUpdate;
        &CalculateBookExchangeRate;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        &ListDeclare;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX1jx08uZVuaqldj6SW7K3SJMvpN8bZpxx4uP/JV8cdiJ39FgD14A4EeBl31lSuHjmUHC705TuhjfqMyfEVJMxt5r742Kgkyy8cjbJNqC0V3A</Encrypted>]]>
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ06Ke8n4vPs/ehmIOGgPHPqcMEhqFAT/BWR9WpMhwyr1bcL/bXh09/Q891ozl5l76y4JVkKGj1yP/PqFiwA6WE83toxaxWb3kdDWY1FROLgvp8H0Nw7pV6nmqP2szLmpg1AQXRpGlhCqIpdwaeUIXSp0=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5s0y2UOo+ZT5K16pLLsdqCXtGqNx9BZEMwxMpAXEByzdjrfmy4/wdQHsNPErddYZ+oOmboeVNm2IPlr7fHAXO6Q6S5cGWkd5xlwEo3E3guyJj8TQFE2pKTsjBN3Fib8zZnsAovzwTDquVtkbV2D425lnWDb1zaf45PlSv3Oe+MrA==</Encrypted>]]>&VoucherWhenBeforeUpdateLog;&PaymentRequestBeforeVoucherUpdate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku4mrwDqghhrQ86LtDVA2yqFRmfhMtNOAUPTnqgH4BMcvfPFEn4Fin3lqnx/eAJCIpoPtgURN9fqkbu8zP6hbI5LZLxoOJ74IOsoenuH1R5Gb3oPpxhesfeTUB+72e6ngShfzXcO4DBS67slgmZAT8bzxfQncHlROoatu/knV4H8rEtN9xjwWv+cUSUBaDShD3PplGW4s7Fa2NAZF3Uy+x6I=</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22cMg2oMMD81lfPjXUoxSXjGNgpeyzaX9KIMNKrHGl6DPGjnUjr2ScnfLyFxuFte4xZVXEAYJs13KbloGNSTl660PSLyBLRtiyNtN38Qqb+CPvouA9pMZhgoDkrmEc5ryVsqZ6/RGutbIALdNUZ4mUh1VNLj3NYe/wlDfg8dt5cYD0gV3oa+7+sVP07bTROYaXUv70QPH4NZHNjrssJ3OpdlabDbPgi7+85sek+taRsJP</Encrypted>]]>
        &AfterUpdate;
        &PaymentRequestAfterVoucherUpdate;
        &CalculateBookExchangeRate;
        &Delete;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        &EndUpdatedVoucherNumber;
        &ListDeclare;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCEI6oJLQbWkY2jR385jsDpandBkYA8tYO4Ie6g6xWb7GldVzu/YXVMnI7NmpJ7G8vbyFyYNRKU/iAa+g4xWbW8=</Encrypted>]]>
        &ListWarning;
        &ListCommand;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ01+OSZdDG39YiPtd29YZ6nuj+6nzgq7KWj2ItOQkHDzRuYTocudsz7bXwRdqXKUheExD8M6Ne1zch7RObR30ZX9g1bXcv4ymmd+6BEX74EEM</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5s0y2UOo+ZT5K16pLLsdqCXtGqNx9BZEMwxMpAXEByzdjrfmy4/wdQHsNPErddYZ+oOmboeVNm2IPlr7fHAXO6B4VBHFvXqJoO3PgiEkfvZUvGf57SzwPHeo2mCCedM8FRktkYCbGa+cmh9SOkeNdnHiy+C4uWRo+h6oenK5Th8Q==</Encrypted>]]>&PaymentRequestBeforeVoucherUpdate;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu14PKj4kTZpEXrfCacqnL7PWx6QYl9vfPUnFTlINWVQLOwnhINpfvGkcvmE1FEvm30a/h686COTHbFxVvp/QeWpYf51ov8yAOG94IFgV+d9q8L2hbhOUcsKXcybhaUHCNg==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxd+PwPEMLTFPZdl83HMnkd6NcKBaO8gNiSXq+sCVL9OmkqLWiYjbr0NrFBzFo5I3TUuwk6CU8D7PHUTuj+xMGo=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxcL2ICQ5VtmpNrpmyf+nmJlBTRnmQFY4b8L4tcuw/pxnGPLA0m/n5eBKJx6Bmhg/w==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkBkZv2qS7WZBwiH4dA06w2yxulKCQ0FC+Q0jtyxgx8sDn3i3Jzlwqda6NyygldSSkvMDtSPhlhAvkJ7C7SUt2I9dT04qWo2QmpT+ONYSBAvEO7zqcZZDq237jdLtQFbWregnRBXkARUnoWwDW3grUfNzxRXY/q82rjjHtCD4rEDn6lcnHqE3PF0JmonY+ahD1OQQNsuelFrHWce5axr3If2a31TsFUVoxjvwHlG7exyE+oebFkdyj5AHZBr6b2mOfsGB9fSMttC4aN6d9GNKJAdP6yNxJDwOMyzX5xbV52pP00Q6ZRhAKdeXO6EnigzbzgPyrDUZX2oyyyX+zzNMsVcn22LTVH9K7/z2QrXIPgFm81XiCXFDWgrimTcMhguuCDE1nWULWMTrUdFXufwiwUHy1yQWYZuFbH0gPKzebxWi5d+9o1NsnYc0A8nJeXA4Y50akUjoGB3yS3pMZ9Nq5tEkc564to9nFZ9ZHN8l7+WDltHLy+HqLLxJdfH+qEb8OyEkuJmfazFgpwU4v1XxOTpd593K0YRz/hV2uyLM3TzQzfeIM9rYgAAe69VJCd6fJbFopETkDnFJ0451jx2mDPP+jkllXmjLfrqlyxfQ/WHYzzNkuopzMJbiz10Wx3YgxQ=</Encrypted>]]>
        &PaymentRequestChecking;
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpkYx3sBKeFvn5xF7ZfQgDKIcLM2heSpZT/z4Yu3FikqpiwV/kVvGT8jNidhhdtcwNnSPIfpTzAio0/RN9m47VxQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyAGHyJs30OpqxSjsgPYKxO9nqlZVlgSrvuNp9hXUiXJuulwEqeBffjJW9L5srzxL4gX8jCh6/2MUuZX7dsmG56fr6wYUV1dplOL7lfXqFZ2cSKuk7UA8CC88eQjDdH9M8SylJCZY4iFlN12r/ptFBGB9ouT+t2jQqiodrqTs/c</Encrypted>]]>
      &PaymentRequestCustomerIdentity;
      &VoucherLogHandleStatus;
      &ListCreate;
      &PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&PaymentRequestCustomerIdentity;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWym9wbgs85nvalQ9Nb4tkNBULONFJ+rXydvRx3Exz9pxEjcZSjdGAoz8aB/KQo18IsA==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTt192kDsk/2KYntDN4a765zb7vFmDe8KGcwPzSS7fXOivLTZ+htxQD2Q7WUyaaSGH5/0HLJliHRUOc4hKh0ZHMrg==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacez/CWxFBAgppJJoMCimB5rzKdd0qtfiyn8QU3XU/mp6O7eCJ8oJ29jWH2vBmC4PleoOawZZ47Sv3HMRJ55vXqcXc02F/6WBIvHPoilDpzkq1s=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwCxcYd2J0gZdsN1luN6RXiMwfzBe5KdsEX3N8ILCJPOTZZktorxqif7gv5nD/tr0+egoTyarxLa6qElRGJ1QO6WT/68IDfIEnERJzhkxqriCWiBp2eEulVuYZC7kyEkOwNCdVQaNG0veTQQZVyHWsjHakSLFchS7PU6WNFqcN1x6njXVovayaU5pq65QHqKSXjsBXqB4FEIiljDwqgfUQ=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KApgGJvPb1DW+53xCFh87q4Cts1wNIpklhNvYvCE8W6oN+MfPqjdHIErI3jRIkO06ywAi1SCQeGTnocLNxcD+0A==</Encrypted>]]>
      &ScriptVoucherNumber;
      &ScriptExchangeRate;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7DpZ08qIx6gjDSaWiHtki5lSxJ92Fjtvew0/2YDFQRXVqfdkRrFebzCK0T3hzp3HBEktlJF5v/C/EX9XBWAj5K944Ufgcghpg1GcJMXXOLyxEKWvDNIySP2fuXUdN3k2NnVeLsQZq6SafUceiwVP8LzeM7ak6SyjqTM13vqvUu1CMv/MocjyoYiPS8CO9dQvGL4Qd7HTc48cPaqtWKUa89SyAPeuKUI3Xa0hVLcqlOPeY5ZYBh6GW1vYNyTs74omvdK3FQzX3tUJOMt5dZTHpCEGV1p6zKTOZEwrQr0rVSv5hIoZwjIcQM7f3TQsDe21V7he06GO5bndtEcrCC0hTHQeYC/6lzFsAjJZPKur+rrS50NxhDkkSW2XqkI6XcYfHBzDHt7GvErnBichT6c2fhgrvaMWq7M7Az8dVjupezyihn1/vbJZfU1Q8ibJlO2z9u/rYYVrceLnsma5d3zIsQo//jKQhUWXgPcSk7M7ZTx7CaXVcFKRDH/hp/yhh5cxF8vW3IepmXmZkH2O1TnVT/IZf9L2W4RUJ+n+572PrxqXaGpeB+oYKZFvBrKw3RsREiZHGc0GBAkrpyrDPH6c9njVRcDwPKd/xEOamRleSoacj98IoG6EWrk4eZNeDNegPLNjXRv/dV5lGHJZ9vkOXFtEiVZdiZpxjdife0ICcepldvJdobfcmtUWDWj0sWgjM7HILeVEXthhbCvsBPwDXrn9mm0cvNmw4UFGo8KHYCD8w==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKHn7ejFHVHl0iMhCxn6HNs210VdZuXIH5LNPNQ07xmEZm0W4CWyZ1bjZjyu25vLkTM=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6EHefn2QMKuKKJPQcG/URqpyFqpeqboTmw5axERgN3+fhxIanO/AAGIgj9iO0gbekUIC4TtiKB6UdCP+zXmU6lG7gvzf2fSoOwNDy3edQ6Ljo0BPB5C6uK7ucmnLOcHoIF4Q9NYmv5MRsyC++BsORRAC2h3JaLMyJM2cDosgpLIGNzSNmFTnQXW/Dz1AiPNMqKDJSjsHuQ3LW2lSpJhv3382tIW7D9YaixKdp6p1U6y5xmVUVfPAMe5RBZUyaxA7eagptubukw9Jj4lFtUygBWuZd7DrRM6f1gDzFMpJ/hrN01lLNDwyqKJibLgOoIusKjzHMunl6G/ZUhW6dSvgjxzTv47h+rRXsSEWGHfU2ZbLABlZsPwZoamLng/G9C38o8U2W7ar2FQx70YNhNfgxdAmxf7rBgM9Yv+WOt17fSlqXzPf9xxta8r/Xxk+f19lPQTZ9hNeqabbzwtNQ6cfRj4Hs8ggUQ4Xe+MyJ9UIpqGud5SFUPo4yabIAWKPRxaI4HGlH/GaCVmpKfB1gI4H1SQskC5u3msQnbL2bu4qD5+Z0433/WVDsJ7CGjJ9tENxN8aMuXO1kD5sbvSfoDY+6l62hJBvQ8QUMiRYehOGygO5JhyFfYNHaN1I3dGzef7TtbZbmvA87dIEN+TXK5OAmLAJfg/N2xndxkRUa/Q1nkk5daiEQqgHXh9Q0utaxkwZPnRaCdRFvbnUPwbT9KwfmQQ==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UdLEWneIMq+BbTz7tb9bjI+l2vImLMAch5p7c8GE+7RsUfIwzxQu1SfM6s/Al0fK0/ZOsnUT7QCbJphR6q/Yr6G7fLDJIknjtc9djQDyszFU4ORZfU5CjCJj0B4Z2F2/Q==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bAU1aExzCN185HTaWw87fsCGsTPotp54IlOBT++EeD6VXPVss+sQy5WGBAP7r4ZHtidZBpQOE3poonFxbUN/7PJ70K3FuSysSN5iO05HtZUci+cbvnwXDpF2D15Zk+A3g==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &ListResponseTicket;
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfU4rrZ6Op0KZZwytwN0yydGZcG+AQof6f/r17dYWhIiewPsAnXNJx3ALsEnqHlBTF6ji0JTQVS6Zsc3thIWbxREozeVnBFHh7kPmDJNpJoAjUl6Th4Lgno39+nvy/edZXQJzPaq3FTAxhrrS2ZRnDbXhXDOO8Qg09PXAQBx7jsG8mzKisChPSbLETfR6oMDYIC1bbpG5JrnVn9h3QZTaG1O+4pZ1bz806ZunQLH/EI+QtgN4ZZk9AgdlaOjrC3xBC5</Encrypted>]]>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD7xjdHAMO8z5fAHbFZSmhAYkxBF1gzSLhpw4yyUaJ6hIlRu8HLiFnpcQBDeqGqYW43I0m1V50Cv3kL0JUVztcH7QSkEvUR46+N+oW623IqX+LfvWkLC0EUxM2H+FpMjojbYcyWP4ek1ObdmGLtytwIs28Hjgx9K+F79Q9IqqrMyFZ34oeQvu/jDkmsAaHdKatfoeqyaDnztxTlp4sRcNWR5+ZLtoqeUZjAmeDmJ8Uz7gGzIILdTwd8yZ7semVEgTnM+RtcBMGWp+Xvz6dKkxSYEt+F1D8b7yX01C9VuNlDSvz/Sdarr7palicYqhz5mDB0GRC/KaaJUDiYMBSdo3Gt3z1rFqkvUOrSiQ1sj6NMnoKEU8GMYk0b1PkoRdgRSh39UoyDimTDAFjH4QnUkxDPtikGcI2tBy/u0+2qsMOx9SQv02j+KbwscpDkhEQFeOnbqtjpVzP/QABdkmffY/A6vwt6rHP9zD7UkToJj01xYY2SWH4W2dyseIIh5woHl8uGg+EZT9zGlnsEi0tsN6I/McpKUxkh5VQXYa7iyMxNxDvirtEeZkoZnhB7tpFq/Zqf8GvZ8OEpucqNfuDhiLD0IOks/5rKvW16FDKTLS6tSdIn1pdNhmMYD1cHxm+fbJze3trJSGELdSxgaI0N8OvQaCVNc3gTiwe61vDZPn6ggf+uI+QQ/l8YMQB5u7LE+67gWH36qBYJgEa7PudkIl3pF5jELVPHvDboubQLzfRAZJ70SgBwzQ4r+/UZydepjMtqrzaeXe/tgdz0Y5zwOnRi04APr31YzHZ+rnDZYd/xLQPophkSPsoN6uD51sSn7rJxVfPt1jkOuLYeNnTnfK0UkZPSukFK81043H1q/pmUACQ==</Encrypted>]]>&PaymentRequestHidden;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V4JMgLxmlt9dSbVFsjGp/bOPe1Iuj/2cJCrEplWzYi3haj2qEAPSouDLWALygI7fhmRcKan3KUCjal5PqD7GaGZPjZ0cb36OEwnb6YmTNQD7IK9Avra4zEqPFTCK7eRWTpCZDnsjYBhpzX6IzFnGMhzl25yGcZeBuO6EpAtUrbklqdK0lt8qIidM07EpLlf1smIIu4tRItlstpUZ0gBWgGuyLUqvapkWDCTMi9umjlkrBrjPSyyeegBhJGoa+GChfpV8PttOMM3P/VMtaoOR6GNqBqGzZF1gzw3bVhOpkB5ZIQk1YUrwgeAWzgqZvhWf5YNXGX8OviDCCleM7ozfA/ytDQl/9MbDON1ADiJZuB8DhPngwZ22emMg50Pu7xwyRtMqnGi69l4mNUO93jfiIaQ4+OlftlpOMZZwLliUJuzK1jgvQiajkQ/5fhmsPLAAgcMLdGMaM2GPPcxK+eA/R085UJkaUtsEd+jBjlM4gsfl0f3mR0tpAb84nqgNb/hFuvjVjaVgCVnQfDKdRZc4kts49VbkKiJmVY2o13n+XuVp/cEejLAM7olCGw9D6urVJTngJvdF4d2c/hJg2PHJubHPQwJsR9VpINf8BSZPhW6SI5rqSNYdfZNihPH756v+Ox2bnnU/ruMd3kRxtofCL8mItbF18z2+PigM5F0aom7fg17r+NADdHu6t7AKuItCw==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqapXv2dF/zPQRP5o3OalCwddkebjQuEWIiRC7gMr70mJ+ZhhiIh/S2km6rEYl1T+hoEaqPYobin9vVBX/J7Fy1L4tTVsJ578yH82kX8cYBNEa5/mGYzcdUGyrl0spu/ZPVczgHHgkzux2MCalP4XC5hY5A281uxuii5rocJmhpNmxdIa9zyVRWd3g88mFljurqanQLMpJm/HhPsP2xiiCIo6c/CSUCzqJB/n37lTs/ZMM=</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>