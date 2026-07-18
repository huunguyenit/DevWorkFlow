<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptSalesOrderList">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY % SOApproval SYSTEM "..\Include\SOApproval.ent">
  %SOApproval;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày đơn hàng từ" e="SO Date from"></header>
      <footer v="Ngày đơn hàng từ/đến" e="SO Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đơn hàng đến" e="SO Date to"></header>
    </field>
    <field name="so_dh1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Đơn hàng từ số" e="SO No. from"></header>
      <footer v="Đơn hàng từ/đến số" e="SO No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_dh2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Đơn hàng đến số" e="SO No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn=1 or nv_yn=1)" check="kh_yn=1 or nv_yn=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt">
      <header v="Mặt hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Kho xuất" e="Issuing Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_giao" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Hạn giao hàng" e="Due Date"></header>
    </field>

    &SOFilterStatusField;

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="20" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu in chỉ có số lượng" e="Quantity Form"/>
        </item>
        <item value="20">
          <text v="Mẫu in số lượng và giá trị" e="Quantity and Values Form"/>
        </item>
        <item value="30">
          <text v="Mẫu in số lượng và giá trị ngoại tệ" e="Quantity and FC Values Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="210">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101--1: [so_dh1].Description, [so_dh1], [so_dh2], [maxLength]"/>

      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>

      <item value="110: [ngay_giao].Label, [ngay_giao]"/>
      <item value="11000: [status].Label, [status]"/>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy83kk4airzT8cLd6DkoBHtd/vPemTM98HPG61JBrPShVH5iJeRvUE1N/zP8ZkF8jkBVS0aaQ9B0JhnyWKHVCs7lUGsyIzLlUPl898dJriJV1Kz/PNShQ+EjGr9P7WTGhwBIv0K7eDslmsSiZiNlSEiSj09FwCP8BCMsuTGjVs8kZOBUOWZUuGZEKGKCeo3dQASAnaGAug68Wrvej8mHC63Kw+6y5Vby6APtI826PKj1Qri6mDWAiSfKJyvQaNySNQGjNbmrGi/nVOayCHDp5jqwHyn/iNMT6VLBMlNLm4F4osdfL1KMJucpY4eKqiOjWUNSdc+Dt5988R1XofcxKUyr5tBXaLatAD2j9gCkFMuCCOJdgIblpXh6oIGh/R7OKGCTEjINEddQpCmbS4Z8UhFEE58y74xxVqwKTomL4r+bgMCLZqhH/g6HIhoexvD2J3tDrqNKv7vVNWE2gMoyKois1dq8sJmgcM2VRD0s9HZf8QQF4eqVeFwfdg3qiuDIB5prRt+92NEUnaXhbnusjeHSGdSWwFdVwluKj4p4743MCHTeXEjNe2Qz9Xz/uZtWQhpTZgmQ3lGahMfjEgcyNbw=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kabgBcKsgcm4iH2SLI2Ez1+</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUaG0xOv0B+TlH+OdNVwzhzuc5iFEHMRQESCcCnFdbRaZ38bLFS6sqCpfsUh9e0R/mFrfwjqMPpkVmvqDBsA43H9zrFlA2fMfgey9NJenBI51xz1E8jc1L45iF6VJfDKxqjNZth0g6h7gvQ+G+W7msXUSWpSqNiAH6UWM647Jdcm7BW7KOEZf7Q1irz7mZ+vlcidc83inaxq9ZPNVkVNf4c55Q8YkjoNYltwl1qkRdgtDm7a5Y7XlPHruld2nxKQJUN86AT8Kl/AYWbU4pNDoWLLo5n66Oc31tVYrhpEsKuV849AmKBaRUOh2B3RPrOG6oVMDp9/EMz4Zq6E0Y1u9FNzqLhpsCOzu+KrvqZRsoaBi8S65pW0Dikaq43l69LeJ79CgH5ANSugdBf9b0TH+ZrbvmqC88fk5s/8W7KcnkInt3Xd+t4OTEV23bxbqcw47FRVqemER9G4xB5inbS//DcaQk9QaQnNrB21agVSDkt4Cp2CzJCYGFkpuOFm1w1dq5pkl0IS24L2zRy/Y5PKlmFa674xVJbgTPVHlFc1U03WJ8nC2L4vCyUgoDn2Z12HAuJPW1sO0RG/vTpL0NlE/NBLTxIks7I49TMLkJUNyWknvr2gTviWWPNAk60lCSoV0aRy4hY/0yUl33WQKYIUjViQQ1Hpwy+lP87ivHzEsxlHLNAm/jRsIZUV3sZj56/idFQwpQSFsUaYV5YGo4OumlpAi4Sm8XEbnt32zAk1sVA+kl/mN8j1X9TppbwyqLL4zi40DcIOMpQd5mJ7tGlZ0wRn2v+KxGcjZGQkHwKanJl0iiH0gqTFAXDLN/IchV9/Fso7VR9N7015EXgr2eoIytgJ99bl86W+G9hCu2VPZifg8=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>