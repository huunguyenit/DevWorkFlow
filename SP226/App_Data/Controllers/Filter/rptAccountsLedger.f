<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
  <!ENTITY ReportMarginCategoryIndex "1">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ngay_mo_so" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="nhom_tk" dataFormatString="1, 0" clientDefault="0" align="right" categoryIndex="1">
      <header v="Nhóm theo tk đối ứng" e="Group by Ref. Acct."></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10" categoryIndex="1">
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
    &ReportMarginFieldExtend;

    <field name="tk_so_cai" type="Boolean" clientDefault="1" categoryIndex="2">
      <header v="Xem tk số cái" e="View GL Account"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>
    <field name="tk_so_cai_1" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="2">
      <header v="" e=""></header>
      <footer v="0 - Xem tất, 1 - Chỉ xem tk sổ cái" e="0 - All, 1 - GL Account"/>
      <items style="Mask"></items>
    </field>
    <field name="tk" type="Boolean" categoryIndex="2">
      <header v="Xem tài khoản" e="Account"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>
    <field name="tk_1" categoryIndex="2">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="tk_bac" type="Boolean" categoryIndex="2">
      <header v="Xem tk có bậc &lt;=" e="Level &lt;="></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>
    <field name="tk_bac_1" dataFormatString="###" maxLength="3" clientDefault="99" categoryIndex="2">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="xem_tat" type="Boolean" categoryIndex="2">
      <header v="Xem tất" e="All"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>
    <field name="tk_chi_tiet" type="Boolean" categoryIndex="2">
      <header v="Chỉ xem tài khoản chi tiết" e="Only Detail Account"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>

    <field name="keys" hidden="true" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="112">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110: [ngay_mo_so].Label, [ngay_mo_so]"/>

      <item value="1110: [nhom_tk].Label, [nhom_tk], [nhom_tk].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-1: [mau_bc].Label, [mau_bc], [keys]"/>
      &ReportMarginView;

      <item value="11001101: [tk_so_cai], [tk_so_cai].Label, [tk_so_cai_1],[tk_so_cai_1].Description, [keys]"/>
      <item value="110010100: [tk], [tk].Label, [tk_1], [ten_tk%l]"/>
      <item value="110010: [tk_bac], [tk_bac].Label, [tk_bac_1]"/>
      <item value="--111100-: [xem_tat], [xem_tat].Label, [tk_chi_tiet], [tk_chi_tiet].Label"/>

      <categories>
        <category index="1" columns="120, 20, 80, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="20, 30, 20, 50, 20, 80, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9eOZfOEWQcPADKnaQdRF5LsRwUBLzz59NtKqNIL+oj33cdCqc6PCmjEuTsNaDmZWQtGLrlpqXs5aq4r7DiH7VLCw6gx3zRTouRbHM2eKLWH8qQMFbVs4e2gO87XtqfAFXtbW5tHQe68g+6LXmGZmp1b6tUDVfQax+UYH4zeFmqeI0GcGYu5Tj1NzYvLEOCS5vzFnhO+Co/QPAKsFx5ZA9Szd1przS2N3JNs6cVKw79POYsy9qdFKhuvUgzp1dAL1OVfZ6klQlxT5rNAs0rkEer7Orx2ixyYFwVfbCiWwIFG</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD7LkTr6EVa6C5cVPNskRLly1PrSUUFX4X5XQzf8p2oyZOhqiZ4FoWBPF9FpedlAnLfKtGPDgTQ9uQynzzFMQhU90Tqv/IhRxzRVfKb+9FX7yxfKXkC5r6UIRlPYlsGr7Xq6t2PdM4HBDEYrbwLBRCdjF9FDR89HW7A4t1ol4wZXSEyGrpQ6oQArMj4qWtPMK7XTK5nub44ez9f9B69VnCdmacb+Lo7W/cKNuKbXKcksj41v9SA2+a5vJg+d6I85oP+PYYeqyIUgqjGNUMeAmbLS5y6DvIutUcUlkuxg1IjHuHdyyCZ7GGBzydkxyGV3YDeq0qcHhc1h4FlZwyjAEUAYTMKZJ2duW2G9ueWz8ifYWqIZZX9V7o42NFNBjx5xuIajczsXOWQJP6P2VUMkaEsEu3cxqF7jnmUDwg6tpFw1zXjDroJM+kjve2Bw/ma0m6Ys5GkOkPtlAIC6aNnVlkh+5zCPVTjQwlW1vwNG3mOGO4mb6ueiwztMOVYIynYsJPy6aiUe6/lQ7AVXOXdjMcyL8q8QftNOadlBCPpyJZNNAfl+bxZ8nplDUVgo1lhgEWfLusHbe2HhbOFKJAbmbb6i1RVDrf+1A0jCHxc31JjFfqLUwUlpOZM23KD9ahz+5/CeVn2RO2wZg/A3oZH1XK53+zn9KbN0GbjtXoHVH7Ou6J6i6fKTgihhwn2IkJG6xG11HhHuNG36DzwnnirngM54nWZD0FpSQuhNm/w9K/MttsYjzQXQ+/xzFe9HPGjUDPva5CGLZHRmgek3Fmd8sJs5lD5tpMr2N5LMOh90OUcHHp2CnynMMegQnTTgBTsRNiVHrv5o6nxq7xyEbZW2evKM/WgQpiDSDsRiVBvdOzh4XHS1qbOWt5mU3zIQshOcTLHiZNXMo5rQg8zSOICNuLGdMSwlHzeGnCbnAAoGSSY+cUR9wyN5B4xhWyFzDfAFBH05cewAGcW8Y8HbSwucHMPg2gKs8FToRkRoMWPCvZNeo5LIzXwfSiszmxwDVfEkpvso6Nl73rdQuq8IksmTRUx+WjUyFBh4OmT89f70SaliUZymu0mwaebbtfv9v1nWKdD490TY2YIt9r4tC98PzVJAAVTSuM7FcHXY69crJjFqAVNUt85kax8RaF0cV4lnHJSP7wW2150kL0OVkRRVjJdUkzOsdcprnyo6iGNej1/l4ykW/4snYzN46+V3rc8PXPc7ayMJhRV+dul+Rwh44TZq7VMT1857L5rOz7OFjh0/ooZ6+0FEJQt9lyuzQ66BpsUC3+feZTiN7REw2vpz9VmYfqAXXw37jLGTHT4uuHK+czvWHSmqnBJAWoC1X5vYkYpvm5mj4dMe37Uae58COZmOtdqt1VdkT0BpsgahXThKzA==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>