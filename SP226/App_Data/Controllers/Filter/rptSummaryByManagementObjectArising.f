<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY Controller "rptSummaryByManagementObjectArising">
  <!ENTITY ManagementObjectIndex "1">
  <!ENTITY % ManagementObjectReport "INCLUDE">
  <!ENTITY % ManagementObject SYSTEM "..\Include\ManagementObject.ent">
  %ManagementObject;

]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    &ManagementObjectTypeField;

    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ từ số" e="Voucher No. from"></header>
      <footer v="Chừng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>

    <field name="tk" categoryIndex="1">
      <header v="Danh sách tài khoản" e="Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ghi_no_co" dataFormatString="*, 1, 2" clientDefault="*" align="right" categoryIndex="1">
      <header v="Ghi nợ/có" e="Debit/Credit"></header>
      <footer v="1 - Nợ, 2 - Có, * - Tất cả" e="1 - Debit, 2 - Credit, * - All"/>
      <items style="Mask"></items>
    </field>
    <field name="tk_du" categoryIndex="1">
      <header v="Ds tài khoản đối ứng" e="Ref. Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="tk_gt" categoryIndex="1">
      <header v="Ds tk không tính gt" e="Non-deduction Acct. List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>

    &ManagementObjectFields;

    <field name="ma_kh" categoryIndex="3">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" external="true" readOnly="true" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="3">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" categoryIndex="3">
      <header v="Mã sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="3">
      <header v="Mã bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="3">
      <header v="Mã hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""></header>
    </field>

    <field name="ma_ct" categoryIndex="2">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'"/>
    </field>
    <field name="ten_ct%l" external="true" readOnly="true" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" categoryIndex="2">
      <header v="Ngoại tệ" e="Foreign Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nt%l" external="true" readOnly="true" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai" categoryIndex="2">
      <header v="Diễn giải chứa" e="Description like"></header>
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

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="257">
      <item value="120, 25, 75, 100, 100, 130"/>
      &ManagementObjectTypeView;

      <item value="1101--: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11011-: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>

      <item value="11000-: [tk].Label, [tk]"/>
      <item value="1110--: [ghi_no_co].Label, [ghi_no_co], [ghi_no_co].Description"/>
      <item value="11000-: [tk_du].Label, [tk_du]"/>
      <item value="11000-: [tk_gt].Label, [tk_gt]"/>

      &ManagementObjectViews;

      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      <item value="110100: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11000-: [dien_giai].Label, [dien_giai]"/>

      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>

      <categories>
        <category index="1" columns="120, 25, 75, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 30, 70, 100, 100, 130">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="3" columns="120, 30, 70, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenFilterShowingManagementObject;
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        &ManagementObjectQuerySubTitle;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8s4kVn56erIDhsTEN+FAXG2udEwkLoFAxUShud7zCPsXb/4kzGt2lX45F+cYnOkmRjvAaaYIQBNQZ6pqCTjfopHRj2DUP3BMeBBeEmMxhzwJ8yFjTVsD4No5drdYJsygdk74rD+3Ul1TccZakJcD4cNR8DZ2l3m6OnK1YQdO7iA8b02QUgII5V9FjVXUe0C45iJDKJU4rGLazT6vqzdyz4jaahe5pdeYUloKnrlXWzYdar/Aee6AkkYFDz3I4SPXg==</Encrypted>]]>&ManagementObjectQuerySelect;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XXurn7C8yS1x2tflXaMuuXOw1Payg81nMZATmdiQEezyqf4XhtIM+eVx4RhNXF07x9ICdmcVkI35aIS4PBkYjoEse8mkYZMpZY77LyAzKUx6n5eGtMz2jTTFQbmzZXP7cgAtvjyzmuo+mkzAmRX+JvhF1WzZwG5E2YREJWYD3gVYynn4/0+bklG0b/Nk2d/KX5OIIazjq6Nm1HpQz2kfYysQJExd35xthgMA3huNRToyE/lKcaH2DwB+2a/hxE3ap7BEdIDTCisBiDqCrKNngc=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTglkHqnaRjYR8qCTAKvDrzeS2HA8/ZNt2AxtdMgmLBHBPQ0o7/VV7dnRYHScjqViXg6b+HRvUVkLcF7LqbzDLnR84f2HXFhtPyOOsI+AJyr2EteHXlxpocF5Ua1xjxrEbBwgINprmzx/Qfi9SmTMiH3P8IS8voLnaxsgWE3GhFqgmiQvsRF85nbnWC9kC4PCxQpr4/9EydEFOo2G3k8F9f4=</Encrypted>]]>&ManagementObjectScriptActive;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVo3DbFsvcoq3D47ubR9Ztg1sBce4c998eiZwG7e48M+NtD+Ggh1LkOavKKLEurQYKVBgOrbrPUXUhUtDUHoe+qACLAz85CJ97kI5XRjGRljNkyKfx432mrQDVKeLr8Oc8YsBrFuH+Psr2Aw4OvjcgRIh1VKjRFfqV6ehb57/vb9So642xfSnfesgWZV/c01KiypqXRG9m+YULFi+KjQ1RwcUuUNjEKK8F9g59furwXrBPo3Ig0nBrbl28Ti8RcCJvkV1QS84fPA1znFuCUt/2xFyk8xonkPpZfE7ERSrlAWs9v6Luc4CVVrOeH136LkP2A3VYTZql8cpQam/nJNLesYGqE9I92RmuEXNAQmgWqEP8pHVuS4zJ220L2xTJPu5kgi5YsAWuux1KiQ0V9GeRgMUz75fWOYvjBB0MofTiErGSrhQYS4vsW3jfMYFSkYk8SabN6KThxwKHF5zunXyq3uEbWN0DJKA6ba70QmrtPwaLe7exdDDbyWmvZnLTDevCJwX90gs77S8nNHXkf03jHX+oZ6Kg5LFz5kt9L7gCu3kY00ww1f5SKmcnZZJhucd5AN6RXkbMNs8nCXaoD6aswZrrw9silZPNo+FaidFGtGsmRn9JgSRRNnsmAjRbq5uw9DZ8LbBIDpWMBu1PdXZB+xzMXqBhSfPzH9/jFNlGu8Zt/k7pkkJ33LDX8UdBCkfAJzlzfQiAbdQupjPcK8pdo3Hj4n7gZHeq0C/qcejA/dKiO2YpyMKIGlt+w2oxGIAeelPRuqclncHBg/sOGA785pq7SEP03wk5/hlnImGZl7jXkWTjC4iUPBISoHfPV/PMJ8po6brbvHEWxpLLFoA0GBQEIiaOr+nuFT4iKH1qgsnVxXmGaWJ2iMfWN8czJfJbjqwWSXhnjeMuV28OF2YuzIHQx5lnNcWuAxHV/KBBxAzF3R+BKkpk5OVTJD25D695c=</Encrypted>]]>
      &ManagementObjectScript;
    </text>
  </script>

  &OutlineCss;
</dir>