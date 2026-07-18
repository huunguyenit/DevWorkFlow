<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">

  <!ENTITY Identity "WSGenerate">
]>

<dir table="wrkin" code="ma_vt, ma_kho, dvt1, he_so1, sl_xuat1, stt_rec, ma_ct" order="ma_vt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phân bổ" e="Generate"></title>
  <fields>
    <field name="ma_vt" isPrimaryKey="true">
      <header v="Vật tư" e="Item"></header>
    </field>
    <field name="ten_vt" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dvt1" isPrimaryKey="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true">
      <header v="Kho" e="Site"></header>
    </field>
    <field name="ten_kho" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="he_so1" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="sl_xuat1" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="dpb" external="true" clientDefault="0" defaultValue="0" rows="184" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="WHGenerateGrid" row="1">
        <item value="ForeignKey">
          <text v="String: ma_vt, ma_vt" e="String: ma_vt, ma_vt"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: ma_kho, ma_kho" e="String: ma_kho, ma_kho"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: dvt1, dvt1" e="String: dvt1, dvt1"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: he_so1, he_so1" e="String: he_so1, he_so1"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: sl_xuat1, sl_xuat1" e="String: sl_xuat1, sl_xuat1"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: ma_ct, ma_ct" e="String: ma_ct, ma_ct"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="244" anchor="6" split="10">
      <item value="25, 95, 25, 75, 100, 100, 100, 100, 100, 33, 0, 0"/>
      <item value="10101000001: [ma_vt].Label, [ma_vt], [ten_vt], [he_so1]"/>
      <item value="1010------11: [dvt1].Label, [dvt1], [stt_rec], [ma_ct]"/>
      <item value="10101000001: [ma_kho].Label, [ma_kho], [ten_kho], [sl_xuat1]"/>

      <item value="1: [dpb]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2xlK8qHzvkvVP8ToujfaeunrDzIlMODk0ff78ePL1Gr</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Kan+1XD0VV3ujfIAC7OIcyrAh5DtluQZLNPvFKIaGLz16HQbMYJCS5OYFQ8zgRL6A==</encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2n4f7jl0jX8hzbsWRhvYc+On9S5oefEl6iw4NanziAh</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Kan+1XD0VV3ujfIAC7OIcyrAh5DtluQZLNPvFKIaGLz16HQbMYJCS5OYFQ8zgRL6A==</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwSZFYAj65RYzXb1/jCQS7LbKpA54gCakU+hnjiXOE3L</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Kan+1XD0VV3ujfIAC7OIcyrAh5DtluQZLNPvFKIaGLz16HQbMYJCS5OYFQ8zgRL6A==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70A4fLbLV3kHxv6jagmvQXiQmVKU4qOaErPxnpphD6J+4</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9HoI0bqADHHZNoJGEpHYBttry6bIChDw8fTVHB46apHY2rvTniZGOhEhnwYvG1vnfQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ac6ieFqQHRAfjjXPMzu87n9hX24ef9KPD2joh5SG2onCgR5cVzcMUD6Qqsh5NCeSlcxh+JyzUWtqF6lxvdEItsi+UeR4KQHzGv8BarpGDP8fX/pVJwwrBhsONFzlBi+UQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9FHxTIUEvJi6MTJ4CXEDv1GoFs7JdDxRW//7AXbMHmJbJp3bTG2ybHwQuwmEOtGKAuAomerOmWPTnbyxeo//oePvioac6ACSyNKQcT3hL/p40Eh0zemZa6H0VCW5u4lfmdBzoOggCw9uZssFRp2p+fBWN5T77KVITbnh3Ll8rRLgzpbJKgiMA4zrujLcglekDoPGGkWddlFv2wM7hxJ7cn//ye/KUhMw0IdDmBJF9bysbVrjFnQGt7FsnrOBzMfcgQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ngw/e5mUNSQfG0rHhVKw8Cz2hkv0KX2Ig6TmnaiSV1oe6QKjOPtCM85p9Fh6qDglts0Koc+GtrpTjw8o1F5qtc=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ac6ieFqQHRAfjjXPMzu87mZZTZWmSpVnN2Tw9fy5b7Z5uK5afU8dEPfrZV0SkMnFIp2KxwEvb7M1n8aWNDnWlM=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9EtyXG5Dz50BGy1srKRyoFYm5/ztPQciV7O9Mw2JUqeBbtueTL4Xgdpx7Ijp1mG8t9nwylckKF5JrjigCruUzOm+TcvDFDAIYhvvTC8BTtbpfB+rucbtaQcyop7L3rQB2OAVZfDvKUy2vl2bHeGxzLQUZgDEU7N/OyAToq+4ayDt</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9F1mxH/NDeiIx5Eb35/mdOKAWjqxOqvAVIHkCB33P6ojltr9nRNZ0PtiPhubxXbiZnTXKvOJnj9CLsiLpRksx/s=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9E1xAwqunF1QxhTKuknjKkvEOhbrnzwwEkdScw5cZzFP/v6GyBKazTd0g6IAvnPEqw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ks+cMykz6XumP0keQrCD4guEns6zd2tdJQefBUElELIl4Gbcx7AI4icmeITbcGvcw==</encrypted>]]>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+kOijHdboDxmz1nY4W5tJYIqaDFJWrFgQpsO0fDSNTbgGFTIKHnCqh2QLRgZAZqm9nstB2Jw4d+n1lXSWrab/2SyvIzui/2O0ZHrnLFmxNQm43hiSAcmsONOZbix8Nus6hD//k496GfVFCjPfpkfHR+Skq6SJo5zFcTXQS/2FzXxAtbk4ZFkOpIKtpgAZaaF9P2z7T7rJNbXcgsIjvP+t2weIPoFlW1c1lqhSCNbCtnB9p+E7c7HnRK5VoJQpMyYfK68FFQbpJYrZZDGRmpjaxaaDER+KmJdkrm8ob7c727lgjY8HHWQMTrrvf8I6AymROTvJYE27sIthcsXgIdX7wUirlLMaPEbPbA/M9jPD1/yFXc7s6Yg96dKQowzbPlAEdS4GCKc/IEifa93giNhhbkF73M1ldqw4Ia7ZHECjtbvh718jk02cAodK5T0iaKtAXYggc7tvNufVUvIq3XddSRNGrECYSl3r1L+ZgGByVso9ojdbwcuaO7dPGo8sUGOqHYe+CHCYoO8XvSRa+/j5u/5r5R12IBClb84Od3MbbjPksIok2+R7jyLWG2nhiISuBe8N0jN3I2420lVkCNBt36kAmF1um/1BSHLIcBdssiwcxrCUGmVgrW2p7KTyfdhWuNVntN0o5Nuabq+L8BEexadVU/Kzk5vF2xhPrjgP77E=</encrypted>]]>
    </text>
  </script>
</dir>