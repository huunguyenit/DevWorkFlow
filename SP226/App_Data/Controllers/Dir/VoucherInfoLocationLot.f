<?xml version="1.0" encoding="utf-8"?>

<dir table="dmctvtrlo" code="ma_ct" order="ma_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo theo dõi vị trí, lô theo chứng từ" e="Location and Lot Tracked by Voucher"></title>
  <fields>
    <field name="ma_ct" isPrimaryKey="true" allowNulls="false">
      <header v="Mã chứng từ" e="Voucher"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and ct_nxt &lt;&gt; 0 and xgl = 1 and status = '1'" check="wedition &lt;&gt; '9' and xgl = 1 and ct_nxt &lt;&gt; 0" information="ma_ct$dmct.ten_ct%l"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''" hidden="false" >
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" clientDefault="Default">
      <header v="Theo dõi vị trí" e="Location Tracked"></header>
    </field>
    <field name="lo_yn" type="Boolean" clientDefault="Default">
      <header v="Theo dõi lô" e="Lot Tracked"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 330"/>
      <item value="1101: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="11: [vi_tri_yn].Label, [vi_tri_yn]"/>
      <item value="11: [lo_yn].Label, [lo_yn]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliTALPvCbqmHwGoeAPuLmm9Zy7ppZOopkgv052VpHavf3D42T39h8pYyZVa1s2mTDWfI02BK9bR1HF1T1DwWwwV0PCVPZwO/aIBWhUMBOvotKT5EJFnIGYFpyS67vw9+oRkSuKJWK8VK7BoSBIpw2djUSGokxWDaOnLfYDCMMeESNScGAD+yzHCRErVOQiK3bkVv1qNsK7D454vX6vFMI/K3ESXvzvNQdKBiErwAUBtO9DcpH64BKVErBwZc/ZVxq4b2LtRogb53kiIRYSB8yQUw08nZeaFQn54t1G5lA53/cJjA+Jt5q52ugVIXU4Sw/kNvzQUupIZGZNkYs5bsb6yQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nDwjLsRmcEU53J4AQhnjnXTX6XQuYSQEp2Mpjz236elM3SVaMHq/U99nJNhpCeE9kY1tRs+bPnKWOzj9T7yW+Q5o513fdDSCsh83ycPv9XKPerOgUNGS3n7UctWaFTj0mQY7VUvQIIZt80yMxnhaeqmqrKpg4SkUScx5wI3wixDvg3AxFY0q+gpk78rXd7rot</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jwd4y2MET4DtLkWcZxrbC8A/T65mb2pMzsr1Pt+1ev8QSXQ/l64fNPyaZgnFHtPeuD40syUSFUZtOOmr24V3I9TfFNpIYjQXlhbk+qukgxkZMyHihzg0BsGg0BrY2B797slETBTqJjxKBWReq66Yhaxecf0uLnfD8lmBvTxgImnQGmxSTRlcH4INu8cFB+1cGWwnZKInELgir7EWRGwkasw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeiikR0KH1iTsKcqzpelumIspiZjVGjZEjNopiM3ayMbk</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>