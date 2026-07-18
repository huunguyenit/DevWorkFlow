<?xml version="1.0" encoding="utf-8"?>
<dir table="dmcltg" code="stt" order="stt" xmlns="urn:schemas-fast-com:data-dir">
  <title v=" bút toán chênh lệch tỷ giá" e="Exchange Rate Difference Entry Definition "></title>
  <fields>
    <field name="stt" isPrimaryKey="true" type="Decimal" allowNulls="false" dataFormatString="##0">
      <header v="Số thứ tự" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_bt" allowNulls="false">
      <header v="Tên bút toán" e="Description"></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and ma_nt not in (select rtrim(val) from options where name = 'm_ma_nt0') and status = '1'" check="loai_tk = 1 and ma_nt not in (select rtrim(val) from options where name = 'm_ma_nt0')" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_cltg" allowNulls="false">
      <header v="Tk chênh lệch" e="Ex.Rate Diff. Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cl%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cl%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="11: [stt].Label, [stt]"/>
      <item value="1100: [ten_bt].Label, [ten_bt]"/>
      <item value="1101: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101: [tk_cltg].Label, [tk_cltg], [ten_tk_cl%l]"/>

      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI4TNPzqTjPmaEhODU346NNS4FRV6lZ30K1BukzjQ9bsf3iWBuDhpCXg5ARuSKpgj3QTCq1oGM48VCGxsibNsVn7s7c6CzbmHLoKJs1V2wnL/636G4KUGzZt4uPukzW1PCD+u0KZ/p6PDCy9qrEEOL7rRm1Iqbmw37Grulcpx7DbzIcbhuq+46eNzlVJA+v1koc3dhuehB9J/OC86BE1Ju+ypihRKA328UOdCtdRcEMXH/SUSswJJlWh121IvwGbqPL5I9EQa4KyZoIh3j8mv0B8MMO+RLH5EQJkIRacTfscR/muEJ1zW7Dgdcq5Lv5R1S007mK8Qc0KqOdBDFJu2s7icoIkF6+O7gC+UDyKl/ewDXGxtHU+VlRj3dfG2zcZgwGcfIe9c2nGC6hrFPoYyJJbaJ1sPiI8Kv6e68SzSjHqDRRizsuztSchfMDC1LQTTorYoSx3Fwm/n92XN0lCrfbcA4WnUHEMs3s6sitEe46LDsNJ04saMZEB5sG8W7lsx2A==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n2npELVi3mHxu/Wyt++DtLr9fLIbVYC7n/MPehIC1QRSFvAKTY/wkVhGoOicwGDgvBzgXKZjMxgcXvwX8GD/dyL8hpMzLTWaFh1vyuNEJCRxisVWC5TrhRK/aOdCQUrrRrZe+oafw5EhWPRoyG7yld1FaCN7/4xcOu7h1R71vDHKWNlvMAQpQvkPceCopvf0a</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jVCr9zd45gLuwINxG/8BD7yoQprajxAxCOQ52Bj+ueJmYaQClfkbJMtK5QJzUb/jaRZxJ1l6FNbcT84wN8CjRGPqZ4w0w6JK4Olfrv0zJEv+VxDhqV/uV7pWGaxLThDmkyrrz4/+6UO78R6FeElzdO9CTJ6OaMLKaVEqJgLV7b5+j2BSwN9iEQmBf3Rxa/pd6TlCeqxxJz8XxniiXBW6Hj9UTwS+sHZLSHHoEhKLDico=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbense+DuKZ0i4Xdrn4SIrJvzL5sjnQWz5Dir9CeM2pi5k</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bAzRZIuKbJwwb1qtuzxwYvixTFL3sbY/iRCUmRAJEn+dLLU58ygKzFomcMKQQNvTdaICYmnfbEpv3QEvDjCOKhCufmleLEYXQmfV9MsrGdcuCd1Kfg7LZhOBpwV0IvVbzkKaFQEv0PNlyU5W/VPbvkTYyEdziuKQT+YbQ0iuHcJXaBYaQr5NxhiGLIw4DUqoFS1UFepokO4d0sd+yxNhEDddRX+yWbTgmE8ngpn1V393fp6gxV7/JlcjPmjLBytGlMo6oZmxNYXWgLnIghj2Bue/8XMEUPCuJMFq/xOhwd4jM1ccWyyQu0t2oI6tQ7CquYQFtKrWksnQefL+TChTtYBBlNpcrX3pxv/ud38VlMpAHqFALMbpqWvqzxfL04HjOtgOdWpprsXtj6LzrfmeoUOFRAEQb3B8AE4/Q5i1Wvo</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>