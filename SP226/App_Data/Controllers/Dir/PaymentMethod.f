<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmhttthddt" code="code, ma_tt" order="code, ma_tt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hình thức thanh toán" e="Payment Method"></title>
  <fields>
    <field name="code" isPrimaryKey="true" type="Int16" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_tt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã thanh toán" e="Payment Terms"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1=1" information="ma_tt$dmtt.ten_tt%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZSFYskJL93xQw1RNN7RLofpKgzcpGGX4iMQgKZZG1RvJKaYUDxjDG2IPeVr2M04Sf3/hqYlfd33o1exckRSvZ4E=</encrypted>]]></clientScript>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ht_tt" allowNulls="false" dataFormatString="@upperCaseFormat" >
      <header v="Mã hình thức thanh toán" e="Payment Method"></header>
      <items style="Mask"/>
    </field>

    <field name="ten_ngan" external="true" defaultValue="''">
      <header v="Tên hình thức thanh toán" e="Payment Method Name"></header>
    </field>
    <field name="ten_ngan2" external="true" defaultValue="''">
      <header v="Tên khác" e="Other Name"></header>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 30, 70, 25, 25, 180, 0"/>
      <item value="10101000: [ma_tt].Label, [ma_tt], [ten_tt%l]"/>
      <item value="1010: [ma_ht_tt].Label, [ma_ht_tt]"/>
      <item value="10100: [ten_ngan].Label, [ten_ngan]"/>
      <item value="10100: [ten_ngan2].Label, [ten_ngan2]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4Jc8UKb5bE+qcc3vKuWfd7pXuPkJ2OiyFvShL8/PXteyvRhnRMwrpLvvD+9htAU5EEZwr2CkKd2zkC+IoyfYO1qO3CNKKi5te/1rRpyBLI4</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzO2jvOe68WOtuMuyr6TNA3y2zmLhnt+ap2IU4vuJAgiD7gYyWffMk7x/RSzqsJBIP2Osg5YLd8vIxKke0oox8mdGMrgBcJKzpEYQR52+PzL</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwXIw3VSIf86IPRZxKCm519s0LUMlDNkZoKZWrNmrZAb64xnRBMkPLDA+Pn8gDwG0CccrM3hnrFLrPMGsLD3P+I=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6R1RHdPMbygbw78yCjcQyMnyco2esyZHT3PvgDJBlT+nBkocbgyB0qJs9rvskmrRiprLKsGK/rcET+z7aGIfDYfRxrEf41eEB4UUTBu+WuzCQgNxSdL740CYJXMK/t1Kig==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliwopxkVG/0vKIxLwJnveJA9yC2pgvyqzqh8BgWuafu8EvFzjJveKcHtpnPGY4ku8e1cWKPtOIqruyZ2qYv4//YKLJ+Qaw411Zu9U6ZhAAp8s/fC+HODFYcDAzVvHRqb6utmcU3ltzW2z1g5Yd0U20DoYjNtx29uGFODMAn/JFx0VHL0ASIfA6cTyQY+JFgBLFUE3fnQEyHCzDetmM0tBxeIzzmBGeznZVmPIfpo3npmyr65Gk3i8kL4up4vlrqiONMef92ewLYBWVC7zNshgQ0keXPMQczoX6JrFqtk9VO7WFK4a7AY/lvEKae3gEXuxIEwgG0qqG/NNPYk7ZVOAdOPTVZBU7MwDt7p0lUSK7AX0=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3ceWWNuOQZp0iOYjPyPxLnI09xsCfvhgP3kTY8ihyiwWLAx/kCHNfDnsT1OfJNLQCTCoZPnQ4SBNhrGofeZRzn5LlUVz4zDFg2mjbFxNHs42hLTWoOj7M2gV402/jxbOwHleWrnsgMJcZvJv6YCVylThxNe5NqJm7Au4n8+poeoewjPCVyErxApSdWLSReSskh6Vs8nMnsFTw2KChkcoDe4jVI+2oQY5apspFBXvs8CxQ=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jjLoENKOtlwnSW1j6dreDsbIye/V0Lttw5l78AjYvSM3dTIvVCJE4/EGVvb1TRyYEU3dMv1B7VgcqcNT/CCNxTWsQLx4sy4G5RHPiRacUbgeVL7I3Dh7oz8uuCoU3FsnflTj6fRRez6zZCn0PRQYIHfN1P1dOvw+2WhHcWQt9PvbT5RsWqgPtng0decutuphw09CswpYQbryonITpsI7fzxr5i0KuYh8LbuD3eibKT6CLG31Ek2M6JQPx7hv214AXylZSq3wdhXkBDTBAE/2U+g==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbenyZLiaN/koN0JqTN4HzTH61yHiLzsqdrgMZawkbP1A9</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70E+ap/8j4iTBDwsvz5+ReBmMQPKDxbFzNa5nZWD142bXfKXZ7pxxy6pP+DIUq8I0a4LX7HjqohzsgpSjmdzKjpTv2EAYcCOUtSG6pUyXhAmM2nITJDdeFlfXJj2oYj3pHVaHV043rZjvjHCYbfdnT12K5i5YAbgvom13fvlQ30YLJKm9I4OFBHxvVDaiaVc0hT7u/hDSBa/h5I9Slt/r89ao35VUYDoztfptc63G7n7aZE6zR/HQpxYpncPKYSgBAiSkTlOSJ8oiwAe2rDR3b6weSs+c9dA5bIHGYOIkJuI+wpNfslJVMzekaWL6rOobEyGUFjLKHp82g269XZqo3kQWAIiw3OY1a8r/hYVCRiViLQjAmQW5j1RzXz7xbPh+8CnskR9RecrOBfpaZoN9WDTH46aIoCjSTHzjjhmSAYn0PdIhAejzE1g/QMJqy4kDYGu/fh0tK6ibU83ajIfy0BG1xmvLaFaaC2yhBrTXchzxCuk8a4eSthES1k8nrOl9WxifY2wKR3V7vsvxxuMw38gp+VBEW58QbAffa4loPNDiBLfzYeN4rKdeBxDjCqgQJS3zeeL8zbUiIjpDcfNIoRFfwN6c7RS1I1e1TpgehsajIjgOy18hZuwYUki8CcpjEissFiiOh6/wVqyErgUa1WQ=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <response>
    <action id="Term">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK45qR/KD1KA+mdoLJ5m5Q9eXn8fvKAIRu9DW+2AhSQzS7H/JTu0Nzz3ZsFmYKEmqZMW/rtBXh6HN69kOcEavnl/+HYjpuBFlNKMl2rkV1A9nKLJReVtFVsTXrgc0x9I89w=</encrypted>]]>
      </text>
    </action>

  </response>
</dir>