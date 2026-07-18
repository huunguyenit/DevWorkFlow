<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptPhysicaltatus">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày xuất từ" e="Issue Date from"></header>
      <footer v="Ngày xuất từ/đến" e="Issue Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày xuất đến" e="Issue Date to"></header>
    </field>
    <field name="so_dh1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Phiếu xuất từ số" e="Issue No. from"></header>
      <footer v="Số phiếu xuất từ/đến" e="Issue No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_dh2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Phiếu xuất đến số" e="Issue No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1=1"/>
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
      <header v="Kho xuất" e="Issue Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_theo" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Nhóm theo" e="Group by"/>
      <footer v="1 - Theo số phiếu xuất, 2 - Theo vật tư, 3 - Theo khách hàng" e="1 - By Voucher No., 2 - By Item, 3 - By Customer"></footer>
      <items style="Mask"/>
    </field>
    <field name="loai_ct" dataFormatString="1, 2, 3" clientDefault="3" align="right">
      <header v="Loại chứng từ" e="Type Voucher"/>
      <footer v="1 - Phiếu xuất kho, 2 - Phiếu xuất điều chuyển, 3 - Cả hai" e="1 - Goods Issue, 2 - Goods Transfer, 3 - All"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
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
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
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

      <item value="111000: [nh_theo].Label, [nh_theo], [nh_theo].Description"/>
      <item value="111000: [loai_ct].Label, [loai_ct], [loai_ct].Description"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA6csiqmA6uWUbWt8Rlc5KesUzG0FSdaLT9N98y0s4qgh55AUV6kBtM6U79gQUtcQPCqAFJ56Aq2sLvpfgEXNW/mtPB9kiF+TL+o9iMEgRTC/DKsFWzltdpucmuN//pbRrRSPg0p7CHkb0Ufghey02+xtRdcV5o8N23Hjvtcqav8WUwNfWCqdRtt2KTP8TPi5hGm0vZ5EQm+arM67nPQ0Co=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kabgBcKsgcm4iH2SLI2Ez1+</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1Kzii3p6ehknKjvfgm+r4/7v1XRkAvKFtXYzDayytSRCUOK9Bbng5Qb7HvljPsV0n9uqFXSP/B3KFIvlHs9M5borCJHbNJIFMIVWhxgKahEE38tvqF5Pz66cn9gQ/VwfDm+6K+ndtwAK8DCHwEamuvcLm5gemBe+rcnPE6xXPaB0Fp8l+Q562QAHvie+yT7wJn0sr7ks2uyQiuaQTIFfd9Ahd/uMrRd/xy1KYPN+5JUG/WBEjIhaDyPJj6ubdIFKo3OOewhzEIB36EuuK8ncMcfGrbKo8Gnp20ZGZMElZ8T/Uf9zkq9bvUC6GqzeO7T1Auc9U/6r3f7IHP6I3GKM5oSSGdjFHZ24u0LwhkWytHTPXT6xv+v19XkgD3ksY73PY5xizFYqCaVbtNuJSZEbXq5Uiv2tU8qFSwMneJrymq1BSvx2YmdCI4xyc5ncPFFpjLa9jr5i/Kt48Yf5k49OpuuvE=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>