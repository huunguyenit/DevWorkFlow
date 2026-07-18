<?xml version="1.0" encoding="utf-8"?>

<dir table="hrdgsp" code="ma_sp, ngay_hl" order="ma_sp, ngay_hl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="đơn giá sản phẩm" e="Product Unit Cost"></title>
  <fields>
    <field name="ma_sp" isPrimaryKey="true" clientDefault="Default" allowNulls="false">
      <header v="Mã sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="hrProduct" reference="ten_sp%l" key="status = '1'" check="1=1" information="ma_sp$hrdmsp.ten_sp%l"/>
    </field>
    <field name="ten_sp%l" readOnly="true" clientDefault="Default" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl" type="DateTime" isPrimaryKey="true" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="don_gia" type="Decimal" dataFormatString="@generalCurrencyPriceInputFormat" clientDefault="0" allowNulls="false">
      <header v="Đơn giá" e="Unit Cost"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="110: [ngay_hl].Label, [ngay_hl]"/>
      <item value="110: [don_gia].Label, [don_gia]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3Vs2YbfrK+fZGJ5J89WpdHJgmF8ldES5iaDvPWXivHokEYA5cZkBEBL6rx9xCo5DhbfZMofdgJrQpLFWHudUbQuopqvdVyA2rLenPXD6Zksa/x/pCrfSU2gWV9OgeC6AUer4mZT9ocu2xBwyHh92MzrV+nWVlOdo8p5MUeHJVHi7xv11pZ07v8LnNTzfrIhgg==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3Vs2YbfrK+fZGJ5J89WpdHJgmF8ldES5iaDvPWXivHokEYA5cZkBEBL6rx9xCo5DhbfZMofdgJrQpLFWHudUbQuopqvdVyA2rLenPXD6Zksa/x/pCrfSU2gWV9OgeC6AUer4mZT9ocu2xBwyHh92MzrV+nWVlOdo8p5MUeHJVHi7xv11pZ07v8LnNTzfrIhgg==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulikA8iMgv+3GbRrLR/gtJDKw+sa+fpvdzI23CM3DdZiZKHc2/gGxg0ZRPFI4MXFlMWxjqICnIOVAM1TE5uHki/o2vaIf8nIveRMlHzaVlfbg1J3KaDjxw5RmV2VYoemn47AEqar0GgynJkdNlSOqn9fHm6Zsj4bMVBekeRTa5jkOGmoNH1vZAp9i1dFIRQoxdTUrNjd4fC2lg9eYNjFOZPvuA8iuWbcOZlG8h60Om7H5rnnIHGiWhTvIaas+z4kR+Enno/2t30uPlI6czRCu0Vhf2GbousXT8qTk3ceJOIGnAQ+ITqwfy6N/tT/r5fCG/Ua5wRNkNSGziMGLCG76T/2h79E6LFFNEFHfTY9ZkbpOBZlwO5PG7DNdoSPzoqKh72ssheUQlwj6kAk3We6eO5LQ6Bq9q3gYV+61n/GvwcMoQvEaos53cqm/+A6CZsLs8j</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nclXaAIdEc3YI0ga9l3jYPXPsuMLgkrz0otOdMBX5J9iXTU7vM/IhsueZKIciFWOMjtl2AAIx4ZygoQ0ILHy4yFkijEs0KWBUzYoXq9Qmj6E6rf0Vq2cA15UcstUgq3ElUDFvnF15CjV7/YFho/TOyGs0Sgddx3k05gGfTPMn7AwA9tFNYWe4cs2/vLiQk+vRXVr0cIA0kga85HvLCKfQMUQR5IUkVrf5wwx3GmwTvL2OSp8YlCXZzn3bU/BwS/F9</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jkPwQrL7tWpGC2Oy1WD/2G7FWA83AR+cOl0swuvq0n7yRJPjNdU2DObSlkUl8SUqBnsqvBK3/uG+zH59tnOg5sc09Ub+3BKsAAWDsQg6LedRX1TqVqa91cqa0voRiLOu54vqd9QFRolwh0hOFbY28j3k3lPf0rNLg+wl1rPKWdDlU3bPipNC3o9mtjBvknrt8zxjCZol8HF8GsEuk8XRY8X496fwq5eq5K7ZN4K+ZUIGp9jvSDqTn05Nc8UYNErO/pJ9moX3M7SYm/+jGcQIMptaz4qWXKhCQhleAURD6fCXIT8cSQLGX2bsXKbqVl8RqACeSslgaKNkVy7RKxVZxVgYSDLvlcCPbVjZzNz2z53U=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeih52J7WYvU0mINct26qwr2szadBFMxG046Dr1CQIhksv/kcuZ9fUSxhK/ezdWX6zg==</encrypted>]]>
      </text>
    </command>

  </commands>

</dir>