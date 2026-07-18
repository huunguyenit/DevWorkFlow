<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrkbctbcc" code="ma_ct" order="ma_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo chỉ tiêu bảng chấm công tổng hợp" e="Timesheet Summary Definition"></title>
  <fields>
    <field name="stt" type="Decimal" dataFormatString="###0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_ct" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã chỉ tiêu" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ct" allowNulls="false">
      <header v="Tên chỉ tiêu" e="Description"></header>
    </field>
    <field name="ten_ct2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ds_ma_cong" allowNulls="false">
      <header v="Danh sách mã công" e="List Workday"></header>
      <items style="Lookup" controller="hrWorkday" key="status = '1'" check="'1' = '1'"/>
    </field>

    <field name="loai_dl" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Tính chất" e="Category"></header>
      <footer v="1 - Giờ công, 2 - Ngày công" e="1 - Workday Hour, 2 - Workday Date"></footer>
      <items style="Mask"/>
    </field>

    <field name="kieu" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right">
      <header v="Số lẻ" e="Scale"></header>
      <footer v="0 hoặc từ 1 tới 3" e="0 or from 1 to 3"></footer>
      <items style="Mask"/>
    </field>
    <field name="in_ck" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <header v="In" e="Print"></header>
      <footer v="1 - Có in, 0 - Không in" e="1 - Print, 0 - No Print"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 330"/>
      <item value="110: [stt].Label, [stt]"/>
      <item value="1100: [ma_ct].Label, [ma_ct]"/>
      <item value="11000: [ten_ct].Label, [ten_ct]"/>
      <item value="11000: [ten_ct2].Label, [ten_ct2]"/>
      <item value="11000: [ds_ma_cong].Label, [ds_ma_cong]"/>
      <item value="11100: [loai_dl].Label, [loai_dl], [loai_dl].Description"/>
      <item value="11100: [kieu].Label, [kieu], [kieu].Description"/>
      <item value="11100: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx8Nq8HuhJdjEH1NUAs5AgWWy2oPn2kVyrKsaklS0l5KqhRGVua3lmAf3r8OMLfeu6K3ZzCMsOQJ3NAwCgAXc0O0SB96sY++JDalCcJvTS6h</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4Nu243qb2anH6gfplBDxgrIbEJTBcR9QozTjuQpwEGcGIuT/gKHLGeXaLxZWjTXn5GGSzLVDyFApgCXzQLrv0gTLZO/Bvet9s3FgyWlTqcP</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliTALPvCbqmHwGoeAPuLmm9c928DdmXEVwtyKR1wBhY8yp87rVNcIggKqfE7eNqpv5Nhc8eFoktjrfKPwmDB8lBY3w1XrwrbUWyBFRDYnRoRS8BC9EwTMvGwJk0HMTPMcPtGtphs1Vl/LZjpBPgOtBq30rF1ACyIyQhPNhez8MN+IEvyXywnyKIkvFzy52du3OEHeEa1sslcD5GfHhXBoN6MZix3TRez8CZe4j2WSfylTqwzRC1YYDvGVkNnigBySYtYyhVdOHG9BFkPcr22qAwUBTil7RuCZ7C7jK8yW/EobHAfj8UvScuBu3DiOuZ+wwLa9zxNsVBKtxS/tDxYpbs9P55mlZbYqUtC1gxZlwJKOI318S8S4w1TClYjpcZI4i</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nXC+RpnYBzEExn9bx8V76Dlyd5FMGiTljx/n0EiCpoqBhTiciIo1TXp1zGMSFWRHWT/+u73M65JXh6DJdtu1aIPerV1CchMkRtpeabC/ppuQj/lY3Wz8S/upMQVw+inLQ+2yI/x086VBVlPOz5j3qlnDOvAsjGO80Lybf5Si0sN8E3udWyr7Mr3Dv9Vndp0x/n6dqbs8LhfWYhqlRrexWJsldv7PY8xrXFV0irwxTMSk=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jwd4y2MET4DtLkWcZxrbC8CkJtIzpZF/tcy0FAnEIlPpcpJxcqqQenrnzcNBilmHUts9H1anO1/5Ex2LJXSh+TeoX5eqTgKE9S809flkkuigijD3YFTH+DVKXbeSdcHL3bo0Xo1UsbOynFoHExDLgkviuuA0P3wQx48Xi/lR1xd/vmhjKn8Hx5X7umnk7prBQlPO6hmxk1yU8iDLxDJp+JMEWNPUYPmimrVmPfuGAePT2BoSTWE0f5j1e18/WZMYh</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeiikR0KH1iTsKcqzpelumIspiZjVGjZEjNopiM3ayMbk</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KbU7GvH784Li6EOQWp3AE0xI1KL+udHmWQ0rcJA965CycMTpa5vSKHy3+MbxAW4J8D1tHTJoS9QJyL8VWM/s+De5IybTZV7lau2MO4Mpl1grBSArAMTg/hUohoriZ/1gbX1rsmO9ajtp8DvdUOz70xXyUrvjk8HX/IInQiXEeVCBY4PQn9sZ98aKo/b5PymohgRqbzKEtKynItUSY9n6Exb47HwY0P7gTfNMilUUGzB4icQQX+TKLYpomzY7dbbmc1bBPJKEEavVQOc5F+2sUuDf9/WMcLMAJryqdzmEc04OI8ADtOKscSB/jyahAtPtPbAgKjGLVofRLx2+J4Bw0lpOi2X451bDk7KxBUu8KFq</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>