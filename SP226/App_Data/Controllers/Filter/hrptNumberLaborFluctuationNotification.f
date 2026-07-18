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
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="newDate()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="newDate()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp1" onDemand="true">
      <header v="Nhóm bộ phận 1" e="Department Group 1"></header>
      <footer v="Nhóm bộ phận" e="Department Group"/>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_bp1%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp2" onDemand="true">
      <header v="Nhóm bộ phận 2" e="Department Group 2"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_bp2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp3" onDemand="true">
      <header v="Nhóm bộ phận 3" e="Department Group 3"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_bp3%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_bc">
      <header v="Số" e="Number"></header>
    </field>
    <field name="loai_dn">
      <header v="Loại hình doanh nghiệp" e="Type of Business"></header>
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
      <item value="130, 30, 70, 100, 100, 120, 0"/>
      <item value="1101---: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="1101000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11011-1: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp1%l]"/>
      <item value="110---1: [so_bc].Label, [so_bc], [ten_nh_bp2%l]"/>
      <item value="11000-1: [loai_dn].Label, [loai_dn], [ten_nh_bp3%l]"/>
      <item value="11000--: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu99kbA25IV0U+kGZCZNJSlHgBZ7U4lOGnbVnqNciuhkR2Tu2vr7nN3LY28R/xNhr0r0+quSo8sXjsR6ro7scgs0UjMHhU7jrsqbLCH8TkEHPp1w/KTi7pBnnlHL4yTHzRcmK68IxIFVnqiZKfJmFVYkYL5KLXxReh8FdVlbxKcR5FjyNg12xDFh8wB9WRbLyQRdcev0tkdGTVgbakgPmQlmmnn2jy61g+lCK0LMElwZ8ikrrwM3P0eY81+7NbGOaGIVrVHSV7zzt3qRW1FwSUkdND/Bgpu04kHGNMDM/cJm/xZJuvwslw3girUSTVpxyuzSBfuoDEQztugAzT5K/A2EvZvv25s/hWlxebeJ9rTpY+/2V3ZhGsE/hp1ZmAYJuAgbGTTxoGKvb887ayG60SscjzbU4+UJd/QFxLn5eZOOK</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iP+uVSrXMdAt4vLeVnhT5AbiFOmBruEzSJAFQyXZPhZN1RJc86gcFKD5yBMEPJCMJ0e/tQWwY6QPnNX0PeK9guBR7l2rYu50ES7zKqCFKf1BlNajhsLk/tRXrhwnRQVN5lmp6aYjy1+WkOeSpWXY8gSiyeP3wlAYTn95y1AwWztkL4ALd5zmNJBT8iA82ERJWUHsQEwvrbFvy2EPia74Cxz8Fnf5jOIfuPomBTKA3qcV8=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>