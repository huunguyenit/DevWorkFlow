<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmcp" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chi phí" e="Charge"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã chi phí" e="Charge Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_cp" allowNulls="false">
      <header v="Tên chi phí" e="Description"></header>
    </field>
    <field name="ten_cp2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="loai_cp" allowNulls="false">
      <header v="Loại chi phí" e="Charge Type"></header>
      <items style="AutoComplete" controller="ChargeType" reference="ten_loai%l" key="status = '1'" check="1=1" information="ma_loai$dmloaicp.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="loai_pb" dataFormatString="1, 2, 3, 4" clientDefault="1" align="right">
      <header v="Tiêu thức phân bổ" e="Apportion by"></header>
      <footer v="1 - Số lượng, 2 - Thể tích, 3 - Khối lượng, 4 - Giá trị" e="1 - Quantity, 2 - Volume, 3 - Weight, 4 - Purchase Amount"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_ct">
      <header v="Mã chứng từ" e="Voucher"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'" information="ma_ct$dmct.ten_ct%l"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''">
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
      <item value="110: [ma_loai].Label, [ma_loai]"/>
      <item value="1100: [ten_cp].Label, [ten_cp]"/>
      <item value="1100: [ten_cp2].Label, [ten_cp2]"/>
      <item value="1101: [loai_cp].Label, [loai_cp], [ten_loai%l]"/>
      <item value="1110: [loai_pb].Label, [loai_pb], [loai_pb].Description"/>
      <item value="1101: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxweWhbGdF+8xde1NO4R3USWCMFF7vb19KMt0J0SBcoLhVR9pf/0IMAavU7gQ0UGq4rQ=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN0kDlTGZ6CmcMkgL9DQRFrUSK3moEFwnxXmnTSn/XfV8I6MB2I2wEsq4r94zFY0+D0=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliCFk7X/+uLacUsz7Q2EE2ORUJlrE9OoMyU/xPr3QvBGX9gBcEHYJlGpqV1SBLdol0t7vWa1sjIpaLcksjWEJCs1+U6kDWrtF+a5zhIG1VAt3qflJRkO/c2T4Quc4Jp7mtBieUtnvPFLvbLEnDkFw8yiesdUSFRp61WnCDaTJopKQIWuxdai44hxou25qCcqwdhYKcrirMvLDzorxdbymJhZaF5Lu0ThtPHBgLt03Y2RFzsOPtq6anrAsLh57kCb3ckkw8PfKhnKI5HN0etAvYZfn6HeY9dSepok4JoPcBoMOVgMACAwXRt4Vf4j+qHJJuhgHcidUVr6l71whlg+wAFA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n2yWu9hjJFlfsBY3klD8tats3kDmCDyXhi3KEawqMkLKmuyoccBgx2d9B+fDq7/0kcMS3ojk+LBVBcQr93cZtSGKBPLGaFGNMc4EBmX5/4v4FtLuGdNiGui1ujPNm9pOeWcA8oo+6YW9Rg9ktbN8X5vWaD1f66eDujRJquydSPKOY+0/JE0ruxAEz1f4Wr45D2cSFH4GeGeTcOy4+yffdZ67yGaCWP2SGUzI7manIcEg=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jwMlrCDlMuk2ZBU7CprWOeKli8E4+/HFlWRu3RnyHwHg91B8DCGvf8bIWbs5DxD1atJsacaR78JQq7Dho8VSsO0eYF1ybd/uqkikhqWwU5uwrToxHsrl+nsKZHIfe+i9iQsrGQXy7oTOTsC9U0pTZIR0iYR+Da8VOhQWagqFsmOZ2SK9b3PsCq0XkhCB94tHAG+6Z/Mj7paR3Fs+sUxwQcK9/k+w4W5yhOitx93PKmPFuIVJ4/q+9l7wyajgVHOwGrTqXTQ7k6J3diTlDBnNEpw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbetWfBl0hcG73VT+s/+ZHj2hznlozytuZ4Xiqd+p6WVUY</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZLYm09j93t1mnPgkJbsSc2zDSzZuwBXlrnm/K1w6xbJcr9q2fqBkgEzjj6tQXUnH7zZAYnChiFa9uV81i+5hdL5IsVFnD7xuZ28PglorAJJWlrGFj9AhC13zPWLmDgTmKIcUtLXGsGrajaYN/9OnimFYr86VTHaYVcZIowI2GafPrrB8TCzbk/Twvu48cbA4AVOWN8avaQ4yzezNKD7cLoXmALrzMgYEGA9F9STTu3+p5xuc4qhHR2qcvaA9Ulptij+LPxdPnBHOrC6wT7L3fGaJRxK0xcnV4CTAkZzkYxMKpMaihoy+wsnJV/SP8/JRs=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>