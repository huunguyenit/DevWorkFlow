<?xml version="1.0" encoding="utf-8"?>

<dir table="dmstthddt" code="pk_service" order="pk_service" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Khóa mã hóa từ máy chủ" e="The proxy's public key"></title>
  <fields>
    <field name="pk_service" maxLength="4000">
      <header v="Thông tin" e="Information"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="39">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11000: [pk_service].Label, [pk_service]"/>
    </view>
  </views>

  <commands>
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0PbAlr1XYg1QQeHj8/4uULjJcFcBqDlAYRxUgDdLF/77gMbRh2/wOpqPhwqYQX/tpELnePsOkHyI80TVDnlGCY=</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>