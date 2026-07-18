<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A01119\ReportCircularTypeField.xml">
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

    <field name="thue_suat" align="right">
      <header v="Thuế suất" e="Tax Rate"></header>
    </field>
    <field name="tk_thue" clientDefault="133, 333">
      <header v="Tài khoản thuế" e="Tax Account"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="tk_du">
      <header v="Tài khoản đối ứng" e="Corr. Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_du%l" key="loai_tk = 1 and tk_cn &lt;&gt; 0 and status = '1'" check="loai_tk = 1 and tk_cn &lt;&gt; 0"/>
    </field>
    <field name="ten_tk_du%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh2">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh2%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="loai_bc" clientDefault="3">
      <header v="Loại báo cáo" e="Report Form"></header>
      <items style="Lookup" controller="ReportForm3" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="tc_thue" clientDefault="1, 2, 3">
      <header v="Tính chất thuế" e="Property Tax"></header>
      <items style="Lookup" controller="TaxType" key="status = '1'" check="1 = 1"/>
    </field>

    <field name="ct_goc" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kèm chứng từ gốc" e="Original Documents"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="sap_xep" dataFormatString="1, 2, 3, 4" clientDefault="1" align="right">
      <header v="Sắp xếp theo" e="Order by"></header>
      <footer v="1 - Ngày ct gốc, 2 - Ngày, 3 - T.suất và ngày ct gốc, 4 - T.suất và ngày" e="1 - BVC Date, 2 - Date, 3 - Tax and BVC Date, 4 - Tax and Date"></footer>
      <items style="Mask"/>
    </field>
    <field name="phan_loai" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Nhóm theo" e="Group by"></header>
      <footer v="1 - Ký hiệu, số hđ, thuế suất, ngày và mã số thuế, 0 - Không nhóm" e="1 - Series Number, Invoice No., Tax, Invoice Date and Tax Code, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    &ReportCircularTypeField;

    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10"  >
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
      <item value="120, 40, 60, 100, 100, 130, 0"/>
      <item value="11: [ky1].Label, [ky1]"/>
      <item value="11: [ky2].Label, [ky2]"/>
      <item value="11: [nam].Label, [nam]"/>

      <item value="110: [thue_suat].Label, [thue_suat]"/>

      <item value="11000: [tk_thue].Label, [tk_thue]"/>
      <item value="110100: [tk_du].Label, [tk_du], [ten_tk_du%l]"/>

      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_kh2].Label, [ma_kh2], [ten_kh2%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>

      <item value="110: [loai_bc].Label, [loai_bc]"/>
      <item value="11000: [tc_thue].Label, [tc_thue]"/>

      <item value="111000: [ct_goc].Label, [ct_goc], [ct_goc].Description"/>
      <item value="111000: [sap_xep].Label, [sap_xep], [sap_xep].Description"/>
      <item value="111000: [phan_loai].Label, [phan_loai], [phan_loai].Description"/>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy6LlGeWW4M6VMUiTiPGREfyivWTn8dcy/SpW0JWMjLeLXLkusARh4wLukkGBTnRveEOJZasPhndPNmhz4rRyGr4DOktu1RzB7dL8BZsRS0RNYSu0aP0XUSfAH2nJuiaDZ3Oh5xPmEzPQ2R/DcpxC5FSwgLbEZoKyhYAE8Ug1f14fridrP+8V2CfEKNK/hTqNbDqD8vDeVlZO+Fu0mvvvQ1I2PIrKmXefD+ICSfyHzhSRozff9WIaoD1oRB29BVccLNVLuTRJhscw+2ezGLoqUVHhFkB4a1/ouEAYdXcr63OjiceHJLKGzr/lO1q0A89krAXRBZlOTc+QDk0jogvx9+RLy0/b/Rc3VDhz2k0v+7GTSqRzsCdnvvf0PTwLPCeXkpUqeUpDxChCX1zgxTZu++t0k6nRy1lYKAh5kahGimp</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUcQQHzN1U7v2IJAR0rtoVsC1s+UUlt6VzuYUs7c18QeL81eguffVjXJmHeeXj48ylG5nFqDssy5jT35EZjG+zcrAb8dcK2+2UXyS7Pti/vZY4mMsk4slwZLT3AC7NtWkcTyoYG1CLX6aC4gFN+J7AX3CxBMixWZkBmAGjzj98xQ7Qo+A8gUKaesyZsG0l7zBt1vltmnIryaT5AEH3pd/zsKaR+ZN1P9IoWGMxW/9dJAqGpJwVm0WSxj6ia+1toLtAWr2x45LSUmvP5Am00taRwMhSAgHx7JmumAzz05kcE/SgB6vRH5AMBHOJJADQ2XSTbHQa8/sZqq72CZj1xJ5q4YURwbdQzQ02dju5Hr7zBlphfO7sbppWEO3pzSEwK8gkWH9rScsfOZ7hdvI82BVElFi2tBV0T5lO0g9jWERDzacdRrhss2c/D0cai5qM/DiTabpb3vhcdbUlsDAgtXZtksPIfiwyRGLe6jDg2fDCRpHHaF8YrG8Wdq/IF9zhQw6h3a7uOwDEzbVi6pGnLXrrBX9EQOG24+EpTu7uTRy+9cX5vEsmfSPzepyjxGbf1aD4NDnnrpEg/Lp2lyvpq4HNO05bM9gEDX7DaYPa09OtMpHslESXJlYFRZ4mi+a2R632r6M4iM8s9Eb1GUSuSe0pEwrc4hBZOiThc2SC+tS+e5j2HaLt0T9wWslbTRgX0S0v</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>