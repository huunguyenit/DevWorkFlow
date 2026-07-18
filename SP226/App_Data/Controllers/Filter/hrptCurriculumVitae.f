<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_vao1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày vào cty từ/đến" e="Join Date from/to"></header>
    </field>
    <field name="ngay_vao2" type="DateTime" dataFormatString="@datetimeFormat" align="left" defaultValue="new Date()">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vtr" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bac" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_ttnv">
      <header v="Tình trạng nhân viên" e="Employee Status"></header>
      <items style="Lookup" controller="hrEmployeeStatus" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu song ngữ" e="Bilingual Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="keys" hidden="true" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [ngay_vao1].Label, [ngay_vao1], [ngay_vao2]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="110100: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="110100: [ma_bac].Label, [ma_bac], [ten_bac%l]"/>
      <item value="11000: [ma_ttnv].Label, [ma_ttnv]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [keys]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4X+K4uS3hNe2a7cK9WcQ91aueOvvfikK15ZR31mYoQFQlQCy1auIPAbUcRCm6i/iWNxrLfnKv1+DBgi7mfTqFjfvNCk+vEsW/CgdSD9Htz/mPTM2nLVqqFXf2awRY5ZAlc+oTut0Kn+qyORcITFjOdhrQKqvSnIWDW4ngx+8VCtr</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R6oVqgI+1J5dAPNfBxh9Xe9AlA5htXn/NAqiSseO8lgUHsH8gW0JPsHUKizL/iL79CKmp4zcmkTgyYN0laUlMzdKz4YiHqQ150cVaeKJcJ9i/Egl+wFtihBKunEIzNtOn8CRyzYMtwRxEHLDg5ezX615CcqXmDZISZfHUSPAvNWvL2h/Fe/JqX6govD5iYHlqjO5i3beceaCuqcs6tMM2vy2EwM7BEDEhnF3hYf5p4xdMkKPml4UeDavhyXso5dOZlkpPj4oQ8iIXSzOFk5Mh4wV9h+SXNJbbydIqyaaL8b0nEqYZEe/mmjRfGsvI6FAPDI7HvcVAnJoVNzPpX6FkW6tFIxnmz/kqKG1igFTL10oONg6fGD+h8jC9x70DG6VX5Yzzz7D/FgfGbgMe5lE4ZLrFWrpcTrIpDOW33BlOKamlzyhi0pxlQ0exEHf3WNIiT1OiOpvk3k+ugEyByGvlo4oU3jSSPiUJS79TWJQomA0psaFQZQ265MkyAoUkyD9FRU4iYuHk92qAq9uft3Cl+Om3wPqa5EuSY+gjOYIcQ4OWaoV4+I6i5OseA20uxd9zk=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>