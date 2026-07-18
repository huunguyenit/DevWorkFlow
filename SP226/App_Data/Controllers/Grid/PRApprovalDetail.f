<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY Tag "cast(0 as bit) as tag">
]>

<grid table="d91$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PR2" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c91$000000" prime="d91$" inquiry="i91$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tag1" type="Boolean" clientDefault="0" width="60" external="true" defaultValue="case when a.xstatus = '2' then 1 else 0 end">
      <header v="Duyệt" e="Approve"></header>
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJauVqgFQYaix0+BitFArIZ1HOfZ42gKo1uR4gvTTwvDoQNF1cPsn/ygBenU7wCSC1Q==</Encrypted>]]></clientScript>
    </field>
    <field name="tag2" type="Boolean" clientDefault="0" width="60" external="true" defaultValue="case when a.xstatus = '1' then 1 else 0 end">
      <header v="Hủy" e="Cancel"></header>
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe00SqZV5ig/XvZFrXx3xXobFaSXYjxAlE/0QA38HesyPXrCfHmbx/qGee/0KLhIdw==</Encrypted>]]></clientScript>
    </field>
    <field name="sl_duyet" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Sl duyệt" e="Approved Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" readOnly="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a" readOnly="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" external="true" readOnly="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>
    <field name="dvt" allowNulls="false" width="50" aliasName="a" readOnly="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ngay_yc" type="DateTime" dataFormatString="@datetimeFormat" width="100" align="left" readOnly="true">
      <header v="Ngày yêu cầu" e="Require Date"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" readOnly="true">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" readOnly="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dc" width="80" aliasName="a" readOnly="true">
      <header v="Địa chỉ" e="Address"></header>
      <items style ="AutoComplete" controller="ReceivingAddress" key ="status = 1" check="1 = 1"/>
    </field>
    <field name="ma_kho" width="80" readOnly ="true" inactivate="true" clientDefault="Default" aliasName="a">
      <header v="Kho hàng" e="Site"></header>
    </field>
    <field name="ma_kh" width="80" clientDefault="Default" aliasName="a" readOnly="true">
      <header v="Mã ncc" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer"/>
    </field>
    <field name="ghi_chu" width="300" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="xstatus" width="80" inactivate="true" readOnly="true" aliasName="a" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="xstatus_name%l" width="80" external="true" defaultValue="''" inactivate="true" readOnly="true" aliasName="c">
      <header v="Trạng thái" e="Status"></header>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag1"/>
      <field name="tag2"/>
      <field name="sl_duyet"/>
      <field name="so_luong"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ngay_yc"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="ma_dc"/>
      <field name="ma_kho"/>
      <field name="ma_kh"/>
      <field name="ghi_chu"/>
      <field name="xstatus"/>
      <field name="xstatus_name%l"/>
      <field name="gia"/>
      <field name="tien"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75/LoBZviloreISoXiuNrsxnQxz1nixKWWZTMuX0kWwFNf3r7XNPX9TByWwLXAuvs0A==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNWLrl2QcXbqLH/L3cyqz4S8saLQO62J8t4UduRC3kaIGM3NmNadh3zYmCN4UxY92ZLYUAiyGuMb8R+aIYqWr3C5TjqwH1ERjWpC676n9vYFFbY3uHtneMoA3stq12sONnGdDSlEyAzLEpGK2QaQaP4=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyqTwdYM4qqgn8juj0GBx30NvwiyuLQQYv2lZfe+yCCMYpgNTIhZeW68FtnD8Z1Q8u6k9qkd0+wyAJVgTuU3ODCHiNbxcpG2TkvBf88mZeGA19TO2gtpD06iDnJEZ2JxXzgFMZSbQYW2oM5K4E6fU/6Cmsle9QhJ9qCr5y+Dv7Ox4BpEUhyVQjTgJ+ZLVdttHXmBSCtmCSroncVJ0Qsb4pXHe0mcd5eNxMMVTW6iUGbBgzyAcjaj0xaTlg5fSlmYySZhsfjPZdgG/Nuw0BnntVcZaVKAmeKYR4j9NH0DilnkPg+qePW0Se8tkHMBKDbukD0bqCkOAyNuR5VVKbsfMUF5Vp2e6okUnewlW9Y4Nysi/00F6+Mjj4ElObrNJqelxzMjbHzA8TwF2xk2kXg3+0CIxJ+64fDXtuwQLCaQepb28Ma6dQXPtKOEMfaiR02Bp2lZqGRGpYNdNuv9SXxX/6uA</Encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>