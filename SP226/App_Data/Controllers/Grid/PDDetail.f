<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\PDGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">

  <!ENTITY AutoLotForm "PDLotForm">
  <!ENTITY AutoLotGrid SYSTEM "..\Include\Javascript\AutoLotGrid.txt">
  <!ENTITY ScriptAutoLotSet SYSTEM "..\Include\Javascript\AutoLotSet.txt">
  <!ENTITY ScriptCheckGridIrregularCode SYSTEM "..\Include\Javascript\CheckGridIrregularCode.txt">
  <!ENTITY CssCreateLot SYSTEM "..\Include\Javascript\CssCreateLot.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
]>

<grid table="d96$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PD1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c96$000000" prime="d96$" inquiry="i96$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrtNZry7qPMbwHsBNsjc6Mk1WRLgRhbTBAqb5u7VmEUWTYQCFG+3awI/CHACMPUNGw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrHAErFytBmVTuYM2/+h6tbHTSuJe4+eNimX9Xcx5swAaVOb3OVZQuway3Ncnl3yjQ=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    &SiteField;

    <field name="ma_vi_tri" width="80" clientDefault="Default" aliasName="a" inactivate="true">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c$%r.[ma_kho]}' and status = '1'" check="ma_kho = '{$%c$%r.[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <handle key="[lo_yn]"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="qc_yn" type="Boolean" defaultValue="0" width="80">
      <header v="Kiểm định" e="QC"></header>
      <items style="CheckBox"/>
    </field>
    <field name="sl_hd" type="Decimal" dataFormatString="@quantityViewFormat" inactivate="true" clientDefault="0" width="80" readOnly="true">
      <header v="Sl hóa đơn" e="Invoice Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_kt" type="Decimal" dataFormatString="@quantityViewFormat" inactivate="true" clientDefault="0" width="80" readOnly="true">
      <header v="Sl đã kiểm định" e="Checked Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="dh_so" readOnly="true" inactivate="true" width="80" aliasName="a">
      <header v="Đơn hàng" e="Sales Order"></header>
    </field>
    <field name="dh_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="50" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="xstatus" width="80" inactivate="true" readOnly="true" aliasName="a" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="xstatus_name%l" width="150" external="true" defaultValue="''" inactivate="true" readOnly="true" aliasName="c">
      <header v="Trạng thái" e="Status"></header>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" clientDefault="Default" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="tao_lo" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_dh" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="xaction" hidden="true" width="0" allowContain="true">
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

      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>

      <field name="so_luong"/>
      <field name="qc_yn"/>
      <field name="sl_hd"/>
      <field name="sl_kt"/>

      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="gia"/>
      <field name="tien"/>
      <field name="xstatus"/>
      <field name="xstatus_name%l"/>
      <field name="dh_so"/>
      <field name="dh_ln"/>

      &XMLUserDefinedViews;

      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="tao_lo"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>
      <field name="xaction"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8BBf6CWPXlB9wcgkzMQHd9Z2LDxEqRbMWkgIRhHObCJBxKCaFU4vlttpfuLC72NfLSXYjL/xT1E3KC3v9qE3mqLmV8YV+CFjm30EFR+DMOz4ds06u7GQ6qiUi2SVovcwTb1cZPN2Q2mGY3eam+V3mxYdM4BxPG55aPGTE8x7HpiecFuQTZTe7dSYPV9fP9jkZAovBpOsFBmjHMDuQwce1ZxL7k1cPZFhdBkOOic5RAOg8y8hCFFUGMcQ2fkcZCXe9wxExC8UFjWN+BDeo7OhEUhziDbXxHhAo3rFVp1rkjmhxUtAqwlyUOtxcKyZq7045H0vqhbXf5LghPuKQsoYUzoiOeUtFlPo5MmLFzKPaQoySL1TkhGkx3cDpiV08tL05iLFSEpkC60CAVhz62ywq8dA7D0hCpXZ1VgXMAbrX9wFrhW/q44Zky/ZpBEjh8g7OmOtrFHAwoLErKTlO9r64nrPa3jgpk1badZ83I0dbntOb0mrlKgvFvChwUCPq8ceawErOOeHKoFv0njPvmJk3ZssQJNE4A0i7deGO3oJ2xBvTJlMZlN7q1V6FzJbJcjmdXHlXSR1Abd/ErhBCi83c9Ioi1GwznESPtt6UXFWesGVAWfolyWHaqZD3NsDfhVse441G5Yb21CnMo7aVw+nFGUd3SNAAo8yLL1bqqFTeyeTlVs2WeNQIbzP8bYfhMx6LWWE7gq6+7+8WUS5HtIHZ9w587XH/Dgjpq1dohvyZkhRXiNL7cAOk/oOk4OSyz8/Nbn3M9LKyqTVNqnuSu3q5e35zyNflIwCJkYbGmwM/VlzkuGsvjFJvR51faiAWfpKrvUsVoCZvOATNV1AqaEkVFlLiYBhYlilxPZltQuU4vxQ==</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNl1m5Ya6nTvvxt8y8PVTwNfDi4itH0UP+2e+md7+87cZX707Xe2uFgz3VHJRCBzWuNacG55t1kqAk/x9hMoRYx0DPZvbOz9lmDFQbvsMrSGquFNDqn7QPyNVX4Cdd+5jnN8DWFIMbdx3k5Uo8sXidAOSskqITIR6UYSvt7mzYJRJt8Ndp+MD0DEkARQHvZtwfeXOF6Lbdx1cCccwzRstwjyqIopf5pvldKdUe2gasgm/lZ2/5H0FCz38TwtDmAut5ovUBogSkOLLNx0Yz/Qv5E/wzkhdX7jZE3HlNzyfwW3V8ZOwG6QDn0m2pPuf2a+MJg7/9eMpzSaLSTsJFuKw8GaTZRUDWIX6/1xa+C7pGQYnwJWskz9AhRQ2GgegcgfeBcpVmxDfHFn0GbpBER7eZlv1rkfH7CU3Ks8BsYIrUynk</Encrypted>]]>&AutoLotGrid;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmP95zrGi0d6gM3L6vg8utKuJ0FknDVln2sNxA9f0z23aLJkL84qno+qHWJYypsfJ6qFuoSMJeCk9bGsXSvhljKTfENneRujFU1uLcu2XXOmiGLgohK90xH/GfZJzKxiUOx6js2uyhUmfiDKU/lMNoEHpFfkkJUNPDkbrnmhk7866AipSSvHWJDemnpIDBsP0LMthN9Kgg4yOaKDGw+gbDAwCAnctEy0f9ZuIE5H3u3304u488uFc51sDfO4LwineWR45dDObcwC6K7QvK0qx6QbnCvaERAHnUbcRrUViO8Yz3k2nDu2iKFFF57GEZ1OuDw8cyMR/SvKuZYpEB4CHajhO/YQTc+QbZ5wiwKf3uK1rZx4q3itN8QwIo2Wq+LUecOzKsLqs7mqt4X0AxCFSDdQMue5gPul9dnH8KgYzPwTkTVtmeJwXjEK5C6B1DVY4eH7kJHK19RsTEaqrPoVSTYSlV6yAidkdSzC6J+OCGrM/rPju1iKubMfu6bbwS37nFf5hPRQDMpyrlVuftk9IJKLZe1Ao3iGttRJHJ0OG7NcxuvlCVpJhoUhD8ja4/kdnT51yBxNurbJflvMXGjBkeN/18sszIRhEcQA6TwJrXNljXmimDdZEeLo9vXnHEpguTMj4dfLAYMZmIwziOM5uVYGntQ0oVPfj++2nlNuTw55I=</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptAutoLotSet;
      &ScriptCheckGridIrregularCode;
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;

    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDrpCqzTem+GfltTL/s/TesfyY+aJ9YB1ukt4kXF//lXNQQs8k14sAv3Xeg+7ohd0KXVbbVU7hlY7nPsiF+EJT5JHe/YHrgOM2dUsMAnjUttSXJW9CKhzcEsLM+WTkk4ymHtP9RDNtJHy+T63cQk9MKaEhFWA0xtPZKn9kOH0mAWEQ==</Encrypted>]]>
      </text>
    </action>
    <action id="Site">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeONrSgIrSf+52+N+L9IwcI2DgovH2I5r7Zp60T52mgYbNic5yDVZLkkyVyPQMKysaxfGrZh5CZSYJol8sVwlztuKJauvivO8vV8HPoJ+uQY6Dbym52pM6XFlfyWBh+pM9LHrkX48sEZ4N7wrUmVY2d1jRLv8WLt1xIkvODB8NrYVS6nZq+13P8myyAozQOJFCU=</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNWLrl2QcXbqLH/L3cyqz4S8saLQO62J8t4UduRC3kaIGM3NmNadh3zYmCN4UxY92ZLYUAiyGuMb8R+aIYqWr3C5TjqwH1ERjWpC676n9vYFFbY3uHtneMoA3stq12sONnGdDSlEyAzLEpGK2QaQaP4=</Encrypted>]]>
      </text>
    </query>
  </queries>

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

    <button command="Retrieve">
      <title v="Toolbar.Retrieve" e="Toolbar.Retrieve"></title>
      <menuItems>
        <menuItem commandArgument="10" urlImage="../images/Menu/PurchaseOrder.png">
          <header v="Lấy số liệu từ đơn hàng trong nước"  e="Extract Data from Domestic Purchase Order"/>
        </menuItem>
        <menuItem commandArgument="20">
          <header v="-"  e="-"/>
        </menuItem>
        <menuItem commandArgument="30" urlImage="../images/Menu/OnlineOrder.png">
          <header v="Lấy số liệu từ đơn hàng nhập khẩu"  e="Extract Data from Import Purchase Order"/>
        </menuItem>
      </menuItems>
    </button>

    <button command="Lot">
      <title v="Cập nhật lô$$90" e="Lot Maintenance$$120"></title>
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

  &CssCreateLot;
</grid>