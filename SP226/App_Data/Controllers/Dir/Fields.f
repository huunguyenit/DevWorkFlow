<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY Controller "Fields">

  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;
]>

<dir table="columns" code="id, controller" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin" e="Information"></title>
  <fields>
    <field name="id" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="controller" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="header" allowNulls="false">
      <header v="Tên trường" e="Field Name"></header>
    </field>
    <field name="header2" allowNulls="false">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="status" type="Boolean">
      <header v="Sử dụng" e="Use"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="20, 100, 20, 10, 70, 20, 190, 120, 0, 0"/>
      <item value="1010000011: [header].Label, [header], [id], [controller]"/>
      <item value="10100000: [header2].Label, [header2]"/>
      <item value="1010: [status].Label, [status]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6eyx7yBamBd3U95cUYB4yZ+s6Lu36sdZ8RGJ3E06VKd8A3GLKQE2Dr54dNp1FJj6PYRjYTjPWBRqo1dX+UQWQtlG4hHc4GwsVLK+JpwlsA98exFqgNl7w9BbVbLSXauM+6RTLUX2mGoCy0kfJQxFxEEi5WEgedvOFPcejiCCvLkREFwHHFdL3GJv91n7YCq5adYAkhFmI7QDbcYLdF8RM6po/H9nPOR2FjqwZ60kaPt1ZzHTvUIbhsssXtfLBMYsBIpoWBWxofSv7kgTv0Q5VDGfUe6ZK3NfUHYoVryRUMSmpUiFKNmnDjY5I8ULluuGq5xa4S8VHCD9ZppOV0WnpBV22IYGLPhAIwLZnayzvGdbGGf9mJZ8vjsaryrMve/xjQ==</encrypted>]]>
      </text>
    </command>
    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a3daV0RtpOLbUhyZYikZlJMgsZFg5j4Nq7f1M1xNug6B+xVXJL/Q3uYXOjUW9d8ubh5r5vIKVfQB76MSj/aXIhYBZgmxjiaN3jDWYavFmXF9Pa7p++UrB5ApJtyr8Nty2X1UBwCKHN2OdtlHO218crkHV/FKmNsxHIIK/HNFnLpz1anHjryGvolqn4tAFWG8hpf5x7aX6Ub0V2KiqPL9f8=</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>