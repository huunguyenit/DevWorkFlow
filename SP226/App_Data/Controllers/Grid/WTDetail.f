<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\WTGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLGetReason SYSTEM "..\Include\XML\GetReason.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
  <!ENTITY XMLGridStockLoading SYSTEM "..\Include\XML\GridStockLoading.txt">

  <!ENTITY TransferID "WTTran">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5nWMX1S41inKp0JTWfM4tDVnp0LVoHti8feA6r8qn9qM5xsx06CTGYDKeXA4oeeoVXO4vnrtT8+ceVl1hTqKPDrMxH7Yf1KIl2B5CoABwwX/XcfgZmOeVGkRMCy4tCEX0hD90GxwLdcY8lQNX16O9N+weBcKX5FASHznBw5Ix4thoXiVudgsvX2D/qimBDIi111MJp20GyJD9374OoHKj4m92EVggC2gmTG6tBfh7928IezxiC1OTn8tG0JST6cjCX3NdIyqjnLZql8PWbIFlqKn4aZnk98KBWIuDoWdV59x7VPj/hbLBoEOWWSY/eJTqD4URwzDmmyUEjjbKGF035xEaNklJ2ncZNLxg/D4Gy0+VTH3uzazFlGCG9yFJCy1VvthMTTRmbTLeroZ6VXzi6l22l55VdXGwAuXMjAFOHStUFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY Type "1">
  <!ENTITY Tag "2">
  <!ENTITY Ext "90">
]>

