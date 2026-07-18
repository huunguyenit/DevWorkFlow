<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\WIGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLGridStockLoading SYSTEM "..\Include\XML\GridStockLoading.txt">
  <!ENTITY XMLGridStockResponse SYSTEM "..\Include\XML\GridStockResponse.txt">
  <!ENTITY XMLGetReason SYSTEM "..\Include\XML\GetReason.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptGridStockRequest SYSTEM "..\Include\Javascript\GridStockRequest.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "WITran">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5nWMX1S41inKp0JTWfM4tDVnp0LVoHti8feA6r8qn9qM5xsx06CTGYDKeXA4oeeoVXO4vnrtT8+ceVl1hTqKPDrMxH7Yf1KIl2B5CoABwwX/XcfgZmOeVGkRMCy4tCEX0hD90GxwLdcY8lQNX16O9N+weBcKX5FASHznBw5Ix4thoXiVudgsvX2D/qimBDIi111MJp20GyJD9374OoHKj4m+uDzbIgULdNcXnkmMBPiu5AVn001QUvThY86TuUmpoYfQ7vkBHI+BqaAAqHZ/HgBP6qqg6rFyh/HlUmBIQrtpodjCEN+lIQJaQeZucQsiTXPGGnORZ8Z3gh08/5sFVQ64EF8LC7sSkBJgtRq2NbGJ4A7s7d94mgklJYWtXEW5UFjtckvbJ6HSzUsP8jglH3O0=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">

  <!ENTITY Type "1">
  <!ENTITY Tag "2">
  <!ENTITY Ext "90">
]>

