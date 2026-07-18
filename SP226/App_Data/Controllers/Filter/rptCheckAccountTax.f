<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="tc_thue" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Tính chất thuế" e="Tax Property"/>
      <footer v="1 - Đầu vào, 2 - Đầu ra" e="1 - Input, 2 - Output"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_thue" allowNulls="false">
      <header v="Tài khoản thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_tk_thue%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <footer v="Chương trình kiểm tra" e="Checking by Program"></footer>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 5, 70, 100, 100, 130, 0"/>
      <item value="1100: [ngay1].Label, [ngay1]"/>
      <item value="1100: [ngay2].Label, [ngay2]"/>
      <item value="1101000: [tc_thue].Label, [tc_thue], [tc_thue].Description"/>
      <item value="1100100: [tk_thue].Label, [tk_thue], [ten_tk_thue%l]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KmUl/jMrq6z1D71Awtp7C9zN4eiGYEU62YgjTj8cx7JBjQWot9ljXnMrubwKgt6yowWQHGYcYJ2SzrYTxC56+d+gkkCMXwQOQSi/kkeJiDMIocMSuDwar6yzWx4K1aMxkQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+Y6TIVGyvLgi9D0eJpQVfYE5U6EiS7MNd4dNFhPWKzfC/3jBdlD+DbyevRvD5aXsqcbOCeSx3pNqdZ46Rlw1dYjD9Wp13QbwO4RtsPyHzv9Hl1W3r34CxYdZLwya6ozvhRuENKMJppVX3BF+EKuzH4QoEC3xyPh6CXq9hbf2mUsjppe2s3M1xDybgthe2EOktRHoGuqyS9yIFt5rqzPG1svqNgfefPY2zaqs/you4mjjcOGdKtYVJwd9OiRnuMMNqhcNYSPGqkf54CZ5FB6obnYN2JefsHJ5NQ2nEjkKvLRs6Jo0wegwYquQMt0TBDg2SULGI6Ve9PUZEa473X5oR/V+aI/lhUpY2Io5jNEn4vX/hR9aM/I1Vez2vZB3K569kKiVrki1aD4Jmsf8kHpX5YIjczF9hLXvU2OHqEaPAn7bMN8PktOXhVvpD4pXmF/2Uik+1M3CBrmFevh1fjXAb4</encrypted>]]>
    </text>
  </script>
</dir>