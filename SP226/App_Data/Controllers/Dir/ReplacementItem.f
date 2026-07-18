<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ControlFocus "ma_vt">
  <!ENTITY LockedDateKey "ngay_ks >= dateadd(mm, 1, cast(str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01' as smalldatetime)) - 1">
  <!ENTITY CostingUnitLockedBeforeEdit SYSTEM "..\Include\Command\CostingUnitLockedBeforeEdit.txt">
  <!ENTITY CostingUnitLockedBeforeDelete SYSTEM "..\Include\Command\CostingUnitLockedBeforeDelete.txt">
  <!ENTITY CostingUnitFunction SYSTEM "..\Include\Javascript\CostingUnitFunction.txt">
  <!ENTITY CostingUnitFormShowing SYSTEM "..\Include\Command\CostingUnitFormShowing.txt">
]>
<dir table="xdmvt2" code="ky, nam, ma_dvcs, ma_vt, ma_vt0" order="ky, nam, ma_dvcs, ma_vt, ma_vt0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo vật tư thay thế" e=" Material Replacement Declaration"></title>
  <fields>
    <field name="nam" type="Decimal"  isPrimaryKey="true" dataFormatString="##" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" allowNulls="false" isPrimaryKey="true">
      <header v="Mã vật tư" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt0" allowNulls="false" isPrimaryKey="true">
      <header v="Nhóm thay thế" e="Replacement Group"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt0%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt0%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230,0"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="110101: [ma_vt].Label, [ma_vt], [ten_vt%l], [nam]"/>
      <item value="110101: [ma_vt0].Label, [ma_vt0], [ten_vt0%l], [ky]"/>
    </view>
  </views>

  <commands>
    &CostingUnitFormShowing;
    <command event="Loading">
      <text>
        &CostingUnitLockedBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw9P9keegRGTJEvWuNJvU7880aZF/jy7sGqVpRLWzXAC7Ldi6J0u2qxHmw/VZ3W4gQ+pD+yWNPa6WVQptvjO2bA=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CostingUnitLockedBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw9P9keegRGTJEvWuNJvU7880aZF/jy7sGqVpRLWzXAC7Ldi6J0u2qxHmw/VZ3W4gQ+pD+yWNPa6WVQptvjO2bA=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cuceJVbNuj5giGWZ2jnR67ohwLlGn1k+KfJtPMS+Bn/t/ZgmVCyEY596qesLte9vXUJ8VSaAGRGXXOLPSJtLxD/2m7jsQiZh2NDvqCfo+hFZ6gosX92nvTp+XJ4D8JG5b/rDWAS5SncLCOYQIzRBvzc9Klz/L+H6rM5b1xxHrsWK0dZEZUce2vqehYqe2S4TJ6CwOI0UQbvVFEXm01eID8V7Fx88fiAW9koZXXmBdadMigJ8gl/h9UroqPdSXtj1hZ3Kzmwev6xp9Up0wEE/DmSlcRLYlMowYjhyTktPOOmOMwv8u/1e654sANVoITjnb7eTEvvw4ok+YzLEXPDA1MdWDFyOo66G/xC51+E0KY+Xw==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9sfesf+e3ush620CWbDv1fsWZyVrMjRcP73g5kglVX/gUctpqT7501g48yplCCwFuiP1d0+2GhNKYu9Lrvd/TGuJxbhYZin2kdoM0YZaAWKIQ4P7lj0s6iqzUuLD3Fqh6UH8MEblSGos8GGjPpMaCyVjCW/Gxtn3nCRnttOcPDfbuE1e4WXB3JHLNbCA1S0S5UieeuOMTTnEBV4csKqsF/pI7ZkC807MQMK4/WM5+/SdmmzxGQ+u0EVJY74qXyu5Ji8rNH81/Yz+OT+U3s1/3BREBWDw9i4SUXdPla72GpOwPXVXPvw+gyxaXfrnCyTyKlhHbJKGtScN3sOyCoJ/gFpPxZCdCYAoctep+ELWk609QbAqIFhsc/cFkYMAP3nNWJ3EN/EJ4QCjZ7DFAmpvYd3HBl/B2CMx85Adlp8b7pM</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n+Q3Aq3n/NodUEib/RjpokEjf+fiidbN9iNvmLNz4INPZP2t43z+XzxMMIOXrOHeoXP5AwPSWZNg5To49xjUc2qOgKsqz0ruo+FjGX4n8gK219zwcjPpqJjKo35rsKkyO72M5i0BNkiQqFRFO15/vpgaG7Ar+wjSulxQLwkJMXnEdfoMQQ72jSzZ67E1YYQupAW6Uenlq4g6uGubNGveEMA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHbjveXsmJ4pkjBvMl7kGE4JJNIOINcnMIHJwihpJ14YxmrLAeMQrSlEf32ZNjKBVub+IqtcucLfTw4h3Kbcc5ntA5bsinYxSM/GPKp5CZ/tt3QW2ZsYO5sbvsQDUy+jWX2EjLjHmt1Vl1YG01yviFN3+2QB8fa8UjluFbLI0ZBvoaCNLKbKC+vpjf43hXOsIeTZQXXw9Aaal34fTKLiXcBqFTCiZiG8WYiOObq5QJIss2d52M9NfcK9D67q/Xbz8H91k4xJYkMBj0K1GgTAYYjRs6JkCATPrN/xfhLRvSmPBwqtPcTKg9Dn5UDN+bDdf</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbekcvOsKVOZ2bTiN7g1JoBfRbP3o9JQ8h0eK1k3s6cntsiwrT5szyKM5yB+gzwqztb5G1OWS48ZK5vu93gQXGbJE=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CostingUnitLockedBeforeDelete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Kw9xKZUg/hs/uweeYRI1Uvrm7JawuxlHYgWOPOaF3OAGKxq0Nq929iJbWVAVwMEIqE/rowSLWbMQf50sWXx05Fqsdumr8ID8GhutbKFE10ACicr1fZ4/MAUphisrYe5DU0cKxE0OJCoCFUDZQ3rco4qjwKN3SM1q7gRM2RCILG9R+QoPouPo7lmORZigJHgpw==</encrypted>]]>
      &CostingUnitFunction;
    </text>
  </script>

</dir>