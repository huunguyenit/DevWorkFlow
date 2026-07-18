<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Tính giá trị các chỉ tiêu tài chính" e="Calculate Value of Financial Articles"></title>
  <subTitle v="Từ kỳ %p1 năm %y1 đến %p2 năm %y2..." e="Preriod from %p1 Year %y1 to %p2 Year %y2..."></subTitle>
  <fields>
    <field name="ky" type="Decimal" width="60" readOnly="true" allowFilter="true">
      <header v="Kỳ" e="Period"></header>
    </field>
    <field name="nam" type="Decimal" width="60" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_dvcs" width="100" readOnly="true" allowFilter="true">
      <header v="Mã đơn vị" e="Unit"></header>
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
  </fields>

  <views>
    <view id="Grid">
      <field name="ky"/>
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="ma_so"/>
      <field name="ma_so2"/>
      <field name="chi_tieu"/>
      <field name="tien"/>
      <field name="kind"/>
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
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d3btzoz7IUaW9A32Rf4fAW2R69SS6YENYLAa6LL5zfvgfIwRmeBT/AHSwv9Eb6N/9m/ZYtVtzhENEwjKscmXLzeOIZcVnUy3SVvaoeCV8Ltym/D3f6I7YB/UVyia3vVJS76dRe/0Cx0Cj7LZb/FFV0WwR2t6k6YP0WMw8MelBbG+2rTsuwldMjNalweizzJVA==</Encrypted>]]>
      </text>
    </action>

    <action id="Calcutate">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d3btzoz7IUaW9A32Rf4fAW2R69SS6YENYLAa6LL5zfvHAkmyHMhO3Ao5cfjRW7OCPYScpJkB/EX7Z1YoGOVYhUOya3U3EyMuAviru79tvKorod9UF0pjeEipDeLQScyfd1ltECvABYWNRnbb/mkJBEQNkmmyF1TIsZ7c9/3cGD6yzNZpVWbtY/vjmhNYaKHAA==</Encrypted>]]>
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
      <title v="Tính các chỉ tiêu tài chính$$90" e="Calculate Value of Financial Articles$$75"></title>
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