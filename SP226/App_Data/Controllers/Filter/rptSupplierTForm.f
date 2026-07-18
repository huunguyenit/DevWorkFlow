<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultAPAccount">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1" />
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false" aliasName="defaultAPSupplier">
      <header v="Nhà cung cấp" e="Supplier"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn = 1 or nv_yn = 1)" check="cc_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130"/>
      <item value="11100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="11100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="111: [date_from].Description, [date_from], [date_to]"/>
      <item value="1100: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9eOZfOEWQcPADKnaQdRF5LsRwUBLzz59NtKqNIL+oj3iMw2ssFzZUtUpqJxkQhMtzByELKbaidot0ryNOhfcHqcjdCgBzNTqs1eAuaBGqLfzKoB4knNjyiNNAm6HRDIMSmR6JXIuiADKC0Y0nThP4anfol95qciQC3OzxiCiFpaGc1Uh4tpLydQCX6aWby1Kqsrn6I25ABm34zePRKc6CjgWycH8oXnCfqueE8TubejYI5EYeCXxKGPaS1tSgCbKt8XjKEWdKJe5IXvj70ZsQl1nJ5rGPWMa+x4iiMfty96URfBI1YcdatizCYQxfRGHQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1KzoFQzpUtyxRKhl7OwrbUCkwxvjs/VV26AQvwNMS7RQkkl7KvNoowpRX8dXrYLR58Lw1OKu6Cna++DSmT879sDZvJBd6xq+3kf+fBZIz/PmvzeyPK7WT1ANvG0qQvdZBOF7bMyERpJh9we50i6ODMBQ0wmxQk8jM5HR6P5xGnA6IlshDocoTiwUB7NlkBhpSteibqXPwcCqqVpW+GNILFesUixWKYlmarujDMi+3/R5v4eJdsyOl/GpPnrzGZPcN2gHcuTuSCCXyOfPVEpZ1AvTs4Z/4XbvXbZ+1MjyRzf3dLz8u5b9l7u4cbWKCpdQhHnqlHGw5x8gtYuJgqktyaAKgQlcF8RizYQU3K23bL8jbDRPgVbAQrTYayenPSxz0lQBXKFBm9iG7OhQiKQAG9lL5Yo1c+byjHxGilgcdeaM0iq/PC4mQ34gWCAYk0eEHOsCkOgOiBQ9o46eJNRo19ifGlHHz4jaGQ421cBsPFv7FjiMV9jTP5t7KnZBijGdqv5dWLSaaG6c5PlQLHmBjy19c1Bkltb8QOYL64G+akCoboA0eqiGLtdqLaNzVSxAzNTUrCfQAraUYPiThDZ022v9/FCpRyXUX39yJ40bsYHbAO3dLrUc2ySQOgPdIeqfWw1CQT6DQWaYSo4YkErDTsQgPNk2BIlcs7Zv+E5poMOROTUXL8piWyQf9QkiV14/VM2ctZT5fGNXcOC5cL6Y9olI44D/ULtk+YqXdUmdHKsXr1lyuWHoUtmqRdy8xbUM0YCg==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifZ+Z8xb2vrymO7L8l1iONMshIBb8irW1YDA7cu+DB6ur11JOuGhj1b0YBXP2XIrznWtDX7nCPm8raIcGqV2RNAf/sP4a9d05bIuC8aZFPACReSn6Yh6f15Zlo7HwfBY7yav8Y00c9ooROw8QjMyGzjMq657SUpxeCdV3tCeBYOFQ==</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>