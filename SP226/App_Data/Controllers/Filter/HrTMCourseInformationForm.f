<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "hrTMCourseInformation">
  <!ENTITY DetailTable "d08">
  <!ENTITY c11 "Môn học">
  <!ENTITY c12 "Subject">
  <!ENTITY c21 "Số phiếu">
  <!ENTITY c22 "Number">
  <!ENTITY c31 "Ngày yêu cầu">
  <!ENTITY c32 "Request Date">

]>

<dir table="hrdtyc" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu yêu cầu đào tạo" e="Training Request Form"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_mh" external="true">
      <header v="&c11;" e="&c12;"></header>
    </field>
    <field name="ten_mh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right">
      <header v="&c21;" e="&c22;"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="&c31;" e="&c32;"></header>
    </field>
    <field name="&DetailTable;" external="true" clientDefault="0" defaultValue="0" rows="208" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="&Identity;Grid" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ma_mh, ma_mh" e="String: ma_mh, ma_mh"></text>
        </item>
      </items>
    </field>

  </fields>

  <views>
    <view id="Dir" height="268" anchor="6" split="10">
      <item value="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 50, 100"/>
      <item value="11010000001101: [ma_mh].Label, [ma_mh], [ten_mh%l], [stt_rec], [so_ct].Label, [so_ct]"/>
      <item value="-----------101: [ngay_ct].Label, [ngay_ct]"/>

      <item value="1: [&DetailTable;]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70A4fLbLV3kHxv6jagmvQXiQmVKU4qOaErPxnpphD6J+4</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9JZdL8G59SoqzF05WfH5ag3tfTyL6DFnS2waDAxeN0pXo0jmd8iE5tjoEeMp5wZrHa/Rjfdms3IRNcOHRygzY63ryHwIsyBCiaKYUKylhEpWUwudwtDcBliTMI/d+ujV6g==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ac6ieFqQHRAfjjXPMzu87lxdFI8JeKgtlPwSXTCx2Ttmias7EFgcwnnSElVQsBcKw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9FHxTIUEvJi6MTJ4CXEDv1EpYSloEUvp+K0DgEsCQRAt5Z9Jp/OWtTcS9ZySVdavQcjka7jyGcxys09kV5w8QVJtdg+5viLHUh9nW2seLjC7K8qfFIiz2D/pDK03xiMv1s1mjqzJSG/Avp7aprrpGr89b9BJXO5QT9tk2n19Ef9/c1gPoImfmglCSg8YhxT8M31NItwBoxJbLSFOM3aN03HJbXGYdHmqsOcyQVIzjZhrupOSApwIsZVZKixOYnv7Gw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ngw/e5mUNSQfG0rHhVKw8Cz2hkv0KX2Ig6TmnaiSV1oe6QKjOPtCM85p9Fh6qDglts0Koc+GtrpTjw8o1F5qtc=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ac6ieFqQHRAfjjXPMzu87mZZTZWmSpVnN2Tw9fy5b7Z5uK5afU8dEPfrZV0SkMnFIp2KxwEvb7M1n8aWNDnWlM=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9EtyXG5Dz50BGy1srKRyoFYm5/ztPQciV7O9Mw2JUqeBbtueTL4Xgdpx7Ijp1mG8t9nwylckKF5JrjigCruUzOm+TcvDFDAIYhvvTC8BTtbpfB+rucbtaQcyop7L3rQB2OAVZfDvKUy2vl2bHeGxzLQUZgDEU7N/OyAToq+4ayDt</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9F1mxH/NDeiIx5Eb35/mdOKAWjqxOqvAVIHkCB33P6ojltr9nRNZ0PtiPhubxXbiZnTXKvOJnj9CLsiLpRksx/s=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9E1xAwqunF1QxhTKuknjKkvEOhbrnzwwEkdScw5cZzFP/v6GyBKazTd0g6IAvnPEqw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ks+cMykz6XumP0keQrCD4guEns6zd2tdJQefBUElELIl4Gbcx7AI4icmeITbcGvcw==</encrypted>]]>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+IfXONUE0DYLo+/XcLyCeZYbo1Jog/GWxagLjPx8EHvemjZSWVbCuLMQCwr5+RJ23AIab9LoFPGistktcR+8JVuNkj3ToU2K9OI9N/JQOQjfQGzTGnULx0aOKdI1OHWUSOXnHz20S6J81VMV4qLkBFAK1QZobkfqMJzZrPYbUwmZI0LsCc9zR0jkTQ83J+wF7vcO2xgzCRFp3Q7HKI1wCVCS932KrhH6rMZh/AS7ZVj6tPBD5UQjtzCKStk+WxJnYy4z5eV4BUWQSNzX47Y6lWABoS8cJ3SsHTc31boP9R0KI4bG1ue7v3QFWmWZnSSrn</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9BHzU8TljyugYIVF9/EjfO3OzSmGaYACxbqtN2YCq+csyVHiLNI+H/wfDuW4s5nerepLuiv95Nm37aWmDbf93r5VOqeZEjlTuSxngzbNlpKej0ne7L15B/mjN+TFZ/ueKUbdCuhZGPRE6BebSGgfAWHNoky4hjPrAVfe4y6drzaL4E98jzUu5ztbSNhrk+fbfrttOU0pYffvpoE+iY4Mnb7C8sCpEpzNgrwx4Jh6TUnBgob0o/mOBytFF9828jg4VO6qgHmoS0KO7r+f41wVYP7VT6HQKZF9bXeoFDVm/70X5tHJX/RVkqoAuwP02fZSuxsZUcS+1BeA5cEOiBN1btMSSS7rBBGCkm2Q6eEwxTyq</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9LCi/z3oq75KsNs7LWYCKy+w29Gf9yiqF7OwJJ+J+3O2j+dd2HEPbWPh7mVMN3Ebb/OGM8+8C0uUpTuPcotejCJANxU5HoQXaodwKodjHv0Umiw7sqxqm/Z0tqXUWgrQfegIFSq5dPvH/Pfd1YF8V1IQMNBrgl/KKaUBRwzaoX8h</encrypted>]]>
    </text>
  </script>
</dir>
