<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\WQGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLGetReason SYSTEM "..\Include\XML\GetReason.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="d55$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PNI" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c55$000000" prime="d55$" inquiry="i55$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" readOnly="true" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" readOnly="true" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_vi_tri" width="80" aliasName="a" clientDefault="Default">
      <header v="Mã vị trí" e="Source Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="((ma_kho = '{[$ma_kho]}')) and status = '1'" check="ma_kho = '{[$ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80" readOnly="true">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="pn_gia_tb" readOnly="true" type="Boolean" width="0" aliasName="a" hidden="true">
      <header v="Giá trung bình" e="Average Cost"></header>
    </field>
    <field name="gia_nt" readOnly="true" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" inactivate="true">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" readOnly="true" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" inactivate="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_vt" readOnly="true" width="0" allowNulls="false" inactivate="true" aliasName="a" hidden="true">
      <header v="Tk nợ" e="Debit Account"></header>
    </field>
    <field name="ma_nx" width="80" allowNulls="false">
      <header v="Mã nx" e="Reason Code"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1" information="ma_nx$dmnx.ten_nx%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrVdIQ1ot1fbMQ824W93TqR8eblBVo9oT8IhKHmdep1oI+3mQndyuhxaNfAhCp/9tw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_du" width="0" allowNulls="false" aliasName="a" inactivate ="true" readOnly="true" hidden="true">
      <header v="Tk có" e="Credit Account"></header>
    </field>

    <field name="gia" readOnly="true" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true" inactivate="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" readOnly="true" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" inactivate="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_luong0" type="Decimal" dataFormatString="@quantityInputFormat" width="0" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
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

      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>

      <field name="so_luong"/>
      <field name="pn_gia_tb"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>

      <field name="tk_vt"/>
      <field name="ma_nx"/>
      <field name="ten_nx%l"/>
      <field name="tk_du"/>

      <field name="gia"/>
      <field name="tien"/>

      &XMLUserDefinedViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="so_luong0"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kEXgAAQ/T0sSk3cxYRQvsMzqRYkLGpqyYqf4RJkd5KVZeEcZ/5yiIfvZ/oOpLaQB+YntRie1R2gGw6qYgluHWS36uPnsjeWb3fK/PifwNtAaa/pxC/cCqxMfxI9UnW3gm2gqNkeHtVU916UEQVC+97Zu+zlz3KYAUFnHE6uGCyyulWriot70cNVaUGUVtIvOShGxoY5aQ4U+KPBVhT4JMscLihywjE2WLCJpsbv8GMqAKnSOVj5ngtabXCm3nqRgePQRP8ns1+Y0a+51nHMg9o0ARRwBhELwQdEispnmHvDFW4Bp8eWnE6mZ6endxJqfYTJv/1ETMCo+aGhb7XO86aM/o3gnu5APF5bven0mv9IQrt3eUIZUO4ZACaI+Uigmy43eOa6kybJ8R6SiRTEbpbSXXbLNtD/9sAEAmUdP+MGNNfaBFyLx+s1yGjEpR6O2AIxS76CuRCyHM2fP8uJERZ+VHE/GVxVEin/bcrP+w5R8Zy7AJEFULaX2laHR7hYt5DKdD8W2y4YNd9gH8vJNngbS1pewX4g6DfrxfmVjmQiFgwBQCBbgKzjRditXBea/bXInqOVVhpjj+v4resaUmIPB1cA1BlxT0lkwo+XolVdphXeHNzcc/S3KgJeoQM1u+LaHAlzOlYkY9goUYt7AeHUAzJuTIp1Fa2NWWiLEm7JMw6lyTw82ssz1rZQussFpE9zoyEfwZxcZG/LCCBqbQOmQ1w8dOYXBY5MuXilCmqoh97PhVJmqy1zMtf9Jvd0fmFcSTaNj9tLpNr0CDcGb+Jh+C/3Vt3tMcxcjwI17gp9YrSewJEHIlPvEmdoVDlwQj3MX9S9PQ1U6CSDIUzFKF7x5N8NX9z1QBh7vmXZPmTmOOOWI2ubv8MjWP8HEehAQ/NH4xBL20hZTxKEw+Jb2b9CuyfiDYiOUX2DWW2ozHNyZET3Y828vvHgVH1iN7XJ18Q==</Encrypted>]]>
    </text>
  </script>

  <response>
    &XMLGetReason;
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNWLrl2QcXbqLH/L3cyqz4R5WPurvONXlXPy/jxQyx5/tygPniSGVrG82pjVdXduiJK//ZfrB6eByq2D0qY0hOEQZq4i0Iu/MeeIoceyfWC3</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
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