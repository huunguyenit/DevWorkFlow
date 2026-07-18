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

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpC8SFyIdt4Yu2cx08WE24Q7CugFUw6lXLTIG7rroKb5PdTZSahMZlYh+4fajKR5X8DILLAmxbVtY5dN+efvgr9L0EhmkyX87gc412JT1nFEkXI+bH1zQVI1FmjV2lE321JApYscncZSt+pmCZUqZcxkQ==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG0zXlmT/X5o5sHm3fx0wwsjNfmt4fDaLNEjyFUIXEPNQceZl51EUAHanM0qDvOa2Jdfi8wz4YCxErwCN7gkuoyToBdlEJTtvfAzBbP8jRJ2IAoAQ3Fm7xEwdJ7OTAkTDypm3ri3EdOH7yhjdwzLWe0bFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$knoOckCk6knYGNO/UXETAzxNorSsf/WfjJv4XJH4Epz/ykDctyf3i8yl/NRMzlA/yKnT4lVusEd+i2UB0QX/0rc5zj7TSpOPkDyAlgaanx43n6eaOvthLsL31y9onUf+9WhJ4HBwcEOI0Fu1xBSSg4jrmytJ48FEvIax2+Yn1+Y=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiaHofGFJpbS3YoWGP8IosdaXsHVY4LAwQvxqstZPFyVa8fOE3+ActJA30mwTa9B845dyrRversQvB7x7Fp2/IKwBCiNyQJ2rerMVheAhw7/iMhi2IJ3w1E65nOPKE0wJUvPM/GjQUMi9sEUawVkikH/FNjPxSllV7ZJ0WB6MH8fOSd6NWLVVwNI15Sy13GyFzZNMFEjb5k33KU9E4vNsbGs9rtQdrI/c+82xVnred8xFxhY9pMljq6UNF4CeHyfLNHN0jfN3qKcy/mACK2fs90wf6h07H3mMsJTAd0Kddezott9QsP43KuTlH91TwbBsHocjvY85yH38xGolRuJv364BCkHplbk07GIFJ3ah4D9IA1/sK/Rz45K4q9XLp0ocHtidbwqObabLhZhkm2EdbZ4=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbifM/+VqapwAfKVezvG0zuLHSAKcGhKTlgDI12W+tFKfasHelOivDpsFHyDXOxyX8vfBmDEvs78vj+vbhRXil/2vefGlr0XPJqewN+4cUY5LG6XU8kFslDOYuOil5opxnLRnsyzhLbj4JvCbSCccSk53S2cM88kUVP+6nKUd/wSqOYfiEMDrSojOjh6Ii63L+XQ==FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaWQtC0vfSI1Nzknh968bmTipvbXUSQfqzXJJBGabUuGO4V4b5/3i6wNM1Lcc0eIEI8l8Q9sCBHnwC+uBY65g7qzA83TC5j0caaSaNTYwZDm3ZbroFNJAcINV6/BIu3krvM=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUTWTmxkl/+1EmfZzjOc0vxY4eWMIPCuhlGBOv0fNlGxSOgw6SZ9nqmKi/+H5VpnuYA==FastBusiness.Encryption.End">

  <!ENTITY CalculateBookExchangeRate "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5teddOpp4IPAroYCkT/JKhj0QXBsyUYQ70ObM6+LeIptpVk957tE1Q0SVln1g1GVWMOAN15T8Bbgr3B880hNxyfYIqyca4BFx/WyeO2PDZCrX4XANke46dzeHuDFdNwYLxuzlQQjNZ8VwK05mBsOe5bvk8qs+bmpwTRoWTxP680hI+YihxQokuHuQtXqj1FGHXauBbuoC/bOTI6zwodRUx6lMhW/K5Yqc5V8mLUvSUD61VbBUSJHPHwJEV6FhmNX8bWx2GeqVYwxTdgND0EoWf8MwyINUs9DZ34315CBiy44vNj+iRHjqxFkEEfhUhbmz7D7GgCzxJ0LM+HJ3H3XURRJdHftpmOea9AqmBa8zLrZauzyPNkKVryONZ5Yvj6QKiDdVuoL0rzOHl+SuZhqiSEXoOS/fnCX+D1wvjRWOAImPstm9R5CGWjJyCcX8sF+5UuFUWuGAmW9gkj88dSVCI=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$TsvsXuBB21DvVUoCpdbLx5hjOaO4cpNFHBJ0jdvV4NN4aSP3K/+UlV+mvnzJok2gcX3Sfzw/V965ytgcZS5ZGxbCBST9Y80Gxg5xzrQ7h6L+d+J3Yr6RllXEXCyfjg9AYh2n61vVpYyf7LwhUhfxv5MmwyikrCc8Mb57CStLp75ckSdYOQVXlrsD1P81QGBdSzNDpWpBfutK9ODNANCmbQ==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$TsvsXuBB21DvVUoCpdbLx6l7KS3Lv+uUjjerQmolft2gyEtT07qpMTVidC/2N9fkPFeT1QEOZn4NDTM7BYdS3f4kX6k9SqfLnUBpZTC3XvrBoms/r2UO3XbgvnlmUV6J23YOfpdIy5cnSijvEAWCO4O2zgmIoMh2jnVLoU3OWr2yRGrNxWPFoAJvBABO8ipixUZj0W9UaDN+0yHfNLSTe4TNQFMiVSYTYSFmGLBe7kghpeGRbUoIo3nVbYdadwc6sEeK9HunSroAex13Q4uUmboO99HXVX48OJpTI/Vu0xScJuvOryf8bbMgpPdlki7m4JeXbq+3eGfZQgqJRa5jWTFerGlLL0STHSJa4T41P71rQXNEb3I9yAcH9mbeNPuht68glQARVOfogHACbkFa93ZIx3f2l1dB9bjpM7PuPFrzYRBZyI9w1kGBZks9RrEIa33sn2elTnVkOY2UqiroHg==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$kEFDDs/h+4ZHLYm5skR13o4O3aQe+UWuJOzV+bTkr/O8IwpYSJOy2C8PRzLDJ22GsXhAnl3OOMsgMNax4lfIyGU9rXSa69+xkh+9Tp8PNMpEdKgNm5h+LFatx8NZCTT6Vvew6RdS+f/cU77llDQCEr30UCDJvQe02HcuIpDmZ6jL+b6tfiqDB43x4wscv2kwbhMiVrOoeC+1TB4jIaNWxp3bY4rATE3WVM9aIVJ/le2Rbpk4C9LlbGM8ptHWNL3WvktWeMX6UbqS8RXUZcMk5NT29RMLffnDhMP7j4swqj91lYfjVJZVSwYZjeXAl2dNBi5H7LHqwV+jBPQSTRq3ANA8oCPPvgr1gnHcfYEVNGb6Qe1YMhfJPZi3QGUtqrOyKwS8tU4+e64srnxXJxpACc0N2By9veN5mIRX1UfxhOjarKAbbGx4vnZySBxkfqR2NOkjVajn+pyZ7KQlBU54lwrd27i0Z9rbV6YAhrxk4zJb7I1PFdy9DBX/SviVA0uZFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$XpMwRlifXC+7LVgM1zIOlZS1irsZ35Xvanwm8uWCOHkg3wUJmyvhPORbV1aVcuPqFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$kEFDDs/h+4ZHLYm5skR13mT7HE0VslOmcESTENtrMA2zaLRPcj53Oc0EypzdRSNgbnTsUE1EifgZqep7ILQSj/5nneWMzSPlZ/MReszxTKe9hiXW1szK31KMXBuHE/AhWuWRuGpw4wrFD5Awu3n6SyiJPKGIbVMk8KhuRMyUnJtR2ir+mxlF8Bx02SzR2gYJt5x3TLw9BLpsvgAloTRtKS+s1UrfpYuqmp4R3N5QJVS81c3W+M3RoQD91UqCzmgNfFiv5dNlzE6p5tFR1Po/HE3yoHOnrKPDVuwvt8xfNNvPcbtV49jKQGfgNuizFDhvFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$ftRT+zHulynPZ1EjbodAkCtViXRgslKNyPk8l167u1Ld2i4Fm1Ppv3v6tikUxazBZKxqlhP62xoMZV+2ezGfQDFh3bJt/ZTwEtdCX5C4KXUPK/KzdTJD8sPB9ZHSawcq355ZMyDJYZf9Df85NjKhlC4NqROtf2V0Dpfg3AujHFneiJNh9FTZkbke/x5eXv2b/C6SeR3aqVeWYsMbYFSbMg4rHWWwJIJTW91KVineahlfvaUbN+vHNqoicoTxppxOHRSZgdpYF0pxvPJVYUna4I4LwD7xRUVW9bTMu2ML7NA6Cmx2wxcJUXWSE95Whj9CFastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.CKTran;
  %Extender.Ignore;
]>

