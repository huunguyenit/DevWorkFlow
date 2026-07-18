<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmtgcc" code="ma_tg_ts" order="loai_tg_ts" xmlns="urn:schemas-fast-com:data-dir">
  <title v="lý do tăng giảm công cụ dụng cụ" e="Tool &#38; Supply Acquisition Reason"></title>
  <fields>
    <field name="loai_tg_ts" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right" allowNulls="false" allowSorting="true">
      <header v="Loại tăng giảm" e="Type"></header>
      <footer v="1 - Tăng công cụ, 2 - Giảm công cụ" e="1 - Increase, 2 - Decrease"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_tg_ts" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã tăng giảm" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_tg_ts" allowNulls="false">
      <header v="Tên tăng giảm" e="Description"></header>
    </field>
    <field name="ten_tg_ts2">
      <header v="Tên khác" e="Other Name"></header>
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
      <item value="1110: [loai_tg_ts].Label, [loai_tg_ts],[loai_tg_ts].Description"/>
      <item value="110: [ma_tg_ts].Label, [ma_tg_ts]"/>
      <item value="1100: [ten_tg_ts].Label, [ten_tg_ts]"/>
      <item value="1100: [ten_tg_ts2].Label, [ten_tg_ts2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwdybWnSvooTah2exxdYpHnLvPoBZO53CLDQj/stRuafZ/8ZKz4DYUSujCt1HvYo6cmmkCW6CG75RlTmLRMi+w0i</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYbajLFunmD3iBWZs1ltYKH6AntgBVyd2XsbKKHB4lambzS8xzs3PzjUxqujWRW3G6M=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7eFMky5uHOSn7v1sBemaRMfhdxLh/LOXsKz9XmrmJ4pI9a0AogYSv6mJ+LqKtnReSsGaLbkBDz1/Do9vkBkHPv+FUcAXpNttgLXorurvcE2p3LcIVZZ+4cHA/ASGO9cWhv179/ehijTGtbUeoQGNk/+3kVFmTxvuOqUBLqq2p/7B7ruj+UnKrYAkpGJK5Z+t51nrCOJXR44y2VSmbnmVwankBk8aCHhW+yZO2VWrH/ROEIuPiCw1LZBK5iLk0nMhXsKW3zsAvgPXUAeI8eY89C3RSnXVuhfR/awA2QEYwihYXcLQMVDKcrH1NLICpoLEUYAe/xvJMuYRXSluPJuhRb9BVWlkykAZEcBlpQe7e17DtYCERWK4XP4HEjMuB23NYHeu0TQCmmPEHv1T9wy5JB2Ih1i17Hto6TorjgQIG+jV2GvO9+P44MFcEh1Deh0V5zwgWUq5mplHNoOVCCvp5UmbwurAAEup+xvZ8gwVBc6XQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nEVPvYDh490O+hYbNv5HmfjncGMXtu98eebG2p2aB5/PIZYn3r5i4gRtSD4woUEZPaGzhwBVhTs/8ss3BTRj7263U6+4O6VGbgNLUh+i7slfvMl/nX31sZA7CQynL5IwI/+nQAo186arymOfgySYp8dxHKJ+b6FKQf1JO48BUkwEfYip15mZd0WACp1lc2sAy+pUyQfjAz5o7JSvQiAVRkR2qBsexv5Y93pXTrYGNTyI=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jmO9OfK6RwUrqaN5PIBUHcimQNWm3uJU/qaWu/xmHdjRD6Dbobhk/IwTfHtzd2PrxJrUelFGRMD2ZAGV3cAIlhM4yVZ4VHnr+vf/tvM6UrZ79umIQl95eC0LHSre17lftdiNTHvHpB4gmPB2fwbIQR518uQMoEoipKHtj60QgLkqlVP9nHyKV2kaDaqmnBDeROHoAZpwYSit0Y7JUvP9Zy+7BvwdWhBRd5xgaR0bjBPfrjI2bUIH8FMmZxBG7WkoIQA9+hVPuXcZhdYg1547GfQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeg0IAAooYCLX9bBra3py/1FIuPSBOX51Psll7wlflW4r</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkbpuW9t4JK5LEYXKVIeehVzSS0+iiIRvHx/Zw3SORqtEz8cGN8PksAd6bYZgoLSGV4l2mUNZ9FWiE2L3aTNttzRQicNua5mUTYRyA2zK1FcJHZoaKTkTbQWfuYCnakuHuNbIenG0I8rse3nBIUEySGLH6p3El+L5YMHQp6mN0mw8quK+16+N7bmtLbBDOybWRyyegIn+GpTv3Qc4HwaVFY5/tGI+mMzUVJ1Y/p7PK1NVcN3tb+UXZrAFKbHYlJn1gPL4oD1uMhaw7iY4/hwTIvrJsNeMxI7zO2JGtXspEKX8DwMO9iRdlq+7lglB/2PIh6klGy83k3Ap2pBAA+dTpfT</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>