<grid table="d65$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PXI" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c65$000000" prime="d65$" inquiry="i65$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
      <handle key="[nhieu_dvt] == 1" field="nhieu_dvt"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrHAErFytBmVTuYM2/+h6tbHTSuJe4+eNimX9Xcx5swAaVOb3OVZQuway3Ncnl3yjQ=</Encrypted>]]></clientScript>
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
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQooA054J+wew50DMntVAonAbqYhTTcCO+LPvypIOqklUz5gWARmqH6KMad4CB8YD7Y=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_trin" width="80" aliasName="a" clientDefault="Default">
      <header v="Đến vị trí" e="Destination Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_trin%l" key="((ma_kho = '{[$ma_khon]}')) and status = '1'" check="ma_kho = '{[$ma_khon]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_trin%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80" aliasName="a">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQpl1MgJeW5LDnfl3Uwo+zcYb/mbSpl+HKDk0RRwQNroW0RcBA3Reyy1JEJLQm4Dth8=</Encrypted>]]></clientScript>
      <handle key="[lo_yn]"/>
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
    <field name="px_gia_dd" type="Boolean" width="0" clientDefault="1" aliasName="a" readOnly="true" hidden="true">
      <header v="Giá đích danh" e="Specific Cost"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" inactivate ="true">
      <header v="Giá nt" e="FC Price"></header>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" inactivate ="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
      <items style="Numeric"/>
    </field>

    <field name="ma_nx" width="80" allowNulls="false">
      <header v="Mã nx" e="Reason Code"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1" information="ma_nx$dmnx.ten_nx%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrVdIQ1ot1fbMQ824W93TqR8eblBVo9oT8IhKHmdep1oI+3mQndyuhxaNfAhCp/9tw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_du" width="80" allowNulls="false" inactivate="true" aliasName="a" readOnly="true" hidden="true">
      <header v="Tk nợ" e="Debit Account"></header>
    </field>
    <field name="tk_vt" width="80" allowNulls="false" aliasName="a" readOnly="true" hidden="true">
      <header v="Tk có" e="Credit Account"></header>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true" inactivate ="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" inactivate ="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>

    <field name="sl_ss" type="Decimal" readOnly="true" dataFormatString="@quantityInputFormat" width="80" inactivate="true" allowContain="true">
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
      <field name="ten_dvt%l"/>
      <field name="dvt"/>

      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>
      <field name="ma_vi_trin"/>
      <field name="ten_vi_trin%l"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>

      <field name="ton13"/>

      <field name="he_so"/>
      <field name="gia_ton"/>

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
      <![CDATA[<Encrypted>&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</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="UOM">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeP8YubHGdsHL4F7ebTcT1gq7tOzEs71LfwWDo028OAlEObL/fNTdjgB+WFMget4gK/jV0igO78X3SJfa9eaFhUQ4DP8v83cgHw+OcO++FR14lomj7VTy9/spQQsPbBFN88fcW0ZKfpf/+nvb7QboEUKkoOf6fABjFWFMwxBUaKRUNq/xNH/AubbKNxRmBMBjj8pFF8v1UTNx21PJnyzugSkMIGCX1ypUimQIhIz1pibc1fN5lMjIgsshXB/6MsYqlpuuPvXPQ8jtSVsIXbpRpT2rt9DNOffPhu+U9h4l4pId9qOveTqtOlimiOccEaXXL7kmy7ugPsq4TSAq34kc+Hx</Encrypted>]]>&Type;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08jmer1q+e9WVUBSsPHwzyAKwF1Cug7C7QrMnlsiJP11VmYDSULz8nJeZIi3ZMjh+mscomrwaAS3cYGdKqnIJHNxqlvIZoaWPP7lPZ/u2hXm</Encrypted>]]>
      </text>
    </action>
    &XMLGetReason;

    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDoaH12GUsmy9u18Y5c2O/JD7et0clHdllpR2oMO3iZ4F+p9l+MYLXT+Kimcps0LLr8wHG9jwCpNOdn+sTWRWKQL9HJd0PIr1DsIY9C6LgOh/ayeymm9kNb0I7NDYCgh2HykC22TMe9RytxktGY9VkN7nzlQsk3IWaLOJRp2gaaw95cVfYgFupETD+Ebh6+7Y2mHF+Mpv8Gtt83n1mulDhjI</Encrypted>]]>&Type;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ03xn50zNKtn8WVrJ9IU7Njl02svHsWoWEMoXq3wPDsjOwo65/jx8SYfr8FowTg9GvZant+UbmI55Tb+gyozOK/SbQw/wmJS86iJnsRiCFHNseAz2ZiscIDV1HmRpSFXrQxgwcUhMZ4qdd4Jn4F5QrhuoEqGn8ItT8cKqVvN/TISR</Encrypted>]]>&Type;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QOCVF+ekU03F7aV1Fw8qBeejwo4WNSb81oo9AS172aY</Encrypted>]]>
      </text>
    </action>
    <action id="Location">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbePLRP88e0/Y0htLZXvhZ2/Ht6G7RJIv26Z2htKkAECAjtIE8kXKOhM0PonSTAtLul+aJbwy7nlG+6EGYOlAY3rnic3yfGd5J4MVU5L2JQklf+t0W7AC2nhSQ9UzoXPHsUBaw+iIrby7LmkBmzgrvEx66GwzknhasqYZ4TrYrUjG7vXKGUYEytohfh8V8N352nJDm1cnG2Fwue/aH3JPJjjIedeNoJ/EM+L6HwCENeOJ5MS7q+hN6y3mYyvT5YxgeewH6rNAU1ALYZ7UkYy0XV430xMSkcsiQewg6iDBY3RrHQ==</Encrypted>]]>&Type;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08jmer1q+e9WVUBSsPHwzyDhyqO09d4WYNm58rtLlYYvKpwcR13AHRzCIerFf4dkba9zrC0WSKlk1Je7zwTYHdY=</Encrypted>]]>
      </text>
    </action>
    <action id="Lot">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4nNXTwSZ1E/2fUnpexg/xWo/ibhnMVV3RwEkF346tR9eZXflQNf9mm1rvwefuAplAkDZghfpDgRl5z9ek8ywTaNBLBPdX1eobjn6g2mdYwsv0ALP9VokBM4wFDt8mabA4vb916VNF2inDfl6bLpMEjUZ3clfLX1ybSJPq+hAug9YtdqgagwUmD099Tdl51RWMNB8GpMCY3eEHeJZepWLau1WApWGtJJcs683pgXini4xT6JTcgaE402rtGf6NFCpPd93MNGyE7WyJ2vEUU/49Kq9VXWddK7B/WHV9kvDatww==</Encrypted>]]>&Type;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08jmer1q+e9WVUBSsPHwzyDhyqO09d4WYNm58rtLlYYvKpwcR13AHRzCIerFf4dkba9zrC0WSKlk1Je7zwTYHdY=</Encrypted>]]>
      </text>
    </action>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    &XMLGridStockLoading;
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+avxtQ58FqDl+auj1EQWwj5sNlraQl+jInF3SKEyCuLwoHGDcX73VZabijGWZMToF27df/OW8HQNPN3pp8jpluUtD8P0Absy9rIS1qVxLJV5oSeoACtL4Bz9KOjbFeJhQY5ITrgOhl/52gXFV1IokAobInrCNP2DmHeRlbBslkTiQ==</Encrypted>]]>
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