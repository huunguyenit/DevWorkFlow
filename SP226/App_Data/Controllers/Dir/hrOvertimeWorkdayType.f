<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="hrkhaibao" code="line_nbr, id" order="line_nbr" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo loại công tăng ca" e="Overtime Workday Type"></title>
  <fields>
    <field name="id" isPrimaryKey="true" hidden="true" readOnly="true" allowNulls="false">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" isPrimaryKey="true" type="Int32" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="name%l" allowNulls="false" disabled="true">
      <header v="Tên" e="Description"></header>
    </field>
    <field name="val">
      <header v="Giá trị" e="Value"></header>
      <items style="Lookup" controller="hrWorkdayType" key="tinh_chat = '2' and status = '1'" check="tinh_chat='2'" information="ma_loai$hrdmloaicong.ten_loai%l"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 330, 0"/>
      <item value="110001: [name%l].Label, [name%l], [id]"/>
      <item value="110001: [val].Label, [val], [line_nbr]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0HTcaPT2jam+CW9uQJh0rilWTarX9BVrqcS+paYKjODhPGT5/LyMjM2dnFLZGnH3D0YCc9kO5u6ky8jkkbxE5c=</encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2+j97jlg+7FdtYzEuVP0WZTIHaGILeeju/2xMo9QgLt3jdNnFccosMebh5UJ/aS8yQCsUwdzqQb1HYFBunjJk4=</encrypted>]]>
      </text>
    </command>
    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%wrzppAz85JvUwDK965ktY9Mi6dTii29Jr3lw4sHOq/bDg5vBWvPXp4vAVwoVYuP4nhC5B42j+klpZapazUN1gqQyMINMqFNBqme8083SR0zdQgC6fXHHD6crHuHE9HNCC4jT2tTKmke6nOagBUCjxA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Kn50JWsgAQK/h9S0ThBhICnAA68WLJcmgbhlY2oo+rK+fcAyFBkNM6dPpiK9qU+EklAr/Ykr90dpF4UHaTeiPuIVrexxJVGK8H78Hd9OF+7sEZdn1KO1QCENYG0OaclQozeoeJQCPKONB/P4uUn9zM=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>