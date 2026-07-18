<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\WRGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeQuery "
  select '' as [return]
  return
">
]>

<grid table="d44$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PT9" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c44$000000" prime="d44$" inquiry="i44$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="so_hd" width="100" align="right" maxLength="-100" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice No."></header>
      <items style="AutoComplete" controller="ARInvoice" reference="stt_rec_hd" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and  ma_kh = '{[$ma_kh]}' and ngay_ct &lt;= '{[$ngay_lct]}' and loai_tt = 0 and (tat_toan = 0 or (stt_rec in (select stt_rec_tt from cttt20 where stt_rec = '{[$stt_rec]}' and loai_tt = 1)))" information="so_ct$cttt20.stt_rec"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQp/R96AhaucyVV1pMknkJAXEMoPDKCN401mIW+VgU0lBc3nkANfiosOTii9MJJJuYo=</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_hd" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="80" readOnly="true" inactivate="true">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="tk" width="100" allowNulls="false" readOnly="true" inactivate="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" readOnly="true" inactivate="true">
      <header v="Số tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="da_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" readOnly="true" inactivate="true">
      <header v="Đã thanh toán" e="Received"></header>
      <items style="Numeric"/>
    </field>
    <field name="con_pt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" readOnly="true" inactivate="true">
      <header v="Còn lại" e="Remaining"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt_hd" width="50" readOnly="true" inactivate="true" defaultValue="''" aliasName="case when isnull(a.ma_nt_hd, '') = '' then @baseCurrency else rtrim(a.ma_nt_hd) end">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia_hd" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="0" width="100" readOnly="true" inactivate="true" hidden="true">
      <header v="Tỷ giá hóa đơn" e="Invoice Ex. Rate"></header>
      <items style="Numeric"/>
    </field>

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
    <field name="stt_rec_hd" readOnly="true" defaultValue="''" hidden="true" width="0" allowContain="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="so_hd"/>
      <field name="ngay_hd"/>
      <field name="tk"/>
      <field name="t_tt_nt"/>
      <field name="da_tt_nt"/>
      <field name="con_pt_nt"/>
      <field name="ma_nt_hd"/>
      <field name="ty_gia_hd"/>

      &XMLUserDefinedViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="stt_rec_hd"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zYoXBjtLCfuFJhfaX79HdwFAx5OVbQ+jTUUESwFkfYbPs3P9K5Y+XULO/oJbfc57BB1xGnusZZZlkvf/JskCbaz6VqXVVlG/IxWEuUNoazi</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kEXgAAQ/T0sSk3cxYRQvsMzqRYkLGpqyYqf4RJkd5KVZeEcZ/5yiIfvZ/oOpLaQB+Q61Vw8aqJNC7ADcL3fsM94O+XivA+IuNYNKdumJTXNWkevwssB95abJmbAoGnvpcLgXNnXFG6SQDmOcbtvsWDyUvTXTUVFXigBQB21X9sERzXLmZvpvD18T8txC3ZGBPl1AN3iBGT+4e/pTkJ86j7LqNJFvdoCk5svyRDiv6ykf1F3EUO4IzdJSjWlVYEKXxaIu7v4OWR77bhESzY8dJGq6enNPnY5T+9Qi0VolBK5mfqJ0GRGFbJi+8nkyk8hnncmTggfy42xckEg80u6lL72grUtI6dEb4fcMbxtFoyRCSOMvO4Bb9nHe1u+e4OxVK0Va6J9ZLNhMXB6+Ud+cfK4h+jxUnBihA47NF/VsKdRbfMYy2f6Janq8lvYesZYPCpqIiynDkAYZxKLjP372ZRKLIPoLtHRNiqjSSxjOYergFpvIYX1O847XEeS5dRyICOOagWbjjr2JXD/EZxVYZOgPPf2n00tcyP4UTREYseqQ3QJ38hKR96NQOODT/88yTDT8YPSgy+bsILf2WpU2mDdUbuP7GkN0MZF32XacWu0yRPhGrVKKqoP5sdX+XJDx9lUpPHUPHMvwxaV57PsIVzANS7HuJWBT+C9m90ru8bCdLA6O4TAq2sOp09Tm8lSkYvVc7EnOpYVtiVmnAHQXgjThtVrz6KHEIuFg8IdXwiIXGLD5sJ2bTS2ivUwml8X3sct+kiSFidzYy4U6XklPGFzwVLj1civgNlW/wgxQADYSFf+gqtV2uOQxqRBr2kMv+A==</Encrypted>]]>
      &ScriptInsertRetrieveItems;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuynvFHnr3ErYMqXn8h5rm3jw30UsdDVg/hQBfMoTl6aSCFsLvo+oZ2v/L353NWFkTc89nS6a9hrhW1sxBeesiUVig0/zHh0NYZo64IYbheu00SoOe8eWJyZYg+zDJDasCbCazIzwS7dxMpkkQg0rS2QV3pNXctWNFovD1YvuFBlwDVRFYgL1DQXjGwbNQ6Qy2LbDs2qCnx3o5rk4+nDah6Q=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="InvoiceNumber">
      <text>
        &CheckRelativeDeclare;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wFJdunbbknYZEyRnEbb2XvZqhgWLdxtkZclzOSEH0OVlD97POzcFtzBbfiIeJKgT2MofYKAWWCaFUdlI4A5mZI=</Encrypted>]]>
        &CheckRelativeCall;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeOarCVtQM6939b/p/ICXsTk2u7irKX/ogFze9tvh2FT0WKTd5pc78rWpMneqx6MO2R4ZOsypphWMxpnM5oIEHpbxo79q0RS71Tc4CMOAiALw5ykbEnuhA5JaBtUnjh/cpFdIZT3CsenybexgkCjsPkOqj3jn57ZZVylfn2gbT+6SN98EtZCALqNUwV65ykAkbX6JtrLmJnFEi3up2sQgyp7I6u3JFpTu5s8UYVjhnslB0qufP1+QU3Xtu6Yg7O6x8Qat4/UUiPnKgfQxeZa37Anrobz4y7LJNFHZxgSr5buXFHgosTilCVuu+S8xuQai2GYgTruOZsWljpmctPh4tVZ5uuAK9pruKRPEVUdU2EkYxGBMVkvF9btM7EKXqEWjvttDs64k7OU4ZdbSbl1RiJb33p7mbzqcM4FSr8I4UgcEDLRGoDVrN0aA+Kcj3VRh8NKYl7sE0vesKWL8O77QXCEVLSMPwMTHu31gff0Ri7A2b0Q2VF7DS/IZ6KOoWfnRIdbineSzk5LhPzW9I/F7uuOS0lG53GCOg/hoJzym0VmbnwpExFnWjNx/eRUGpMR87l7LuCJmAuIXf7vKOmzKDinXa74VFVlYGoEIRundoWOFkw12Dwl0+RSU2Px4wafxF9zMXc5BI7UOt7OCCVxFxWAON3YQd0Gnp+yQ37qJqQi+7oKi1kYvbJRcVWOtA88gZhxxx24cCcS6HCNmlQN3B2DN5oaodULwikAVKxHu3RRSLerPcMmxD3Ck4DzCV32Evs=</Encrypted>]]>
      </text>
    </action>
  </response>

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
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    <button command="Retrieve">
      <title v="Lấy số liệu từ hóa đơn thu vượt$$90"  e="Extract Data from Overpayments$$120"/>
    </button>

    <button command="-">
      <title v="-" e="-"></title>
    </button>

    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
  </toolbar>
</grid>