<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmvc" code="ma_vc" order="ma_vc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phương tiện vận chuyển" e="Transport"></title>
  <fields>
    <field name="ma_vc" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã phương tiện" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_vc" allowNulls="false">
      <header v="Tên phương tiện" e="Description"></header>
    </field>
    <field name="ten_vc2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="loai_vc" allowNulls="false">
      <header v="Loại vận chuyển" e="Transport Type"></header>
      <items style="AutoComplete" controller="TransportType" reference="ten_loai%l" key="status = '1'" check="1 = 1" information="ma_loai$dmloaivc.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''" hidden="false" >
      <header v="" e=""></header>
    </field>
    <field name="bien_so" dataFormatString="@upperCaseFormat">
      <header v="Biển số" e="License Number"></header>
    </field>

    <field name="ong_ba" >
      <header v="Lái xe" e="Default Driver"></header>
    </field>

    <field name="height" type="Decimal" dataFormatString="### ### ### ##0.00">
      <header v="Chiều cao" e="Heigth"></header>
      <items style="Numeric"></items>
    </field>
    <field name="length" type="Decimal" dataFormatString="### ### ### ##0.00">
      <header v="Chiều dài" e="Length"></header>
      <items style="Numeric"></items>
    </field>
    <field name="width" type="Decimal" dataFormatString="### ### ### ##0.00">
      <header v="Chiều rộng" e="Width"></header>
      <items style="Numeric"></items>
    </field>
    <field name="volume" type="Decimal" dataFormatString="### ### ### ##0.00">
      <header v="Thể tích tối đa" e="Max Load Volume"></header>
      <items style="Numeric"></items>
    </field>
    <field name="weight" type="Decimal" dataFormatString="### ### ### ##0.00">
      <header v="Trọng lượng tối đa" e="Max Load Weight"></header>
      <items style="Numeric"></items>
    </field>
    <field name="dvtheight" >
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="dvtvolume" >
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="dvtlength" >
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="dvtweight" >
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="dvtwidth" >
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="tg_xep_hang" type="Decimal" align= "right" dataFormatString="##0">
      <header v="Thời gian xếp hàng" e="Load Lead Time"></header>
      <items style="Numeric"></items>
    </field>

    <field name="tg_do_hang" type="Decimal" align= "right" dataFormatString="##0">
      <header v="Thời gian dỡ hàng" e="Unload Lead Time"></header>
      <items style="Numeric"></items>

    </field>
    <field name="dvt_xep" >
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="dvt_do" >
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>


    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

  </fields>

  <views>
    <view id="Dir" >
      <item value="120, 30, 50, 10, 50, 290"/>
      <item value="11000: [ma_vc].Label, [ma_vc]"/>
      <item value="110000: [ten_vc].Label, [ten_vc]"/>
      <item value="110000: [ten_vc2].Label, [ten_vc2]"/>
      <item value="110001: [loai_vc].Label, [loai_vc], [ten_loai%l]"/>
      <item value="11000: [bien_so].Label, [bien_so]"/>
      <item value="11000: [ong_ba].Label, [ong_ba]"/>
      <item value="110-1: [height].Label, [height],[dvtheight]"/>
      <item value="110-1: [length].Label, [length], [dvtlength]"/>

      <item value="110-1: [width].Label, [width], [dvtwidth]"/>
      <item value="110-1: [volume].Label, [volume], [dvtvolume]"/>
      <item value="110-1: [weight].Label, [weight], [dvtweight]"/>
      <item value="110-1: [tg_xep_hang].Label, [tg_xep_hang], [dvt_xep]"/>
      <item value="110-1: [tg_do_hang].Label, [tg_do_hang],[dvt_do]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwccxTHQ1NHAlEYyusR/3v/o7SQ5YtXGLZChNbZRTOv41gcHTgI9S00XxN6Wm5I7Zss=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYbR+bF1ZaUmzoW52VAvDcvoSVVyQHIDljlkQ7J5rJXl072IMYZHdMPuJlE0hN49GcM=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7fQHqph514TdS6Evrka3tTlC8BjVl3pQW4r8zK1Buyn7Y0FxCZenejxR5utnSVC0vzBZg2vtnP5+CFxJIDSJ1ctrww01BK0EYngFVZwI2e+Ct7QIdtuvcMz+KyeaMQOuehPdV0kE5bqvlTAfzrqpbpnkPN6zC1egXEKdeVH8Xqsq4QqfSIBlNw0KPMh76S/xdj2RF/JmE3rO3IDiUkEQMlANxdbV6GHhAOedY9KhKdO0XHLhOjX5GG3ye7C3xy6lO22DU1fHC8OfTHxM3Y+L4g4x1zFoqMaAhfWmZvbZY/10pq0Cui3GusO/JPRGw6ibRXBzUvTnRPYRZ1kl7cUXSwwDkJmfGkDWkToGGIR+t5QD87E1bb+1rDiABIQUSMeqaJwX/Gr9rJdEPGi5tfFy+7K491bqGuD6oDJ02Wkcc7J/SBFG8dFtpn6JxEVQv7ISd4=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nzNyliR8dVv0cH7dBUhPQ8vIH4wI+hwA4W13tKfS0HvOrxfZafsonQ/COtxzzg3K0n8mTKxYcdsVK3o7EfLpNind0purF4V+sIg4LNb4TBWAhDbJrhYeCdQRJLgF/+zyE4ufry9vJuxkt0HXaKiYRdHLbM/jfXKpKkOFPfpIBzSlbTfDaJu5YdL+YOCjAROZLFeJlG9mmLzsuamZEWvyRWjepur2AZZVb7o17KhNvWwQ=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jDFaqgn94qLjpb3Le74tqKN5wjDcpIJ1e+hY/mQBYPefXbCNfeTrsk0OmUXtj+vvIYBaFRhGCHk699x9yi4seYRno4zHmsyos171GVPXFiOEd9jpfEHDaphReGb0lx6b49nU6RPWSGoah39fVA3fpYynitHHWuXSkMxU5LmS8AvjfW7grOs3SNTVAlAFnhOGut9p1CFefhlpZVjpyCp97AnORyyaGnmf++7ZKP/uZoieya9vGQdL8o1GPn08Lq+HSYJbSuYpWSKLuubkRtFkYhQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeksHsmOgkS18nqz39zJDdahBF9xEg0IRQ6hwuxJ8q9QH</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkbE2exJDFU8J3qgvRfUTAEA4uwmsps4XYqJQd8RcbfpMY39ZyOe/l5dhXW/wVy0+TeoK2KY3LsdTsl3A82vBp4tv8ycTTcm8fOPHG7vyC0pgDOwwiCbWmA5CzupCcLSOSucl5lr+nRhHBWZX5/yC4P6ZIq47jAyacGGmcYGe1MYrTHhvdBoM/81eLcyqko8JryN4MwdZN+6oMVOlX3VoWdjzAaNnwUXcosPlBi4iQXFHfROPdeFNuRPAPdaJm9RhSQ/CA9D2Il9bMmPxBe9GNUrJlrX8hQzBuVAZrF0AQr7d1di9l4oBib7j91YkQAPKgmE7aHv16rdu7xw4xp6sfF7</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>