<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmloainghi" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại nghỉ, vắng mặt" e="Leave Type"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Loại nghỉ" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên loại nghỉ" e="Description"></header>
    </field>
    <field name="ten_loai2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="tinh_chat" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Kiểu" e="Nature"></header>
      <footer v="1 - Nghỉ lễ, 2 - Khác" e="1 - Holiday, 2 - Other"></footer>
      <items style="Mask"/>
    </field>
    <field name="bh_yn" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Tính bảo hiểm" e="Update Insurance"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="loai_nghi" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Tính chất" e="Category"></header>
      <footer v="1 - Nghỉ ngắn hạn, 2 - Nghỉ dài hạn, 3 - Khác" e="1 - Short-term, 2 - Long-term, 3 - Other"></footer>
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
      <item value="1100-: [ma_loai].Label, [ma_loai]"/>
      <item value="11000: [ten_loai].Label, [ten_loai]"/>
      <item value="11000: [ten_loai2].Label, [ten_loai2]"/>
      <item value="11100: [tinh_chat].Label, [tinh_chat], [tinh_chat].Description"/>
      <item value="11100: [bh_yn].Label, [bh_yn], [bh_yn].Description"/>
      <item value="11100: [loai_nghi].Label, [loai_nghi], [loai_nghi].Description"/>
      <item value="1100-: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf62AL5NGtzvsfJ+oHgZI4T8WjSQJIZY2CK4kXINaYby+dVPz+eUTTQoFo1sb6bOX3ObmYT/j8xrRRztXs3YU2fY=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7n5J/nPQ9UQxMzj8qOaxa7ODon9OPs7DP+OLOU4QZxdySjZ+gRpF4frxfu6dFBrQ5pcjufbk9jqlSjm4SX0Yac=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEIu7oUDhnFCWIyu/YmOZzEM10qZuNS91FvmbV9eD71fh9rhg2swlk/sTgme2hU2XX0rw/B7ZEUkb5L6pUu9KosahYohjBXiYXiIQebQCqz3vm1KbRV8jZwlFlV2yqKEaSWrp3SFqNPL06uN4daO1cVghkN5D/E3HluMO8qi3IJn0XxHWUUiW6yHwet2+pLutbuM4hEvtOn8MPGA/91wf9v7js9NUqpYF+Q8mSVLyBNxSL6A9Ac8+WO1pVvtsAXvDVdqWjl60FxMF83L2OZX9LLPbZpMt2+tQT0E+Hhh7oQX+9pGe3ee0NXRl+tbMJq9N9w==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n2yWu9hjJFlfsBY3klD8tats3kDmCDyXhi3KEawqMkLJjEmgas7elA3cWsletFMJG4AV3lAjj6aktUyOOORFsKjr3V5Tvrpn7dpX31kBOkJ0leZWIS0vml7EY8pn7mH0VHqBTivPQ6spiCFViZAeWH0vy/xwzAl/81Ol6q+/O5V4VNgJeTLG9ZRawaO038jonDQ/r6HYI8+Vt/v8Z3r1fzBf8uKDUw+6CtzBVTwy2L+8=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70JuFqzYCxV5ec9qNSvbVs7BAyPiianZ3y7fzlBmi8tzgCydZXCbWoxg2kaKNxd79RcAlb0k0C2ed/9puTKSqJoZleGcuuLsmsWC51WlfHBLl1+FSRiSkPX3J6saPi+ywb8nSlNdxVr72fCZfWTBhbjGRBe0Z32nKjRnvuizIRMgZw+ZwNsaeCxXTLId7qShn3WzdBk9t7zdoif81uZVJ71oqMK69z5PiupLMxhKlAf2aRB52jSp1dEoTQCmFVxPsEGwC9BDPz99/TFGMDXbBKC6GZpnRBFRIh7xflLGvxAbya5OElkctrC9WZed2cM+RI8LLQObO/0bxhQ6NdXiTww4=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>