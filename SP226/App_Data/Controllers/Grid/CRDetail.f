<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\CRGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">

  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">

  <!ENTITY PaymentRequestRetrieveTitle.v "Lấy số liệu từ đề nghị thu tiền$Lấy số liệu...$120">
  <!ENTITY PaymentRequestRetrieveTitle.e "Extract Data from Customer Payment Request$Extract Data from...$120">
  <!ENTITY % PaymentRequest SYSTEM "..\Include\PaymentRequest.ent">
  %PaymentRequest;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY TransferID "CRTran">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVb96JFNFIdV3ZoQvErtz2ogZuxBNw3ZsRak1r05D0uspjim2XWyOC2d1LoeC/MFOAcUbIiJaOspY5wV21SDSa/anQwf6QyhZ+Pd1CdpS76E3Eu0e4h9bMZbbl8WlvZD3LbyxSaxXoFJc0CMrVpbm/jlheAYoHmPw9WFXbDwSJ8kHQ==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeQuery "
  select '' as [return]
  return
">
]>

<grid table="d41$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PT1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c41$000000" prime="d41$" inquiry="i41$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk_co" width="100" allowNulls="false" aliasName="a">
      <header v="Tk có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên tài khoản" e="Account Description"></header>
    </field>

    <field name="so_hd" width="100" align="right" maxLength="-100" external="true" defaultValue="''" aliasName="rtrim(isnull(d.so_ct, ''))" allowContain="true">
      <header v="Số hóa đơn" e="Invoice No."></header>
      <items style="AutoComplete" controller="CRInvoiceLookup" reference="stt_rec_tt" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and  ma_kh = '{[$ma_kh]}' and ngay_ct &lt;= '{[$ngay_lct]}' and loai_tt = 0 and (tat_toan = 0 or (stt_rec in (select stt_rec_tt from cttt20 where stt_rec = '{[$stt_rec]}' and loai_tt = 1)))" information="so_ct$cttt20.stt_rec"/>
      <clientScript><![CDATA[<Encrypted>&5IOchVd+ox/t/eEkJOHtTK06AJ0m5uwRkAEjhhe9AoOsmXKyLYt30Gu5Ng7KHiQSh3Zwq77utcBBfYAwRQvATUiTaESCyuWH8aacs/9gYdrpOvCmm7/16tixZXfUqAGu</Encrypted>]]>&IdleLookup;</clientScript>
    </field>
    <field name="ngay_hd" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="80" readOnly="true" external="true" inactivate="true" defaultValue="''" aliasName="d.ngay_ct">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>

    <field name="tien_hd_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="case when d.ma_nt = '' then d.t_tt else d.t_tt_nt end">
      <header v="Tiền trên hóa đơn" e="Invoice Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="da_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="d.t_tt_qd - case when e.status &lt;&gt; '0' &VoucherLogStatusKey; then isnull(f.tt_qd, 0) else 0 end">
      <header v="Đã thanh toán" e="Received"></header>
      <items style="Numeric"/>
    </field>
    <field name="cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="case when d.ma_nt = '' then d.t_tt else d.t_tt_nt end - (d.t_tt_qd - case when e.status &lt;&gt; '0' &VoucherLogStatusKey; then isnull(f.tt_qd, 0) else 0 end)">
      <header v="Còn phải thanh toán" e="Receivable"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_nt_i" width="50" readOnly="true" external="true" inactivate="true" defaultValue="''" aliasName="case when isnull(d.ma_nt, '') = '' then (select val from options where name = 'm_ma_nt0') else d.ma_nt end">
      <header v="Ngoại tệ" e="Currency"></header>
    </field>
    <field name="ty_gia_hd" type="Decimal" dataFormatString="@exchangeRateInputFormat" width="0" readOnly="true" external="true" inactivate="true" hidden="true" defaultValue="0" aliasName="isnull(d.ty_gia, 0)">
      <header v="" e=""></header>
    </field>
    <field name="tt_qd" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" aliasName="a">
      <header v="Thanh toán quy đổi" e="Payment Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_kh_i" onDemand="true" width="80" allowNulls="true" aliasName="a">
      <header v="Mã khách" e="Customer ID"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_i%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh_i%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="isnull(c.ten_kh%l, '')">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>

    <field name="dien_giai" width="300" clientDefault="Default" aliasName="a">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" aliasName="a">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ty_gia_ht2" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="0" width="100" aliasName="a">
      <header v="Tỷ giá gs" e="Book Ex. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" aliasName="a">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    &PaymentRequestFields;
    &XMLUserDefinedFields;

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_tt" readOnly="true" defaultValue="''" hidden="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="so_hd"/>
      <field name="ngay_hd"/>

      <field name="tien_hd_nt"/>
      <field name="da_tt_nt"/>
      <field name="cl_nt"/>

      <field name="tk_co"/>
      <field name="ten_tk%l"/>
      <field name="ma_kh_i"/>
      <field name="ten_kh_i%l"/>
      <field name="tien_nt"/>
      <field name="tt_qd"/>
      <field name="ma_nt_i"/>
      <field name="ty_gia_hd"/>
      <field name="ty_gia_ht2"/>
      <field name="dien_giai"/>
      <field name="tien"/>

      &PaymentRequestViews;
      &XMLUserDefinedViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="stt_rec_tt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket; <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zYoXBjtLCfuFJhfaX79HdwzZMc2K6gBUwwfyOaI8TS9eky/hMe8FWtNGE6e2M21MMsz3+OsLfX79aR3LcoV1wNGt6Qj6F7QRNOGSrrfFamFGcXFWmT5US+OLJFeThRFCoqNXD8+Pb64SVGJaaRaqXA=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756/JB6dPeVkwCfYuq8ju3IgTyvaYmP5SXM3CTuGAFlasExTxCBQbPEXIWZA/Ry229hH4j2n/gnYZn8ybEUcQSpI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kEXgAAQ/T0sSk3cxYRQvsMzqRYkLGpqyYqf4RJkd5KVZeEcZ/5yiIfvZ/oOpLaQB+YDmOci/ISdx8zsIKhZcJ4x3k/2TUXZhzx0FdI18CQ9HNoKA2J2jLinHRNHjEIUkCXwGdS8hPCVw1c9LD03cYZ6Sgh9z2y11GEM7IZ5vm6CevJWVjPAKVTKfjAuiJwsB4umDxKdjj4nD1ItrklMyFwYYUj/2SX+GfJP/zf53b/MUMzFzUFU0vzjmurK95oD3liI0haz9PLeBYBWLXmu5nQHPhW3MVcDgUzgwYHk+I26LLRMRHB7qGXNQDJDUQMTZuxiTd0YcEPCMlByr58Lhi1rihg6TIpoISHXjmuGF0/p85NNWTqAGThHTRS6xjycbH/5l2sI2KM5UQW0G3BD0wkr0wDWV9i+du1b4UfLsDXQFY5oMIe/NJVO4lj7wh5EdZFHvRg9QQiRI2+ajW+0gbyrulmA9tol7jkU2E32VkOB3ThzFNIRivebYaBKKUiQdVxSiYSwUcE2zDQccgSbZuO+UFTx2bvAyU709as2uCR7EOpAJHOZTKRPf1ScnYj9CXptHc8jtlnJzm9uG333X0KgijvyB2cEnBAEMVk5fDdt8FTs05UbArcSs2lg85rU6KsgRV71rbsyWMPyiH4XXI7vFW1nrf8XH5rBF4W31E3hzYjMAdLFgis6uz3YtCh1Q+8lMMaqemVQTMCYAeaFiad/u6AJpqmaKTEvE63FOWL6yMaQaKCMMkQRCIU6OuOBxvee3Z8OKB6T90S71KLGMn21BsxQrpsTKp/xoaPZWny8Vf4t9fW7y+q14X0uwGc9Do/z0qI4geZq2UkeO437dksvwCPgG+CxMVEwcfkhN8a5/zoaaWHLsF7b2TPk7te2/c/wxolOeoGR9StCiCtr+K/WLjjML/BQ/3q1JH131N/2vJT6WZm9rEjlFjszAunYvkg==</Encrypted>]]>&PaymentRequestScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4fNbXY+gdQ4f+EzJhgvsGRm8dI3azgND7b6bDdNA7p9SGHzxIW2l3b/fvnkqvex+ZicWHhtwG9htXghnSiT6jwn/WMa1D9oEL0lrrumUwZiE/yic5zE/l/ne/RLHpY4/+30lImfL160i4G6P74puxQtFK4IOMBFFhX3KOIvybNYAAi1zjHUrNMUxpY2OL2f8La2qNSFfXLDXcZtaUkR+NNgY+coFBwJbgqkvMNCzm7YnF7f6plaYb9/uE7tDL55wSswxrSts8qr0xt84XryUVWuP4B0fhfWNbs3tofOquKn9Twb6JcgV/wfztsOphRrPbSTOU7GXLHwinJGdXBlpVUKjXYgSqjSdr48hwSGPiahiWhGJd6YAHetZwvnBc/2Scn78/IYndUvKY4C2a9wfd/S+ym51TvtuNVDYttgWhaLZJA4FKXCCm6zbgOiM4y7Sh12iuM0ofjnKmz6Sy1+kGHDpARQbK4JGRpev6LPUFe+vZfaRQXubg4rfxEsbYhrtydUsa86kxW/bpDxjUeg/QTSpMkHtpIAf+sJ4Gka3klfRYjE3SaeZzfcjju9nfdsNMv1tUhvl/bKjqEl1XFN4oskA7i8WSbxfZlqNgsr1i+5P7ZBcLtA7SQQQu6j49pERfKJlh+DNhXGfub93h0fXJPYqYNK7jOSZ2msPTVLuNzYAP/f28peAc83ZM7R5hdmkRQ==</Encrypted>]]>&PaymentRequestCopying;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmP95zrGi0d6gM3L6vg8utKuJ0FknDVln2sNxA9f0z23YYXVn2E2kD0iNwd0rPyW78YkUwTrUGv+/Or+8Pfa9n6npGOvYP/A+EpLrY2+ffzJyzm8idgXkDo29q2Lfece8UOz7ubCNAc5t3DUChk840NLZgtaXJbEOHkzFGIq0qOORuy15DtxfbJiZ8FIh0Wh1zBpvcA0NDyXk86CRhJm81QhVz1C8ZGVLkpnUpkhrcqsX9lO4AtdrCwrc+tLuYmD37PbYEGXRAN4rwRJUDv2oL4MDUeKEZSqNFmidpKseBmPWEGj/vxVkxSpBhYoHWOMwpoCzUnZo2RngoVquBe0G3F8msenW6hct5q03aYaBvCfITozU6EhVtGKLG9j7Z9XGQLpjetJR8kd2elShBv9kJHd+cEaYRP2MZxSY1x6jFhIsdKDXxXyLPQ/tBAA8jCVTpNJ/nZTOYHtE+m04ITlSrBveqKcYu1sbV4vXBq1+62E5/nS9RiBBe9wew3IIn6ThFZgNBD5sm6hppODnmLQ11YLglh8s1FtUbmRwb2Z/wGk9rKHbNaEpVGGX1GdaSu3dfvEKMQwUYb9P/82a2J/6tK6hYlVmKKgiYyJckfPRgp1FUDdyclHUE8ygmgM5l/kk45vWKQlmmvg7eXHgBCilE3X3fm5mb8/fg5daRJBAl5xwzZJdIBgzBGgq0ZSC8jywIu0iCBsgSh3f3Hu4KahWcdZi1KkvqXkDMjKzE8UghJ1fjFtB3xzyG/zJa3lw1CkqUuegeP60if5PBDVK4dKMjMFY30Yv1/xbe9QY+9hItId86/NxsA7y52ydGVWl/CIBIdNZHWFYDys20TdGPmmj4srceWKzuRGUpvXMiHA/BKc4bj8NSx2EEstIB0/wusSbETlSf7nIJarFhqiEPiIjCHfVdyel/Qv4UaSI/Q8NMK9vQok8XrmbUJDefG8R+QP0agWi/ORz7LPQzSXC4A6+8+MVIKPsPhfHdgFJz7rvQrV5JpdgFWR9ZW0pzJwQmt6rZ</Encrypted>]]>
      &DowloadScript;
      &ScriptEmptyExternalField;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFC4fYRKj6tyfZLrJgISPmA2LDZr254zIFLvrrm5EcD3H135DeM0j0kru3pV8YKDj3w4g37rWwBbFnfXd2hTKU/CsWiGOk0W5H43R5O074qQ45+xdf6IbgmU1rIDVRfoPRJPOA1NAdcAwWLoTvJn9XPJTCcuQ78lhSOdWDTzQNh91DAuoe7y5Omwsh0qgfLTvq5/8VzQTiIwhQMmuTh6U0KqBohqz0xRIjtu74AhEbqgOncJ/fADAQL7nPDZbCaMOb7NeXqdK31QwLb5M3bkJ84NpadAGDZQGYn0fox5h3hLaj3kTXqLP2empdWMKQdOhA==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="InvoiceNumber">
      <text>
        &CheckRelativeDeclare;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wFJdunbbknYZEyRnEbb2XvCL4OTHt0LBtVuEvwO22h6hUJB4bOulPqaR1up9Bc+x5VtmvD5ZUMHISGWjil311E=</Encrypted>]]>
        &CheckRelativeCall;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeOarCVtQM6939b/p/ICXsTkhbVn5+kuFBBSF5sSwAhh4tz0/J8snr9X9dHLNMxNFqZmnqpdA4cGuYgccWGoAo7wvlL74SU1OEUgPcvDzFnV6L8YK2gqDW6j6802tI61WIBbBszzHXja0VvmXcifA50py2vBL23gbO059ORfcSMHFXCbp5HujnVtMDj0xUEvp/nUfAZXr/xMYc3Bd8ruUZIEJqVOm+W2sC9dlxEfmj+FM8yJMm+2k9xiqZRwGWxsoeq2JhNkWr+/PQa4TQHskVSce90aQL+YTYP88hDLOXICsFmlhrXoobJuN0RZBO1uYqUhaNzOgIw3yt4VmgXtdsFFbMmHybcjmShsit1biIs/3i6NykAgRdZq/bT2cFFj1lrQuEwgil5gbZ5s8Wl5U8iOG/HbuzVcQVW9VDWVfbsqwpBIDQ+3ip+K4hZeRuZHDKM1o9jQm/WRXlguNQBeayaDlaJ0aF4Sy5qOgh1S2cCM4D+/n0p8ehzYUvRwpgSeQg12wl/mCiBQTrREmG/xACeh7JlN7DIE0D5SD32bXUCUf9amjhtqhYvJma/vkZCv58CxryCM6we+tMW/67LbUjsr8Su7FJ8gYxO56ASWZNrUbIQZRwtNVedSfs/yy6wxyS2k+sEQSAN2xJp85anS5QujJgDGY/J34fWJqD+mhSxXcmVrOCRJ2n86nBOE27ejL1u0hiCNewvhRbeGK5vKvutV1wkgzb9C5ACXt66WAqJ/GSUM/D2epyAlLdKBPY1ZVkmvm1h0a5Ae7CgmFF1oTMTQbx5QBOQZ4MAprrq/RvGahIcZvPrO0zoMnG64L5ZRhL0=</Encrypted>]]>
      </text>
    </action>

    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    &PaymentRequestToolbar;

    <button command="Separate">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
  </toolbar>
</grid>