<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmbpts" code="ma_bp" order="ma_bp" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin bộ phận sử dụng tài sản" e="Fixed Asset Using Department"></title>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã bộ phận" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_bp" allowNulls="false">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ten_bp2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_bp0" dataFormatString="@upperCaseFormat">
      <header v="Mã bộ phận phí" e="Expense Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp0%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp0%l" readOnly="true" defaultValue="''" external="true">
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
      <item value="110: [ma_bp].Label, [ma_bp]"/>
      <item value="1100: [ten_bp].Label, [ten_bp]"/>
      <item value="1100: [ten_bp2].Label, [ten_bp2]"/>
      <item value="1101: [ma_bp0].Label, [ma_bp0],[ten_bp0%l]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwcwxmsuJdEvd7BCL92F2/DGqJjw9uHI3URFTU/29Qy7DGM0m80UJpOppTXDqQpvp/E=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYa4jenshSQNhvi8MinZKKn9OLmX0z2ntTYne3ZAs1NVT1+SkB9FSSTXGwx4IUEfj0s=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7f3Ww8iIiKLVQ2r5jTKX3iSbfWwqhfII8/L3PGCtGYEN+v+9W53jc5eZgoUrh3Y7XLAkpGzNjFA9ahZz1B5kKX/IRsM5CawhHHblBnoNSikJvN6vHn6edGWZZW8ehx07VmXrUGVHlhdyaJoStsaGmEVJEL0pZdoXt/yFKvtXPK2ny0Z97T3V5X/Xn4kTF36pE4wXaWWrqMPWaEbrIxkNImIn5ltrn82OU1Vl8UwswWJqm0/aJ/1AsWHoRzTOD9AW9CELLMyEQF2MKJxVc9MjQJjbHnxFxQ5k1Fubv/s5GfEyvuKhBMMivIVgLyM8eSxO2PP9MKsZpIlaoTCCM1FixSzU9GiO+B/+KqXOdiqggOt75aJQGvWANPrF1wrd2UPdRmnuiklHk0IM/GujpUvTRwVj+q0zmxYKn7vlZn+YDU3bvgAN0b9mMx30UT9Ee8JMLOV8TMLE4fSr8lUhuiN+qby</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nfXhuiGxtx5ilNScGK8aDj/gaPT6XsQe3KalGvQju+Gxth1P518u9ujlfZpxf0mBSEd1CEgJfSCt9ISCms7G/mLM1wfNnRpcCpU2v752jL/ljjy7HFZI22D7RyxHu6Ln7h7GSZ0eRc+l7/YDl1LDH6lgVloNYXtLH5X8VYXv2PVv9/9TEMgpLv6AscSMxuzmftM6nJAm9XjThBdamg893Ll+f2LM8di4R4sXKxlPDx5Y=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jbmjLVEaL5LOirB19XEEBSfcZd21UrWxtcnnihK+i6/6/pPKpRlRf4qRpU2BI2bFOMlMPyWUbPI6nGPeIW45Fozk7khp2BNqJ1DYVTX+D0l6p8Q4GYzhPEPcRm9lj6etYZGxEYrLnuzp7z8srrsv61rkh9gx+O4u1MUzAHg3GsZJ61cZcWPzRo41fatP6/pjlDG35qulTF+27IV4fREJgcPLe1Q9TdCvuZWAOeFJSojcdiozNCcsw7ydv7WtpKdnabr+wES0+goea+3hYgtyN7w==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbejRN51d98vJNgrmale/BmbKJhKVuFVjZuUVxtvZAdwNA</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZqg7ciOImSUwiXwpLZHBuO+fSNlM+iy6WfQMCMpbnm+yP+Z2Hfaizkl2EFFhj0uSHuSNrdjLGPpUxBdzrF052nblMnjk64+mVtAl+GNfOL+KObIk5abQ/wgZk5xe27yOSxqTpLiPICk4/06AENiaIreCEczOZvJWQGtiupSIKuEAg56THcmghw3XGYxky3nArhXR7sw9WbrjoBEOTvj3PeN9lV8QrPMJtcOMh26QZ2v9lxLYyanb0vE5/TWLwFFutp/JkVSRCj8ow5khnKc1F9OhySGEseIYFwTte1VL4G0wmszfRRpcTHzvDNC5UAS2Vp/5oY9rnv7LubY2GJgjoI</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>