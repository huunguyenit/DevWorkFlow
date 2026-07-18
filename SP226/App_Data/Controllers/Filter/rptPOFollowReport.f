<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptPOFollowReport">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="PO Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Đơn hàng từ số" e="PO No. from"></header>
      <footer v="Đơn hàng từ/đến số" e="PO No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name ="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Đơn hàng đến số" e="Order No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_kh">
      <header v="Mã nhà cung cấp" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn = 1 or nv_yn = 1)" check="cc_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_gh" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" defaultValue="new Date()">
      <header v="Hạn giao hàng" e="Due Date"/>
    </field>
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" defaultValue="new Date()">
      <header v="Ngày báo cáo" e="Report Date"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="20">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu in chỉ có số lượng" e="Quantity Form"/>
        </item>
        <item value="20">
          <text v="Mẫu in số lượng và giá trị" e="Quantity and Values Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 100, 100, 130"/>
      <item value="1101-: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="1101-1: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11010: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11010: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110--: [ngay_gh].Label, [ngay_gh]"/>
      <item value="110--: [ngay_bc].Label, [ngay_bc]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormLimitRight;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM0GUti1kCp50u/Joaj4mLrRFBFrkg61EVyh0XGpA19zx05m0tH1OgdPSKya+jhQB92mZjn9Ot4aMXMuRM9wUx/xclTHT0ytQP5YzsDNDeJ2</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHXojy5noBgKx3Sg2+EUbM3n/SN4SW19wrMqzniEJQHD0sUhSR1CmeeceyKifxxdWAsyX6c2sUBumVG0M/aipwYW3oFXcIvYigvlJ9bklr4tgGpzTKXSAyQS5Gb8m+vUPZCAzKfFuZj8Sud3WxRWYrYEM1QDhtZsRVnrmdWC0ewoGk6LGg0dHmCbonf+LqItmw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kabgBcKsgcm4iH2SLI2Ez1+</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdE6rJ7cm8qPeSE+QL29ptF7Nk7oZ65GqM429UflgnXKeDcDbOpzoGt/MFEQ7+jZ+ud/T90N4VeH3SV/ZesZ5zC84poHGhtW+gGlT2iD61iqOs9pTdh5NOXnYKI+vG8oLxxYzDV2EJho958rDsGlYATcC4Erd1/n4otHMvqD/g/VDGnypTBLNAAg1YDlymgr3QndDeqLYhE6hWefspd+dfJRZcr7tn2xRTtnoU8B8Whu5pWT953k9eYQJU3vcC4QGlfA8hea7KYI07uSW2a7z+M+OeMVPWW7oKotvKikBwjEvLejxZ1OFnVKOJIJHCEe1mG+VrRehEg7Sn2trsZgZdN1+Y03wcI9IKFFjFnz0RfKmHzuuzzoZQn/GoIE484SB4o6vQyULdBtJzJ36Oj4O9OkNgulcsyei/PWExsjGbAWS/7e0PPXdaL2PdbvU7hFbnYx3ud6xI2vuNCkbjEug0S62piA9z0PVUwtSnvZwdFOcXe4pmaUhPJrTsRB5lxr6IF+tccxkRDoJLTfp0UyLr5pGm83Kqg9wGJ9ZbZ4nvqDuAvRoN+/1kwMlY5JMGESeBSMP2/3TRm6EdMRhwkyWKj9kjHQyhSidThAjyv+WkucB</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>