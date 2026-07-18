<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
]>

<grid table="d93$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PD5" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c93$000000" prime="d93$" inquiry="i93$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" readOnly="true" width="100" allowContain="true" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" readOnly="true" width="50" allowContain="true" aliasName="a">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="sl_duyet" readOnly="true" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" allowContain="true">
      <header v="Sl duyệt" e="Approved Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_pb" readOnly="true" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" allowContain="true">
      <header v="Sl đã phân bổ" e="Allocated Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_yc" readOnly="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowContain="true">
      <header v="Ngày yêu cầu" e="Required Date"></header>
    </field>

    <field name="ma_kh" aliasName="a" width="100" allowNulls="false" readOnly="true" allowContain="true">
      <header v="Mã ncc" e="Supplier ID"></header>
    </field>
    <field name="ten_kh%l" width="300" external="true" readOnly="true" inactivate="true" defaultValue="''" aliasName="c">
      <header v="Tên nhà cung cấp" e="Supplier Name"></header>
    </field>

    <field name="sl_dat" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" readOnly="true" allowContain="true">
      <header v="Sl đặt hàng" e="Order Q'ty"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia_nt" readOnly="true" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" readOnly="true" width="60" allowContain="true">
      <header v="Mã nt" e="Currency Code"></header>
    </field>

    <field name="ngay_ct1" readOnly="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowContain="true">
      <header v="Hiệu lực từ" e="Effective from"></header>
    </field>
    <field name="ngay_ct2" readOnly="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowContain="true">
      <header v="Đến ngày" e="Effective to"></header>
    </field>

    <field name="tg_th" readOnly="true" type="Decimal" aliasName="a" clientDefault="0" width="100">
      <header v="Thời gian thực hiện" e="Lead Time"></header>
    </field>

    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" hidden="true" width="100" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_nc" readOnly="true" hidden="true" width="0" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0nc" readOnly="true" hidden="true" width="0" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>

      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>

      <field name="sl_duyet"/>
      <field name="sl_pb"/>
      <field name="ngay_yc"/>

      <field name="ma_kh"/>
      <field name="ten_kh%l"/>

      <field name="sl_dat"/>
      <field name="gia_nt"/>
      <field name="ma_nt"/>

      <field name="ngay_ct1"/>
      <field name="ngay_ct2"/>
      <field name="tg_th"/>

      <field name="ngay_ct"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="stt_rec_nc"/>
      <field name="stt_rec0nc"/>

      <field name="line_nbr"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKQMRwrqQg5HeQZgOGRz7fjxsnUjikC8Uuy5FW0bdzoKJIxwhc452dKJMskO1c+I18N1TwhM5fbdOLc9PftO/7+rtLjuaKacsiuUu2O8BEtDJQFfOpZ+QRUxfz1SLiMSOvdFvpMZz13+I0BL24t6DKlfk3kVb2o2ed4EN/HmT4si4Hzb9dJFSV0QLtiyhlVYRrxAzbmzYhJ8QJS9t8vr3CG0lZmkD3gWYqT3f1lIJ4bPuICKYPjJD0wUNjXdxvW55fCBZhpj6BCgFXyREOemEMM47kWnquOz9lYaDxs7yrINcbkxz195MVyntTQp7PJrsSbbdjeliA/reCq/zanF5cU4Tam/J+Tl6u6eZ0m+/siSs2rrzjNQvFImk5ZiI0x+0wegF/uKImLUkiQ7NU5kxBQNTiX10uvkMAYlje5aF5YrRImHfOKjm3k9WgyH0SATOehTHjOfxW1CavWAj0vygItCK/OACLBMyDZOjNDX1KHj0=</Encrypted>]]>
      &ScriptInsertRetrieveItems;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNWLrl2QcXbqLH/L3cyqz4Th+ZzgCBZllbkBlW9c9DVO1OWwDXfvK5KUfQrRe+ir9Q/kzYcoL6WtcXFsvdzIC86BHv2aRbt0btPMlpZH/tQ98C1B1imbnDPHP2M2k3a3CA==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
    <button command="Retrieve" >
      <title v="Lấy số liệu từ phiếu nhu cầu$Lấy số liệu từ...$120" e="Extract Data from Requisition$Extract Data from...$120"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>