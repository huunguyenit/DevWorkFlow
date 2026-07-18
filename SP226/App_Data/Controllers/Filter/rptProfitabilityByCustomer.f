<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptProfitabilityByCustomer">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormStockRight SYSTEM "..\Include\Command\GetReportFormStockRight.txt">
  <!ENTITY SetReportFormStockRight SYSTEM "..\Include\Javascript\SetReportFormStockRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY Identity "&Controller;">
  <!ENTITY FilterExpression "f.setItemValue('ds_ma_ct', f._filter$Pattern);';">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="group" allowNulls="false">
      <header v="Nhóm theo" e="Group by"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="tinh_ck" type="Boolean">
      <header v="Tính chiết khấu" e="Discount"></header>
      <items style="CheckBox">
      </items>
    </field>
    <field name="nh_kh1">
      <header v="Nhóm khách hàng" e="Customer Group"/>
      <items style="AutoComplete" controller="CustomerGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_kh2">
      <header v="" e=""/>
      <items style="AutoComplete" controller="CustomerGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_kh3">
      <header v="" e=""/>
      <items style="AutoComplete" controller="CustomerGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
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

    &ReportDataTypeField;

    <field name="ds_ma_ct" hidden="true" readOnly="true">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 80, 100, 100, 130, 0"/>
      <item value="1101--1: [date_from].Description, [date_from], [date_to], [ds_ma_ct]"/>
      <item value="11000: [group].Label, [group]"/>
      <item value="11011: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>
      <item value="11: [tinh_ck].Label, [tinh_ck]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormStockRight;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0wQbriUAVIzRroYockBFB6nFXMe0qzPuhqBmd5Zao5qAQwcfL/6V0/q0CX4n8ChMPwArKq79zdA7yEF85fxOWQoysdI0YEWPfZsBxgV0rovkQIyfQao2lfxUVfT6yv+7CHUM7NsE6A/U0/MzQWg/ie35tSGCOnGEjW7xpZa7M22uURliqdhMg6LHnvkPUBjxuYI2Q/T1Knmrb5UC3jvXa4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR71GqGW3kgH0U54LjwVJE5HoUUqk6P2yvF0VvgunktszeavEO9j+q0/4+ug4SSpJCRmKLb9uMf4qFGbXfYKqhZBakyWVbDSMenDPv5J9svk8TY0udJGNCUU9vqRTu9Z4yG35X1ErHd9HwmbIS9kPVHcP+mi2SOTmp4ozQ+sWJ/rYOqCuhNJYrD++rVVG9kWuOXn77aoPez7cFw2NYFW2PVokyHY/G5Z9nxBhKYyqEM4VMcfbepEu4VWnIM5snfG69WndaJK7uY+IpO5D6Rmh0E4fxP2fNIe7203YPjRZdd/18Ho45xr6NngFUvdK4xcRZr+xhoKK5BMRVUVk65nYg8TA=</Encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKK1BRPJgsUqzblUsPyGwOckJkm2lvE5A2ZzlVCLQxx0ahTQJa/yaw5JrFI1WmGd0A001a3bYOjVWKa51IqmTLBxNJsog6P3w/FHnWH3Qz4x5oO+Gf5GGf9T3wa9c/ybyGhVfSDm/Ts+BLfq3gAFBe8qU71swxygY6lwrq0/boVGfTjuKKMPQ+6UbBmAI6BGW0LYXK6NErf0ni7MVJrXx8QKxZrW2tl28Vf0mCJz08FG</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kabgBcKsgcm4iH2SLI2Ez1+</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      &SetReportFormStockRight;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTglkHqnaRjYR8qCTAKvDrzcgRxuQh6keovaXhyE65GTPgkOM0eWwUraig0e8BYgyjzR//KVJUv0WKd0nqXxnJTI=</Encrypted>]]>&FilterExpression;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVo3DbFsvcoq3D47ubR9Ztg1uI+bSyloZvb2OphmC+RidPARQcvh2OflEYz/2vOQTCO/XJ/C9CU06W2m2+cArXP/AJ08k4XnZYUzSXcayHEqqgs1dVVtyty/Y1m6ZvblSdkfY5JNjQ8OyCVwvDrkBwC/JnvY6WUuR84BbYe4YzgAtXC0SO0oGu7LxPdo/XED1Ukw4/zHIvKwPCkzplC9lrKNFB4tNkODHWH7vmaixZ3dAqMQByTx6U1gVY6HTS/qzs/1siJ6PyJeb6DGsea3jQ6oMwvy3ZoPSmEhDwj0lM+04Fjedo07TtFk9YzyRoBqlsNPrX5GXu4sYw7SfOTZEeRaBqWlpOEUIzaxfCi9Qr9yvO2SHEs5SMStlIISUddMq3euG7vfK0sN5jbaZzIkBJsZyjMMH1zIAPteyYnrzlXdFEYrV0kJDWazd4OGBqr6RYQpUctlQDgju4OhrIupozFSMHi0PBFAHjr5dCk3KXb8HrRIBKoz4QRq5r2jzLsNz9nhzKlKREojHQbzgfApLCrjC2hMzJ36PWT4u2u1t/fjhD5f9OTBY4E1KrrMktD4i0cY8WQ5zAo+ihH1FP/QDW7l6v8MaF4bsIP/624L8mjpq0aN2nJEoa701xcU+TvDsi47k5EVjQ9S+mAlN1DvsgpqpM1WEVkcgv40tyxlHjtVSA==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>