<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Nested SYSTEM "..\Include\Nested.ent">
  %Nested;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Tính giá trị các chỉ tiêu tài chính" e="Calculate Value of Financial Articles"></title>
  <subTitle v="Từ kỳ %p1 năm %y1 đến %p2 năm %y2." e="Preriod from %p1 Year %y1 to %p2 Year %y2."></subTitle>
  <fields>
    <field name="ky" type="Decimal" width="60" readOnly="true" allowFilter="true">
      <header v="Kỳ" e="Period"></header>
    </field>
    <field name="nam" type="Decimal" width="60" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_so" width="100" readOnly="true" allowFilter="true">
      <header v="Mã số" e="Code"></header>
    </field>
    <field name="ma_so2" width="100" readOnly="true" allowFilter="true">
      <header v="Mã tra cứu" e="Lookup Code"></header>
    </field>
    <field name="chi_tieu" width="300" readOnly="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="tien" dataFormatString="@analysisInputFormat" type="Decimal" width="120" allowSorting="true">
      <header v="Giá trị" e="Amount"></header>
      <items style="Numeric"></items>
    </field>
    <field name="kind" width="100" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="0" readOnly="true" hidden="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ky"/>
      <field name="nam"/>
      <field name="ma_so"/>
      <field name="ma_so2"/>
      <field name="chi_tieu"/>
      <field name="tien"/>
      <field name="kind"/>
      <field name="ma_dvcs"/>
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
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d3btzoz7IUaW9A32Rf4fAW2R69SS6YENYLAa6LL5zfvgfIwRmeBT/AHSwv9Eb6N/9m/ZYtVtzhENEwjKscmXLyq8ezUkeTJAHfqyWEARFC4Aoy5Aj42aFnG4o6P6r9nS9FYxciwC34AJU639BT9F2DktYbzZhlCzohXFl9ZPM9JGWrPvPPnJHIwCgksse6oCw==</Encrypted>]]>
      </text>
    </action>

    <action id="Calcutate">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d3btzoz7IUaW9A32Rf4fAW2R69SS6YENYLAa6LL5zfvaOt6bT2BDo6T3e7POUVS5m7fwaA8cy2L7s/0j+jtyVAuiZmZfMe3L53lEp2zaGNiVGE8UW/sTKEjfVQLXySgpZ7Lhbjv6mA9UMRursD9e/k=</Encrypted>]]>&Customer.Nested.Report;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcF8fMb3M/er0xXcHGB9wLOg70D/OWALXHW+fgkZZ1mM704wLjAwmXlK13QAllkPSzg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxyncABl9eWuZWdNKDKhrY5CPyICgSu6sD125+y/qGWAoQmqhg2dejwx/eBMIzZuN7n6LJWTHb2ktkvXDgoTdGIWNp0YNeUmRvVLcQxh5sIZ6gxlxuqOoYrMwQVR8JISoiOmYnTAMbetJVMXxMogbWvBRisffFbEBaecuSjNfX732D/G1Rnx9n9Wc6XeZwjOS/y60Ef0ziJ/wjSb9SogfNM=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Save">
      <title v="Lưu giá trị chỉ tiêu$$90" e="Save$"></title>
    </button>
    <button command="Calcutate">
      <title v="Tính các chỉ tiêu tài chính$$90" e="Calculate Value of Financial Articles$$120"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
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