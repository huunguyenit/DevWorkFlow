<?xml version="1.0" encoding="utf-8"?>
<dir table="dmloaigia2" code="loai_gia" order="stt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại giá bán" e="Sales Pricing Type"></title>
  <fields>
    <field name="stt" type="Decimal" dataFormatString="##0" clientDefault="0">
      <header v="Số thứ tự" e="Ordinal Number"></header>
      <items style ="Numeric"></items>
    </field>
    <field name="loai_gia" isPrimaryKey="true" allowNulls="false" disabled="true">
      <header v="Mã loại" e="Code"></header>
      <items style="AutoComplete" controller="SalesPriceType" reference="ten_loai%l" key="1=1" check="1=1" information="loai_gia$dmloaigia2.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="11: [stt].Label, [stt]"/>
      <item value="111: [loai_gia].Label, [loai_gia], [ten_loai%l]"/>
    </view>
  </views>

  <commands>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVxtLcbTN3rkA08OvL2Zr0AZiVzt8ksVem0QPZlNh3iGt</Encrypted>]]>
      </text>
    </command>
  </commands>

</dir>