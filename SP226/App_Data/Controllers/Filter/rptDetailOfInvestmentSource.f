<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A04195\ReportCircularTypeField.xml">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ma_so" allowNulls="false">
      <header v="Chỉ tiêu" e="Norm"></header>
      <items style="AutoComplete" controller="Article" reference="chi_tieu%l" key="status ='1'">
      </items>
    </field>
    <field name="chi_tieu%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>

    <field name="ma_vv">
      <header v="Vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_vv%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="nhom_1">
      <header v="Nhóm vụ việc 1" e="Job Group 1"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm vụ việc 2" e="Job Group 2"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm vụ việc 3" e="Job Group 3"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    &ReportCircularTypeField;

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
      <item value="120, 40, 20, 40, 100, 100, 130"/>
      <item value="1100100: [ma_so].Label, [ma_so], [chi_tieu%l]"/>
      <item value="11001-: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1100100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="1100100: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="1100100: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="1100100: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [chon_tt].Label, [chon_tt]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDBaaV766j4XqVMPTsxBNLQTkrMbhmDd1bdnSzWA45DRIm45dznU0EMZflx7heSDgusymD1cQDT7S2L5UYq+qQkkvVh08D9kjwYylOXwqmu1OeHqWK+KGy42CGVc2FEGRP9D0xtlXTiRjuCaWoqdl6oUgrmqhxfTH4Cc44jdKW0/vR0/elAzyGnKYMhrWf8BnanXvjGFG02yHPR3p2jqBvc=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX7V6CeYipVHdRulRsUTOw/4GFI3aFHkl8rZHwQMXGqxTbE26SPH9UQ/42W3KoK5qyO3gatBRXZe0yd5Br6/RZt7va5akouVAlMi24TTdyn/yxy+1AVxx24NyYdxHJP/3w5tSwIv+rHqN64toXvqT4YGePxRXP2DwdkEGMo5y0Ilo8VjdNOMJew9pU/2hofzIGjFV9hkpwCqu0lyxnjygIemldquYtx4VJCq02JxyLt5BBdOnz1z6f1qYaPnt3/qQv4Yw6fOpXqioMTQVarpJvqyQ/+DGyMZBdqGl4MZNkt0M+ZRD8g6Vm2X5GibobiZYqLRw4lFlkvt33oIXO0/5ti0lLK9KadXuITFUls0CcaB5195KGcI5rzovfkTfPILkYDrrDLLan3tHIrbhR6/7aIVIOOHjswAdml4Ac/SR1hpFNoriofk8qi9ZbJN5vX9+1tc1aWu8EPL8z6h6EJ+iE0Q/SQoPGwnjbObGvecXgB1RfcVHtqnfMAeBTZ7vl1npNrB4irMwDllD3p5FOsfXcZe3jqjR102PATOyt8XE+xHdw==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>