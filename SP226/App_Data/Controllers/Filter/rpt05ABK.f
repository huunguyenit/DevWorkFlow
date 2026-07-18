<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A0592\ReportCircularTypeField.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="nam" type="Int16" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e ="Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_ns">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="TaxEmployee" reference="ten_ns%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_ns%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="TaxDepartment" reference="ten_bp%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    &ReportCircularTypeField;
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110100: [ma_ns].Label, [ma_ns], [ten_ns%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [chon_tt].Label, [chon_tt]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKBqqJeBFhuOpLkf5Z3TI1F+CW2ZQ2WrVwZuMHT45OlA1UP+TkNny59p2xk64YdJagS+XQr1k4MMLL6CfnqqWTf3T6ye9NkX4moOKNqnrRDSWQBBER4JbyCqJUly0kT9GQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAiPOq5AwHj39yjkxWkVx1cxuAMrjUdSRP2fUfSWNNOYHNKxtrCTvkNw3+aM/39lC+YRrJIPk2zkQARzzofGQ9OFzukmAMeN9d+wS6zutstMYauO0Tq1pJUEIegVCToVTeVYO3J0pFHvanY1Ixl/1nWIvtLG+d84HyHRocCsW1UT8wpYozi+V0uRY0+x7rAGyh2n3g9uRgIY1voYLdTSnx1208HanV3Eku4kTljLhJ7OT4ED59ApYs741BwU49qXnBRSvye041ycmsmkOAR0Mmm5h356ei6Mcm5IT6+LgIhizMrlcuUSjYThEF7bQOAO+1Myu9znrRC6GHB2NCJdWfDBmC5/fGj/n6w272fQ7LiepIHQkadbyz2L8LjoSkWwZER9neDBAiRQwcRSZ8An3sYfouL14I07Sn9gxDdE5U5MXnX1LgSx7nunzRGQmBD5YP+6av30IaDKTeRTm/3Uf8WW/MeBnfWrLL5HbHKtMVdz+LcNwvWrflN4+si4H9dE2odcivmC9qBLCJLr7F6NUgaJYCI0VhNNDjPrS0Kgt8dogngzsPzKGJjzk/lxiFRfuc844aW1dYHzUESBwGgM/s7nYQ8ReABn4ZpOc+yKq99S3yxm696P9toHOk1XZOYa3wEKjhi0BTLTlRNnOPeTvHlYatwOS08+u+aAag4/zwWPn57ZUEsv13OBgQK2zMXRu7Em4shymI68tXV1ao3gUQaI+uSWjDDXsC65ImM/koAn641kNisC0J5mdKVThjV2yIeUx2gRzacubVoEayOJp1slMMPjni52aNXAg2Nu7qUvKJWOIfFP3Z5P3eKz/jPPTCsaakOvXqyN0hIY1Jgq4onqIwgDGxAfyw/Ke4Go/oPYnDxFL6WQqustNWLzvL2Jtmv9oi/mhquEDyzI0xpyC9aLTaTHglkRjNzMum3MgDx3oYbJKPzjZn62t4v2bp3YACw==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>