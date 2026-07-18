<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A0126\ReportCircularTypeField.xml">

  <!ENTITY defaultForm "V20GLTHUE3_28">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky1" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Từ tháng" e="From Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky2" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Đến tháng" e="To Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="bo_sung" type="Decimal" dataFormatString="#0">
      <header v="Bổ sung lần" e="Addition times"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky1].Label, [ky1]"/>
      <item value="11: [ky2].Label, [ky2]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11: [bo_sung].Label, [bo_sung]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLCheckProcess;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHai1NL/F43lwMSgr14iP+41Uo1idtrwSmh1DF6GuMxhmFjtGloyGBov6JdbYE4deVhZrhoIwHXdYptXTjeSvbdPVkjWdZPGLQ6EbxfhoprKxQcJoTtw/Ap0aubNq/IIbAwYa98snztnrUp56LslQdF3goPIOMxuFt7F5M5FivLGHVnuTsUnWZaSNW1HwArdSAUn9GA5+deXGmowG1L+15yACHwlfyzU1mfh0VA4mAmZoSSqyU6CBz4Yp3DwuiUqSX6v5KUBPBECoi1nPCWUzSM=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1KziuitzclMLZrbpfolDPlQxVqJa1ncuTa4i8l4r6mXQ9AJrujWLk+9Nth4VOxGjI63zz+XeSjVSlmLi2BxNOtnbvzZifLjQ0WG50FIN+5BYYuwUiXQRy9F8ZX/IbLKvu9Ki2RJm3MZA0whN8E+68adSCLlsMUgP3M1hcaVOUveOZ+OP6Unt74xVpCfqn+5mFIvbKezFn5KhxZzTFxbZQTMX/3IaDt56Vl2c6q1RJUJRfQXfXcx/NJuxWE8qCvpiv/tVrZwQYpUPM+AS2Byu7+oQ54xuvyhYz1aR05vsb0hECPAklISjoIdlcEXNV6hLVicDfusjKNSOaR2Axu0RgDYRMkwcVlbbGwDJLCM6XOTGZT</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>