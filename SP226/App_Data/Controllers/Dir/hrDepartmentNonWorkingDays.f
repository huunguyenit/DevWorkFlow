<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir table="hrnghi0" code="ma_bp, thu" order="ma_bp, thu" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo lịch nghỉ" e="Department Non-working Days"></title>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="thu" isPrimaryKey="true" clientDefault="1">
      <header v="Thứ" e="Day of Week"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="2">
          <text v="Thứ 2" e="Monday"/>
        </item>
        <item value="3">
          <text v="Thứ 3" e="Tuesday"/>
        </item>
        <item value="4">
          <text v="Thứ 4" e="Wednesday"/>
        </item>
        <item value="5">
          <text v="Thứ 5" e="Thursday"/>
        </item>
        <item value="6">
          <text v="Thứ 6" e="Friday"/>
        </item>
        <item value="7">
          <text v="Thứ 7" e="Saturday"/>
        </item>
        <item value="1">
          <text v="Chủ nhật" e="Sunday"/>
        </item>
      </items>
    </field>
    <field name="so_gio" type="Decimal" dataFormatString="#0.00" clientDefault="0">
      <header v="Số giờ" e="Hours"></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_thu%l" external="true" defaultValue="''" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 330, 0"/>
      <item value="11001-: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100--: [thu].Label, [thu]"/>
      <item value="1100-1: [so_gio].Label, [so_gio], [ten_thu%l]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/csgLbm8qHsZXaQ9+454+a2UKGteAordEfLeHkt1zCtsYwszyoQ+/y/3o4SvXN48+WdNY3AhDULFFh1zoUXTgkOsBrQVhlw/9qrUukDwX243aTiPHUgGpSZZX3ka+RyYWZQIU6v8OxnhDq/3MoDFudpZMREUvUxh8kxM8jkmK1UHYJRqFFYnBgVaLI2+oyuXhxb4zWEwZjp38c7nBRsW3dgCSYVlSegiIpYqzUaE2fk1SK6OIYww2KWfbkjn+2A4zrYkQK5dB2OfsbNddV91X4HaVO0b2m9fTJjZkDJOCcy+JAwGr84087DIhBDZQkXFme093gm03cunZKv+lJPF6j15BxCYpajrre2mdvW6yEI0VQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nV6x9NCCTRPHIlcrwox6N7amUPXGpM6sIDSHr7HG6rPcTfvfL+Nlr3DrWIL4Gc9ZncRvtpI87FrWOqKpdejqzVUpfOw7TEN2pl+SWm6ynMu1pxeXJm8ps/Y/681r2NNGApbz7xurMKALYk/k+gByiBFtAPK5gV6RmSYj8TWTqr4Ls3IfO9ZtsxuVYvI8JiLMbmQTM89otdsTqqJSnnnHenQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jbmjLVEaL5LOirB19XEEBSbgkHfNk4Oj0242mKbcobPNT/KTv/yogXYyDA+eZtID59CjQvLFJPUe5N2e91u76fSEDwukD2juL6XohxfQAOQ1e4aKjkFQ2aRkQthk2Dg+F2J2dPX+nBuZI+qH5ZVmBybIm7hPwqQzscPnpGg6vkiQ6wDVGHv4XGbJewfJSemEiQA60KSVyDlIah8d1hmNSNJU9yCw+XSobuLWnMHXAifk29ixoxGD3X5kwMREYafUg12x+H4Uv0lMNpsSXEs3HIg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeuZh6ZMhJ3z4eB1uSgYugrbE0bpKjGdqdXMECFlBiTR7VfsqfDzdkvqecAuGyTSSAQ==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AZD6Q2pmaXmgVw9nXebopyCzSC4lzFNieBVtz0uTVxX9mNgI8dHeAhfrU8htFEnve7jN13SqeW2UmnDk5lBH2nljXlI2TYu0+lygQuxtobMuQAltt2atIlKL0Bg996lug==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
    </text>
  </script>
  &OutlineCss;
</dir>