<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY Control ",@$control = '10001'">
  <!ENTITY CostingUnitFilterShowing SYSTEM "..\Include\Command\CostingUnitInputFilterShowing.txt">
  <!ENTITY CostingUnitFilterInserting SYSTEM "..\Include\Command\CostingUnitFilterInserting.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
]>

<dir table="xcdloaiytdd" code="ky, nam, ma_dvcs, loai_yt, ma_sp, ma_bp, so_lsx" order="ky, nam, ma_dvcs, loai_yt, ma_sp, ma_bp, so_lsx" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc số liệu sản phẩm dở dang cuối kỳ" e=" Closing WIP Data Filter"></title>
  <fields>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    &CostingUnitFilterShowing;

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    &CostingUnitFilterInserting;

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbGi4Bt8vpl5t7FW+BIvzcAmTkKEM89qIlC3RGoAWXE6d49seGpYXazvGcwDc955LRRXDw+7Gsy5E39kCkiDOSc2mtXy8vzLjVz0DmnuDUIWdqdSLKv+gIxGyLZ5zQdwKvx2W1RfUX+P7/jKK/gsdWvazRerYjGT73G3Mbssq4cKFESLu9J5+63V2Sug/MsUlc3rcdQo6EJV2HNvR5GYuGNvbPriBnUVTcUb9QlemtCHRX10dyy5MdUrT0akpMigRisW3abBFPUxkcSL8va6p+4RyCUFEBtvSXdytudlbZVGrKCwCr8ciSctEc+GGatS5DKQBbk8bArIiEpGJa0nXuLkRycaVynHx//K2cF5Yxkht7K9CuGPt65d9LaHOdFFJbRfSwmyOELXV2TgdQH6Kkdqo4poJUyjnBGVx3D1M6DXuZWlKbWMdbWhwVB1QNKfIjtg4U40FA98gRRdaH82K10/ATuqGuVsKJfhAOj8ESrMJ4G8++Z1HxUSfM1G/3XvjcWmQc2w5MoOA5g3tKjIJTEbCVbmMQwArWD6W5C++7nsbEKYSwAYqbyQF5aTWdG7BKuBcJKTUWENmfVHZ+rbEsazf1LhHNAYPYA6YY47bS7dZjOyFALIq/nn16H736Lnvo/113Rz6y6W9xNC5BLwalwAo+b9uD9xNQhEpGw/adPTmckVBcEhLwr6+oOFRHCSDCMSZASoNtETqMY35HrvfvAT39tpRrHnqxwjMoX6HEM+axfLTinyzT9pca9W4IGv2Hnn4Ihe3WB8NfEIKGu59ud39IYE81Z7fFjUfEhGjMZvUHE5Zuyr7njCB2gcJytfvAwyBBtZvhMOT91WYpHrXDIb7YoBXUx9BLJkKsqPvVIcw==</encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>
</dir>