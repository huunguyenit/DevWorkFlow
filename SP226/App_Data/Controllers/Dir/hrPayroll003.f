<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="hrPayroll003" code="ma_bc" order="ma_bc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tham số" e="Parameter"></title>
  <fields>
    <field name="ma_bc" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_bc">
      <header v="Tên báo cáo" e="Description"></header>
    </field>
    <field name="ten_bc2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ds_loai_luong">
      <header v="Danh sách loại lương" e="Pay Type List"></header>
      <items style="Lookup" controller="hrPayType" key="status = 1" check="1 = 1"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 300, 130, 0"/>
      <item value="1101: [ten_bc].Label, [ten_bc], [ma_bc]"/>
      <item value="110-: [ten_bc2].Label, [ten_bc2]"/>
      <item value="110-: [ds_loai_luong].Label, [ds_loai_luong]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2+j97jlg+7FdtYzEuVP0WZTIHaGILeeju/2xMo9QgLt3jdNnFccosMebh5UJ/aS8yQCsUwdzqQb1HYFBunjJk4=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FW11TMx9O4os12meFBJAmR9QHmjDjgGfOupwQvXIB59cK3l7FdJ2h/Z2E38zu/FD7sACVNBi0/kxakFQX6X4v8+050JspbEIdUdtD8NbHZzra1MVgZ6ZDV1VLnpSNO7Iw==</encrypted>]]>
      &OutlineEntry;
    </text>
  </script>
</dir>