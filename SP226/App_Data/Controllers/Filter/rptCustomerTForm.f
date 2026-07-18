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
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" normal="true" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" aliasName="defaultCustomer" allowNulls="false">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" normal="true" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn=1 or nv_yn=1)" check="1 = 1"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1KzoFQzpUtyxRKhl7OwrbUCkwxvjs/VV26AQvwNMS7RQkkl7KvNoowpRX8dXrYLR58Lw1OKu6Cna++DSmT879sDZvJBd6xq+3kf+fBZIz/PmvzeyPK7WT1ANvG0qQvdZBOF7bMyERpJh9we50i6ODMBQ0APSS5yanzQvfzZBBI2F/xNY/LW8D8Hq0Gue7N16vEiwdGJ46p7dFNeoQV7z+A1nChjW595yURbnPWuQ/3ipg1iAQYh+gQKnmHVf/mNBM6zGmdBdK079wXPyx08vy9QTxVxcjvq9GnziTCHif9pDFxoRdmf+zlZ7ZTRFItvZpb34yp849G4Dj43vipvUQki8gB7qDINWeCsV0Ecuzj6ejEcTLYVt5ArBZkienuIXAD7dhfIWbbtGmSOWNLhXDPvCCnd2kY8CVf03vaRu/IFT4cN2ElL57gbXeH9vYN5Hz0GnaxjjTsfuPrUzKHAOMKV6Zn8py4sD/Uje8OshgTz30/H/uJO+ow3WcrW6Nc4OKgGIHpWaGnZiEC0opk89lq7gagFlOj3ueQYQBq6O3BOvhKA8lZ4GeQJsTwspeaOXQGPtut+JjePIZi1ijmNeT9aIbchE6/+xEk/tjzIZNcMXudJwWLEr6ExFDpmx5NOpCXSJ5mWrabXy1FGLIIw7uhbVwcjVfLOStDoCpZoN4nuEXFpMHqDwdCYXCuDv8N8bMkcwn5g2FViNOo2m1i0ih4x3j+Oqh5vER8yMlv7JgTHJ2fqXG7Z7MCBaH4MO2xvWAL7w==</Encrypted>]]>
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