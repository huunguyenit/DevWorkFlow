<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">

  <!ENTITY CommandGetSIBenefitItemType "
declare @sinh_con_yn tinyint
if @@action = 'Edit' select @sinh_con_yn = tinh_chat from hrdmloaitcbh where ma_loai = (select loai_tcbh from hrdmtcbh where ma_tcbh = @ma_tcbh)
select 'this._sinh_con_yn = ' + rtrim(isnull(@sinh_con_yn, 0))
">
]>

<dir table="hrdmtcbh" code="ma_tcbh" order="ma_tcbh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="trợ cấp BHXH" e="SI Benefit Item"></title>
  <fields>
    <field name="ma_tcbh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã trợ cấp" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_tcbh" allowNulls="false">
      <header v="Tên trợ cấp" e="Description"></header>
    </field>
    <field name="ten_tcbh2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ten_in">
      <header v="Tên khi in" e="Sort Name"></header>
    </field>
    <field name="ten_in2">
      <header v="Tên khi in khác" e="Other Sort Name"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0" defaultValue="0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="loai_tcbh" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Loại trợ cấp" e="Category"></header>
      <items style="AutoComplete" controller="hrSIBenefitItemType" reference="ten_loai%l" key="status = '1'" check="1=1" information="ma_loai$hrdmloaitcbh.ten_loai%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYOLCvqo/hOq6Wg0/MgMsdfHJJ6UwkHsxrlIni05vIOExiDvyK1uJSMarmmJXUVddA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="sinh_con_yn" type="Boolean">
      <header v="Sinh/ nhận nuôi con" e="Childbirth or child adoption"></header>
    </field>
    <field name="tinh_le_cn" type="Boolean">
      <header v="Tính cả ngày lễ, ngày nghỉ" e="Include Non-working Days"></header>
    </field>
    <field name="ty_le" type="Decimal" dataFormatString="#0.00" defaultValue="0">
      <header v="Tỷ lệ" e="Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_thang" type="Decimal" dataFormatString="#0" defaultValue="0">
      <header v="Số tháng tính liền kề" e="Preceding Months"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_thang_ltt" type="Decimal" dataFormatString="#0" defaultValue="0">
      <header v="Số tháng tính ltt" e="Min Wage Add Months"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_ngay" type="Decimal" dataFormatString="#0" defaultValue="0">
      <header v="Số ngày trong tháng" e="Days in Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 50, 280"/>
      <item value="1100--: [ma_tcbh].Label, [ma_tcbh]"/>
      <item value="110000: [ten_tcbh].Label, [ten_tcbh]"/>
      <item value="110000: [ten_tcbh2].Label, [ten_tcbh2]"/>
      <item value="110000: [ten_in].Label, [ten_in]"/>
      <item value="110000: [ten_in2].Label, [ten_in2]"/>
      <item value="110010: [loai_tcbh].Label, [loai_tcbh], [ten_loai%l]"/>
      <item value="-11000: [sinh_con_yn], [sinh_con_yn].Label"/>
      <item value="-11000: [tinh_le_cn], [tinh_le_cn].Label"/>
      <item value="1100--: [ty_le].Label, [ty_le]"/>
      <item value="1100--: [so_thang].Label, [so_thang]"/>
      <item value="1100--: [so_thang_ltt].Label, [so_thang_ltt]"/>
      <item value="1100--: [so_ngay].Label, [so_ngay]"/>
      <item value="1100--: [stt].Label, [stt]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandGetSIBenefitItemType;<![CDATA[<encrypted>%P96uOFSSvZ7ZN83ydBq26HI/fYSgkMUeB4Hgu7dPh3teQRzvqYaPvkFUlhoeu3Rh7NMKLMObqQ/9vO5+asCiIfU8+tBoGl1eRq7Rhx48X8s=</encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        &CommandGetSIBenefitItemType;<![CDATA[<encrypted>%P96uOFSSvZ7ZN83ydBq26IX6C8UIXNDjM0bvn3mZ9jc6QJSLAP0P2CppozqgPIhyevJF5BFgS/iiymGVBl5ZinabzSZi7sknxy80MT9BgG4=</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYZBJF0Dyi9Peweszms5xPTWaaZjIcrtZDO9mHWBG2rjPNCkspHiLBpxIeeRml9vEQ4=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliarL9hCPrFuL9s7O5o0IjKTA8h4XyLy+hbVOEg11PsZy5rar84lMt+DWR2fiYWL/rlIA55oh5P4eUQyDsDSo1e378KaIEdzwc4olxKbh3p4vli8Hs5fjrR0XGwjdqbh/LrvSjbEj4N/JtA/FFrzby8bqjLgjQd4btTS2uR7I8AL2wfacrs3CfjdqdKf/XwLdizlxE6GjUxWpj6bcb30qky6u9FHoCzwqUQZ/oAkxJ9WtdRJjEMWkLTI8SN7kH/N/JF/Dkpvi0kg4GDxwbG7Y2Q3YYiyy4Sti59cl0jZ7Dvj2w5jYmf6E6akcBJYsV17IO6Q+MZPXQvYWLPfLy/6/RcBz4x3nT0QHKPCmaZHAUddI=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n7EWRrd7N0KQMowDp4EUEW2PeAiwYUxijpHJMVY1RGFks+crS9VoaAGTM6RmHt/UsqntTjvNHf2wNFpdLN8N0VEUrNquhHNfPUJwDnVDTm+use45Ter48MXAnh9kYqY/AGJukJt40FURrKJGrIZGQDFF0LNQ4QVJSZRsHLlxjGrZFglQ+1OHK5PuwscYc7xNE</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jtfO1VrxGu6gyzO+x2FI5t0rWXb/oSpjY4P7AUjWPgCCAQmvsWNjdCZWviFNfd99OmgbD4Xix6b+hk1kGk5psaODr2EGNCFV0a6h3TpQ+ZTjL2sve82Dh4ZRnbh/VZzHCs7KYVYrzf2OjRz2huB+XEFXzqSCBgCzOQbB1WQnfZcHwWou32c3FjVI15inIQFyUQiOtRQW6MbGdNXVvEhU08dAoebUTsIcbvVO+PmVblLk=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbevLvn7Z8No9tdh5zsdTSffgfYO8mtDDPxRoUcWGlyOGC</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZJOx1fovvLQ6oXxeTwdfVg4M6Suu/H+n3bSueRckIEz3MGCxYAm2z9ivMgGjHvOb5BUdNI5s/5DYMG3xkJ5szH+GeYq+4aVp3nQBt1VHBhKSmckrLjHdoY4xd6vjik78UiyUiRCPNxigP3xv8bEjTe1Iy4EZf2SJerMSq6KsbJgbgZoN7aLFmWGvTbj+M4IMvqXB5OhvFB1XYnqFNQPHZo1gNU1SIiUqCSktQ338A0b/bboIhAlhQaoXlijk8gD+JvtaW0ogENoS3vayaut5YqPZH594EMUrUrM3zbAaOHmgGF/Kkfz+1TFxL95DJ+b/NaS/c5ItG5dQ8MdXcY1tpH87Dwj3LJ4PU0YshqLUPRg29s2OH85b71/mOl6j+ecvhiGOReHNIEf8/4vwZXgrrqYjq9XZouoE1IrDOd1ofYzY9wyBCw1jZDpoYJtNWlFSZtwBBc03c1KdyV/tlRpZVueT33cxETB1l2C+lAtQTUu1vflc5tw8Olj2SKHv2euMVrVKoOoIAwfrZjIYxjmUqfZCjE4CJ+30nkMxifHwauCMoU02uKMj5+7pqQYUchoQWbzTgLfViz0g3wlMDLCRQY0mfwAHeGgm5JKHVukGWVN26toQ+EYZ6lP/EzYb79RoMu8sL8wSPwRZOZMKKMlox3WeN/8feXML090MhC6c8NXxw3adXPMHCQdcavPyG+JMAhZFCOaaLiYGHCJ8VKHfq06LQyge6+vcsZ8t3wOv2YhFAW3+FLk1dPpw9jATDBe9rS32nsjVSDjSEGK9B+Z1Q7scwmjrGtQncKIWGZPGIO81I3qyC40aD3RUBxcIYFTz7aHL/bfQuJ4Uj4tWb0aDUuDgQ2L8CfA0EDN7tRtlcyLrBeezUP0OxX/ajWoTN7w1i27ngry1zDK5+r7IkKuWCFILDJBhfbDSJPZmPyl4sAl9ADRVf/DyKslMML2KAcYHaKh4aiOs6DdoupnJ/Wt5u/yxJDPeU0vM7gSvWhVKuhIbwyX8MyRWJcrN45ylRKDsEKn2hmk3lR9FAKktAV+lVylm75eVobyRDG4u6SJBgntaQLmBTHTAVvYlFn2nMsKus=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <response>
    <action id="Category">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6fiA3oqArvAnCEuZbXDa04vykoEf+7JJYPUBWE9FS7nkQ+aq96rgQZ4NAjOSJwh3nMHMsR/woMhVaCXMEmGGPWxjm3H99HU9MEjj/t1kkS09igLkos183cuzm4iFKivb/Qh8mPcbM9MT97oAgzIw/eZiDlFwJHb210PGTw0OJfX+fsy3z0qs7xQH7daq4QgU8w==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>