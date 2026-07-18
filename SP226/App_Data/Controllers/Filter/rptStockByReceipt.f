<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptStockByReceipt">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Tính đến ngày" e="As of Date"/>
    </field>
    <field name="ma_kho">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_vt">
      <header v="Vật tư" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"/>
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
        <item value="30">
          <text v="Mẫu in số lượng và giá trị ngoại tệ" e="Quantity and FC Values Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110---: [den_ngay].Label, [den_ngay]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormLimitRight;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM0GUti1kCp50u/Joaj4mLrRFBFrkg61EVyh0XGpA19zx05m0tH1OgdPSKya+jhQB92mZjn9Ot4aMXMuRM9wUx/xclTHT0ytQP5YzsDNDeJ2</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5sW+kp4MK11X55maSgW6tAq28qU+mzyLq1lPy1OSlYhblzurVNMWbCscwy6JqC0SrbxpML86JbZuShcIiP9ae19quCwNV5K3saiERf7M78U5ERCr5iWAuC/fR6LXCBm3+znDgZWVYu5TdzO8S3qL/1bUNcgNfvgQr7dR14kVIrD41zN5JNRT9MXnycDuBYZM57tDYTtHuwqoNqkWXNn+5u/YWsgawRG1eXyAMYpbdj5Rb52aJ7XqWV1HVtUdkJz/N2rQKxAQ1Gzfkwsn6l6+sk7SoC3AYdeCgp8JbZYMSr/</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xgjRNcVlicW/0GqjC+uzAs21DqZRSlebzU+dafAZigst0OP+WYT02TnuDO9+aLtKej7OZvguEJRCov8s23tVDB6SSBUB/N9uX9DI4Yz0S8tal83WzYPYk0lDlra8ZJ8H9OrlsND6xrweHpY00bBQ2tSNl2MwiofN6JP15DnnK0Di6nYke9FDJV0kf4ckcBqzMc9Qv36OR+8EAfqAorn0IcsA6X2XzpXsVjq6pxU5wV1jlTf73rW6Hd+6xF/vhzPi5VHjooB8TYBAt37SR2xtGLZzjIFvtDCUCuZGwws96IlNDfPgetEEnlDbAcWiraxQfrCNcpqTrE3GmxPKDaFkbUGlu3cePN9zvmuazCsMvDZoTqt3aewVVzlZ+FWkmLBEjkfLYiYDBFzwm83qUSbiPTB1gmYRg0mUrVzlmscg+pKLRzbL6LUsHXxwlkMEXvudL0V6AstjJsVmB/28Cm485GHmos7dPsFBsvyRfdV11DG2dpX8Lx8AlPqCegL9RavyTYUD3KJXsZkdzTiAz+qsN9/I+0GuHitetGHWmBc+W+zhFUZiv4oIh5o/42411xDY/PrG5IUP8nTGakzXLEjPLRNP1RbGAR77l0H+GfIwejzS3BQSGGUmf3EHqFFRRZw4Y=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>