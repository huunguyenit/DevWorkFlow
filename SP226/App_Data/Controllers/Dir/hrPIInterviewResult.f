<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBeforeLoad "
if @@view = 0 begin
  if @@action = 'Edit' begin
    if exists(select 1 from hrepv where stt_rec = @stt_rec and stt_rec0 = @stt_rec0 and tag = 1) begin
      select '' as script, case when @@language = 'V' then N'Bản ghi này được chuyển từ phân hệ khác sang, không thể sửa hoặc xóa được.' else N'Can not edit or delete this record, It was inserted automatically.' end as message
      return
    end
  end
end
  ">
]>

<dir table="hrepv" code="stt_rec, stt_rec0" order="stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="kết quả phỏng vấn" e="Recruitment Interview"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true" allowNulls="false">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_pv" allowNulls="false">
      <header v="Loại phỏng vấn" e="Interview Code"></header>
      <items style="AutoComplete" controller="hrRMInterview" reference="ten_pv%l" key="status = '1'" check="1=1" information="ma_pv$hrdmpv.ten_pv%l"/>
    </field>
    <field name="ten_pv%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_pv" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày phỏng vấn" e="Interview Date"></header>
    </field>
    <field name="diem" type="Decimal" dataFormatString="@markInputFormat" defaultValue="0">
      <header v="Điểm" e="Mark"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_kq">
      <header v="Kết quả" e="Result"></header>
      <items style="AutoComplete" controller="hrRMResult" reference="ten_kq%l" key="status = '1'" check="1=1" information="ma_kq$hrdmkq.ten_kq%l"/>
    </field>
    <field name="ten_kq%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="trong_so" type="Int32" dataFormatString="### ### ##0">
      <header v="Trọng số (%)" e="Weight (%)"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Description"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130, 0, 0"/>
      <item value="1110011: [ma_pv].Label, [ma_pv], [ten_pv%l], [stt_rec], [stt_rec0]"/>
      <item value="11: [ngay_pv].Label, [ngay_pv]"/>
      <item value="11: [diem].Label, [diem]"/>
      <item value="11100: [ma_kq].Label, [ma_kq], [ten_kq%l]"/>
      <item value="11: [trong_so].Label, [trong_so]"/>
      <item value="11000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHaIgDftHXW2KNrQbmEWvwRUYjcShzMPdXoURd5MEV5qiPNiw1KfkE1VQ/7E62qFZ7Se/95IQFnSYVcLdptcAfoi</encrypted>]]>&CommandWhenBeforeLoad;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1MWjZgEX2gbSUKxmt1/nIMF24XtU19T0z3Z5Wxdi7FfjWOcHWROXh9QTEwrd6uRo9HzEljnLNY5AlEGO3bOgvCxcoFmz5apS0YSQ21UF7d/Gg0u8d3ndLU2b9i1m9bJmhm6delcbA9NZDq07zjtbKA1yJ4BW2ZCus3kcgU2qg8oBQyhRwg7LO3Ixs30QLxNCAccEH1dJ5a062RYzNY/IoFU6u1KqDULlhO7JdwlIHjch9uGvSziYkHjAl/WRVkO0XQMezFjbxlfrRbuZhXbr2bnt5lr2VP+AAv6UAYMr7RBlPAKTB5KTnlcZx1KsG7DLNHR9dWwuIn93JLfC4le0f0=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZqLQHvIqLTJUpo+DWhlymlb0f7glYOme62xjmIlCmOsw==</encrypted>]]>&CommandWhenBeforeLoad;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5faFui04G3amZ/UcZbrdJfeTy3SmAQWfRU5VMlwmFnfa+CWVvkmnTj3pdtTWHADM6FNJypq2p4wLJDTaAmix5O0+C+8c2k4MO38aekL1K1/BdKcICIKAGfo+tq0QUsrVTEN0LMGoHCOSpK7wXRNcMk=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VMGnAuG6TZuGi7IHA4qURqb5MuiIPUtActJgFUc5FCyRksD1B8RnPfnG/s2pcHb+jFKbHj+HFyBLwhJ0IPUkwtj8EcZCBWGvA+1yP/CApeKXN8Hf/Ii2lsNk2jK4PXq4BIH2ep/iR0f1EluLZwIFrpo5qW2oIqaeGS/KLMykhI9mGiBFnZlNb0Lzm0pYFPaQqjxWnqoFb5DgCruuZalSA0295U+SICgq9F4oMri6Sx9X+S/k8Uk0X0Z+3WxM8yUzNj0v2wtRIZQILbDUxZB5WUAKuGjCwyafpWBrpP2PVy+dioOTALmiFF65fLmGADf5XYjRIN6Dz69Mp8CGZtNY1ASxquUZmCXAcPgqGtcCK0l+5eZgjnw7KptwGAzIG5LhzwQCE0DyQon5T+QPNhicDsyUV3n1sV5qkEe79fa53Jg/z0JWFEW66/dXACa3MEtSgmsXUKR2wKuXCzYA+bslKXAQturDm+0GwWUOisgcUl7w0rcE39kGLC7nX0OGBm60MmSpZrCNradwZfZEJCDbd4J9Zkkv6ewI1D0MpJXYXxR</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bUFE7iQS8RHpMpta8FmD9VOcarhU55gfVcHUBf6r57lmC/TIKFGT3p3zQHFTkZX5pvcH7nUFNsVTT7ClETjoF0ky+eWDdRi2Gk8XHw0NKtyeAiKa2EMCpexmXUEFSXwIi3uTE2dgIyx4CkDgAc1BrTMtkuRkLBOvhRLRYSwVfoBgd6t/DIt2dKnhODE4bb8Y4eVYY3Uiacv9Q+fTWzXIUOz37fNKEQY12DwFAsupqzNI/DBKPq5rDcvw/762c9wM5u/cdRB7hOdYrijz3e8yEtldC6G0QUWZVxnHKG6Pw1q2B7WSwipw9Yo5PlNHXfGet7UU4rDq7VBAcoat4D8hcoX1o5khoAo9FRabDQ+6wNcEHnkIPoVUwkE6SGb2uo59nYKsXsDiZLmDutmg77f9SQqT4lh5XK2hTg7dkESx9xdo8LusbPxfquIQr9KVUTMMKPC/vlZ2YXqj/KFBhf4pPCxxqVuxGeJahzNAeJG7nLqZ35RlHDboxU3bMiGL3b+Vv5m7AqR/FBSkfhDsOxh3dY=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6aBk6sDGBDHgaGthtV95WGfW/cJmTUbNUjPXb75Dcg/oG7mNRMmAWaaVi/p28UBA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bUFE7iQS8RHpMpta8FmD9VOcarhU55gfVcHUBf6r57lmC/TIKFGT3p3zQHFTkZX5pvcH7nUFNsVTT7ClETjoF1NDr49P+3Nu4JwU7P4+QHpBxpnD6q45fnMXZV5m9COvelHCofR0R3LTid+VpK8a5mhsDd3wAHlroj9kN5tBpgF+fp18GQSCEYqKAkvqYIfc7xaF7yx08hOudSZZ2W1LCnpnZ661A/WlrW67dpfPddkaFyJGwd36z6BeGBcwUOJ1n+bHAScTEkA7X8xyWMTvM/46P++VZrjaGJ6UdCompSeINPauf5EdScHVuFFNG0TnUo2MwsdaxetmtsAj60QlcBleMkJUGYuketw/dVMRBKD</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberoa6jRl0HozQ9/2em7TRgbBZxVK6WrbqdOuCgmrhBxuF3eRyTeBrlEW2m4lrGyOrQ==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6niqI+D/Kp7gHIsYpY5USxv/UEuDlDRErypJ6GZMfhHB9E/6rOQxqN13p3EQAFcblZ3yX/ES3E8hvxED2rgsCFFQlOuL4FxF0oMXyDpJTBKXghxxFr9CoML1aft+XO5BXVdKBkuP9H/rndjUHXmHN7</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70BdYGe1Rm7050+M56/B3Wr0q9nHQTIbpFLLkPnRsS/kKViwChYulzQbLyNyvIFmTHokeQ3F2+h5To0B8XDjCK5+r01P5MFBFr5HDKQrsITcc+rWEDQB6u4yvhuRyTRagOpnSz70bXaPrYw8NRoYgFFEGrO7xTcbfGMLxt0p8141+Zw87NHHjFvOG8kQ8U8S0wPpVzMCXZiKfh338CIsy4a4=</encrypted>]]>
    </text>
  </script>
</dir>