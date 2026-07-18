<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="report_date" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày báo cáo" e="Report Date"></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="vtr_cv" onDemand="true">
      <header v="Vị trí" e="Vacancy"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr_cv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr_cv%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="bac_ql" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac_ql%l" key="status = '1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_bac_ql%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="kieu_loc" dataFormatString="*, 1, 2, 3" clientDefault="*" align="right">
      <header v="Kiểu lọc" e="Filter by"></header>
      <footer v="1 - Chênh lệch thiếu, 2 - Thừa, 3 - Thừa &amp; thiếu, * - Tất cả" e="1 - Insufficient, 2 - Excessive, 3 - Insufficient &amp; Excessive, * - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir" height="64">
      <item value="120, 30, 70, 100, 100, 0, 0, 130"/>
      <item value="110-----: [report_date].Label, [report_date]"/>
      <item value="11010000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010000: [vtr_cv].Label, [vtr_cv], [ten_vtr_cv%l]"/>
      <item value="11010000: [bac_ql].Label, [bac_ql], [ten_bac_ql%l]"/>
      <item value="11100000: [kieu_loc].Label, [kieu_loc], [kieu_loc].Description"/>
      <item value="11000---: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI47uKaZWte1VVHlJZXt0YY79Og7ndX/AwmFlMx++tW8MhWUyL6aN3r4KRAqkaNNyhmMW3f3jTR+QHRgoyppwsg3O+sBDhOnVntN8uJJUS+AW3kWhA91QYG9jhp7J3Rdyf9i1leXzLc9jYFz+0LGgW97+g7UpETdtxL+d7OKgQEhFR2H3XdK4KFnWe/mJ5O8SPRegNHHmPwdFscof+6rQqg=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R47kHxCyUREvBizlmXOBTcEfGAdM3PML1pIM4IiyohV4nICqpHRMEQtOjlQeWpURU2ngJGhPlFpWH89R+xfwnisvcPbCoSAKzD2JcNt9kLAqpFhbi0DbA2kBfO2xKEIdoJxqRETCR0tUuIrxh7hRd2c8RjFzEy4Jalbnisx3eqbQDyiUeOnODbfDKbmh7aMI5Dov1HIWdZvMVmAd2xXrEwQPhKthrVJTkIVffywRS6T2ucFTSXwRX3EDVpX9NZJIyBN/gHkVzOKRU2H7eekUdAPKPnJCBtqbAvNYaTH8V0vyQ==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>