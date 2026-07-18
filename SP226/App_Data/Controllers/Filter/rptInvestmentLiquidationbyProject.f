<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A04195\ReportCircularTypeField.xml">
  <!ENTITY defaultForm "DTQTDTVV">
  <!ENTITY circularForm "DTQTDTVV_A04195 ">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultARAccount">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
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
    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 40, 40, 100, 100, 130"/>
      <item value="1100100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="11001--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1100100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>

      <item value="1100100: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="1100100: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="1100100: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>

      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [chon_tt].Label, [chon_tt]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsDCzDTbAYjxedDUkYV9a1omgMm+cPs69mQwYzgY3h4nmw2ZuCDo+tbnQrNYaX8YtQD1ze8Vt8MC+JT5aEEyFqPwI9JGI/cJqWfxB0GseSVcrBf4Fs8RuFmn9Dk/RA+TDCD66PmI13xeEy1fpR5+4RaznX1GsPM7S3FUO5/TOKgt2GYanBQu+v4ymWgak/+nVCM=</Encrypted>]]>&circularForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd278lZQstIfvDVKyoQfWcnxmtMy+NtWbP4kXedUo/FkfFcRSbWSw/kQmGruX9zaOeFcGG5B1Vnb1g5Icb9LCeOcYA==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8b3snQ2t5TjqLIhhJXRanu8fCWEMVAqfwCVhxQq2gOoNx3jCdhg/Q8SN5L/rI3IlfWqykN4nEkBYHueF+Yjh3LCU3rO4oF/6dp2NDXNlFRM</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&rDv0vttZjAuzMv0027Om3Y8C5/bcvVcp0vdssmz6oxQ=</Encrypted>]]>&circularForm;<![CDATA[<Encrypted>&rDv0vttZjAuzMv0027Om3WbrpvTCj04c3DrHFIqv5L33hn/R/ZIXnml1292xAvinpY8VPc153x0DleKR882UJfAXXnuwn0cMR5H/mrWKaq16JmM4wgERansvmdV0zvlGROrUr6J5aX9OnIOKQNpg6cXxtmyiKMT+RY93+WOemQPGbS1Xk82J/ASRhjixB+BhThW0cQ4nmZJ6+cA9wPeOFPLfOki/XLSu4Is0BKJ/7dqrg6GCyXuI1zQqDIMF09mHoVeO6GEUteGwtMJz3mwt2w==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1KzovGjX8PqAdTr/BMqZOmhD21/kcC4L+SaJqqrhB5BWWvZL9ud38/F4FoVNsFtwoIezr32qRPjDQRKQrSED5B5LSiTQgHGg04u4Jc8em0NfZtMVz+aoicqI+mS+yhdbF/ycNtxqfy/xiwq+kfb9leVw1nXcpOgfAC5Oxhve8HDBqNLB+jJO8y7OP7WyGD3Nrqk8TNTxXsgtJ37aNDzEZCZRlcLLRc19t6EHz1BD4k0e98zzhaFvE7eqjVE86Z7bkS/16pA6NF03Ndl3PFCk+ZoUgEiLL0B2fB/Ddf+JXKkn/Aq27OIGYiB/+qYa8VpJCh85/8W/IwFCcWOudvgIghcCxIL6XgvWjDZ7LGwXh3hn6urERSnvcMzSQgl6SmsNrFjgZlPqf77oN0AWYfLEm0xd3omtLIhf3l75gqeQLVaNMNUgtILAgxm3/K1yQqyvpuYFWrbY80jdJFqaoZmwW0XqpPkr+8OZsoGvqbBZ33crJX5tCg1dlWo+fpo5S2GATTkvTdqjZADdW/E6F7DvNkLqTR2oTzGxvGiHb46bHLGninWmzy8hHCjio0/FoWc7Qcdhx16FGLjddy2ItpL5oQD6PiG/Rouxb65FsTuFmtb2N8pNMtbzSM+qksSGTeA7am/fiRevKoX7nvEWNmerk5dGmMRzXXu1LZNWO93iyOO20Fc2Gtg8fK1QNiAnIwbytRPWqDX05cRc6HyI3cQlBrlHqKqoTvj34BMNQRp1rBVrh5OF2/oBEKK8y4YvJ9mDAyi7/NWv6mxPl7GuZEFusSoYNGas5zR9CFSMPeQC01bL2zVu7BaUh///DHAyflAs/UOXc6uYT7Bm+kN4VjyIR9GOQWkajnprvqWVFNveQCtTDXk+hlqWa8DT7zL5Zod9HEO66nTLoI6VIBZxep6JeGS+BVdbqh1WF0804gG8LKTyN5+HbXNS4koCaPzF1EaYnyUuvJuQejZ3YUCa0vkHlwOS/ukLQ/LhChmHLHxDqc/ecQ970R25LDYLv4R1Wro17lLEteczGRJOZOuf1Blmw1dMv+XHRHdsRMFZcm1ONaGMbceTIdYBuOfvmtoE/ImAgsbrnTO9339D7qpdcrvuVNnM5ERsLvMvfpKx/Rf8ri/yykSD8VsnU4BPIyHT1j8IXpzgQVMmk9mPMUtDKwAlsziSJdiNlbmr1FqKgMzcp+VNHS7kGl4ZXbrKnqSe098FxPeg==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifZ+Z8xb2vrymO7L8l1iONMMBFHRBHdugGetqrYoiOTfBA1lZWKeXlqJ8Aryd2h4b11Bzywq3T2nZKzq3R/HAsRdjYXgE3oq/TiWNIYrI8lvdg3Wqcezp8aESHCzdewBJHJLX3PPSIEGjXYsvk2xH+1</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>