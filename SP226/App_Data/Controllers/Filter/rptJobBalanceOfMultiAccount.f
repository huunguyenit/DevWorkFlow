<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="tk">
      <header v="Tài khoản" e="Account"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="vu_viec_me" categoryIndex="1">
      <header v="Vụ việc mẹ" e="Parent Job Code"></header>
      <items style="Lookup" controller="Job" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="vu_viec" categoryIndex="1">
      <header v="Vụ việc" e="Job Code"></header>
      <items style="Lookup" controller="Job" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="nhom_vv1" categoryIndex="1">
      <header v="Nhóm vụ việc 1" e="Job Group 1"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv2" categoryIndex="1">
      <header v="Nhóm vụ việc 2" e="Job Group 2"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv3" categoryIndex="1">
      <header v="Nhóm vụ việc 3" e="Job Group 3"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" categoryIndex="1">
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

    <field name="nh_theo" dataFormatString="0, 1, 2" clientDefault="0" align="right" categoryIndex="2">
      <header v="Nhóm theo" e="Group by"/>
      <footer v="0 - Không, 1 - Vụ việc mẹ, 2 - Khách hàng" e="0 - None, 1 - Parent Job, 2 - Customer"></footer>
      <items style="Mask"></items>
      <clientScript><![CDATA[<Encrypted>&1xH15u/kHzW68O9DMcOYSEA13H55AuqqWitC7R2w24g3tXTXrXSzglqs3KyfPoUYBQb9b/POnUUY8aiP2dCY+g==</Encrypted>]]>&OnSelectionOutline;</clientScript>
    </field>
    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <header v="Thứ tự sắp xếp nhóm" e="Group Order Type"/>
      <items style="Mask"/>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="185">
      <item value="120, 100, 100, 100, 130"/>
      <item value="111: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="1100: [tk].Label, [tk]"/>
      <item value="1100: [vu_viec_me].Label, [vu_viec_me]"/>
      <item value="1100: [vu_viec].Label, [vu_viec]"/>
      <item value="11100: [nhom_vv1].Label, [nhom_vv1], [ten_nh_1%l]"/>
      <item value="11100: [nhom_vv2].Label, [nhom_vv2], [ten_nh_2%l]"/>
      <item value="11100: [nhom_vv3].Label, [nhom_vv3], [ten_nh_3%l]"/>
      <item value="1100: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>

      <item value="11100000: [nh_theo].Label, [nh_theo], [nh_theo].Description"/>
      <item value="1111: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>

      <categories>
        <category index="1" columns="120, 100, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 25, 25, 100, 75, 130">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9TnGDPNRfG3RLSraAWcCrRTycbCKzkpoL95AVhvdgC5kN0MxwoFhcPNowyTqKmQ+UkZ8quFUlKGBFxnEojNeX/ny5Cntng1RpoqiU/zky4lUDPS4n8Nx7qgNAytxzByT1CmkPi/GYZtV0wqvzqNkFIB7hf+kjC2fHyMvHlJSDxrnEvAKeXkfXwQl+j3vFchOE8N7yJqGtXw3xScOvAyiX05t5eT7gnJoIFh9uTRx3z8c4B1dGZZGWvc9aCW9Vn6Vz0d+S27GPkHthUAMyJZ5ZzuTCkwbX3pdNmvx58jMczozWG8OUSCL/5QxAnKGz1rpUdyregT9t+IqkN0I285Uvi5OV9VdQCLS5Lep+rA1dZdyzvUptCR/64CSk4X/RchHVr0rgLb7JwNvK8h4Ynoo/gaD7N/hzk+QHmXAAh+PPLKV+w==</Encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EeKL7qb/04iuraroARBQeYbTAeKU1SRCWUXisbykImIgmfvDMeiPPvRi7OZBLduVfMkCzbtHvEV3w8EILJnY6mVMSJZw7eKUuD1qIDl42p+kUjvfxwjhbZnmrdVzITPFhwD5RdEQrFdyLIRlzeAXwyxnydUFv72d8MC27c4+bIxDbgxyFxstAUOSeO77A35tLZo5e1Jrawc1uuf2sRjPoM3EujBGt4+d4lHBg8pNS1PLiVNW/owjB6tedu6R1o0R2YtE+5dr8DF0hphhxKB2tgfccSSqPssDHeK4QOLDtZQumUeXoWq04xa/kEpbCXiCFtvljx1quJq6VOXCdlx8hPQ=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00ULgrLhUdgr3bzRb2c4qE/aNzpm6PMpSu9F14+jEcSyew7n/+fO5I8JJhgkleIek+XPOFCpqeXi/I6r0qdJQ4NXVn1f6Q1nPSoTT01cMwyAb+Ttt/9fepVDyVlnT/yUKD2jOkOPksdKC73R6lxgGS5HoWbZ56xWDvOWRFdsj4kY1NoJcwFCMsO3JlVWJ87k0DDeHNUrv09MXmonyYcRA9D9NuFBTd1nwM0BeaAcJ0g6oaEeyJ75VPAqJtPxml/kJ0pWS7q7F58cw9va/bcVz/dZ1TlU2KhKjhE0e4Kv0i2LnHKkQsvagVxN8qfSe0jhiBYvyLxK7sAeJ3/rUNOeFNXZPA4OJRgjEt27T1VF5qkJQvzTpm+W4UkRKVLOaNaj6464luaXi6Z/cuu0nHJZhi0kI8fN+EpX1QPdJR/ZoYH4x49nvIlR8suXN9pIZAXjh2ZBByPYtyk0/rEAPjXoQAy9MHW8zh3OTorD1gT87kB4uscxtxFnmH5Lyn5tTLniBFDgHmJyK+YKQhNV2HKQBj7QvpsY246ETFYyN/QzNEg2Q35CXsRsCPJJA8osKoxwp5SKTLOSPpEnhiNKh9S729Yu/EXEOvPmICLYf5b4tNhkZrMFojxpPQAVfLL9QG+KlQpV6KkM8cdz0/1JUZ9U1xqn1I/FXz247EGfpSSqoRClWOduhIk2BuUD4PFzJziYncoO8/8+Dil9qAU3/L0btrmRKt57tNUnAxA+qzlms8vlw4sqpYGmlhg9lTGXBX7qgVLA==</Encrypted>]]>
    </text>
  </script>
  &OutlineCss;
</dir>