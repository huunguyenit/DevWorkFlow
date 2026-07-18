<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLGetContactInfo SYSTEM "..\Include\XML\GetContactInfo.xml">
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
  <!ENTITY CommandGetTaxRate SYSTEM "..\Include\Command\GetCreditTaxRate.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherReference.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">
  <!ENTITY DeleteCurrentStock SYSTEM "..\Include\Command\DeleteCurrentStock.txt">

  <!ENTITY CheckDataCondition "stt_rec = @stt_rec and sl_ss &lt;&gt; 0">
  <!ENTITY CheckDataBeforeEdit SYSTEM "..\Include\Command\CheckDataBeforeEdit.txt">
  <!ENTITY CheckDataBeforeDelete SYSTEM "..\Include\Command\CheckDataBeforeDelete.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY CommandCheckVoucherFlowBeginTag "FastBusiness.Encryption.Begin$dvPdPCqpe+GJ7E9smhqxCnyB90cCd40EEYOqKMuHkUPpYzInf2rpIU4y6M2xM2XiH4G/ANea8IqBm04bTddQmP3tloNSB/P0fhMR2bU6tWWDBgZHciTozEIUsGaVmBLVFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$OE/reVxWO46ZQ4iNSKHRokAFEq2MCL2nKfTQ8k7vCV19wBNXE3SnXWDNu5ReibYLFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$ZQ48w5RQriGrDGcgASRa2qQBOvG/0AB/L0wxfm+gn2YjuPImX4ikex642ISSnlmTFastBusiness.Encryption.End">
  <!ENTITY CommandCheckVoucherFlowEndTag "FastBusiness.Encryption.Begin$3T8/SXFntesh8PkcPLSTP6vE9ruXvo9eFjcQEjQKQ0PSKMopo038Jfy8NYuN1J4JRIUvlIVP11h08bwxVLDf0Q==FastBusiness.Encryption.End">
  <!ENTITY CommandCheckVoucherFlowBeforeUpdate "FastBusiness.Encryption.Begin$ETLr4b7Rzr4OjFrpPLLTZwIc8kLQM9MxxRnU3dTMzCQNdghV6hAOmTOMdQFNPOofpAcJ99g+lJ9zvV10KmF0mA==FastBusiness.Encryption.End&CommandCheckVoucherFlowBeginTag;FastBusiness.Encryption.Begin$fX4o0nK+AW8MIUygIYpQ70hexcZ4MleFQGQTHaxmmMFHDX9vT8GU92lK3XBwqfykFastBusiness.Encryption.End&CommandCheckVoucherFlowEndTag;">
  <!ENTITY CommandCheckVoucherFlowBeforeDelete "FastBusiness.Encryption.Begin$ETLr4b7Rzr4OjFrpPLLTZ6j3Rez4Aib04inrDZuSdr4=FastBusiness.Encryption.End&CommandCheckVoucherFlowBeginTag;FastBusiness.Encryption.Begin$fX4o0nK+AW8MIUygIYpQ74P2F3CIiruYqBpOf1OPq6I=FastBusiness.Encryption.End&CommandCheckVoucherFlowEndTag;">

  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTNoeIsrZM6JPpQhWIA2MX6DsQnyKUyCOvDu/u/eRER43uk/bGifb5Dx87UodLuumkSFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTm5CM0qXjv/pzsnaw1v5On8HA6K3EA+PM4nmEBHHL/TOiX4KChmSyqeRSsyO+hDCCw7Dglr9XXFOHCrd7ox8SmIiymMGj4Lejgn/hb9fIZ1gxfH7OFGPc/DfBBcUObFa/0cGYXvup7yXLBUDSgGGz0=FastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTN83FcPoMfPOnsSSvGu5HMa16EhX5Hs7dRwVCRZrjQj52QoToGfWDcrBsY2WDtP+f6FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTm5CM0qXjv/pzsnaw1v5OlHm/H8WdwPngw8+9BvmK5dSLnjNGGpboqN4XIDsacIELJ/A4rfHHyDqQ73hZtG5ul3zs+g0wRWB9ySsZU60Nz6jtmuJkLbuLCMOnV13IYwHwp5bwXYQH8uiTjwHA4FxYA=FastBusiness.Encryption.End">

  <!ENTITY DetailVariable "FastBusiness.Encryption.Begin$Zr2gYv9LbUp7UjZiASBD3EoHUhPYXzqhZSauUzaPqz0=FastBusiness.Encryption.End">
  <!ENTITY DetailTable "FastBusiness.Encryption.Begin$LiOSJyQOLGBjzbvc5z8iSaCO86T5i8hBYr+137wMei7nQKgrquTHXxcQafEjxQOcFastBusiness.Encryption.End">
  <!ENTITY StockType "FastBusiness.Encryption.Begin$qqTjkAFEh2v8lzCvSPFTQcoY06+Mvw8MM6tEAvJxvSw=FastBusiness.Encryption.End">
  <!ENTITY DeclareStock "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+/i8MzmACQ7ibkpz8KbxMDbLfJIper5I3EWjPIlPIoyEJHMrSeWVY5DMdnkPS2ZCGA==FastBusiness.Encryption.End">
  <!ENTITY DeclarePost "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+/bSP8aCZAsHTAc5PT1xyLz/xeSOPrjDEVXS8v8o9EZgXcvUsRKHJA981lT5U0LlNPWvD8siVQGREo99lVQ/jTmk3fEvk/p6LZmd64QExfCXFastBusiness.Encryption.End">
  <!ENTITY UpdateCurrentStock "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+6OQAuE1QjEQkb2GneySWEjXkqySTja2LYFtiKjMVNyti6Tp9gX3GlsaCxUWsZqMUCFd7+Gk88W6PMrT22lIOuhg+Yt4K7atE6bmpBmvg49gQ0BXN9ckjXw2dVLUGEUH/35YYWhBPmcEE/zeAUxC0mHiWO0XUlvrtMsVX+voWOKr8XVhdwHBbS/h+L/9N8JTOEJOxYXfRp+09J2p6CGoAJ/thhtpVi5/8DJC4rFpshJ+FastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcBXgjGWS9VRA64jX89rO1Kct5RY/C7SRPV5B3MtI25kp6PS2M0MCb4KXeW/K2Bh2zuXzTyjsuXkjZ4506i6V+e3kIMX6ySTXnorDbn/DbzYrLOZ+YWGMsgkmeMRUIIMmIcsAe158/ZHSuEMA847wq6o=FastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$/RSNPGCNQdOpUiaA6NGaHjMEEaPXaTcsXDAn0WDWd3Wcoz+VPtGlmKRabMg4L9qDbVFWKLaHR8+fPWCYLzhlXmzs3Tr5TKvOVx3+yalSmOPuSXLF3mdY7xFJMcJ595tUFastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$/RSNPGCNQdOpUiaA6NGaHrb4ioB+kO4gS3eCZluuVsfNVA4ZSUxWrKrSr3g3Vdn0oGQ+KmjA5V5LZ0NS2uE355ftucvlHTHgOtRjbO5X7ZkhxRSElGl76zPbBMGP8sRcFastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$M+kvXi/dU/Pm/PVr5kRbNBfjFZ3tfAFE89y9S3YIk/XukuLxNMhltXh+X7OvqoIB+DYKIWteQbN31V+gqKNvkHlnLccgp7Vjn89gJ7F0gD8a9YGhrU2KZTl1+7lqInu6eNSXTr6gLfCCzzJTv5J2sJTV+y2U+OKeJ75f/hXUpAbWXx/pwlSoHW/4Dfw4VoWZaW6cNGT8T0jLz3J6i85fz4QOmYWh5T2H5rWuN8BYiili5pCZo6lhmZWQFAC4uLIFQjnyg/QR54P9TotniskmTg==FastBusiness.Encryption.End">

  <!ENTITY ReviseCurrentStock "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+ySSDljcOZ8+T0vEA92Mduok2YkySKq4twFy3yeE/9yXZIgQ3ZOB9wjbh5Q2jygh79Xm22g0xyr7V60Pv/Y+x/WcaZgkOZ3tp0CuIfROb6YTUmw7HB7D+BoL6o27c95GxoFsss8/vorVIcxvlLek9Ay+V+O+jA+f6SyaohWNGcMeydhQQJNdf9bUdcj4JlGg3bidFaprAhB7jF1IgYraVe6i9LOqBuIt4CPulRdkEFjiFastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcBXgjGWS9VRA64jX89rO1Kct5RY/C7SRPV5B3MtI25kp6PS2M0MCb4KXeW/K2Bh2zqapu62ovRnFC1f3wGwu6LygXW8ofvSqDxotSCoowyDeCtz9cvVz57jt5LrafhpGKXGAl1Jl80m5RP1tgicA1co=FastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$/RSNPGCNQdOpUiaA6NGaHjMEEaPXaTcsXDAn0WDWd3Wcoz+VPtGlmKRabMg4L9qDdYlL41WZHNgcOy4OeUzrNa3S0P7pwHjn3TvgYDxHmlZPB4BjJAA/CnWPUhhUgEdbFastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$/RSNPGCNQdOpUiaA6NGaHrb4ioB+kO4gS3eCZluuVsfNVA4ZSUxWrKrSr3g3Vdn0ODQO7Pk4bLaMpEyKCE/NO6vEgLmMLkK2GQiCu8iKaM67PdOYkV3+++QW6Tc6QP0qFastBusiness.Encryption.End&DetailTable;FastBusiness.Encryption.Begin$M+kvXi/dU/Pm/PVr5kRbNJt+kS2PPC1NX/DYw1NYFnFvqZwuvIPZtGrlguoG9rKnazSUpIr7nS8OfuZXZG0muUeTJa6+FU3K72AKiZQkuUkr/RnExB6MRHmh5hslA/3LuOHpneKhbiS392BZtKEZuGI6SxlmFRCBLdx0QIIX4BEu2/wtsTwWDsAg9oCaT91SwLyQ5xMnaSg2UMlpF3qlHvJUd1k1V8hEToiEdAlS0vvge362ATuIvyMWTb+U6v/aCv/V3oh12pcVmBjU3CB7iH0N+nfAlRemgBn6jzkmnvg=FastBusiness.Encryption.End">


  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu83ZYkZ3oNJVlv9bAUKotx5t5d3TixmdxE1znM0ttqcRd8YSyGB47VHgl8m7YQYaHnuoooOs9N3Dxi460COZozfFnRD6XVE3yh3owZtJf3rvc867uxln6owmM0HanCEvMAv3NpimVv/MYUbkCkoV9P5xDU4plGXX7n9obtdxjT28/TEOln3cHpCjH/VGug2HY7xNBheLCOmx1sfXNQtxbO8=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbifrqY9taNnV2l6I1YCu+I0eCbjHgDFsIFQV+gv43St2iZCsXv172ZQ83Jz1GOo2uVHenM307Gk2o3vsbarFdTWPQD8Ww658XqM+SLqd6IhXUjcLk/Rz8MtlaCQOfonuBL6J8yiFnehYw3+wbTuTH8GBXe4vgpT3W217xTen/YuO9dclBMS4zgvf+65VKpFmHIq47UUo58QyafqcmecdIYFX+O3tXBfgfgHhAxrhdD8OjZ5mQAoGp5EHJeNWH4Vplpb0ERMGD9VoNn8ZuaYDVH7QaHx96K4KiOfYt+JhOAbkCmsEQrl84ZBAKFYq0NEASa6itKGc+ofJH4AbWswMfcBy138sWkaX1SAh0n15Eap3j4bcM9CcryRDo7EBfBqK8Nz1QgJVDly2CIziC0GpvcP4=FastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4TrRBgp++BFuLAZiVrbzKD3lMSy7ymglimvPsJkH7SLSLQyYDEKD/Z1dCRZhutP0l0awmMOHhLN0B1x1J8fpP09yNq38i01tORoD+Vep5sfApNEwbu6SU5bYBCW57/vO/w==FastBusiness.Encryption.End">

  <!ENTITY TagUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcCCvUeh8oRF4cKdXZqR1sViQlFl0JppSYU7pB/+cqOsrJbX5TNxhHTX2ZNKcxt9mfs2vJgkr3B8aHlg2YAVXzx9Pry5Mi7uMqfrYaNhSMH/jvD7gXRDZmInOmTvNhb5jp5M9EoyMJ5s+F1T5czBXmYAcJO5x0GF/0r9U7UCsSck6FastBusiness.Encryption.End">

  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCCGQCqYcwLd2Bc5rVaRT0sBRqtJ6qK4+cAPHB2qKha90SEXFFwggkc4yp+CgwNCc3+l9rbuASS+mT0bhFcphCAgk3xsd/AhJJH5KsU9cx550=FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu9JeQ6BpL+iOW0yvEmllXuPA+XOjPz+ocynfyNqqEE8d5o5E5Tx8zvqjjeEqrBcWTuUR3n2ZLULg0NLieWiG2d0=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELHjSzs1KK1z7WiL/MgvziS4i2b0tPGuvhl4rOMJrkGX7RedxQjzyGotAOLPh8g47hMemjVtFyWzlqDVn3A4eosJFastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.PDTran;
  %Extender.Ignore;
]>

