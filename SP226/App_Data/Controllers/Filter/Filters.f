<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "Filters">
  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;
]>

<dir table="functions" code="id" order="id" database="Sys" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc dữ liệu" e="Filter Data"></title>

  <fields>
    <field name="type" dataFormatString="0, 2" clientDefault="0" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="0 - Chứng từ, 2 - Báo cáo" e="0 - Voucher, 2 - Report"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZS9TcZdv4MVV1zEH3weajDcnloRvzgosICsngJfzUuMF</encrypted>]]>&Controller;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WNq6rgbIwGGpnig6jLG4rA8bm+eGO0TZ3aW96kMAblv6</encrypted>]]></clientScript>
    </field>
    <field name="id" allowNulls="false">
      <header v="Chức năng" e="Function"></header>
      <items style="AutoComplete" controller="FunctionFilters" reference="description%l" key="type='{$%c[type]}' and status = '1'&Operation.And;&FieldsFilter;" check="type='{$%c[type]}'&Operation.And;&FieldsFilter;" information="id$functions.description%l"/>
    </field>
    <field name="description%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11100: [type].Label, [type], [type].Description"/>
      <item value="11010: [id].Label, [id], [description%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBqUYKfsf1C8RK71UZIdZEZOSveYqaX/ECSYhY6j0tASkKY0nhjCEH+UapqIyJqrs1qXf5IPcotH7IhItvqjX8gErv3EE1KVXhFuCPnXWgv+r/L59pWzVB6W4D5mJSqyH2xXdEemiHKWLsDIpE6Rj/39APtrZfb+HeW5HK0r6IHF4P2LqnsM81/GZcMMhLFfAK/wRXKFHNjb4mtnvhhdUpv/FfQcBQWr6uwLjAtleuZP4DCFoSFIPv7U8zBsuXdMst+7gvsUgWQY3L87dIHI5njqVmbqalcl4zcp7liukgbBrg==</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTIrM8IrQPIVG7ZaYz6p6J871QQkTGdwZqgmQhaLnZzWNzfH80oYX3+8TWIVujzGXew==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bqKN4rlvYdFbXWVNslG5cWCARdZlNSvC3l5GCzbWiN84ZxjVz4qRkeJ4kufFgfpAqqXk98Uxk/t1gy4YYA7QsR4UCoZaUNaxnWcIJwZHbSXExqF8+4jJVY03ZmvRFzR6sJTvUMEKdL+epJerhLXKB1IFty91RJCrBMMKu9ZOdFnTZtms9yYrcbNPQ2a6tglpn8giKet4K227bIsHWuJxCMveq2d6fyuYgP+PYZ7qGQ+W3DVpN7uwACK9pHKNPaKbe3hNYut6GD6D7Ek2w8x32FqpKVNGwx0BFMqNLaeCFgf2UonAMleEde1qXnEy1zqNw==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwSZFYAj65RYzXb1/jCQS7LbKpA54gCakU+hnjiXOE3L</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTIrM8IrQPIVG7ZaYz6p6J871QQkTGdwZqgmQhaLnZzWNzfH80oYX3+8TWIVujzGXew==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70A4fLbLV3kHxv6jagmvQXiQmVKU4qOaErPxnpphD6J+4</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTKXIibGwQSlQkqz8O246jhZTLBE2qr/wDoyEkmHVhMRN1WFS3RXU+qE+KqPPAK9R9QZK/vUtOxITqq/7GIRZ/Gy0UVVtRzKnnQcDsEgE7ehgC/6j6zCtExDWpfjkEtJ8MQ==</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTPftIim2E80VlW1QknmBe7wOUvW1LWoI5ZDzrs/oh+leHCL0ym+zHD1I6MNtmvBMM/sM/DIipv+Veod2vAc1QT3Wv6Ma90nQjh9/XgJ+0Wt6Epn1zc2txh6DNb5xtXskhg==</encrypted>]]>&Controller;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WOKrpFriIluZ3LUfJvAwaiEXPlJojGn0tonJhrSZwgvPUXb69bwU4UtHU01CbfheFwASGRk5StYaCGBwFlJZ9vuJdCusqqyOoO+9szz/nkfMAX0bMTSl3qzMxSzRT+8ypSjqVjGTudZw9X+yyhK4Tg99SEDg4izMLhVQHyyaGc/3TFaMv7vEn25Em9f6T+1YauAkhLixK28uZdWOTkZJ/z/JUUCA62T3HFUjq4e3XaqneGcnaA/1eq15Bf3Q7KcxdXN6Lwxm6iF7EVzn8knjHdF91oqz+TxbSQ1mCVJJUgJjlUCz7iTm2jX2OP1qwt4gFOBQiJUvVqWTF+tu+CcHVXcRrMujTde9foPMfmGY9KEi1W5pR9r3igAoskZrJSok+FfLWkCksjHUc3uV05CM7WQFrNKXlfrPPP9aDrotAq0Rf/26+tDe59NYR/jaxuyiqpT6PF48EoBqZr7QhQ0XY2ZZyJMMFj5rgqCdsNSWaCHJr+wEzxkKJu4f0fnRjeAHyMS1gbtpColZulgTuM213hpV0LcNXpbdAcKMMQs1AK2S</encrypted>]]>
    </text>
  </script>
</dir>