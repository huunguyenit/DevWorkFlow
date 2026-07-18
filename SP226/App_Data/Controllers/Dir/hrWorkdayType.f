<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmloaicong" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại công" e="Workday Type"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã loại công" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên loại công" e="Description"></header>
    </field>
    <field name="ten_loai2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="tinh_chat" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Tính chất" e="Category"></header>
      <footer v="1 - Trong giờ quy định, 2 - Tăng ca" e="1 - Regular, 2 - Overtime"></footer>
      <items style="Mask"/>
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
      <item value="1100: [ma_loai].Label, [ma_loai]"/>
      <item value="11000: [ten_loai].Label, [ten_loai]"/>
      <item value="11000: [ten_loai2].Label, [ten_loai2]"/>
      <item value="11100: [tinh_chat].Label, [tinh_chat], [tinh_chat].Description"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2WPCxRVkP/aDs3axAEGjW1YvVXedBPjTlsrzE9s72sN86fKqnFy8fxRhtXNftWaHb4tZQNebOkfc35/kxehX/o=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2iNU7F3qosiOwLnKtGnz9gbMWf03UZ2cnr9uTW1ihm6JX38/5J3/cSuwZqybj4PXHSZcpZMeVa1OE7QToT17Yk=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEKfairVqkkG2/EAHbWl5sdbBOwtFzSbhhoIpgkMQS2dLvjGx+87dJe0t/lhPRf5LZKCYaMNdNjKVlXJxObb18wNBnihAct4BQNsYR1p4Zsjy08UldzTckgmPa6mpa/rYrI4KPD0jtoENrePN/ba83Rx7lhXca8lBBC1RPIuaZK/YpETahad79rasf2FgnsBtxGu79YafGDUhFkE/eNf0qj2QljIMo7D50EKGDbds9QNOJS9XnNZrTDeL6aTzK5RUGmOuSDOegQ95yYhZIz+fz7+YOcEutijKnlCJPwvdheKHI8a/8YoyUIxK4Yvvf4fjkQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n2yWu9hjJFlfsBY3klD8tats3kDmCDyXhi3KEawqMkLJjEmgas7elA3cWsletFMJG3+ikghBWn7L9uXLnJw3YB4lL3x0gPDj2HEL34gPeSYTh8krYoJgcFNIfBcN/ndXlwFLkxlyF2/pCAVNTvpJz0+ttcdeCyFnJThNkyOmDp26qJyYqjGtz9yh4ov6WLQ7NkMXPJhf6WS7GNO2TEp7GYSZEKblp+7ptT6m1ZPDZbE4=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jwMlrCDlMuk2ZBU7CprWOeBQqJNNbL3cRPPtAK5XkyLEJq2svAsXCP7+LbQLrg4c2RwaxfRslgI020qRuS++u4NrmktKayefu3ipuW4+qsOZqqhSMXVr5QZOVtB4jUTslzm12GHiiSi0I/q4BGZyp1eF295uGZWb0oHuyYpa2Bz0UMRUdzyN3Tl1HuYmJNRBtRMvu3ftydnHDvkJDsN+m5e8Zn0T+BJlKoCwPN+thma1/X6YXLVao3leSCbPa/9QxIjGo574rOScuE7TnAj8RIg==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70ESvQ1RDiki3qVL3ilMoxk2T7idqhU1UW8VOdRND0JmBh4OimtDoE9NT0xxN0+VHfSPZIsZs03Tjtby2c4b1AeZPHdQsQfQk0TswHCH7ygmmlEvCx7sRsGZ/XpN0qtouKTGPhfQTHGLyC+qLNpPtF4o1b7eCNDHHtx65/j9vhm+trpKY6WcsEqczxq5XaPiIBX/CwuKzTpKQzC2ALx93E0R3CFFTf+M8jRQKi6Tr47cZhSfApzOLcGAdOh2isdLyxkS25iv5JzoMGZNoc1w4p1u1i16YVqU1LeyChV3a1zpsMDYQjKk/1Eb2cS71lg98FEPTeFYRWAd30UoETtVKvkvUoqN+4eUqZJtxSyokuln5</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>