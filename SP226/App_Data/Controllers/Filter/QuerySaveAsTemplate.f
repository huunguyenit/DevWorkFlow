<?xml version="1.0" encoding="utf-8"?>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lưu mới mẫu truy vấn" e="Save As Query Template"></title>

  <fields>
    <field name="title" maxLength="64" allowNulls="false">
      <header v="Tên mẫu" e="Template Name"></header>
    </field>
    <field name="other_title" maxLength="64">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="is_private" type="Boolean">
      <header v="Mẫu chung" e="Public Template"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 100, 100, 100, 30"/>
      <item value="1100000: [title].Label, [title]"/>
      <item value="1100000: [other_title].Label, [other_title]"/>
      <item value="11: [is_private].Label, [is_private]"/>
    </view>
  </views>

  <commands>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0/ELKHll8CmLZDxLX1FoNbNAvZYbfGrdsQxOovwwTnC79VYtQ5/iMnXVgYgsLUVIhS+X/1VCMQanloi2W2ewIxwir/tRCdQ14PRZNbAfP8tdS1ugBWMh5AUIlkV5E0I0KjjDNJbaGed6sZ34fFcXKDZU5fcX/ZTeIZYYGx4hUyNK+9XO5pPPTPsD7Mjxbcc/Q+xdGQWpa0s0XnAj5wZ6Al/t7kLSFSy0Eshnb4QvP82Hq+2FVmhO7aMowBSiFo+2ag=</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>