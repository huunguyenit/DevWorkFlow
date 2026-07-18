<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">

  <!ENTITY defaultTable "gltcpt11TH">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="period" type="Decimal" dataFormatString="#0" clientDefault="2" allowNulls="false">
      <header v="Số năm phân tích" e="No. of Years"></header>
      <items style="Numeric"></items>
    </field>
    <field name="periodFrom" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="yearFrom" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="periodTo" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="yearTo" type="Decimal" dataFormatString="###0">
      <header v="Đến năm" e="To Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList" >
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="11-----: [period].Label, [period]"/>
      <item value="111----: [periodFrom].Description, [periodFrom], [yearFrom]"/>
      <item value="111----: [periodTo].Description, [periodTo], [yearTo]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsDCzDTbAYjxedDUkYV9a1omgMm+cPs69mQwYzgY3h4nm01Vlkt0i7ZN4aRatfJtsDQn3rKtCc97AlUK5bm5uQIgrIJPOaPIZ+z63f3sdcWm2XBiS2OMPrmO/HZtrlxXovNPoGupmuZmPE51NlEpMpKsAbRLGCfcTjqr4MZSMbO/kqt8PVSDByzHG9aXC1/xKzE=</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd27uVwqIfcqTxdkJh5W27c+5VnxWD50aqtVX/Pv6MPJlptVGM6/IgfzAFrAjvmJA20WC6pmDEeh/j0i40IlAoUbCNlIIT72aMgv6Le8ewn+wysVcILc0V2oaIihBo+i+D9e</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAA2yLSlHLMIpNRbXv95PEzLcpXyvZZ1194114mb0OWgMUkVVswi5wEYByawqN9j+F1w3KgaMy2TqtBwLPs48jpsGQdIoZgViS9N0b41VtayJ9QmqnNAQmSzCGthEUzR6ScTwFXdvTkPFs31yFr6BhTIwkOt6YEC66g6cCm+nT7coIDkWYfAK7CJdNOEJABLroD/KAGruF1YlgvSjd8zWSY=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9zY9AhuYUjQ0f5+izEkBIGXrK8f97dojMN5rH0H1QDVRhvB3OUzuc3SeTqYO8UWdumczd6D8CsCkBo6vTg8Ix1zrQYgO1WxlS8sKEalfDw+0QsojALEvNMjRLTYedLndHBtjclsXu/EL97Q3THkOjE6S3Uf5o5goOMYo2To+TbYEaNEYjFR9vi+geaY5M/cOCCWIg0jEENWewUiTHNx3Rh/cPehg7t4MJ0Cg+bHKnDLHjGiTbbNWGRncB44lb/YPrYeQr97tSyDnobhEfLw1cfmoND04/Z5lLevusJC+Y/tIEVXEv2m1h50np1ANc/0BB1v7TtBbprsenQ2KmTL2JBHV3yDVJbEin9xjDBOHoUeZyG2s/dB+3yC8flxmNd2kphmexRSgS8RdLBJQsTecq2H/6l/l69Z7PbU3ga1yGjQsI+HXzfkftS0LX5aL42f58r0AK+LAqdArPw22xAQvXwDTfSbal2I9YrAbFoYrIBEGVDZJ8tvMoyNs4TjIGHX0IppOc6Y3otvSTEyeAAGW6nvEc407Tl63XstZPrOXd+RHdlk0tet7Kgfvq7EBi9g+wPnJV8INoUubCdmMuJxenCkPypo8vq88ukxDyiHcyJuOWlql0p582tJlsjaCeV5H321ip7TLgkB7KbvQoDUDHrK/J6FhPzz5cT9ns5S/WI4FRPnL3chVBAeSNhO5hZLqos5b7h8+bvTW2cvwhKTolhsqo2Irc5Xrt/SwqWv/00dWoJDWJzQXyR4PkpwbCcF/fIZNEx3Rmvjutn44oO2nCk0dTjx7Ch5ezmDTnJGUAvyEA==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>