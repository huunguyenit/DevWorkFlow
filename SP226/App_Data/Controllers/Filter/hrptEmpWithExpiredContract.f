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
    <field name="date_contract_from" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày ký hđ từ" e="Contract Date from"></header>
      <footer v="Ngày ký hđ từ/đến" e="Contract Date from/to"></footer>
    </field>
    <field name="date_contract_to" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày ký hđ đến" e="Contract Date to"></header>
    </field>

    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName ="fromDate">
      <header v="Ngày hết hiệu lực hđ từ" e="Contract Expiry Date from"></header>
      <footer v="Ngày hết hl hđ từ/đến" e="Expiry Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName ="toDate">
      <header v="Ngày hết hiệu lực hđ đến" e="Contract Expiry Date to"></header>
    </field>

    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="vtr_cv" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
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

    <field name="loai_hd">
      <header v="Loại hợp đồng" e="Contract Type"></header>
      <items style="Lookup" controller="hrContractType" key="status = '1' and tinh_chat = 1" check="tinh_chat = 1">
      </items>
    </field>
    <field name="mau_bc" clientDefault="10" external="true">
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
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [date_contract_from].Description, [date_contract_from], [date_contract_to]"/>
      <item value="1101--: [date_from].Description, [date_from], [date_to]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [vtr_cv].Label, [vtr_cv], [ten_vtr_cv%l]"/>
      <item value="110100: [bac_ql].Label, [bac_ql], [ten_bac_ql%l]"/>
      <item value="11000-: [loai_hd].Label, [loai_hd]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7Cr9P7DZviRVm8tZVROSLXtj9MZ33zLRypxpikDmbRA2UgIiX8yCBVL9VknE0ANl6iYCvikS8jsYVdER5kcA0fOosYsJQRehxMK5qonB4CZ8F6VAiH2r9anGzndazi3UMjAKV3UqBJvqN7mBYEA5CoLeazuT/rQ7BhCNxU1BCHOIjzRI4+Ou6CE8QjnZTiNi8E/YVkZGSP0C8PfLmOCmbYwRpOzkpdkpK/HpvHjho0o</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+SpeCuq5ic4WMUrthGm0QpRCIt5H2rsg3WGljLmNR10L3xjHeGpaLW/WqyD4EZnDoXP9htndcsilHY7QyUllDAeJPgcXmAJl/O51EcGpdcL0dnmRzLqSbX0lCVosyuiMnT6o+FD63P/LdhUhVNkkgL17Zij3Fv5dQ12J08JMJnxKhW9B12FrVyeO7c9ezdB0VOCbBgdIbn1FSolrNSKvP/XixpuI5T4vn/cAKr2n+bh4IwzZ8WG6ULnXdaYnZtH0gor0vGgyMfoO+XtMXrSjEf6clZdHYW9B9n9mYwIK/xPbuVqvJ/9IyuuyUHchiYNv/v42Sk8nwzZICpqOZkftBhdm3kI7vAbcQwP1IK5hEASxqiYNX6hsvWyrW2WrtpK5E=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>