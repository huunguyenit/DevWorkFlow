<?xml version="1.0" encoding="utf-8"?>
<dir table="v20dmdg" code="ma_so" order="ma_so" xmlns="urn:schemas-fast-com:data-dir">
  <title v="diễn giải chứng từ tự động" e="Description"></title>
  <fields>
    <field name="ma_ct" isPrimaryKey="true" allowNulls="false" inactivate="true" disabled="true">
      <header v="Mã chứng từ" e="Voucher"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'" information="ma_ct$dmct.ten_ct%l"/>
    </field>

    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''" hidden="false" >
      <header v="" e=""></header>
    </field>

    <field name="dien_giai" allowNulls="false">
      <header v="Diễn giải" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="110: [dien_giai].Label, [dien_giai]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FZ7Du3m7Rny2+OPmYoEles=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+zYgXkWUL4wyG2/0lrZA5t212uflezGkWurabQrhMuuqbb4AfTgMsXBtIybitSvqOSLhqVYarviFZwmNbQSnWOuqAqQ4eIdbm8YQLwvBd5t</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeiikR0KH1iTsKcqzpelumIspiZjVGjZEjNopiM3ayMbk</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>