<dir table="m96$000000" code="stt_rec" order="ngay_ct, so_ct" id="PD1" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu nhập mua hàng" e="Purchase Receipt"></title>
  <partition table="c96$000000" prime="m96$" inquiry="i96$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã ncc" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(cc_yn = 1 or nv_yn = 1) and status = '1'" check="cc_yn = 1 or nv_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người giao" e="Deliverer"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu nhập" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" inactivate="true" allowContain="true">
      <header v="" e=""></header>
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
    <field name="ma_gd" allowNulls="false" clientDefault="Default">
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
    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Nhập kho" e="1. Receipt"/>
        </item>
        &VoucherLogStatusField;
      </items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99NGGRJuqy3TC5A1nf6qyPlIZMP/D9cS/SUwLYp2DUSbt9ET/XC/WhT+KFT06iGx8XQ==</Encrypted>]]></clientScript>
    </field>

    <field name="d96" external="true" clientDefault="0" defaultValue="0" rows="240" allowNulls="false" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PDDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="xs_name" external="true" hidden="true" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="xs" external="true" hidden="true" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="xtag" hidden="true" readOnly="true" defaultValue="'0'" allowContain="true">
      <header v ="" e=""/>
    </field>

    &ListField;
    &PostField;

  </fields>

  <views>
    <view id="Dir" height="300" anchor="6" split="10">
      <item value="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 50, 100, 0"/>
      <item value="110100000011011: [ma_kh].Label, [ma_kh], [ten_kh%l], [stt_rec], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110--11----1011: [ong_ba].Label, [ong_ba], [cookie], [ngay_ct], [ngay_lct].Label, [ngay_lct], [loai_ct]"/>
      <item value="110100000011111: [ma_gd].Label, [ma_gd], [ten_gd%l], [xtag], [ty_gia].Label, [ma_nt], [ty_gia], [ma_dvcs]"/>
      <item value="110000000011101: [dien_giai].Label, [dien_giai], [xs], [status].Label, [status], [xs_name]"/>

      <item value="1: [d96]"/>

      &ListView;
      &PostView;

      <item value="--------11-10-1: [t_so_luong].Label, [t_so_luong], [t_tien_nt], [t_tien]"/>
      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 42, 8, 100" anchor="6">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvk+TU+VhVo8TVn6/RBWefPcCArp5WXGEude29kNr612C2MktUZKzZii6gzZhlpc3BVbQstNmcOYHWEirVFcUiAJocrE+4Aok5ZmW5EzXplWIOqwgiKXnExNKwDm70UqfXfE88QBcNiZCGnEciYGIEqfmh6QZzn1oS/RcOOxN9F9yfzK+gWWi1me8oggoSX1FIQF1oC18KNU1IwnKNWAe380aDI7+dkJKvy17HbM0YMvTAJOyvnA2Bt+tFUs2XQg/NQ=</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafXdSi7E/c9bKo6fEflqIwvhl/c85wEWQ0yDRCWS1cSUZR90iS/IPuf82lQKyfdlDthcGujC1bhWIX9JQS4DEdabRqHw2t82x0k33tlcnQeSKgENH7kR7epsJxacKGNFkhlTJ3iSmDOzuqqs7pDZl2p0=</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandCheckVoucherFlowBeforeUpdate;
        &CheckDataBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandCheckVoucherFlowBeforeUpdate;
        &CheckDataBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ07yvFm3Ks9k2aeO2EBtmStOFxTWpy5WVMoGkDMA5mMFvvD63ONokir8e4VKa/b8Jl+0++f51q5K0wESmsQb7EYAnBVj7x4uvI9DOAoP+WQ0vbBHjff5oODaLN6UV38shkrzdoFkS4ejLX3+J67D8uSQe/z/J+yrwDrsi74XFD0+3SZXjllHdDrbG5Je4dSLoFq+jngCmyMbBkgkeger4fZJLSPuqBWplxKK668DS9lmk</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5GQ3ujB+G6PxUXu8157QrM80oDxL7nZWZ0KcNjPaGZd8nQU5jevf3yLa6bHthyrvk8Sueuv/cC+v0sEVW2qRa5A=</Encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xVmtGaRrbnbYTg/REqjbmip50ntOqI29l5ZCyPc4dXLAFoTfIEFVOrGNqlMpt+CPQ==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24Asld1MQia5nLDxPn0FG6LLBSeudXmFmdkREPR5/M7SIew8dglqYXBIX2fcH+vrdwxi0i3a9AvG79CR/YeC8nDShlGcdOlufHr/nF20+NiPYO3+WzM1Z6lpZjSU/Q42R7smWNiJbd8O47sl/ZJ/qLErvOfl3jnm26jwgARK3Vjh3KtZfr+w0LyoKbZpZ1mGDMd33TaorUob6bVD+mR/HRvzucjTqvE+j8D32fDutAwj/itA==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGBSKczOjO7Or2PaEo18trZW3agPMZD6PG7+xiYiW4Z6XJ0f2zj/ihADbiGZ4mfwUJyeKcw2HRAtbASCez6TYUY=</Encrypted>]]>
        &TagUpdate;
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
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &VoucherWhenBeforeUpdateLog;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku01uYtUQuyenfEMgk/UE4Q4wQkiRgWrnxwyir4704MEEREAznP0XJYMaSWOMSlCd8VMUmMGMLQ6f0i5gVxBVQ8M+03lxl378TfpCI1ewfdZ8v8E+h8eEtNmtPup1LN2HQImUbAEBXkxxgPglvUhIQRwBiooTivSmJUXhOh+ZZ0k49xXXErSfRxuWsLFQAFsJ/K07YDiFci/GN1/Z34UKnEaJ5zleavo7kid7M7RB88ZvZXHQJnsq9DOcZd/N+zf9k2t+KRtN+nnnNldJRCH9MgtmS3ORa8p8s4Wvk3rehg1YiriSA/F8CxvCh9XhG5OrZqXhQSv1J2/M+3VZElNyglA10Mr+n0Ek3j/ArIGA3O3XdURgppmRymRMB9jbQV+fl06XNygnpOINtLIYYeg0iirB59v8AFxBFNQoQwirXsBXW41ykVf+N/8h09eTiuEPE5HeUr0WnnLDZSCaw7Bze24eoxW4K7xWgpH4bzmN84+IYlMAcf7zDBh1MuHJogSYfA==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bCf329S/7VLvpuRoUBP0FOnkd9xJV/NtKZR+kfW8wuoadlwH2bm0ZZToFaasT+9hNB6IkzleASie+GsPQhnwBQyZsCoTCh//I8I4SYiexOeSfQr2v2j4ofa4zgMmhBncF6SnrUhr6g6eMprK9aQqusrIDLBhifPKPRqdkcaqFHV8sIBkKVwVihZLGZ4JO8Df2+YbrHZCtJM4I1n9Jd50a9cTIg3EAwX8dbuw7BHcG4o</Encrypted>]]>
        &TagUpdate;
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH/OhakbblJHICpivHeunyHuIZvEjZyKebn/iWNksbqB93kw0XGaH2gGtOIu8Q0nxMxszEcwNgqImyhZtTqUwAlcbOvt2h86VfU8XKXRFBeW</Encrypted>]]>&ReviseCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bj66wWvyM7CWl3sXdwt/E2Aqsd/d0CmOf/Uxg6NEEQk</Encrypted>]]>&UpdateCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4X/dT0/Jf2Dh0K7QZbadmUe7qmhObhu2jl87oY6RH4S3</Encrypted>]]>
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
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UYqWr3Mm8GDV5OWs6jXe3pte+t5snktOb6BRbSc52Dc</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandCheckVoucherFlowBeforeDelete;
        &CheckDataBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzqssfdGAH7duPVitrhq/SrgiiPMiKqdyqwQSSjetmbQaWQBiNVYXwzO2CTO2ECAK56iRXADOnYRsi0ZUmgiurk=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &DeclareStock;
        &DeleteCurrentStock;
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
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGTa8jTOWTWqwQgCxgO/x0WCvFEu9GDmis+JNFa3Es8aLEyacJ8PhEsJn3khpUfPgiVqh60DoVgE/eD391AYKdaQ+B91TsJGaIi8x62tu42XQvWmXaWJlk1ePybCxIlXdqwPJqwcHG9YRx2mpRhoB9ohJ382uuvddh72gn9+Via9XnzmSdMZG/VAf8NmY/S3DLzYWZK8gcf0GxT+wljK5TOzhMlQ5JDlKstdTflRNvk9cdTjTFc8Fa2SDCSppc5IvdmzNhD+cGfg5ubyTEdZsrG4KRJhKy2XFAQrRbCJqh799KjFaFvS/ci0UvYQD5lbmAfDCG7TwvHRyzYYP7zl/w0F8nKymv/9JMeA1H3SKG56fmXCxfrBUrpEPHHA+RSjuCRadiI3nmxVLeApwiltM00IPc4VFmUj77PzjRP6//YnUjSozjZsHvq/tLSdZ7kbOuitvBJsxx7GC+y4Klhjlglz29IYto9/YK8ItZEMn68PP0065sBifHidy08S5/v9/qizgP2o20h9QI8ARcOUyqmMe2x0sqcDvlNjQHvOy+OLCBJkTTRc3yrIT06d67LWsvt58v1YDYS19I+orym6NoU5dR3OhLj905kqdqAloFl34FXDzNa5whw1vSXV2oIkeZOg6WHawKQ11+stI8z5rkHVUniPqrBQLFcEon5+wvsc79670CuT6ANKLcXbofWajsJ1xmzGe2ASM3ILQiWb6Y8k+Rqf7hX6MSBjiuLT9mxXi/BP5ASC+XlUI9H6cJa4g02rbmb10WwATV+BBO0brhHB+qEENVQznsyfC9ZjwQv07GPRIb9ODPrWZoXpREpvXwldfwSv9yxY2ZlL06gQvyQ=</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpxEo0gX3ZSm29Pl+bEgpSSdvmRY4JJ83oEYFzir0FLMEtO6dU7oieNBQDm6EonD3bQGMszGvQIiArZyfco9FTbg==</Encrypted>]]>&ScriptActiveVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxfKooGa3ASOCQ6gSZDzgGMcKK41LGreiKvsO8YYqRQTXQ==</Encrypted>]]>
      &ListCreate;
      &PostCreate;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&kgSH0HK8qzKbg/rQtWUzkSmdcdio3ohxiLtPrZSHcuqymkFXZ9FfvUXuC8CmGv+fHgguOHBM+1rfarz0ROpvkh2igjfkCyLG7Gu1QDSI5kQ=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezfV5+W/BowbL0c55LdHnCA/5wqiFGar0B8kO7psAlMr9Jc0Os1un9eUeH7q+wa+dA+DO0Usig2/RQoJCRPeK3mHmbFcvbqDW4Uvzu9cWanoE=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZCdbJ+U2ImncEMAOCRkzWrtT+8FihJ+PDYur3vchdp+5ZzE/0W9FibPkFGMznceS+d08vbUgCukescwu+rlotFwCUoju7saw8woa9ZCLE902nnhVqLd8p4mW7DPjK8SpeA8p947XHTq3toODQClLO4=</Encrypted>]]>
      &VoucherLogHandleStatusExplore;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7AwHTQFqeMYoxYjllYAJQtbXulyr9NjUgH2XldRaefFal8oxmvT8TABlluLU3njBv2skwXEI48gRVDBdI/AqopA654AisYHZs0qraFIQPHe8c0X1wFL3HmAr4quhm5LW8FkeZ9dV1nbqS0F9mI8RLhXgPIgvDKlXEN+6yXukTioO4oGiv+6jmefsMOyRJT8u3tUhv/NHqJRxupP+szzT2yQltvqcenAQ1k7RaoKwCUKNMSEFw96e4U3ADsHTna8mMKrTR2ctS3I3kQxgDzY8EhfgRn/D5Z4HGWzCFdGcc+5S5yrLz6PQIe4mVUZYDFWZvhfwX1G9LamswtdHhd9PzZDx94WNa1O2qVGSJKIKic8Vg==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOqrj2mNavAf9/4ESLwuki8rNCpT5ADX8tlu1K8odc9nSsKZhwfusnftxsBhAl31AfyuhNVFAmcRGvLxxW5AZsnH</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Tceafg9l15/ifmNmrsk5YrITJ21kHJGLbHogWurFyVwYriYMn0H/WAbOQvmeNOtepshR+m2MmeznnbZzyinZNu6kXoFuc2BYQ80QewtDMuwE3kthD+Yxm4qV8Jh5rXlrGhxcQaI1HqQ+OlbZlGrnjCEmIy5bd9hPRSOXv22KwnCl2h+QPWX1mJHI3aV6dzCrQ==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22eBFDbqR5Qs34sjx6QrrOYRFE/wSE9Wfk6yBLHqzJDIb64r6g++pzYpeums13nxzAg==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VGALXfw3Kc8Kk3w3FYNtHC0mvevEviHCNElxwFxOJA8</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dJgeUcGBXK6zcr2MH4Yp6dQE5CUfWxJ1aqyjnDiCVZy</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UkyML8OU9Vm+C05wYc54p7aODYgKbmKC8rdybkvvoWtm5yDt3h/MYyetA0WGDJHzO4FC07FYSOoueloSL7G6+8fir7ph9cr1lTMUdxdUL82vhSFBiVv0bCHH+XLMYwMCeR9GO3G2iCXZUn7JE/mvXzNAYkVWPjp1aQsvajFzuIgAjh6KVUEORRUB7x1WHIVyKf9wwIJmMJZjle4flD3FTI=</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmFeQqAuO58mRNaN/M3pDc4KJgEkzV7ps3Z0Erp+8gZScgORGM220HflsxuyRv1fjmtBz6XIao0TD1I322y7Q6GLMLrlfN+/gf1rWzRr42tAnskHXEV1n3BX9Fpu5C/83n</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6zFhxqBxzr4vqs9YjDF3rXrsvKp+HNHE5pIa1AeKbOhSfg6FVHxBgT6IjMheK9eQcVDa1RUXSwBHoFHiB6GFZm3e0RKVCGmxhkZp3Obmo0Nz3YCjL4pDfnfFgfQ8YY9GVhyyuVGTNfYu3ucWPHLsT2sTrQBYZD9aJdO1sXoQbQadOAAiHtBKW/YkgQv7nUKS2bXux0Moosl1P0SCNkM2S2E54wm1U27bhjka26ifzSWEs44brpBXSGjbPHT1tY77INI5e97GjsD/fcGRgjmCIyg==</Encrypted>]]>
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    &XMLGetContactInfo;

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHg5vz3Um17sirwsu5oGce1Q1wWbXzYoskqW0658fmn0a5EUPZQqtOfg1Q4pckRvxRLASpVdsMSPZCfnbm+r6HYzg==</Encrypted>]]>
      </text>
    </action>

    <action id="ChangeStatus">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyWOW4eTq0YXuhxRhq0Y3YevVYVFXtfekXkIzcmJg1ellUE5ojXKo1qy2Njkspp3Us4usZjaoxHYN2vcJGoSutRqCwCwRokedJd39WJPTr3pFkPCixxM3BWfQfBw9Mb86yx8M2VqX7gyMPF4PXPsKO1ouLEutwiom9RWK9ws7t5FMVwwONs6NoHS9w4k7J41DfeYb6y9CiJH1HwXahxgSrUczpXw/6+saSUIM7yaDhzU</Encrypted>]]>
      </text>
    </action>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>