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
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày vào cty từ" e="Date in from"></header>
      <footer v="Ngày vào cty từ/đến" e="Date in from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày vào cty đến" e="Date in to"></header>
    </field>
    <field name="loai_tn" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại" e="Type"/>
      <footer v="1 - Năm, 2 - Tháng" e="1 - Year, 2 - Month"></footer>
      <items style="Mask"/>
    </field>
    <field name="tham_nien" type="Int16" dataFormatString="#0" clientDefault="1" allowNulls="false">
      <header v ="Thâm niên nhỏ nhất" e ="Min Seniority"/>
      <items style="Numeric"></items>
    </field>
    <field name="khoang_cach" type="Decimal" dataFormatString="#0" allowNulls="false" clientDefault="2">
      <header v="Khoảng cách" e="Seniority Range"></header>
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

    <field name="ma_bac" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"/>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="mau_bc" external="true">
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
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130, 0, 0, 0"/>
      <item value="11-------: [nam].Label, [nam]"/>
      <item value="1101: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1110000: [loai_tn].Label, [loai_tn], [loai_tn].Description"/>
      <item value="11-------: [tham_nien].Label, [tham_nien]"/>
      <item value="11-------: [khoang_cach].Label, [khoang_cach]"/>
      <item value="110100---: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11011-111: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp1%l], [ten_nh_bp2%l], [ten_nh_bp3%l]"/>
      <item value="11011-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>
      <item value="110100---: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="11011-111: [nh_vtr1].Description, [nh_vtr1], [nh_vtr2], [nh_vtr3], [ten_nh_vtr1%l], [ten_nh_vtr2%l], [ten_nh_vtr3%l]"/>
      <item value="110100---: [ma_bac].Label, [ma_bac], [ten_bac%l]"/>
      <item value="11000----: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu13IolENev8IezneMIXPAX1eyy7RfXo4dy98CHDJtttIooJ6DiMnLEdEcFi3K5Z1HCp3EQnJihkCZB6yLJrndKCM0XW+bU/uYEyTxS+/SSousX1gdG9wU0Qzn0tkALu0dsOsAJpYeooUGO0fgnafKkgqIL9RlrAAm6GE+4jIHJY6JX5uH3jN/g+zKJ3CXtR8KdgQuMqG3ojJMgHAIjReoq+QGlLAeSKW5W7/h8L8AxzClqTXjs9TLCqmkTzhrumVnYhweL00CBsrOQX4xVOBOl5bFxUp5pheJj6hQCeT7MP29NntzPKwldcZv/IdEcwfbPRO9zLeTRCcvWXikkCKQqw6LhY/UgZf2L8QwPoQVGBq+6tk2tb+xEnfdcoThNPcklKXcONcT39akl3FMTTUDNb1E4vkdwE0/t8ypOXEgmcjqlz4rpfS0eGqp2kh/tJlHcNgpPmTkRb3TdZ4O8A7BDpJZ4iQeBCAFP+8JqN6Ecuk</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdBirwQHi7tkqUAOMzr9Gima9qJq7vTY0TwPIze/IVIn3t+n/IyVF7dJqqQs+9uQuWj1534cGqEbrOUtxLaxh072jcps7/tnCInmHc9gUz+r6Ik6rsZKenH0ECl3aESEpVzSGV0Ph2y0Dnvx5ie5KnazGSs246GEBke47ORQ6bpj5YBKynJ0OonIfKkGsCG8MQ5KC3Uo5ks3hA3+8dW0w4DL29eqAlBendSWTIVfJy+ixWbD31b/cydVqupQZDADG1FV+Sr1uH5/yp0s0lX6bEr5gUclEl8jN8VPeKUJJqZG2vqYuHCPklJB10mXjpS586lSa5PCJOnOO1y4yUDTMF2Go8gf9OHTpAbkRjKuR6Dw475heJhs5eWytMNEJ1i8E1gpwX60EL5u0gq/CN+ydDaNP/Mshv7A84a0srr5OQqesPbtJ/jL7qfr0mdd4MYDl2s8L53PrObCAzvojA2a984+2ZAp5c9iM/yjcc5NctHd7</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>