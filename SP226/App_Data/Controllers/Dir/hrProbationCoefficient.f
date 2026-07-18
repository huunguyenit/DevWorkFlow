<?xml version="1.0" encoding="utf-8"?>

<dir table="hrhstv" code="ma_bp, ngay_hl" order="ma_bp, ngay_hl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hệ số thử việc theo bộ phận" e="Probation Salary Coefficient by Department"></title>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" allowNulls="false" clientDefault="Default">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" dataFormatString="##0.00">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0, 0"/>
      <item value="1101000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110----: [he_so].Label, [he_so]"/>
      <item value="110----: [ngay_hl].Label, [ngay_hl]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIkHibOl3ERiVHBlw5eAxDeKZyQJHRr/+gq/RT31OTYGq6gUEunEaBPgAEyy4T/hQ18ZqpVC63n46ZywWWhdxxrRMrUrElOzpVp7bTKTTHOLgHzefbyUUHz4ASsIZO5oEqvjMiqUNhx/FuaghPJeai+bQuNnVjmBkSfBca+pWvaGbjpAgscUe5BDc9Upv1I1wbtCJpf88qLMExf92QYkOZp6dZCDwCy9rvxD84YQN7cnftS9K/BL/hGfZxVulKVmBzU4eu6XsXpNb1QFfRsc9Q7z2wrAi5MARHuGYgXkXQU2XUHLJsPr8EoQaaqYwAQzRpVT7ctz/GYw7c5Zt0WIv0l5r2vG+cIBlGWNQFkJ/JZ53586/syjymqt3YCyyONPrqrCA9WCWp+G5nu+JE2bIrHg==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUUO6XbCc7hTINTLwVnHjlRmlGB+Ny+8yyiGvI7tgIqZO/CL82DcoyCUlQF5puwMaMaFU1AMu0+o2bRwj8w6XKFLyfRevYeqCZJoRcf7FH0rTamG56/fr769W/1YWg6abCvgUWI4I4cwfBSOzRlFf76VLCtB0PikB/d/VmqI78KWY9c3prV/oLwbLnobUS3DWl</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLYckH7FnokB58Km/cpKVFu04yrc+C1QRcEkiqD3NdIGXyOruDjzPOvzBcQ2Nrg9D9Uw3hjcizYaRarjgd9bHnlHXKIlaF7RgutniXmQSvbdVSEjFtARv8mnv8O7lo6XvEcGKxCaUIgWsGijCjbtggSWJNqjBMdQfBVTDgQudL8dsIh7tBMQyY6iYZizbB55Jl8EbB+lrrQGvBlXOjJOrYSXWLloGIcsmcNcFR+ghNYw0=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV2p8vc0lzET3U//BRXudzUdWLKsPPPC3C8aERuHSwJBK15/7I5jeLvY7RbZj5pYExg==</Encrypted>]]>
      </text>
    </command>
  </commands>
</dir>