<grid table="d38$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PXH" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c38$000000" prime="d38$" inquiry="i38$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c$%r.[ma_kho]}' and status = '1'" check="ma_kho = '{$%c$%r.[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQooA054J+wew50DMntVAonAbqYhTTcCO+LPvypIOqklUz5gWARmqH6KMad4CB8YD7Y=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80" aliasName="a">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <handle key="[lo_yn]"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQpl1MgJeW5LDnfl3Uwo+zcYb/mbSpl+HKDk0RRwQNroW0RcBA3Reyy1JEJLQm4Dth8=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="ton13" type="Decimal" dataFormatString="@quantityViewFormat" width="80" external="true" defaultValue="0" readOnly="true" inactivate="true" aliasName="(e.ton13 - isnull(d.so_luong0, 0)) / case when a.he_so &lt;&gt; 0 then a.he_so else 1 end">
      <header v="Tồn" e="Stock"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="px_gia_dd" type="Boolean" width="0" hidden="true" defaultValue="1" clientDefault="1">
      <header v="Giá đích danh" e="Specific Cost"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" inactivate="true">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" inactivate="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>

    <field name="ma_nx" width="80" allowNulls="false">
      <header v="Mã nx" e="Reason Code"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" key="1 = 1" check="1 = 1" information="ma_nx$dmnx.ten_nx%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrVdIQ1ot1fbMQ824W93TqR8eblBVo9oT8IhKHmdep1oI+3mQndyuhxaNfAhCp/9tw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_vt" width="0" aliasName="a" allowNulls="true" hidden="true" inactivate="true">
      <header v="Tk có" e="Credit Account"></header>
    </field>
    <field name="tk_du" width="0" inactivate="true" aliasName="a" allowNulls="true" hidden="true">
      <header v="Tk nợ" e="Debit Account"></header>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true" inactivate="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" inactivate="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>

    <field name="sl_ss" type="Decimal" dataFormatString="@quantityInputFormat" readOnly="true" inactivate="true" width="80">
      <header v="Sl sổ sách" e="Book Quantity"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[lo_yn = 1]" field="ma_vt"/>
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
    <field name="stt_rec_pn" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0pn" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_yc" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0yc" readOnly="true" hidden="true" allowContain="true">
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

      <field name="ton13"/>

      <field name="so_luong"/>
      <field name="px_gia_dd"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>

      <field name="ma_nx"/>
      <field name="ten_nx%l"/>
      <field name="tk_du"/>
      <field name="tk_vt"/>

      <field name="gia"/>
      <field name="tien"/>

      <field name="sl_ss"/>

      &XMLUserDefinedViews;

      <field name="gia_ton"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="stt_rec_pn"/>
      <field name="stt_rec0pn"/>
      <field name="stt_rec_yc"/>
      <field name="stt_rec0yc"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&sp4+hMHegg2EZffLn/pV+xQY4Ac7ybHaSG+Lx5+tnMA/v1zen1uTZXHUMiTbUD+4bVd8Fx4PPMYaEy6eF5WGFy/EnYvTpX27FhjjP6GH7eF+FUOTY6NfFWUY7SzlK9AbVk/XwuVU5eYjczhkpAX9WKb1gfbAUZQmHfU2gxWwufycfjVy1/87y1yyC18XP9PuzDMic4QTALMGR3MPYEpXA2YTzMxJzoqa8FBJN3Qcg+93cwQu+xpf1PqgvcAKPvHxdLR/GBoyUP76bdsksgr5lFfFbnhCUiDYNt2k5MErXwvx4l0SmKRVW80+N40KclRO</Encrypted>]]>
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
      <![CDATA[<Encrypted>&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</Encrypted>]]>
      &DowloadScript;
      &ScriptGridStockRequest;
      &ScriptEmptyExternalField;
      &ScriptInsertRetrieveItems;
    </text>
  </script>

  <response>
    &XMLGetReason;
    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDoaH12GUsmy9u18Y5c2O/JD7et0clHdllpR2oMO3iZ4F+p9l+MYLXT+Kimcps0LLr8wHG9jwCpNOdn+sTWRWKQL9HJd0PIr1DsIY9C6LgOh/ayeymm9kNb0I7NDYCgh2Hw0TCFc7dzbzyQJ623pCjpx+cwL6ELFQ7FV8sHOTBPklkIlBDed/SyQH1TQVV3MQjv4pCwwrHcOcLpo2pd/b+qcFzbW4BHdNQpJQrjYLZUxbGHr/ItGKyaz+SgW6gwE39vkah6AQZepCTakzP2CuUR7HR2NbR7PvYgq+T2V3jDMqg==</Encrypted>]]>
      </text>
    </action>

    <action id="UOM">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeP8YubHGdsHL4F7ebTcT1gq7tOzEs71LfwWDo028OAlEObL/fNTdjgB+WFMget4gK/jV0igO78X3SJfa9eaFhUQ4DP8v83cgHw+OcO++FR14lomj7VTy9/spQQsPbBFN88fcW0ZKfpf/+nvb7QboEUKkoOf6fABjFWFMwxBUaKRUNq/xNH/AubbKNxRmBMBjj8pFF8v1UTNx21PJnyzugSkMIGCX1ypUimQIhIz1pibc9NUGpswIIOduEOCUVo79tfmFiEeg2LjC6sNWTPlk44pxKl8iqHGPd9hWpghittZsx572YNNbYsHyU7LRRWzC7dErUhnEn3ihmT14nj/+tgQEVgNwdWh4YrQ/GMIlJCI/zLQOQykGdWDDTwsY5kHfGU=</Encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbePLRP88e0/Y0htLZXvhZ2/Ht6G7RJIv26Z2htKkAECAjtIE8kXKOhM0PonSTAtLul+aJbwy7nlG+6EGYOlAY3rnic3yfGd5J4MVU5L2JQklf+t0W7AC2nhSQ9UzoXPHsUCHYmW5xFibYHzPKvwuOnUx0txOcAAifNVGAzA5BkEYyVyUZRRKO1XC5iOiN1T5AXM=</Encrypted>]]>&SiteCheck;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLRqw5tl+Vr/ZzUCrs5op1e7PzRebm8TcXrldjKa34mlcc1OkOZChRy34A9X9uxMwAMFDuMP5Gcdrf8Oz4VJQ/T5i9vOEnQ14lBustyg4i74yQIdHlubfFAULxYI9c21hHietrrQ8eMhw8My4goLpkOwYeCh7ZU/IU/1BtjbUTPOiBuaiFE5LH8vlVajqqpz5r+UXzkZiMqXmfruHv7/C/Kg=</Encrypted>]]>
      </text>
    </action>

    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>

    &XMLGridStockResponse;
  </response>

  <queries>
    &XMLGridStockLoading;
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+avxtQ58FqDl+auj1EQWwj5sNlraQl+jInF3SKEyCuLwoHGDcX73VZabijGWZMToF27df/OW8HQNPN3pp8jpluUgzG7rSwS/2N9h8Pzk8TGut7BOqbFrLjCHtBeIjddZd2hyKQqQGv0+y57h6comr2HADHrN3u6hMZsQdg3pxiq2Q==</Encrypted>]]>
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
    <button command="Generate">
      <title v="Phân bổ$$90" e="Generate$$90"></title>
    </button>
    <button command="Retrieve">
      <title v="Lấy số liệu từ phiếu yêu cầu lĩnh vật tư" e="Extract Data from Material Requisition"></title>
    </button>
    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
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