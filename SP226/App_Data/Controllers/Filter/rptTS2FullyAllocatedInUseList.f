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
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <footer v="Kỳ/năm" e="Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_loai">
      <header v="Loại CCDC" e="Tool &amp; Supply Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_1">
      <header v="Nhóm CCDC 1" e="Tool &amp; Supply Group 1"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm CCDC 2" e="Tool &amp; Supply Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm CCDC 3" e="Tool &amp; Supply Group 3"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true" external="true">
      <header v="" e=""></header>
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
      <item value="120, 30, 40, 30, 200, 130"/>
      <item value="111--: [ky].Description, [ky], [nam]"/>
      <item value="110010: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="110010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110010: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="110010: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="110010: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEF1yVtg0wrryn4wS2ls7BPetMCZOWgyHW3bInlK4Eaqm8cGSA/py+COrzfyaQLi8poB8aZwbdvAWXp5Co3QgYKrMGtSpW8RA7yTWXkLJzBQ0o53xZZjmSU+9dkBPy+onrPZhuEOrWmjQ01+Oj0/6sayXWrIIx3e9CPwA/CM28KdrpI6KNGO+M3HPrNG5jTw7g==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUvLrUm1DcMeBmcORPeCv9/hhstTFDcYwpC/k4p34bXRK1ddqEoXHf4cyqsCs1SBgqMOuNgz8bYTDOCokwVWYaP99H6WUrWRfj/ezIDLyuFiwHprJedqE7XTHfgvH8+Lfe6hCP4JlzD5WhaXd4Hu9O7xMfl6O3vMO3QnAU06l6L4wSbUE8ySAw0wwe2dUdon4yaAsFpgZDRMQje6KhGXvs/igWZ2g184+zui1NB5iXnwnbQHI3xBJsOwDupp5WkKwPlasunkkSXIlRckXQRcDzaSyDFzlICxXcqwd1cooKRTkN18fKKUN5EiwD4OXWbjYFGLZByh0+CIHU00zkFhgThuupm4LiTAIX2F4mLph5SqBB3arpgAS7/O47FlpkVyu68uLgd/W2mP5E98UTsjzfRGMCWP6bN4B8r/x7C9z38SBlUaaDjoesU9rklg3nk+4i/i2RSU3hTCEMAyum31Nu/lH79SF4ZEYKcIQuJH3AXp5qWNwalRUn1S8DnhOIjLk09PuWDTJ7tVWCN2a5JruYGZdTeieyIcjtbU0/HtnUWf/egLGA+TwPG452am8cjnfy</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>