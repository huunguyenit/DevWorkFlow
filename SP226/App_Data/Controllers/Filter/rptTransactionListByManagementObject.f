<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">

  <!ENTITY Controller "rptTransactionListByManagementObject">
  <!ENTITY DynamicReportFields ",'&Controller;', '#$query', '@@sysDatabaseName'">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;

  <!ENTITY ManagementObjectIndex "1">
  <!ENTITY % ManagementObjectReport "INCLUDE">
  <!ENTITY % ManagementObject SYSTEM "..\Include\ManagementObject.ent">
  %ManagementObject;

]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    &ManagementObjectTypeField;

    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="voucher_from" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ từ số" e="Voucher No. from"></header>
      <footer v="Chừng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="voucher_to" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
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
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"></items>
    </field>

    &ManagementObjectFields;

    <field name="ma_kh" categoryIndex="3">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="3">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
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
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'"></items>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" categoryIndex="2">
      <header v="Ngoại tệ" e="Foreign Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" categoryIndex="2">
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
    <view id="Dir" height="233">
      <item value="120, 25, 75, 100, 100, 130"/>
      &ManagementObjectTypeView;

      <item value="1101--: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="11011-: [voucher_from].Description, [voucher_from], [voucher_to], [maxLength]"/>

      <item value="11000-: [tk].Label, [tk]"/>
      <item value="1110--: [ghi_no_co].Label, [ghi_no_co], [ghi_no_co].Description"/>
      <item value="11000-: [tk_du].Label, [tk_du]"/>

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
    &XMLWhenFilterQuerying;

    <command event="Processing">
      <text>
        &ManagementObjectQuerySubTitle;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI5Jt6Ho5OA2AaNQZuURpAKRRJnPl+gUphPbMI1djNOqo7J2wiZdTcwFPjfdaAwkD6hmCtz7eBmFcVv1rqrv1Ok=</Encrypted>]]>&ManagementObjectQuerySelect;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dJL5bdmcY7oh4FU6qP5v23uNbouc2DmtcFjhf9pFcXaZIJ4LbbeAAi61KxqWgP11SQCdHb7YRxJauDC1gaAZO8HRuXc8Zu6roSxo5H633Yl7N+xdq/ioB/zmy0AGgUD2wz1Hp2D8kEpDj67MemkG84dSWlySVXOlwf+FXNxbQXL9GGre8zhQdokZ5e0PRn5KxqM+7Tz5l4R9Dj4KZCZzy18bmosbIF+44bGb027UOZAJ+3w5YZIRQc3XGrwB2XZGpRMsF70m1mwu7LVrKAPjlk=</Encrypted>]]>&DynamicReportFields;&ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTglkHqnaRjYR8qCTAKvDrzeS2HA8/ZNt2AxtdMgmLBHBPQ0o7/VV7dnRYHScjqViXg6b+HRvUVkLcF7LqbzDLnR84f2HXFhtPyOOsI+AJyr2EteHXlxpocF5Ua1xjxrEbPcu93La/utUJyfq3EVEa96G34pcK+ci8419/uhsDI+dXohyEyQRLkRiyiKkI/W/dz9Uerufq5ssj9ul9MNC894=</Encrypted>]]>&ManagementObjectScriptActive;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVo3DbFsvcoq3D47ubR9Ztg1sBce4c998eiZwG7e48M+NtD+Ggh1LkOavKKLEurQYKVBgOrbrPUXUhUtDUHoe+qACLAz85CJ97kI5XRjGRljNkyKfx432mrQDVKeLr8Oc8bNlQ7zj0m9RYY2RNWNlWV6ZJ5m7HL+HmfARLk9zNAv3HrZK/tlLRR77twik4rGq0LERLgpre3eA6xhZ/YXVXxAWJ0fhHuHhnqiPZIUjuObibXDLRy40SzhQQzmtqNKrAVbpRbfDlRQKfFCwRcG0uT6ia10/FkwCLWfg2WI6RWfTQ5Rm0zcHDUVcI5z+1zUbOw3rhd/AbgBnOwuds0rg9CYah6BivI4mLjSZ/lXs6KROPzlQ1BjL+VSL6o1VeBheMwJVcNblJl4Gw6JhDUi41DdEXiMm/9N9fb86HesAmPeoSqumPa2dh5M22lqLgpJiKeEAPB7hxCsOH6+MxLDQeIlGSEsO9OEffhBXZowzpKatT1wcFiujE7WdeGLvFfyDLMzgosMBS/4PlmJ0qEk1ML4a+G94x09JwtVqBroHVclhEyU7Zps7kLgvaxeEn5bUr4=</Encrypted>]]>
      &ManagementObjectScript;
    </text>
  </script>

  &OutlineCss;
</dir>