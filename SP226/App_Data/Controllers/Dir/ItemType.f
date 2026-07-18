<?xml version="1.0" encoding="utf-8"?>
<dir table="dmloaivt" code="ma_loai_vt" order="ma_loai_vt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại vật tư" e="Item Type"></title>
  <fields>
    <field name="ma_loai_vt" isPrimaryKey="true" allowNulls="false" inactivate="true" disabled="true">
      <header v="Mã loại" e="Type Code"></header>
    </field>
    <field name="ten_loai_vt" allowNulls="false">
      <header v="Tên loại" e="Description"></header>
    </field>
    <field name="ten_loai_vt2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="11: [ma_loai_vt].Label, [ma_loai_vt]"/>
      <item value="110: [ten_loai_vt].Label, [ten_loai_vt]"/>
      <item value="110: [ten_loai_vt2].Label, [ten_loai_vt2]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+zYgXkWUL4wyG2/0lrZA5u2GE7S1kXh+CEpE56uNBVg+WR9aOjyDYJD0rMQYwh/CcHn4ZFTk9VXBbOi9E+gSKSlfirkSeF2k8BMcZ0Jpyq7</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqPavCccM/dSfP2OHYbgR1IwtUawgR3gW4kvlnC8zgkIOEn1KHjtQwfqVcD8dd4JFQ==</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>