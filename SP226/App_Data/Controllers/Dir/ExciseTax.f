<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmthuettdb" code="ma_thue" order="ma_thue" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thuế suất thuế tiêu thụ đặc biệt" e="Excise Tax"></title>
  <fields>
    <field name="ma_thue" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" >
      <header v="Mã thuế" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_thue" allowNulls="false">
      <header v="Tên thuế" e="Description"></header>
    </field>
    <field name="ten_thue2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="thue_suat" type="Decimal" clientDefault="0" dataFormatString="##0.00">
      <header v="Thuế suất (%)" e="Tax Rate (%)"></header>
      <items style ="Numeric"></items>
    </field>
    <field name="tk_thue" dataFormatString="@upperCaseFormat">
      <header v="Tài khoản thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" new ="Default" reference="ten_tk%l" key="status = '1' and loai_tk = 1" check="loai_tk = 1" information="tk$dmtk.ten_tk%l"/>
    </field>

    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" hidden="false" >
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
      <item value="110: [ma_thue].Label, [ma_thue]"/>
      <item value="1100: [ten_thue].Label, [ten_thue]"/>
      <item value="1100: [ten_thue2].Label, [ten_thue2]"/>
      <item value="110: [thue_suat].Label, [thue_suat]"/>
      <item value="1101: [tk_thue].Label, [tk_thue],[ten_tk%l]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwfRDc/5MQFM+7S6QuViAvODpxZ0EpznDYgVq7bXKn7Ea0UG51iUX2q5VUUY+bRaXA4=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN3RifeRGnKKqHOCaR9M8+GNALzgbnoyvNJCY5OfVtFTua/6rNZwFBYUYVmeeMSSqrk=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliREb41ueGAY/q5/iGOaI/0uMphd785khLt8KocegE6dyAO8m3oJo3/NkpMCrqsbTDhSFyMuXMfm5Vto6n8Ke8guH0Ld/kPJrPNMKxGO4biDxg81a2lJt3UPhY2Wl+NlHJDGhkpkFIZEYVtSujtVdx6e61qGSLuoBC+9eRKC5e1ow+JKZcFyHKWh8QJUnIswwKIXQY/+Dgeket2EYr5XYbF+q9R4DxFLTM4ukIh4Yf+XJkGPruJYZUFYWm2n0DWVhi</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nDLbUN3Mpdm0mffFQ/WSEHnJfUaFBz1g9esxz6hj+J4ywivQOnH7ZKrAZ15AELUZV5d+3HB2eUOhnDLpY8yR17/HSspbkQnpSIkht07HD7qg7+UfDNcYXgMlFsnqJc/xyffYJdrUesMR9s+TJ1jMvVzlL7Mv+DqOHytk57RyVnnrrC3q6I6E6o53UXNBz4lMQdQSQhy3XIxPj3T8+o6wpRpZrjodFidFO3E76fUMpQJo=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jiBJ4HSxTxgjkBChEGiWd0ODrqlXf7pZayB/KIlCwgZtcQFLCdhTd/xyPQNWWQmeHFdMrY4+Cyy6J7tkosiqCMatsaWiazvtiF2ahi6d7+ECIzZ8L7c0tyUZ/4juWfiXUckRTCV7S+yt2s06+OrIHX0HB2rmv8E8tTISUGt1RWXxG1geXBK+V+03FzMAXx7HonIiZhkObzFHpc0WbuVvVXM7qpeP6IwIJbTcRKxfepT3kKWTfCQ/MF191F1k0KZYCevcfMCVbxb6UHI5FEBoBtw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqC1ZJMuOjLAMDaUuA56ed+7qqxFmc7vsVqv2TexodqW</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkb5jJdWtc2YUX6YjlfrjPFP3ruj7Udlty08k1C6LDCaU3eFZE33kOMG2SwoXEgZAeKKf4TuMc3GD7KXEBr8cemfuv0Z7OS4FEgA1nIczw3B3oNbD6JSm0Fp5vwmEdcM8BoIRNmSmF+i3utiospb6CsHzMEW+yz9HoAoUeoo6l2VcwxW41LS+8QCu/LczudovErv3C7kx763T1ZnXa/1gVLnlo5ztLBtfa7KsSAl/dVxvO+hh5hLxQrsoyuFSTURcmweQH6s7GVIVzwEsPffC8RBe6GuW5EgWOr1Vaa/a6DbdsFdlL5arYtQ0O/tGbtyxYtDVJUPSfGu1K5sB41lXp8g</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>