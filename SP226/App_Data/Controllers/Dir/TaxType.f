<?xml version="1.0" encoding="utf-8"?>
<dir table="v20dmtcthue" code="ma_tc" order="ma_tc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tính chất thuế" e="Tax Type"></title>
  <fields>
    <field name="ma_tc" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" inactivate="true" disabled="true">
      <header v="Mã tính chất" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_tc" allowNulls="false">
      <header v="Tên tính chất" e="Description"></header>
    </field>
    <field name="ten_tc2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="stt" type="Decimal" clientDefault="0" dataFormatString="## ##0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style ="Numeric"></items>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110: [ma_tc].Label, [ma_tc]"/>
      <item value="1100: [ten_tc].Label, [ten_tc]"/>
      <item value="1100: [ten_tc2].Label, [ten_tc2]"/>
      <item value="110: [stt].Label, [stt]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+zYgXkWUL4wyG2/0lrZA5tEh/JJ3Ld0I7BtLhSHClmUNB4mUJRXfJhMD8iJtpu2mpPGW1kEtVbh69YYn02Sbo12E9HQIw2VtZRx5/T18PUN</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbegbYz4ScSHCGCQnU1mKieiI3rPMWoYw8OBem8bD6F40p</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>