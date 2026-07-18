<?xml version="1.0" encoding="utf-8"?>
<dir table="dmct" code="ma_ct" order="stt_ctntxt, ma_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin chứng từ" e="Voucher Information"></title>
  <fields>
    <field name="stt_ctntxt" type="Decimal" dataFormatString="##0" clientDefault="0">
      <header v="Số thứ tự" e="Ordinal Number"></header>
      <items style ="Numeric"></items>
    </field>
    <field name="ma_ct" isPrimaryKey="true" allowNulls="false" disabled="true">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'" information="ma_ct$dmct.ten_ct%l"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="11: [stt_ctntxt].Label, [stt_ctntxt]"/>
      <item value="111: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
    </view>
  </views>

  <commands>
    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeiikR0KH1iTsKcqzpelumIspiZjVGjZEjNopiM3ayMbk</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>