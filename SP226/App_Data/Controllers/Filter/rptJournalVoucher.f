<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A08200\ReportCircularTypeField.xml">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
]>

<dir type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="so_ct1"  align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="Từ/đến số ctgs" e="Batch from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ctgs_goc" align="right" dataFormatString="@upperCaseFormat">
      <header v="Số chứng từ gốc" e="Original Voucher(s)"></header>
      <clientScript><![CDATA[<Encrypted>&LvJqgbD8Ez2iFIn+GVZ4oXLMvq8EalkkqZZiCWuHRkM2FmrMI1tFwJG8faEW7ISK</Encrypted>]]></clientScript>
      <items style="Mask"></items>
    </field>
    <field name="kieu_in" type="Boolean" clientDefault="0" inactivate="true">
      <header v="Tự động hiện theo số chứng từ" e="Auto-counting"></header>
      <items style="CheckBox"></items>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1 " information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList" >
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form" />
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form" />
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    &ReportMarginField;
    &ReportCircularTypeField;

    <field name="keys" hidden="true" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 30, 70, 100, 130"/>
      <item value="11010--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11010-1: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="1101100: [so_ctgs_goc].Label, [so_ctgs_goc], [kieu_in], [kieu_in].Label"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000: [chon_tt].Label, [chon_tt]"/>
      <item value="1100001: [mau_bc].Label, [mau_bc], [keys]"/>
      &ReportMarginView;
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cQD3zzcirdWaL07YfqTBstTMEpVmk6HZ9D42gZz6UPOe1iaPsbKFLRYFUVxBWW5Nrxd9z8RW0Jh8T9y2414yitMN9Tkdrmya8alLYA78mfudtyRLsQkz49Dj4u/q9JXVhg6KUONG1bfdR5nIefk3pY=</Encrypted>]]>
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1Kzii3p6ehknKjvfgm+r4/7v1XRkAvKFtXYzDayytSRCUOK9Bbng5Qb7HvljPsV0n9uqFXSP/B3KFIvlHs9M5borCRL9ZB8QoV6xUev6d0ZnhF9cQixLRSc9pB1Dce634vt+hRIV+9+38Xcg0XxKR83QI+5DyDWc5KcjLyY7nYqDwDycBx4c/Tdvl5hvsCb4JrCARGcajdsv2CKHZfaxN9fgxdwl8UiLcBrXPWWY8C/27Blsg4Mf2gY8jGjDLd30C+ZulbPVB1PymbnhSdEeGkFsXhEOeB+qaLRxF2jGj5XEH4dSuz6ARA22X4vnI9fY/1tG3txG56FfKAp776uNUU8oVvyDRiBvtaKWpe9+0uOwrCzxmV4XZRIs7LYpAwQS3qi66ntY6R/FLgbiZEtwYblTuPxi5gWp1eOUSr9KEP+qnJOO83SFHJL/wWHegrAieULEycWgKpTj8yBFEjkQOFXCExQI+K8ghoJjHIcfxKxC9vtkhgzuyRgCcgR1nVoxWRf6goq7Tv5gEn24Q96OcNLdyDzTLWWAmNHlC5AASn63QtFO7uVdKm5ga6SLnVgZPQwmTgl0JEyqZS0TguyFnCfV8=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>