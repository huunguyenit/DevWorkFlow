<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY CostingUnitFilterSetReadOnly SYSTEM "..\Include\Javascript\CostingUnitFilterSetReadOnly.txt">

  <!ENTITY Control ",@$control = '1110'">
  <!ENTITY CostingUnitFilterRespone SYSTEM "..\Include\Command\CostingUnitFilterRespone.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
  <!ENTITY CostingRequireFilterShowing SYSTEM "..\Include\Command\CostingRequireFilterShowing.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
  <!ENTITY ReportMarginViewValue "110000">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Từ kỳ/Năm" e="From Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="tu_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Đến kỳ/Năm" e="To Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_sp" allowNulls="false">
      <header v="Sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_sp%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_bp%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx" allowNulls="false" align="right" maxLength="-109">
      <header v="Số lệnh sản xuất" e="Manufacturing Order"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai" key="1=1" check="1=1"/>
    </field>
    <field name="dien_giai" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" reference="ten_dvcs%l" controller="Unit" key="status = '1'" check="1=1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PTzxBBVvUyvoGhZosf1w9Z6UP6zpWBOTFy2wGWvxit3Ff5Nh8jMoxLotWzVzgBrkQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" external="true" readOnly="true">
      <header v="" e=""></header>
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
    &ReportMarginField;
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111: [tu_ky].Label, [tu_ky], [tu_nam]"/>
      <item value="111: [den_ky].Label, [den_ky], [den_nam]"/>
      <item value="1100100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [so_lsx].Label, [so_lsx], [dien_giai]"/>
      <item value="1100100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
      &ReportMarginViewExtend;
    </view>
  </views>

  <commands>
    &CostingRequireFilterShowing;
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu38VBZeJ2ZYXfAHCRLP0L58z6bybgsVzDX6KfnnFSWBPauA6Rt/5fHPVWkyYt2PFSYpHdb4SU4Vd/dQrO1qF7O/DU+rFkjrMi3KoK0HQBsX/ZnPoSPwQ437I0ASQJnNHwNsreP5TbzCZ/y13sn1dKll3u6B2xot4j61FcARZ+e9wiRaPRI2c/8b0nmIDqgYMcRp+hSc58QxzV/csJrPfXedfXNv6YDMxtW9R2fZYYg3svG+iEnInyDaAGrLvn/WnlCJTJ3YAH7bl8mKudLwaFaqsPTZiQkEC2SOhCpD17+9z0REUdXQuTN7iQkXo1qMg2r2GHALYQEljB4Oyv+nSQGjK5XFq5MAGx4I0ss6/7Oj+PaCwN7hkMdX68cvawv3ploxVHfBLTPhoCvw2yUs5n+QV04FMY3UnvaqmkVHZreZ4qbbPmylh/cTw7frbQQtd6Dm7+Et+zJ59MNwAbSIg1AA0g/aAij/P240VwOmxmAw1gUTSxmfm79f2lbqkmftyZBkovON0rzEKQl9KJyHhmZQfhTnZtZIiBWTUMBYRxuYx/2MCzt3yttIro/f8976pQtXIlzRmDC3yakEEpLEyXngBpuXFVMSOZjR5dmjqB3ZeJrBFPEAm4T5S5P7HkNgdmCr+Gb8RqwXlJCWJ5meTaqs=</Encrypted>]]>
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &CostingUnitFilterSetReadOnly;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKyAS6CHoiilpSJ3RTgII6p+40bMcATYoWrrTz+NiIUA1nnx4Zku+XXxyGAQ+V5bRDdhnGr43UoKLXHRnSrG6plo1DVJgRCnxfuIqWvI/g0niGGaO9sCDPvt9JqnAaa8xVpuJ0rxUfJh20t5bRlmSNkf7cd0zm7xBaE4KQneN+Ov1L0tgKmILjIMSdyji/lLicAktyoMCgJsfX1z3UMLc9Dd+cLqK0RnZoCWF6w0bFeX2usWxHV24bAnfvONroQm9EmiGYwqObNZImVNDUCWsx6O31drSnwnNq2lVijyHKddtl55Ocy31EyzdqCLrV/E8I1PwDgF8aSE8Yatxxy4zg6CPmN5QN0897ho6VSASRz1odw0kI52SnecFsYqWRuEqbd6BQM1ZDA6g4T35f3ONLwnsNUpVwkYuSvkQ6m2jhVlAhmtIu2EmWcPfQEw0n4fsB2cKngwu2u+bYqGFzGvTEI032tLAWB9cfEa6M724cZyhSzWvHIg3tIVYzxdKn3/ioP3o5t/XdEzzTFtedQjiAM9vmOmietgu6pwLj0P01zkoHJ3NgmLeL5yNsm9kaScVUo5H0qiMcnhlNiA6+ePRdEvrD5z1ElL3F6HHJqPcifA/ya6l/HXuDsXmMenpVe++Z57kicLnvWxDJKpNM227PQSERhZHJsmPCnn5gSrb9iUQmFiVeZOcIK+EPo7DZMZMxft7gZ8+wEdFznzKqGz4+U+h7MVVykHocYeA+x5HN80n/RwRcoU4HlxufQMXL2BPHp9PHDq63QRlSnXQBvnIb4T9IesriCeB4Bh4bSzUjHmSTEeokjM0itFbGiGGBbEOYflGM1arqVTG4UUeYul2t1++h8HumWfP5F/KS4LjRN7nV2TVUbbg+M7LRQwjlxnwkCR4A4VpqVGSpWjhhInWw7WU06YnQbM5+JfwC9i3G1CT8GYyoxyVS+RSVXmbTyU30jNKcfW8GLH01Lo1oqGcExYE+Nly0q56LVB7PyK8hnaRw==</Encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>
  &CostingUnitFilterRespone;
  &OutlineCss;
</dir>