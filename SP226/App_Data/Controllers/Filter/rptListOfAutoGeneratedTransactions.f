<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY defaultForm "V20GLTC1">
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

    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Bút toán phân bổ tự động" e="Allocation Transaction Entry"/>
        </item>
        <item value="20">
          <text v="Bút toán kết chuyển tự động" e="Closing Transaction Entry"/>
        </item>
        <item value="30">
          <text v="Bút toán chênh lệch tỷ giá" e="Exchange Rate Transaction Entry"/>
        </item>
        <item value="40">
          <text v="Bút toán đảo chênh lệch tỷ giá" e="Reversing Entry of Exchange Rate Difference Entry"/>
        </item>
        <item value="50">
          <text v="Bút toán phân bổ khấu hao TSCĐ" e="Fixed Asset Depreciation Allocation Entry"/>
        </item>
        <item value="60">
          <text v="Bút toán phân bổ CCDC" e="Tool and Supply Allocation Entry"/>
        </item>
        <item value="70">
          <text v="Bút toán phiếu xuất chênh lệch giá vật tư" e="Auto Issuing Transaction for Cost Difference"/>
        </item>
        <item value="80">
          <text v="Bút toán phân bổ chi phí sản xuất chung" e="Production Overhead Allocation Transaction"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
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
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" check="status = '1'" key="1 = 1"/>
    </field>

    <field name="ext" readOnly="true" inactivate="true">
      <header v="" e=""></header>
    </field>

  </fields>

  <views>
    <view id="Dir" height="64">
      <item value="120, 30, 40, 30, 100, 100, 130, 0"/>
      <item value="111: [tu_ky].Description, [tu_ky], [tu_nam]"/>
      <item value="111: [den_ky].Description, [den_ky], [den_nam]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000: [form].Label, [form]"/>
      <item value="1100001: [mau_bc].Label, [mau_bc], [ext]"/>

    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNs2kX1wDuhnLr2fc5FMnlzeFBLSshjwvCc1R7ZJdsNP7qqCPYq/75qVvBZYE6XosK4dM3Zj31a7HQGYTtVF8vKSuTfUm4Yt5djeAAl+/wmVUASqgnFF7zFh6VMxKqdJnmPotxmaqMUz50qfaPSBqnckCK0XLiKrp04UimsHL9Lt9e49a+ng/vZM+BFOGVJSZw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUaG0xOv0B+TlH+OdNVwzhzlom/ZibwT1RDo95di5msVF3Wo1dwH52EKbDwholXi03UJlxI12UQ6j0uiiQMGaCswWWbSxok/0Dj4Nbg/08RA5neJHJNivf79bh4HktTeZnLuNangWWm97p1YJS09FPQxDHtuwyjjAflaloznPuigRdI7yS5KVxtQ3rGNODC5Zc8M7MOtMUcvvqG2wtLmc5Y6w7MZrT9FBfA4E2jeTcK1MeeRgs6tFSOx2mDWG8ZqPBk0A0OxkRDic0AwO1Hjb5nllbUxgjCPwZHnNPnV4cWETho+xWA23EUpUnTCOu0WTtUhLk1Q95XI3DK7+GbDZMwZz9vhAhN8ceQV497qiKkIUuPTNFU9SNZkKVmw0t4CnbeRs3pTDGUKKNpz3Gey/TPczsrWvlZ9T9Mbbof+bYYiYKc7sHvPPYoulFkVbxDdx5NNK833G0sbUWM6ga6D4EATHkx/8ekNGXbwAc97t6DzeSTK07S/JpZmaE1Uy4/r65cc2+xBFFQhtC+KYxWQiCCJ95lJasWq5MZ2FtLmaF6SCYvGElBrY32PS004Gk6Z73zw9lFl2nRTwKGs3grGRH/Z90hALvW0Sn6ZiTvsb+DoIUGntg0OEPLV2b1F0HyaeLpDbM+PQGzqWwIveKn8thHRxW/ohnRj8CDRySWRwOLSlwq56AgO9Hwj00t0tIjcJaePgebdkcPDCpCiqOlmQKdAg+PwvA7cCaA0dIdPi4DIBSPSmQ2xYodU83DZJNCd4V</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>