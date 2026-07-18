<?xml version="1.0" encoding="utf-8"?>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tính lại số dư tức thời của các khách hàng" e="Recalculate Current Customer Balance"></title>
  <fields>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
    </view>
  </views>

  <commands>
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Ksb1LXE+XUM+tw9GssyQ+HmSqjaT/IyxwEtENkWzD27i+p5uytQY55YvYNhSXTN39FBLrjz1wwTQKeCJ+pfLGow=</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>