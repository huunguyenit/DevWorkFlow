<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY defaultForm "V20GLTC1">
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
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <footer v="Chương trình kiểm tra" e="Checking by Program"></footer>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
    <field name="kt1" type="Boolean">
      <header v="Kiểm tra tài khoản vật tư giữa hạch toán và khai báo trên danh mục vật tư" e="Check the diff. between item account in entry and one declared in item master"></header>
      <items style="CheckBox"></items>
    </field>
    <field name="kt2" type="Boolean">
      <header v="Kiểm tra tài khoản công nợ không nhập mã khách" e="Check Activity has AR/AP account and without customer/vendor ID"></header>
      <items style="CheckBox"></items>
    </field>
    <field name="kt3" type="Boolean">
      <header v="Kiểm tra nhập tài khoản tổng hợp trên sổ tài khoản" e="Check Activity has General Account"></header>
      <items style="CheckBox"></items>
    </field>
    <field name="kt4" type="Boolean">
      <header v="Kiểm tra không nhập tài khoản trên sổ tài khoản" e="Empty value of account in ledger"></header>
      <items style="CheckBox"></items>
    </field>
    <field name="kt5" type="Boolean">
      <header v="Kiểm tra phát sinh nợ khác phát sinh có trên từng chứng từ" e="The difference between debit and credit in transaction"></header>
      <items style="CheckBox"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 5, 70, 100, 100, 130, 0"/>
      <item value="1100: [ngay1].Label, [ngay1]"/>
      <item value="1100: [ngay2].Label, [ngay2]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="-110000: [kt1], [kt1].Label"/>
      <item value="-110000: [kt2], [kt2].Label"/>
      <item value="-110000: [kt3], [kt3].Label"/>
      <item value="-110000: [kt4], [kt4].Label"/>
      <item value="-110000: [kt5], [kt5].Label"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KkgxUfilPknsM/IRDgQQ7WlGvs/6HNoQ4Ts7vy8QR+FtLXlpMhQr6lhPL8F83O5mJHgc7smYJ7aYgiQpxquIZd50mi6CvUsN1cXPNIzXEAdq8hL/d3EBYGoku0e1YV5e9OHj+yE2tiybTisXLekdsf4=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+Y6TIVGyvLgi9D0eJpQVfYE5U6EiS7MNd4dNFhPWKzfC/3jBdlD+DbyevRvD5aXsqcbOCeSx3pNqdZ46Rlw1dYjD9Wp13QbwO4RtsPyHzv9Hl1W3r34CxYdZLwya6ozvhRuENKMJppVX3BF+EKuzH4QoEC3xyPh6CXq9hbf2mUsjppe2s3M1xDybgthe2EOktRHoGuqyS9yIFt5rqzPG1svqNgfefPY2zaqs/you4mjjcOGdKtYVJwd9OiRnuMMNqhcNYSPGqkf54CZ5FB6obn0Ns02uWyRhqubcZDenVC6jLEeuM0GdICsqg9sXc+zeCNpbIox5V5MQJcep/onslsNMV5ETWKoBXiNd70ytyd0HFyIwqvAZwZ5aK3NdwYPr4XTfK7ovrC1Zy7e0+uJKZqocjpMyBNdmHLZeg5UqwjPlHIkX70Tf4WecDzwjLaJllfwF+BGVF77GgWeBFJ3orOYPFmXEmQi6dupJqloJSsf9Bq30VosGq91EXqbnbI76s=</encrypted>]]>
    </text>
  </script>
</dir>