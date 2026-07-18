<?xml version="1.0" encoding="utf-8"?>
<dir table="dmkho" code="ma_kho" order="stt_ntxt, ma_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin kho" e="Warehouse Information"></title>
  <fields>
    <field name="stt_ntxt" type="Decimal" dataFormatString="##0" clientDefault="0">
      <header v="Số thứ tự" e="Ordinal Number"></header>
      <items style ="Numeric"></items>
    </field>
    <field name="ma_kho" isPrimaryKey="true" allowNulls="false" disabled="true">
      <header v="Mã kho" e="Site Code"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="11: [stt_ntxt].Label, [stt_ntxt]"/>
      <item value="111: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
    </view>
  </views>

  <commands>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbekGeoY4QMVLPwSDl/rMbkf+ijYDIh8vFQRQtRlUswqzq</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>