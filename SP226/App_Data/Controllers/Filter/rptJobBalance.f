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
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="vu_viec_me" onDemand="true" categoryIndex="1">
      <header v="Vụ việc mẹ" e="Parent Job Code"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv_me%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv_me%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vu_viec" categoryIndex="1">
      <header v="Vụ việc" e="Job Code"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv%l" external="true" readOnly="true">
      <header v="" e=""></header>
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
      <item value="11100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="11100: [vu_viec_me].Label, [vu_viec_me], [ten_vv_me%l]"/>
      <item value="11100: [vu_viec].Label, [vu_viec], [ten_vv%l]"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9Tnjm/cNH2VK0Mz6pH8xI9Hj4yNrtVMCOzZnJZ33ONRvHDBRutkeBEXKhs3SFy6yBzikhltF3iIiR85Po0d6JNgMvmUsOlmGqBi2kQAFB5rOohHD+g4GB8jN0BHUIC4L7NjFaHQgXP9Pb9Nua4P3qgJ1M3J1M4k/KqdwrSOEh+G6v+3fwXhcjhgPs5oy/0yjEavcXzkG9YNCmD3jXGGEVUl0+uUoJxOxgGHisW0Z3pwhaqNGI0waR80ccowQL3uyoyxUhciYAgP/4A4Y3PvByw7q3vG2VyYzVYhOf7sRV7GtxxvZ7/nVXI8x82CLIXtYbxX+EjkA83bV4pnisOPk3wICBhaUIFPsfD6LEXMA0EexGiRkxWU+4DFhdT35eNbg3FIVcjM9s7LZ0zuybAQWvVOPnDrNljxU780774Po4a3U2PUwMG0dEuhyT5qvHfDh+dcustOvFFMxPrUruwCoWiPuWxUXTH+VcCKQq/s9m7hz0ORLkLORigYi/8sXIC+IU9Q=</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00ULgrLhUdgr3bzRb2c4qE/aNzpm6PMpSu9F14+jEcSyew7n/+fO5I8JJhgkleIek+XPOFCpqeXi/I6r0qdJQ4NXVn1f6Q1nPSoTT01cMwyAb++8cTm14b7ssLhov9uAbC6TvDdfh9e7tKVPSHwYHd8SmL2tsJVWPj6IKE7Q2nJDKebX9QoH3lwEy5aczwKNyyG7SkaiBtIfeB+wQTcnzno1yVtEZiwC+dIdm/R6bS2S1fe5LFwBUkhhC5uafyMhL94O46zoOz6Au3PJyWs51Ib/+nldnpl2mis3q41sVKO4nHpVN9S6P71vwWUjufNtQYd93DUMASYbZQOb4gPVdUiO9QcPD1YbzEhj0IDJ677p+my9HbrvwEe4BBcPeQbfPw1QoHmFjAXxGvTzDGN8+UzTv9tuKu2Fe+QdaHXlq3fWcAavcYuUKOV9SBGZIOG7s+h8kqcI6wAFpkhnT7o/dGMWskxxr5ai4SabJmfGQ9uxWp44WbfZ3NHBRhyV+tQvZx25+qW6TOkhn+QVKukpka3fRFitjJc3BCV5Qp4P9BpOrZ3sEWab4k8XvaDKcKHOndBhAPFuvSvH3zF3TXsqSIbfkowc+2vjlHlwdzysFLMb9y7bNxwCMvihI9997skezJY8pDZREb2gUT7tRnTTpg6ImkUROPBn+2h+snQq+3fdljAlanc5frVRZlzKvUhVdMuq5oWEqvjp7my5wWjPs5lBuCdOnOi/LBhnMGSN/2EzeFQl1KVnpM/0Y5NDxFlVo4nduxGXIqa/lWMYtg9oHZqqSAzW0vdgxAKMF00/T59ouIHs3cGgk+iQaIb1XNx4qbNf2/7/N4wV1GVDLGYySl2fOVXru1aXellX1v8e59UHTb3/U2nIW3WNbjNQKabD103rr32AUyTUT1p9UIzUuTWwnZLQhqiM7QXKZaYY/8aZs7tRWbUoMAbCt8WmqHlNbCcEBZ1i9jYe2SHARVAoGeUW6PeoFScJ1Iemrlf4Vyu3oetwSRN7n5LJfmnzAbOTqA+YWf8kAuY1BGvL9jEcPX6+fe2s5sIBbam3aJCOz5iftR</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OvFJinP2Kyzj3jT0QRsptEMoOdMYZ4n2xjB4ZTbHxrFOJ7E2YHZzAwWwiv1Vm+oEYmFMRfmjwsOch1YJG7ACq9tpqQFgz5u6/kAWqF93OoaE=</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>