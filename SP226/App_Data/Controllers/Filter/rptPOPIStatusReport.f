<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptPOPIStatusReport">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY % POApproval SYSTEM "..\Include\POApproval.ent">
  %POApproval;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày đặt hàng từ" e="PO Date from"></header>
      <footer v="Ngày đặt hàng từ/đến" e="PO Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đặt hàng đến" e="PO Date to"></header>
    </field>
    <field name="so_dh1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Đơn hàng từ số" e="PO No. from"></header>
      <footer v="Đơn hàng từ/đến số" e="PO No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_dh2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Đơn hàng đến số" e="PO No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_kh">
      <header v="Nhà cung cấp" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn=1 or nv_yn=1)" check="cc_yn=1 or nv_yn=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Kho nhận" e="Receiving Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_giao" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Hạn giao hàng" e="Due Date"></header>
    </field>

    &POFilterStatusField;

    <field name="nh_theo" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Nhóm theo" e="Group by"/>
      <footer v="1 - Theo số đơn hàng, 2 - Theo vật tư, 3 - Theo nhà cung cấp" e="1 - By Purchase Order No., 2 - By Item, 3 - By Supplier"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="20" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu in chỉ có số lượng" e="Quantity Form"/>
        </item>
        <item value="20">
          <text v="Mẫu in số lượng và giá trị" e="Quantity and Values Form"/>
        </item>
        <item value="30">
          <text v="Mẫu in số lượng và giá trị ngoại tệ" e="Quantity and FC Values Form"/>
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

      <item value="110: [ngay_giao].Label, [ngay_giao]"/>
      <item value="11000: [status].Label, [status]"/>
      <item value="111000: [nh_theo].Label, [nh_theo], [nh_theo].Description"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormLimitRight;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM0GUti1kCp50u/Joaj4mLrRFBFrkg61EVyh0XGpA19zx05m0tH1OgdPSKya+jhQB92mZjn9Ot4aMXMuRM9wUx/xclTHT0ytQP5YzsDNDeJ2</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA6csiqmA6uWUbWt8Rlc5KdS+XzUGFOaU4CoSrl+7+/94j06FCUTM/ZFJuRNmxNeX+J4AwAtPDxgkoqq3lK/jkjvHePggiFdAvjxBli7Rd2i4YO3Z5kFppsj2WUPQrvEw3ZxFDXS1MSwgPiblr55prkNO9fCmFEUysEM1oqKP4OW4rBONmdUKceYWv+CZawI1RJ8b3O48LWBN7qMy5d3IlXBKE8r6gSAgVLdhwQQC9xst97WhMdR0ed4/ngJvanDOVmZpo837mnqT+3Nhf11MGc4nBqGD38HkIhmuOu/0BqJvFhcFfBl5q/C/S0C3GsSoL/9TK+jUCmlSIk+n3nQGF/E8YbVvl9Vvbm9pqaxQoE84ndFFiErcigEOqZC59dZPMgTxbMUrBDczecD8eLCZ8d8HVr2tvqkrl1fnBlRzHFjLuLhtpzwKSrxXtMwg0hpz240NW7VMs8OZBsX5EkolH4MBlP6SDVeb1UsSGgc33F5ci3eIwvJnhsb0CVx9NZ5dx4PQwXVgB9d7L5qWLzo1wlkx/FRPY3f4i7+qEnwyqkQcEuEW6dTT37jZ4K5QJ4H7htjkSpkFgh0/tqsFhrER9s=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kabgBcKsgcm4iH2SLI2Ez1+</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUaG0xOv0B+TlH+OdNVwzhzuc5iFEHMRQESCcCnFdbRaZ38bLFS6sqCpfsUh9e0R/mFrfwjqMPpkVmvqDBsA43H9zrFlA2fMfgey9NJenBI51xz1E8jc1L45iF6VJfDKxqjNZth0g6h7gvQ+G+W7msXUSWpSqNiAH6UWM647Jdcm4CkDx/s3qInct8BqE55lO7pPZfUozIxOXrTHDcAGLcurGu5uevspwh2SASQ5irO5/Gpn3vvj7g/7tl1AV8zCvohY+sJanS5xPHk/v8kb4cay1snbZ9e70H+5nFASVzcjSvCGzzZDNG9wrjvNhLQwr0yY0sPCl1KvGYIabz1Xuga+bjwNBQzqvWbIVSKtMQ5farK66RX4Zshw6vvVyHYuXNhRHdFhGV0Ydvencc8GkWjqEzigHmWcdAI6raHQaULrREdNxRJGjRK4M86X2CBF54D/RLsD8JOMPgo92Hl+i//X6k3/vOsIUHoZLnsbZe7CWqZLLX0WWrZ7dFvJhSCb+qMx2Sx02aU4VVItiG+5ca7Qwx/yi8vIOH1X9LAHjL3eEgnSefmy4AHarXahT+kan0RBcstizsaDNX4JBY/EH/tEfr9ffxNbVbdFTAqnOepWyknNqlsETrqCh+rZ6Awuq31Fngca3yUBHoLlCetBSFHYfsV8Wh9ZoR6kVkCfuVHPURrefLq8DVeeo1bleSACK91gTSTJZd2X4fqktp8hO3WrHwUHSQkZoS9NXXcaa5THXjIHJjKH7lQ/d6kVmpo85R2fikmXbzvU+YkO1gfcnVUtxqP328P81iCGcfWOiAGtD6QfITNEAQaSZ9fG1T6Le9xHiLNVL1E3svenKc9B6LhUi8u8KJuP/70OZCoF041gfPyO/3Z5PQO0EKQZHX9t9HFWPrajsyB1hQdbxs8IYaUh4cEhLSpIJYZQZxpw5WyeoDzFEwVoSi8TRVTdUodYk5dO0d+Q5ImYTnvsNGknLdtYxIhB/y5t+ZJaw7cFRHpuKmpi3nbeHquFR551SUCP7E</Encrypted>]]>&POStatusReportFilterHiddenField;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZCAP1U+YQe1wnBBmDVOiDk8RRaCTKGcaxcntrCZf42JEsL2AOGpKOJ3DmttrlU6ALUya6jPTxmU5jDV+yQ5De+VWBGXSGMoNTj9SjEW2sgDD7rconvFsfnBPnT67Ze6vCwZR43y4t1V1Fh7K0oh0DZqUHhBnt8ieLmPwxIv/tM7tdbeo7JNzhfv6iQCyQxUMvEcy41+J2WjtjH+CWMGkQrxBH8RLeGZThLaoZe3FFnWPAh2/UEJyvv+K/hZ1CaDQqj49A3ZjxcPtFFS32tApDx7i1Tt29MOIej5zSph8pZ24zuPJGtmqe9MGy9pNzAIf4aKqS71RPQmhR93iK+heT5og1+SFDEaOmtscCMHUPrXCTQGJe0McZeMWfVLm/GISX+KP7MrAOa5i3h1TE09pHw=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>