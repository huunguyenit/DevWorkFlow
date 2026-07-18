<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmbcm" code="ma_bac" order="ma_bac" xmlns="urn:schemas-fast-com:data-dir">
  <title v="bậc chuyên môn" e="Speciality Level"></title>
  <fields>
    <field name="ma_bac" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã bậc" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_bac" allowNulls="false">
      <header v="Tên bậc" e="Description"></header>
    </field>
    <field name="ten_bac2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
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
      <item value="120, 30, 10, 60, 330"/>
      <item value="1100: [ma_bac].Label, [ma_bac]"/>
      <item value="11000: [ten_bac].Label, [ten_bac]"/>
      <item value="11000: [ten_bac2].Label, [ten_bac2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Specialist Level"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwdg2yMmHNFJ+I5zEnpAH1l7e7DP1ZWtFjDrStYI0iFVWD1GmA+rv9L/WaRb3d7AjySp/6RznrBx7FtcPhgXOrgG</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYYhrLHt6SXyNWW220IE+sl7paRVR/OS7MmKl+txkciSZjO+ju+zCfdu/obANNMo9QbrF2IxIETS8ffKLBCIJY6K</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuli5sORwP8XqxSUt7qYur0nMdxWBmBCOp0mn6c99FIN6G05kz6fDFZ+Jy4qiWP/mjTZFy8chR4wgXecs34LSAfC8chCojX4Llls68tfKNIaG5pMlanJ1SSwnVhItkZyqtiBNvwSlLjLNgWA6kejhZ0oWIeGzTeR0Ssg6hag3PGEckOrke7PXua4A4hM7sa8Rqy8DX6f2j4JpcM3mJRu3YzJySp/UPilr9NV7KV9jlqkjfx/j9F0eeqqjyxvkjz8o/dmqrSO021IheqCjrgE7/nEfBbTMwlaoAEtq1aj23UPHqXAQUUOF/Io4G7XOKQ59IZYokvguADKFv62GO4iDjLMI0muJPEyZ6mILdZ8cXiP+l8=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n7lne9RFJSwAyf8KIDq4+3doJktvU5Qsph0joUYJfG42Rw/WmnQK5feV1WTDRSHCYkoaGICOBnaIvtbH/yxGJhz4szBNxrIJtAJu61Sgb0QdUhAntPiuS3OR/kTF58OA6afZnwyYxfhyMN83zZWpp1AwqGUbOApXiqi8K1t74NmZy5zskOQhlOD8ciIQdx66twccfPXymgYyLYmauD+S13FSa4nQfEcTlp/Cn7XNWJuk=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/j1bTMWIVgvXrlfLBVA5cmOJ7subQjHXwgA912pyrUtGbAyNLkH9+KxS94DsksaxocISd/u5A5Og2ggDRppQzXEG+JhmrtunWCevfgxP3mrMHvvKDi9q3tt7we1mWrHr7u92g6XLCuGd8fMibfemvE9kx0JMqQAcUwVPv6JoH9SjBs9F869eR14m5DpvCZE6M4YyrAJweXu2mhpQoHwKrqDh42Qt9RPVWGDI23DlUBnDuYAVgA06E7bga3NmUEX0Np</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbelJ/55nACw2PERxBcSXpGqek9HbUF36JPrsdgf7/8EiA</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkbAG11FQc/DXKLjnk5Dl5p1LMtc7rfVPw+A4Gy3MRD6LV4LdtOO9OU9ULBgbYTehOvkYcyz8hHJWADlxR/eHn77QNv2hu7xWkLaiID/2alsErJotPMRsEYB9VRO48qoeAZhAAbQb6v7Rj6ldnKlZXc0x7jd56XSiUcnH2Kt0Z68NB28GkYIS3LsjEWKaxg/2rMOTDO/rb6C5WZ3rFmVA5DIjsINNngb9ZTRu54OTKM54UVegi9vx7bwEV0ofr+1MjFXsGGOMlN+FdzYgEkqrXL7knLILE5Y/eTqMFO3cLKm2+Xjbu8hsRDOxxDYqFbdKMuI7ypAqKLqgxyXVJZF1dTX</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>