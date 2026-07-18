<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\PRGrid.ent">
  %UserDefinedFields;

  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">

  <!ENTITY % Plan SYSTEM "..\Include\Plan.ent">
  %Plan;
]>

<grid table="d91$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PR1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c91$000000" prime="d91$" inquiry="i91$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrtNZry7qPMbwHsBNsjc6Mk1WRLgRhbTBAqb5u7VmEUWTYQCFG+3awI/CHACMPUNGw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" external="true" readOnly="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrHAErFytBmVTuYM2/+h6tbHTSuJe4+eNimX9Xcx5swAaVOb3OVZQuway3Ncnl3yjQ=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_yc" type="DateTime" dataFormatString="@datetimeFormat" width="100" align="left">
      <header v="Ngày yêu cầu" e="Require Date"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
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
    <field name="ma_dc" width="80" aliasName="a" clientDefault="Default">
      <header v="Địa chỉ" e="Address"></header>
      <items style ="AutoComplete" controller="ReceivingAddress" reference="ten_dc%l" key ="(not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID)) and status = 1" check="(not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQoN2WQl1CaIqbC+2eEzfT9w7A0mD7R6mZRXxTrPA3yke4zH+Syga8+JqTCiU11/QoE=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dc%l" external="true" readOnly="true" defaultValue="''" inactivate="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" width="80" readOnly ="true" inactivate="true" clientDefault="Default" aliasName="a" allowContain="true">
      <header v="Kho hàng" e="Site"></header>
    </field>
    <field name="ma_kh" width="80" clientDefault="Default" aliasName="a">
      <header v="Mã ncc" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key ="status = 1" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" external="true" readOnly="true" defaultValue="''" inactivate="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" width="300" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="sl_duyet" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Sl duyệt" e="Approved Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_dh" type="Decimal" dataFormatString="@quantityViewFormat" clientDefault="0" width="80" inactivate="true" readOnly="true">
      <header v="Sl đặt hàng" e="PO Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="xstatus" width="80" inactivate="true" readOnly="true" aliasName="a" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="xstatus_name%l" width="150" external="true" defaultValue="''" inactivate="true" readOnly="true" aliasName="c">
      <header v="Trạng thái" e="Status"></header>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

    <field name="tk_vt" aliasName="a" width="0" readOnly="true" hidden="true">
      <header v="" e =""/>
    </field>
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
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec_kh"  readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ngay_yc"/>
      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="ma_dc"/>
      <field name="ma_kho"/>
      <field name="ma_kh"/>
      <field name="ghi_chu"/>
      <field name="sl_duyet"/>
      <field name="sl_dh"/>
      <field name="xstatus"/>
      <field name="xstatus_name%l"/>
      <field name="gia"/>
      <field name="tien"/>
      <field name="he_so"/>

      &XMLUserDefinedViews;

      <field name="tk_vt"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="ten_kh%l"/>
      <field name="ten_dc%l"/>
      <field name="ten_dvt%l"/>

      <field name="stt_rec_kh"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDCtb9YJrExnX+33mIFfqU1QHX3oIxjSSEKwiBdpVVAEmg7/Zel2N+9lQEBfos/3/HXK4wTHhe239cmPfXozWf/XJf2UG5rhF5/XLLqeTBs3j4Vc35qrrhJFecR4l/SxM5a+d1oTYXWhKWeXoEbSQLqxv0jh+iqG1aCi0NofR1KEvy+m8we3kcQobTKS7VkzXYso1jMVTjL9imQV0T3g1NcOuRPfOXH+6eCfA9VugfZxsad5bGf8b2BHBxIUU5FeR3vbHiJmfHoOlSfnU2sGHMjpHbp0+ZVv9jym87MHNwg08FgpacDa+mxLfIisr30LxpttKn4qhfqzVSFs5F84FCOO45fyrnU7ME28AQqfJvK7ucX+DhVcykayXnw9XvJz2g6lvDJHX3S7oaQDtwdratefPbDffpVhQXiAYU0RhYfyrz9gUdMm3iYWQKgSJ2ckWS20xjX8z+1O/5BBRZCXnVfkFKbE3GeI9YrF70rIm8DNdE84WbyJiDxgbSsspT5UjyOgtdQRxHo+bHGsjgANpQaZ5UbwfTpgPbVrPuCODE2uqeSm5xWsq9dn0xFlm7wkVDQZ+dh0OwZ1LtV1zmkd35G/u2iw8cnmiq+ofvfUUrn8yYMX5996ThBCf2LqBD/hOQQD88ZUAl8hgY/730JrGYB1UVEfIbijCSsBce4EHn7zy4MuD9xEPcw72EUlmyJPLGivrDoLu04nhQ3UKqJGdTR5v1JlsZEeOlH81DNjyiGurFyX4Wb5lJ7w49au/vBZ3wzemPKuZADE/MaxcOrGZhZRePy1T0qa94Ceqxl8FrdW3lCT5oBxwwsl1E9l8kul7GsPz7DuXnd7Ltj0VJew8BEWCMs9R2iLYOeC0Ho9zXX5KQ4mHdsvku6nD3rwyTPgfsgRVwicCByBHtVzsUd0xsFGqixSWYKEwqFtMZ5yaFSCt2I0L0phIa/hyro0ofZUmD+cNJkO7GNHkV7nkU7dLQ+pQN40VUi3N4oabLwBW+k3Buw7WJR4T2DGg1GzdMMCSsVhqRJ+s/YCjp/ZP/66x9FK</Encrypted>]]>&PlanRetrieve;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4chxx8QgB6EqUiyp7mI6pJBLyNtASgkXkk2LcvLR4cfok9OZ36Fkj/5nF3lE1LEDMBMakPTQC2wYSfc3k9RxxIuMGTkKaA6w6ydc4I7w7aR6iYaqng22SFM/DyF5TlVskQ9+g1KrtvBR1bA7XVe7S12Mb4hxS7kdwVjVW8s8NZiWCJ2SDQdvBreXxwevolaeveluQhamhgFaRxr6AsANJo8Xbv/HNcOOnBACdKsxfyHQMNaS2lPPquS9QPojlCllSLZw8VvUMOETymoHLSRJSckZixaS1nfGvlRlRkJZ8ezxqhLCZ12D/n6HEqBUAcVamScwGOYrXzyVQzePkX+NjAG29VLmaws1Y1GFznYAXYB6JgWHDhz/nhW3ciQ5QLWMMfeW5ox3BKQFApyjNID0t42Rk/XDWDwRUlF1hrVXzsLl+ye9Crep447rH94jM5OYyLX3Eyf1PZb5y8us5znR4VA0t7P2nBaLoS5ozRPqHIpEi/2eEx6cnSYO7eJemJSo6sDPxe7yIdfaiORowGWmEkVDsNtlmLar4pzV1FzVwKCc+cHsyq8Wkz9ey9xNXV5772R5dxJ/Z5QPUf1ftvETwAWG7F5BgQhX3kbb6H3ocoHjtKrnrYg4x0/VGnkGehk9Ltg/mgVb7DRx92SycYR9daQjdMIrYYFsJupXnPlclNFN</Encrypted>]]>
      &ScriptEmptyExternalField;
      &ScriptInsertRetrieveItems;
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDq5yNlJNSfmbiXb6C4f0Mz9Sg9s8nOOEltLFnFActbYOxgx+MBwOzNHtuQgvOti/53j5gS1Z0EYsxAFkXAVZCMRAI+uqUxfNWuRl0MCyskOW8R6vxwrKo/pZxNJtJ3PxjFUUy6LuzpWaOIIcekhtiWxVzxzZleP/cYOcExyCWKIzA==</Encrypted>]]>
      </text>
    </action>
    <action id="UOM">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKtFWrSFU+3KR2ejgoPK4CCAb19ZloyXaSyXLcg/hJ/Trf4qH8GfGHe549pIF7cnR5CW/DutpiSoralbszMsSYOFSLplIu2lAciDd1GDAEuY</Encrypted>]]>
      </text>
    </action>
    <action id="Address">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9Tmna0FDIvx3+sO6zaJCH556FXvZpgL9xxsYPQrAsFLl0lcITl14z5giO60U7ZZlZ3aauM7EmX2Uc36PZNEX2lYKf+A9Aa3hNtkUhr2/TllTfF4wvccoDApTSMePN23RFUVyiw80CMqH8FlPaJd9bGk9BNLNL2fJjlFauMB/dwrbmIVsbaPyE/Rqy7XMVd+9BLWdV8Z0lDRnvFyW6lHnsXdy</Encrypted>]]>
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
    &PlanToolbar;
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