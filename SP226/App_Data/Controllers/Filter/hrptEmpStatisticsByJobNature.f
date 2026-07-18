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
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
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
    <field name="ten_nh_bp1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp2" onDemand="true">
      <header v="Nhóm bộ phận 2" e="Department Group 2"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_bp2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp3" onDemand="true">
      <header v="Nhóm bộ phận 3" e="Department Group 3"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_bp3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="nh_nv1" onDemand="true">
      <header v="Nhóm nhân viên 1" e="Employee Group 1"></header>
      <footer v="Nhóm nhân viên" e="Employee Group"/>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_nv1%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv2" onDemand="true">
      <header v="Nhóm nhân viên 2" e="Employee Group 2"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_nv2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv3" onDemand="true">
      <header v="Nhóm nhân viên 3" e="Employee Group 3"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_nv3%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_vtr" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr1" onDemand="true">
      <header v="Nhóm vị trí công việc 1" e="Position Group 1"></header>
      <footer v="Nhóm vị trí công việc" e="Position Group"/>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh_vtr1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_vtr1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr2" onDemand="true">
      <header v="Nhóm vị trí công việc 2" e="Position Group 2"></header>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh_vtr2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_vtr2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr3" onDemand="true">
      <header v="Nhóm vị trí công việc 3" e="Position Group 3"></header>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh_vtr3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_vtr3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right">
      <header v="Thứ tự sx nhóm" e="Group Order"/>
      <items style="Mask"/>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right">
      <items style="Mask"/>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right">
      <items style="Mask"/>
    </field>

    <field name="tt_nv" dataFormatString="*, 1, 2" clientDefault="*" align="right">
      <header v="Tình trạng nhân viên" e="Employee Status"/>
      <footer v="1 - Chính thức, 2 - Thử việc, * - Cả hai" e="1 - Permanent, 2 - Probationary, * - All"></footer>
      <items style="Mask"/>
    </field>

    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir" height="282">
      <item value="120, 20, 20, 20, 40, 100, 100, 130, 0, 0, 0"/>
      <item value="110: [nam].Label, [nam]"/>
      <item value="110001001: [ma_bp].Label, [ma_bp], [ten_bp%l], [ten_nh_bp1%l]"/>
      <item value="1100011-1: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp2%l]"/>
      <item value="1100011-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>
      <item value="110001001: [ma_vtr].Label, [ma_vtr], [ten_vtr%l], [ten_nh_bp3%l]"/>
      <item value="1100011-1: [nh_vtr1].Description, [nh_vtr1], [nh_vtr2], [nh_vtr3], [ten_nh_vtr1%l]"/>
      <item value="1111----1: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3], [ten_nh_vtr2%l]"/>
      <item value="11100000: [tt_nv].Label, [tt_nv], [tt_nv].Description"/>
      <item value="1100000-1: [mau_bc].Label, [mau_bc], [ten_nh_vtr3%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzON/nEjNFoizXWtO3oOE282v7ygSP+J/GxZy1b1G589k6w1g06VhRlZVwnOlFtYCwPCDH+9L7zdtH0Wpluaq3+0Z5O/3MTqM3lXrgMrUul7o62GI92xjsB5KosYEsq/5fGt169deE/Z1mNC5Yq349Bd1coTjyKRdBgZvVDf59r9l9qqNKOhX6tTxUNWl+yZRImImB1BmCfHDgZUtktkSjswCki3e2fx2X+UdyGfBLsU6Pa6Yihu6M3RIwsM+o42ecEjE9k/fxaO4hf/ewAXtc15wSUNxiqj/I8veZDvmWpG1IR0iMwKuDZAF0I05Zn94PqlK5V8yyvr+rrApRhbrsCs66yC79mbZoKLpc4TSHrj2U807xoo4JNwOCtPHx307xe1aGZ9e6kdgsOEqvnJr25H4Qe0SbcLJaMwrGT4Cik1XgcSwyheUizw8fEaKGnX/60TkXLsu+3xS6wK1uyafac=</Encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Xyxehy98Ar3BuOJYxUjeFGRWGXgxamXJniE1ERxzUqVd32VzncuuU8f+uVHXxAyvUs4LnzF+zUpzGTgPCp/ljtI3MwmS8xplBjolEj2uS0s5nzvXvfyxmqDqS/8XeqNv+2YCsziA6GJrnuadaYRfRaCXOer7tiGC2kwdmZMSnbRcqISs2K9ycNN9nPeTxSW1oN3p1idhVBekfLd21Jk7xWIHgYuLWA3h4DzOoA//G/AmIJXshRcxun1aAYB1BXgosidlpkfbB62YCZwp07QO6UeMXnMhUxJIFbUttHAJzAVxFMRkjMOL5uh3PG6TQ+iY2EFt/e6JvSgCh7fLwv2GmLruYZE4XYQk5VvJT1fVD9o</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R7GYbFT8gV//NRBlfK/VHvK3u61G9X2E5UhpO0CV5jS9UARBL7f6GaFA5p9IL6CTjSigJQUu0HBtt1/92AubUshUqfLQOhu2OeHFhrvVNnaxCl8Fcbh1xMEObC7LGpWdl81nacXMdNFeR5zJCKFM6e9Wo4GG3Q246kgLRh4Ry5PMnNno13xox8xOQGc5mbsboe4Jdp4DMZ1nVbN7lVD9Ity36lb935IUiLv8mLFL11TLM/r9r9Cd1gVGkuTuAEG0vTmWsOA0GuNduZNVaxUKWDHgBWtXnZewzUyLyfVuRqEtDn47vm/M6Iw3IsulzjDeXFr6mXSMl2WnqBWhOyHAxSfmyXc7Hfn9GZ/+LDlypxWKEgluKwrtjtqh4tt/JkFgfbAHU9eUO15Un2BFc5y2km3vnFVxQIchtA+dhdNRkjLaP/wZDT6PsNyd0jBe4adDRuv16vyIPb2GU0KvAMd0/d+WW2EhQ2ZNcfzanqIW83WSg==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>