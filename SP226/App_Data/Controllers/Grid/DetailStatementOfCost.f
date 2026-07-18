<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid" valid="systotal = 1">
  <title v="Bảng chiết tính giá thành" e="Detailed Statement of Cost"/>
  <subTitle v="%f, ngày báo cáo: %d, mã sản phẩm: %s1%s2..." e="%f, Report Date: %d, Product: %s1%s2..."></subTitle>
  <fields>
    <field name="stt" width="60" readOnly="true" allowFilter="true" align="right">
      <header v="Stt" e="No."/>
    </field>
    <field name="ma_so" width="100" readOnly="true" allowFilter="true">
      <header v="Mã số" e="Code"/>
    </field>
    <field name="stt_in" width="60" readOnly="true" allowFilter="true">
      <header v="Stt in" e="Order"/>
    </field>
    <field name="chi_tieu%l" width="300" readOnly="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Norm"/>
    </field>
    <field name="dvt" width="60" readOnly="true" allowFilter="true">
      <header v="Đvt" e="UOM"/>
    </field>
    <field name="sl_ss" type="Decimal" dataFormatString="@quantityInputFormat" width="100">
      <header v="Số lượng so sánh" e="Compare Q'ty"/>
      <items style ="Numeric"/>
    </field>
    <field name="hs_hh" type="Decimal" dataFormatString="### ##0.00" width="100">
      <header v="Hs hao hụt (%)" e="Scrap Rate (%)"/>
      <items style ="Numeric"/>
    </field>
    <field name="sl_tt" type="Decimal" dataFormatString="@quantityInputFormat" width="100">
      <header v="Số lượng thực tế" e="Actual Q'ty"/>
      <items style ="Numeric"/>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" width="100">
      <header v="Đơn giá" e="Price"/>
      <items style ="Numeric"/>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" width="100">
      <header v="Đơn giá" e="Price"/>
      <items style ="Numeric"/>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Thành tiền" e="Amount"/>
      <items style ="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Thành tiền" e="Amount"/>
      <items style ="Numeric"/>
    </field>
    <field name="ghi_chu" type="String" width="300" maxLength="128" allowNulls="false">
      <header v="Ghi chú" e="Note"/>
      <items style="Mask"/>
    </field>
    <field name="style" width="0" hidden="true" readOnly="true">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_so"/>
      <field name="stt_in"/>
      <field name="chi_tieu%l"/>
      <field name="dvt"/>
      <field name="sl_ss"/>
      <field name="hs_hh"/>
      <field name="sl_tt"/>
      <field name="gia"/>
      <field name="gia_nt"/>
      <field name="tien"/>
      <field name="tien_nt"/>
      <field name="ghi_chu"/>
      <field name="style"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBHwD6V3UunWN6aIVgRxH54tr4q87GVZVWvgnDUOQXxf8JIZNO2/opWBYjySu/nmR0EZsiHIMc7IBNppe2qRuAc=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKVxK9TGet3gM/Cjv3oD2r0W3f5nMpJKIaEjvYiLjR+5sB0kkBB+hcB34Bk7ubRgufA1Ai1TAWW9dGAGqL2JbhS3</Encrypted>]]>
      </text>
    </command>
    <command event ="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPGgJrHvnYsH1poMOiP3rgXS8z8rpgxd/jgKvihcmAP3u3ZD032GfCrY4UMQgq9o/yBV/ixg1jHjBISDaW7aOP8=</Encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&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</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Save">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SDf6xXA4nsPmzyJS+sI87jl5W80JuhvYoWhbV30p8YiG4JHsM+QcP7EoWHaHWKh3ru2NNuiCOqeJJZXXl8j5TVK01Td+XdZJFf18Ky4tDSPWd2OVeBLQ64scOvK3Rs9f+ECrEx2VQOi1YBHbm+wYZ3SZk2D093D6WjJyztiGe/0</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwNJb7NU+Jv72TBsR/SB74QH6a//Flg9ThtbAxKXedJeJ88OOstDPP2iUxte5HWOgS5N0ocLtsUBsyksWya6czYAqcC4Ty1PsWfAbD7nx6BbdT5oP4PG1ywZeSpUtF0byDhSbx6GAVYTQ1hToZ396sJs4Pl27hHrfyPVQmv3oUvo</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Save">
      <title v="Lưu giá trị chỉ tiêu$$90" e="Save Value$$90"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>