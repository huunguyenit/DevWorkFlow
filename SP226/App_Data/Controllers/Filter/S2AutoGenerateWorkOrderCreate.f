<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "S2AutoGenerateWorkOrderCreate">
]>

<dir id="0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tạo yêu cầu sản xuất cho lệnh sản xuất" e="Auto Generation of Work Order from Manufacturing Order"></title>
  <fields>
    <field name="ten_lsx" maxLength="100" allowNulls="false">
      <header v="Tên yêu cầu sản xuất" e="Work Order Name"></header>
    </field>
    <field name="ten_lsx2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_lo_trinh" allowNulls="false">
      <header v="Qui trình sản xuất" e="Routing"></header>
      <items style="AutoComplete" controller="CRRoutingCodeList" reference="ten_lo_trinh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_lo_trinh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_ca" allowNulls="false">
      <header v="Ca" e="Working Shift"></header>
      <items style="AutoComplete" controller="SFCWorkingShift" reference="ten_ca%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_ca%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="keys" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330, 0"/>
      <item value="1101: [ten_lsx].Label, [ten_lsx], [ngay_ct1]"/>
      <item value="1101: [ten_lsx2].Label, [ten_lsx2], [keys]"/>
      <item value="111: [ma_lo_trinh].Label, [ma_lo_trinh], [ten_lo_trinh%l]"/>
      <item value="111: [ma_ca].Label, [ma_ca], [ten_ca%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIkDam2OpJKeUPrZ6I5WGFhnaMdP3TwDZh3ymfnifRK0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6vwF1B7d1GySFdWppW9fqaMOg5G8iQnsDUnx+RdclahZNZlznBL457SLMVed6cOwRgblphFlAlOw5bAT8S2gL3fiDkslypbK1h3ZpQG5b3Wq7VKmfaavCcn8V7wqbWc6dO+O4NGNHJI9qQXZCJ6l9wXs5QOob2QpU0igWmgPdPS6620pk98efOngwzFJJfrjR05TzR/Jlg6H7qn6Q3R9xr0IROLQD9OYAJUhu+0dmRX1rFi7E+0tMf+zJIbmkeUcgre6nJptqHwfupiw74tTHKi9WHeqQ/1A4USwoWo8JFyuCkTZ60ok2HxSaiJMFG+W9dielHoZO7FWv8bhI8GTosDK/Zjokq5lbTpzALHu4osb3CWOEdWa9A+t3E1rzyn4Q4E1dSj6HNKF5J0cqmVjQJySfWCx7foqa7VOjuoawI07kMt/1TUd6ovSGvfZKD+tfAE/ctIfrUw7dV70E5V/w+lZn8YVHvHMgdeJZpBwV8XKUZPa2fN0YLLWM8Hue/ZeePxGC8bb00/wqg1yjux7oYUIJuZrGn4tiW7g/2fvhoXlo/fDafwQ1wX4NHwMCc8MyxzYj/5SYWYQcCW73wa7hqJkcUzEtlqBD6kUK76WyAh7AK6Wb/c/bNQHm7hrZWv+rkDnfvzIOmoWis9vZgYfCefn9SzyyC9E4BbyHC3Zpet</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1xQ62TljBCi4DBJCzLbeFNi+Lwvf+0FfLTAGNk6bbzfFb+Xda0DjdDaJZ4BcYTSeMw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l15aO01HH673awFvT3xukt4WwoWVmVdwRECIuctWSYE39m2FFNJA2ivX0VsIu2hKzQz34MKcrnNgVGNKi6QeAvEnp6q8eTsgcvI98Zc6cGKK9BJQ+KDVk26d8iXfuZSC8K/0RJKKY+f45OPaljOlG4NAW7VgkT6xh9eKU0dtHCdyC3fhH/uYQCcn8K6dBB7UDRTIuS3nLtOREqU19GVIVu6g=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l15aO01HH673awFvT3xukt4WF2Fz4l/KAFKzIJDZGhn9bN6vBKmJNXPES1Za2epR5W36k4T8aiZjpbDYRbmIe2jb8PeuVk26k2K6dx844ieS+AKP711h+9CuLu07yaTsyMw==</Encrypted>]]>
    </text>
  </script>

</dir>