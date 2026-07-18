<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnvbh" code="ma_nvbh" order="ma_nvbh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin nhân viên" e="Employee"></title>
  <fields>
    <field name="ma_nvbh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nvbh" allowNulls="false">
      <header v="Tên nhân viên" e="Employee Name"></header>
    </field>
    <field name="ten_nvbh2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
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
      <item value="110-: [ma_nvbh].Label, [ma_nvbh]"/>
      <item value="1100: [ten_nvbh].Label, [ten_nvbh]"/>
      <item value="1100: [ten_nvbh2].Label, [ten_nvbh2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>

  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwcXtQbb1CUNn0SZtb+adl3CDbBVTwZGKLscdsUgaHR8zPZSUZAt7DAjdSvioOFsGDY=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYbB9qNsWxt87P9l2XxuiLX7uOPL8mRvq6O/nQKFC6GDAvrs1ecEBOD+HKH+xVIQM0Y=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7dtyInBvQzxdX4h8PcESQb213PkqpSWRzwHRlU+hf4VzAZ43tugblcfk61p6OBb5aIA0VA0Lgk+1E11yeSOuwzBZE80HDV7HhConsf9a86fHGFLlidX/OZj9rGz+WuN8uYUM4kK+Y83v/tFhI2MesXmuwcbDX5mTBBpk/s4sPlh68OA4+IwIjXPrjEx19QbIhNrYjuBfUQeIKH9KJC+WKYBu/NmvDmPIu5YCbCSO1+V4U4/zVu5SFtmNNggjTB4IbRE4ItQQu838pYF/FGpuQ0hnvskvWCPplv59HQqpbi1Nv1dp0ZRgeeTE3dSmHDg7rIe2C4g5cxZPGN3T2g4uhu3</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nIrD9bq3HNFJjf7QgIA9/mezWJs7DmNyuUtt2tRWW00/49RNfDWnW+UYxZU5B65DI10je5zwou3AD3JerCKYG8BHse4P9xHyLAG7awwdgHw+ZIzKNgw26juY6dJoukO+8vCbJ2X3rC7Eq1x8C8t9bDvN3zTxO1tDcXwJWxH+B1XdqHv6D3d4k/ObmMUx/iGAH9QDJqwh1Sd71cPx8UwTUKhaWGMJAJEbyu3jPQ28QdHo=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jWSQ+p3HUvsl68ejeuggJxuyCxH0mSHuhq5WSUU9hOWhWfcGakN1se8q+2NPJI0pdEN6tC0lWUkC7Qb1eaccBgJa/mf1lw/ZRbdssGscDtlbIh9+/iAnM0DbdUUpCtaK+XTPKcheCgbyMX3WUjFVfEtGERh4H7xtglgasK/8c1Kgi8dbWVDYXUvgHxkJJmRpEb1ZygOLmG470/3fVuKeDDp8ALMkrke08cYbrebRONR2M0bvpF5pSfzo8iIm5kM2SkcXQRE6YQfXaIBQ4jtjXiA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeppGcWJkdBPnH26MgxpXUY9Za94ii7OpeCUGZdcg9kwH</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkbh7REqPzkpJzxU/Vw6XPj8vZrnjGUvLHbHCCc+DL3ndk0edwv7FUn6Q9liZ4fZ26BhqoonfaJsAxdVlShKL0ddc6eXM0xrR+XWo22Wz2Uibv5pGVgvH0iRqbfO0N4c0cFuon1VDYQvr1+tHsniI4GquJtVsqxTVuFH+DxC/JOcF4T56qjZgSzkP0xw3fRE8ccxKf9pmgpSauRGwNYIvukg44YqPEuuJvY/lEroIuItDjAQhGXs7gDVrfSKasBIbmCbcd39HdnFvpcdH2K+bSGcPYuyenPplLfkMiWTJa7fhBHryjobBidXsqKrzUVLmuA1UBjKy+izNBiUv4P9jv9r</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>