<dir table="m58$000000" code="stt_rec" order="ngay_ct, so_ct" id="PC2" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="bút toán điều chỉnh giảm công nợ" e="Credit/Debit Memo"></title>
  <partition table="c58$000000" prime="m58$" inquiry="i58$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_co%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_co%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Loại chứng từ" e="Voucher Type"></header>
      <items style="AutoComplete" controller="TransactionType" reference="ten_loai_ct%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="loai_ct$dmloaict.ten_loai%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4WPBY9Z4E2DttbNSMn4AfgyYnyMgEYD7WWfqa1ULxcB4azdnVto0vLlgYjf4L7+rk=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_loai_ct%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    &XMLVoucherBookAndNumberFields;

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
    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <label v="TGGD" e="Ex. Rate"></label>
      <footer v="&lt;span id='idf_ty_gia'>Tỷ giá&lt;/span>" e="&lt;span id='idf_ty_gia'>Ex. Rate&lt;/span>"></footer>
      <items style="Numeric"/>
    </field>
    <field name="ty_gia_ht" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá gs" e="Book Rate"></header>
      <footer v="&lt;span id='idf_ty_gia_ht'>Tỷ giá gs&lt;/span>" e="&lt;span id='idf_ty_gia_ht'>Book Rate&lt;/span>"></footer>
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

    <field name="d58" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="192" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="CKDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="sua_tg_yn" type="Boolean" categoryIndex="-1">
      <header v="Sửa tỷ giá ghi sổ" e="Edit Book Exchange Rate"></header>
    </field>

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    &ListField;
    &PostField;

    <field name="ma_dvcs" hidden="true" allowContain="true">
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
    <view id="Dir" height="252" anchor="5" split="5">
      <item value="25, 75, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0"/>
      <item value="10110-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk], [tk_ex]"/>
      <item value="10110-10011: [loai_ct].Label, [loai_ct], [ten_loai_ct%l], [ngay_lct].Label, [ngay_lct], [ten_tk_ex]"/>
      <item value="10110-10011-: [tk].Label, [tk], [ten_tk_co%l], [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
      <item value="101---11010-: [so_ct_goc].Label, [so_ct_goc], [ty_gia].Description, [ma_nt], [ty_gia]"/>
      <item value="10100-1001--: [dien_giai_ct_goc].Label, [dien_giai_ct_goc], [ty_gia_ht].Description, [ty_gia_ht]"/>
      <item value="10100-11001-: [dien_giai].Label, [dien_giai], [status].Label, [status], [serialize]"/>

      <item value="1: [d58]" />

      &ListView;
      &PostView;

      <item value="110--1-10-111: [sua_tg_yn], [sua_tg_yn].Label, [t_tien].Label, [t_tien_nt], [t_tien], [cookie], [ma_dvcs]"/>

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
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IJ+zPBW2k+1o75apxCZqtKhplfE95GYnR72LWQuAaf0WScsbEbOocWKSomesoXWdyVhcbEWPKMRKTJ7qKefNslS</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWd6HaL1OGauusRtQb6bqs07xG6Qjwkz8N1z0TqPoMU5IOoFDY3nwNKOqVHA66gwNgi+ov6YV6nwDT9MIu2eLGlVMoZdpHU1/ClFeUiYsbBmQ/W2xAgx3X/VpT2fXOoMRH7EHj+9Ql8Caa/AkKSEaYh/KKgElKRfej1EbUizdZd93QjGV/dmuMaw8G6GYpl3/J4odIbm9UU09wmEX5D3NCJk</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxkW8sDrYa7jtl7JPjw97A4kf4yyll/zk4Ipgz7w9PC700XJUr//DBLtLUOcj3l0w+tE3iZf7XtePJDB68wZ4Aj28O2d1ZZDm6oXBvrC4WYYtpnIkH/6MZXd3PcYn+HM0lmJaxppuc1EHYrKUnANnEZw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOsj/pZh7tu774dQ5izIzuN0zhVBN6W8PDBnq+HuHUqwMtGJqkkSvi0ryPQOR7eqgubOGAvNWL1A6LUE+xDSho8=</Encrypted>]]>
        &AfterUpdate;
        &CalculateBookExchangeRate;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        &ListDeclare;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX1jx08uZVuaqldj6SW7K3SJMvpN8bZpxx4uP/JV8cdiJ39FgD14A4EeBl31lSuHjmUHC705TuhjfqMyfEVJMxt5r742Kgkyy8cjbJNqC0V3A</Encrypted>]]>
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ06Ke8n4vPs/ehmIOGgPHPqcMEhqFAT/BWR9WpMhwyr1bcL/bXh09/Q891ozl5l76y4JVkKGj1yP/PqFiwA6WE80nKG0SnTKQWmC9u3ExHAzWWnTGr5FZX4ubIEYj61aay3dfz5pdJ5n3MLskDFVJ2QU=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5rTN1z2TAvRcHxKacuqFDum6oeRWvW/KZ/B4m76lkFxzatd8LehhuRyj5a5+zQtLbGb7DH5NlEN9HLnkSVTW/Ub+KBSSE0yn4x+nnXvQmTUAkC3PF8422wmrZFYEujuDQqNaEXCzi4wwQvm6bZuHLDMkO+iVmgLjFOGFSrLGbdOw==</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8ekuyg+4ThfqUJqBkV8qgvXbVr2RlnJUJ0RWjf2Xm5cqtKNGEk3dG2esRwaFIGYo4WqPaxqrF8LZJrRDO9354nTv7Nug2yv9qR8wVzTZ5K4qwAMFOV4XEcLIQhJS57oBtcYlsiaJJkUzeWNgEqZOXFrXVhjlLvBLdeZAaingEEvskeHp3yopn2U2PmlLXo5OE+9zVmNoOixIOSmskGTzg5Msk4=</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ST0+qh01vjTUQQ4bDb3gxKzinJ1Le4rOkexc5ubty8IE7zwzIzNeEcSp1EdV61UTXIxCn8WUO4IHZtRl70NfMGZouF8VBGZBuA/CwL1REjR3L7QgSuWVGK0Z4AXqOvDdpO7oHqkljwHzR1MrNlk8ZCCxTHjJaaTkd+AEdI5jCSEHCI8apmGt6r2gvmhQjq252CeIH7tvpXIZCJ1JCbLNqTradvcxgG71tMQ18Gb9LUl</Encrypted>]]>
        &AfterUpdate;
        &CalculateBookExchangeRate;
        &Delete;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        &EndUpdatedVoucherNumber;
        &ListDeclare;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCEI6oJLQbWkY2jR385jsDpandBkYA8tYO4Ie6g6xWb7GldVzu/YXVMnI7NmpJ7G8vbyFyYNRKU/iAa+g4xWbW8=</Encrypted>]]>
        &ListWarning;
        &ListCommand;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ01+OSZdDG39YiPtd29YZ6nuj+6nzgq7KWj2ItOQkHDzRuYTocudsz7bXwRdqXKUhePOKuy/xIUk9ErPiGjlmFykJib4sjKr7IeolV+HBP4D+</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5rTN1z2TAvRcHxKacuqFDum6oeRWvW/KZ/B4m76lkFxzatd8LehhuRyj5a5+zQtLbGb7DH5NlEN9HLnkSVTW/UqWlb/SospHgKoAChhGZuwi0qAGnOqnTMo3WtPN96aysoQfjnjOw8eGA/5+v2kn5DfeyHgrpTSwf4QQdr+twbdzzb4NzoMAA/YVMCwJFgJZWnAO9NMvOSZGEcdwdnvbY8Zkx4dxKVvtoYsUfu/u4aDVNyke5WvgijSKtk0BbhyPg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3NglTKahN6Eao+phJglmJBQFiiERF8CdWPHcMPopbEkGsxW+m85qXNGKf1dTCUr3QaIRfAAKH6hsMXwJxD2yiY=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EcC2Reti8lbzdZKpOM2XcPtyqfedDAKFTy0VepLk2E63hZJoAwpIY+oLxHyD+eZnlZd7YGi30zZ+yeXlDj6+kRPipJ9dqJs2JvHbZ5bXKM12JHPEbOzY3yA14c4t1oJE96u0WLSodj2GcLgAPayvWHlEcopCcQJ+P50Gt/fEm7A4FZ5Q7nMw988z8zXPfR/V8hJ+k6obD058CA5dk7GgkH+lISWWDFdBE0cf2v+toUGwO6XaEwAst5pGv7h9nV4rnF6CogRusBhRisS/UAicyzCsaxLr+FuPufpPcp+9o8D6+VWndyyK2g3wV3Yq1KPFB1pfZz8GuFGFvAkVt7mp+PKezJfuCUda2cVKtoxlhbZLPqVBgJgxN6LVTtYQhaYFwyGQSV2urs04NVtt8ERv3uXLadIbTG/pjgjeguo83VbU0SwpJ2kFl5B8P+zNeqN4XEamvt6ExS8f27lwi0wmxI6FLN5gX6cMKuYOQotNZskbr+q60us1RaaxYdIwEpvDSmTjDLcLS1euN4+HkQ9oA70+VWLQWb0idhyD2cHbTiNJL8TdvLAcKZoLqTTmPobvMcUjOLSXubj9o/QGD5tzaVhYG79L34p0RFHx2PssqQvrI3l1JevmP2IvuolcveignA==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5Lpya5pYlEWWAacedGhSUOcnBVTepPq/RK0ZHcGx3vzmWllaktrR3ayTGRTqYfyAsr3y6NUQ/SSM6kMR3XW4HBooYbVAdvctE+8GLSKkiSttRbQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Y76jon4LcrkaI9TjnEc8MSGCGO9BHnJDqZjIkoi4usi1EYOQ0fZO1aQ1cz4RSTiJMUG8JRnXeJ2kgLCnVHKPHR47jwsQS1qihUTBmCjzXr15usTcV1e4uRSgejxYJ+/WP5K/RDKwydf4ymxGyFHcZlM3v4wdcpZnWyHeivcerDX</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWym9wbgs85nvalQ9Nb4tkNBULONFJ+rXydvRx3Exz9pxEjcZSjdGAoz8aB/KQo18IsA==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtkMsL8hH1+9Y5UMatbZRp5y45ZSxftS7A48XSJ4U5SGN6rHAvDxbrAEO9/DFeMjAoxzRE3YCA5y92LH5yFIJ//A==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezjBnxwLKwoi2qJ8NL4s61M6DXkeSAxJAXmb0AIPNRNfoSBliu5LrBY7rtcfkU0FdGwBJwCMSCxEnvIyJwl1jh/+/vQyXzsi+W/sR3AqKOZX8=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwCxcYd2J0gZdsN1luN6RXiMwfzBe5KdsEX3N8ILCJPOTZZktorxqif7gv5nD/tr0+egoTyarxLa6qElRGJ1QO6WT/68IDfIEnERJzhkxqriCWiBp2eEulVuYZC7kyEkOwNCdVQaNG0veTQQZVyHWsjHakSLFchS7PU6WNFqcN1x6njXVovayaU5pq65QHqKSXjsBXqB4FEIiljDwqgfUQ=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KApgGJvPb1DW+53xCFh87q4Cts1wNIpklhNvYvCE8W6oN+MfPqjdHIErI3jRIkO06ywAi1SCQeGTnocLNxcD+0A==</Encrypted>]]>
      &ScriptVoucherNumber;
      &ScriptExchangeRate;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7BvHCz6LZw5zw3oF/HOmTHAXtNTiX3vEvJW1pBYQhO0TZbOzmCHPk04hBopfUq22OIEv44RPRpj3R2ckhhoDM+FMG3bEp8ITZM7rCYok9BkTzEEF5frodsEWKNJK7Eid8SQRkQ79ranT5n9igYCrIz+vBefit+EbMMt9IQTqqF3cCIGXesdH4DBN/RLUYIf6HTpWl1an9TZT5+SUJhGYi6XuW9wXZ5xf4TYKLKutsLJOYA1i7+ndU6pNcBYTzc4lS+mM5VCgDYKtHn7kQu2xDfKGoH6bjTce6x3nEpjWojcoW3sJ7qDaUYtXJLfLDlmrpOXMnO9ZiFXvBhjEu2LNWjG8JxsbUt6/HmYGk4kvLJbOBmhcWf9BbTHkLT6+R10yqmfuYguvyU9ksmI7xJEr9cvcP4TJLYAqfpHUICrhJfMDgrnJRG07XHm8E/1t9nMS9916wu6ihaDOnz/ZNN82X4Ws3mO9g+2ROS/qMclmgOWy9j4CjBBYdlRHVYRjlFVOdmGFpxwrqkR0NGKc+VB6y45s8Q905SCiTeXEB4wQRu0p6xj7fuElk7BrdXolkGd4ttxJT0JTBIGTtiOjXuo76nEaAekhSh8swFjV8zDEy9wBeLibM+rgyA0eZeeNXitdZGLxPK/srp95UfZX3mIE0rNAaenhbhSjQDwpYRHhQd5Rr+blepei1k9wa3JbGXJlvy2HYJ+1ZmnTtVE0kuyNeIVtL4bML0cKMMiG4ze1sajJg==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKEzyMX6iT4l/Rb+xkzJnAZKKAwrc0uD/9iSey8yYfNVxNv2zEgkjCJqQetXGCug80g=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6EHefn2QMKuKKJPQcG/URqpyFqpeqboTmw5axERgN3+fhxIanO/AAGIgj9iO0gbekUIC4TtiKB6UdCP+zXmU6lG7gvzf2fSoOwNDy3edQ6Ljo0BPB5C6uK7ucmnLOcHoIF4Q9NYmv5MRsyC++BsORRP357Ig8LvtqhzIJ5450SXeAVnURQNH5mrXKF5C70w0tpuuExtdHArRcwnlJigptfztMFiVPGXhSz90+E9ZFnAb5B9UV76cDN4+EAZSHJYH3wX4u1jWCXQiWEmtBbi2NUlDk0IRAPbW3ZqT6jx/+tuS8BN1zBhlobfjCWC4tpKSM6jGNFYtmg7Zehb/O9ILjIX3kzXWp9Pa3cg2sOyGB5SGDMAUv4uApxNYBb7Jv9louSKOOnI5JeAh3fC90TAHuFbGhCBgGWEq28YgF6HfVYenizWchqv87v5ls1wykNH1eBfUPjqBCwGwEsos0gr+8K1D5qN+N/wYOLWgy7OwkCO2S/fHuYOV/wTuZSVnLsQqpsyTzng5Eag47CeWe55eXW+OioxXUIytbGBkwWM0fmaCPHHV2JjQZxtNtdtkgmphomsFKxLfaqZ86CUCVIF5kxlMpj/2pPtWMXseWGDXQg7xzP7ZfOmtbGCdO5Q4r740WSH47mWRhK2xJqBz0SUsKnpO56DWUfRipmUu03FTiBsU3qucV8cjIur5gQpIaeKgCiBiK4pTgl481bh0VBwA7gQ==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UdLEWneIMq+BbTz7tb9bjKUqriqqX4WpoCNRWQtRG82zJpvfX9vMOBfRmnQjZEjRf/XFWcub/0VHtdhCqcAhQcT9Awr5O9qKvIPfylzO2cC</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bAU1aExzCN185HTaWw87fvittoEZBpN2oBaAC/2a1AngAnd3zuC1zdS0ZcQZSxhsBvjH3E67XG8kWMSQE+uqbSSGcKlq4vilztmumHu2+SXnq3m41gwGBR0TJDe4tlDwQ==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtiWc4eoifAc4qI4klKzvKGTXgKH+XQjG0bVKf+45ZHAQq7RHwbyr1hgvg9iGSHVukO2VSJ0G7F2nXSiHO1EeP4x5UqBKwtrgmoiC9bg21lcy9/t59Ud/tZqp+zAyXZJlaT8H+0Yth5r8QOmZGA7BRDMKYMLRaNv2I8FRh/l2S8yiA==</Encrypted>]]>

      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtS4aLN9cilX/JX+cTK+0kHgze8NFdlqjoHUhhzhQjjWO572NJ2pTP88AfEd7nmQeIxSXgwrpYDerw1k0RYAvqSXh0BTtA8WOTLvwwoC8tCqXHQQlocViDXtCfO/Hia5sQFq2K4QkZZwFK8shGdtcV8N+w5LjhUrEj5pXkJh5RN/r9/Dnui8rmnq2oQPrt3UczFK0i3J8q5u2f3sOPIASutnXVrIKZCKUOr/eIzdp5R5XBPGOzINQWnu+UGvNPKt1FV7Vl6glQnx/BPI+waGtpqC94BPREm88Wk/4oDAr9PdfDRbvGKHP6lFazJ+FS0p39yOPwyev4Zh2oIkKRKCsRH2F3sg3o8/UNB1KQvQk5k1W+YqYY3geTsrfK5R2q+K7+l1jBO7Evg3m+Px3F40ofx4rCxYGtOBOoa9ePaXM9c74JjsCNegqPXyTbsmWxpeNm6RxPlsx8/k15cvXmhxQlgHiF1HpcM80bXkYG3fBWpivfMs40KoOFdPDblATFU5/sk+VggKac/6tlfEp+1Xe1rBPzrFfi3Gyhc1hSlf1/KTSJd0+Jp/21zhsxOfPsQ4hhUaCWlW4y3MuSW7/MFeIwpkqcJ4vHUL7MuVv8Tr29MCPwXzsFYpM8IGclmKNLvAWS+G8u81s5cR9owrnH1awDzJUKf/UHaMOPT7qhAc52/ZDJuPgjgSARlrHyCaWY7ESDDqRHqVoF3lxIzplfQOXAcYis00eo8zcDyua7uJR7ElhSyzQyHeW2kg64yRRrVoWPKW44XnZzSH124dAyNqSCs0nKLMtyYt0YgSX8F6kXCnrtJMzMPno1jcLBIn45jaX2DbLH6VL59N3OMkMf6J2Xec0ddo/FX4qbeXWChWE6XhVTu6khIdLYGNsz7FbI9WBLp4ZstpuWYEs4R5tvyvEIbinM2g//8gjMh4Rs2IQKyiV6zIB8id6VmMr0Io0QHcnemvfB+IufbN9nh8EJ71uqE/JEpBjh+ZG9ymp6hGD1t6SW9WewlluKHJWBEgoLBc+Upl6QRXNyJkLNtssurd8P8jBWTb9vTel+fPvdFowwT4WC1OWm4UtUd+QQsW9RvJ3bObQtfKCcwyggeyie72ic7SNozCrSmpyHJfBN57cBQR+midFgceK63aotfI876Cyx6Z1IO72K6H8s/40EQC56M0EqW0WtnI87g0mwMaL+casP3/4DhGG+oDSGjZyz/IVQJw9nLxc0aTt9YfUadjCRywdf7p9fhPIOFhAQpV0/5vOhaiqXmtk8GgPCDkXcXqa5w==</Encrypted>]]>
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