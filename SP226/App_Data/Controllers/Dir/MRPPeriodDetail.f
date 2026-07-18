<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY k0 "@ma_ky = $ma_ky.OldValue and @nam = $nam.OldValue and @ky = $ky.OldValue">
  <!ENTITY k1 "ma_ky = @ma_ky and nam = @nam and ky = @ky">
  <!ENTITY k2 "ma_ky = $ma_ky.OldValue and nam = $nam.OldValue and ky = $ky.OldValue">
]>

<dir table="mctdmky" code="ma_ky, nam, ky" order="ma_ky, nam, ky" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chi tiết danh mục kỳ hoạch định" e="Time Bucket Maintenance"></title>
  <fields>
    <field name="ma_ky" isPrimaryKey="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="nam" type="Int32" isPrimaryKey="true" filterSource="Vacant">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ky" type="Int32" isPrimaryKey="true" allowNulls="false" clientDefault="Default" dataFormatString="#0">
      <header v="Kỳ" e="Bucket"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_ngay" type="Int32" external="true" clientDefault="Default" defaultValue="0" dataFormatString="##0">
      <header v="Số ngày" e="Interval Days"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZdhKMyDcSZVXQLrMIZtUm+sIq7NOfNqLe7vUZx6OfFIEsvXcR27j8MscsF0WSlFW3g==</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày bắt đầu" e="Start Date"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZdhKMyDcSZVXQLrMIZtUm+sIq7NOfNqLe7vUZx6OfFIEsvXcR27j8MscsF0WSlFW3g==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" clientDefault="Default" allowNulls="false" inactivate="true">
      <header v="Ngày kết thúc" e="End Date"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" allowNulls="false">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 10, 50, 330"/>
      <item value="110---: [ky].Label, [ky]"/>
      <item value="110---: [so_ngay].Label, [so_ngay]"/>
      <item value="11000-: [ngay_ct1].Label, [ngay_ct1]"/>
      <item value="11000-: [ngay_ct2].Label, [ngay_ct2]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>


  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzkRWEIKYe+a45aXN/4AfeIrIjHCJN1mSIg8aexl8S1H0/BqC3CfPukRZQYZPy7UXpbXOdPUllVlOHT/Wo45lIU=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzkRWEIKYe+a45aXN/4AfeIrIjHCJN1mSIg8aexl8S1H0/BqC3CfPukRZQYZPy7UXpbXOdPUllVlOHT/Wo45lIU=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9iwLQU+JDWGMC7TtfbjEz9hWKRM4onCBKhBJOhTWBlo+AWQAaX6+jBfDN47iv2FygxYgE/cbSW+3bzcPe8HI3fL1+ZBCCvPu+H9MKvJwR46</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulibNAujXIvc25ZF4P2lmh50HD6NNkjAhvmqpWdjhx7WwD3TXAudrAcx5MIzJcrHUPcKzEIv+V2ekkw1S36Cd2sFHXTxAyueayqdodnP3cze2b6Yo2UA4fH67402NMdCL0NGADxQUM3Ntx9MOXdU+QTnIJMIS3V10hUU55cKg8q2/UotS/vsQm4p9cP9ITn6E4W/PF69kAtIwAvT4K5EtsfDCcTr2gMsIHgsZEnYsDhAikkS5hkN7o8MgsKw8cyIFxwgnSsxAEggqLpcismXlLGu41oxC4+fhAavKM152Iq1ZiQelMqLV/xfTic2f3SBRhkHwV7a8GOO0s5X9ZouGqT5Luxo+1vKroqkgn1PHNBl8QBqSJhX70+M73JkL6voP8KUbckD5m9rttSqWGaBSsAnu9QzXuBztmzJC8+Nd/41t/eBZoTAuMqnQRQKNY5TRdU</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3chGulZx9js/QAMlXiOyoG+w==</encrypted>]]>&k1;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cIrpd6++aOhypo6XdVj/R2oy9vCG1Ye55RiANIPe8OBPoXvuurVH83kyka0EveWM/LHPnyIPrgbWYHp5XG7DrNcaKgwqYnYxc/jnQjvVt8lNxaczeLW36HZ6s20UYSrjKSjSxzr+dOeVT6cONVYIThhr94JOzMd125VEQTcL9hUwUjNPlKcj0ZVU+ph+LPPryolkm42rcUT99PZu/AF1HEs=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHIfhvN/FgzGs7XWCpp4tNw==</encrypted>]]>&k2;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cJmBzV322WK9nWGNuXLDzn5NOgjJl4znHt3Rjx8fVKEtZtpJ7Bo8QW2Yp9HS7+4oXTrprpKVD4eMCJbpNmKb4PZMpZ4kfjbuewLej2KyEtODzbvmOM038NRgQ7rRaNuX/qF/6OYKjlTD/IMydNIM7LGUfuW9N1tazSAxNvsZgsR/hzx4nCdjc2N2+nwVSwh/AA==</encrypted>]]>&k0;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cE/hpETWHna8gLwEu3sbtN4/gTNFFQu0uenpQvEOpfKo64C+/GJR6A+stLGmvWCenQWjmiZXH5Ms/sggehN2p6w=</encrypted>]]>&k2;<![CDATA[<encrypted>%ShDm4LooPFnWfxWGAKIehxn5IEU5hwC3K054s/5gYTI=</encrypted>]]>&k1;<![CDATA[<encrypted>%ynJ3B2IMttZ3swIzstMMYWWHuLa0v6wt7BSl+2b6jipDd9bJXWAcFXKYAG9Sheu1/DCziXdh797nyVTqATuoZIn1zBtOD673SHZVqOvBNFiKF1vJ6wQKzqg2Svg82qzBWe9zDNE7mRSNouLuV3Q7U9kczeuJk2eTdfaPVC83EaKOd9dOKf5had1ef/2vkAVx</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqMboCxcWZPqmgVHI4rxdBdE5v2XLyIc5gSWiGIG4xro</encrypted>]]>&k1;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70DBVv0mSwrQ9Ok4hamJlA9Tqyq1U9Brbqh0H4Q9WWKSn+HpJIjfzBrM9qcGF/FbZficlIX3TeKxWTv6VlpoTQaqESOC9J4wyjAqQYGcFbyqEmkPcYmqU249fhDB+Y/bwWK4Pn310wMJ3uVZe3QMJtHNfgczFEFbIonn2JucQIT5GLDizfHrjKgnIotzRgErBox81yEG2uDxcIFC+OFRgX5VIEybyRnTTGUkPLFe7ujiX/8sRnO10PBO55TscDm2pjxdkOwf9M+X9P7jEvXrSvC5rtvIQ6mfTW67ePRY0PTAAIB5K0l6M9mR32ecU+REs7vv7DzZ3Ifit7pC5ZyRUXGWY7UXYCgQocCMpT7MRdaxvMVG40wIst0QUR76m945ciUQo2L9KlzlybrNK3XzhgJtdFv2vCy3OKUiYgk31fyMEIVgzUnS4Qg9AntJhl+s/8m8Ei92rw5lJBvk2wyrQiDB1c13NJOpcl8cF3R6Q40xu</encrypted>]]>
    </text>
  </script>
</dir>