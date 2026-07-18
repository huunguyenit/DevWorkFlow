<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="fromPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="toPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="tu_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Đến năm" e="To Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="type" dataFormatString="1, 2, 3, 4" clientDefault="4" align="right">
      <header v="Loại phân bổ" e="Allocation Type"></header>
      <footer v="1 - Doanh thu, 2 - Chi phí, 3 - Khác, 4 - Tất cả" e="1 - Revenue, 2 - Charges, 3 - Other, 4 - All"></footer>
      <items style="Mask"/>
    </field>

    <field name="nhom_theo">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList" >
        <item value="">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Loại phân bổ" e="Allocation Type"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111---: [tu_ky].Description, [tu_ky], [tu_nam]"/>
      <item value="111---: [den_ky].Description, [den_ky], [den_nam]"/>
      <item value="1110000: [type].Label, [type], [type].Description"/>
      <item value="110000: [nhom_theo].Label, [nhom_theo]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHai1NL/F43lwMSgr14iP+74KXi5kE6utKDVVixC3CdK9cC2Qk5DlR8njuDm0ajCRpB8HgZ3jtjIn1SmbABrXRC2gWZPNUZvE0tHLKgwzFA59cqBoZQUSZc88RKzuVoMAiysbS+dj8nzBF7y9pHuOzT31UeyfoHVUqph//ONsOhkFRCtS1tYEG+LFu7qCuMOl9fiLUn4Yqjp1x+0qsT4vGdGHEl3+6JGoLxAHpBTvR3/</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUaG0xOv0B+TlH+OdNVwzhzlom/ZibwT1RDo95di5msVHCyPErcrNMbewXznlm6nanMXTap1mWWJVHVnpwfjnBq/7x/vM4w7gmA70hksb9IpkmqNE9FUNBegZVhoV/Qa/E0Y47HZdLrzphzSjwkHImL8yH0+LW3rc4sG0LqYrmwyahF9WOMT7KOjeNn9ySt/x8fEv3wuiAwUNjms+8LuIzVM8fz+EJgRnOedh6HVUyTzqAPc8h2XcBuo43tzSkuW30tmIU3x9+iiSqaOi/QkaSxR3kUB1InH8uYWMHVpGpCnLT9SpJCLtkp0COolp7qRx0iH1XyEpAsRJLkMdnssL8dNByQGzdH8u821X67RW4m0do9/zzR7bZc7mcVDmipsdDIEdDQeuxx9MT9tt3Lkth8FMm45ENRTdpAM7A8MgGx3KoZ/Jg5RWfxpThXSwuUkroK3wGXX3Sj1SnN7BjgWygMYaVd2VZmi1FooRTAKD7onE=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>