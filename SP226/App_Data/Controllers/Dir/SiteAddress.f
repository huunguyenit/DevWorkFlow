<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmdc" code="ma_dc" order="ma_dc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="địa chỉ nhận hàng" e="Receiving Address"></title>
  <fields>
    <field name="ma_kho" dataFormatString="@upperCaseFormat" allowNulls="false" clientDefault="Default">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dc" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã địa chỉ" e="Address"></header>
      <items style="Mask"/>
    </field>

    <field name="ten_dc" allowNulls="false">
      <header v="Tên địa chỉ" e="Description"></header>
    </field>
    <field name="ten_dc2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note" />
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
      <item value="1101: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110: [ma_dc].Label, [ma_dc]"/>
      <item value="1100: [ten_dc].Label, [ten_dc]"/>
      <item value="1100: [ten_dc2].Label, [ten_dc2]"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwduGnefY9hwZxVd4xTmenm9wkysq82AAWMVxkNiPi8vPdTAjLV6S0BBdHEUueMSTQ0=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYZdDL4Q0xnq9XhMOwzIlM7m/SduQCwl4yHHw3qFiDxNzVivACrDFPOBjjamTghQI+o=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7cQzo9+VPd0jKIT29zQ3hX1e7XkB+8sP7wX0ugiWaaaZQI/c3PqU36qG7YvS6v3q/cRqijPdfGIE/MuAVUwid2iU8K1svnQn6Vc0dRtgt3woR17BOHeioPja4ibgDLd+osJ3861M103/lel7Chyj1onSdxJI2xqyjSIgAqvN1TImTmvQiDono8Lt+S8+tRWn1qLb0J6ZOMr6sXn9TxTW0N4sx29M/ZtfrdAQrTyGHvMxAOZBbH8qYJdL6OTJQRU3Zv+G4eTmmEfVO5DzWvqlot8SHwVSZCBjO5jfce+TV95uRYKUvDhDHOWTD3kbA0xYQOpjkbM3oeuiIQ+IjDu/26CXk3afoAsRU/rI09b2XIjMw4tGHrFQ4DnwYluYN9CX7T7H9NiIG3Im8NNexoE3TO2JYt1jG0JVb6trhxvCkqoOZU2L8BucAyymua2AD7PLLc=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nNSA29GNi4z0aYupKlw09q0CObzz5mX9iY/Lylu5aOkuip0jKKZ2dDgXuaEZdTijHeelwSxYNz4nhKf0RFNFsUsecQ3v4F3RKuJ7REU1YzvA8wDrBpfNoOBgxhH/nvg3sTK5wq7SJP/QDVgEZuQ1E7HdVvFF8bvnrRzrrg/Uyb105i298ghRqLbictIbiRVAZwdXmNywiOpmr70tfdf/LZzQGsG5BZVxkTcGXf8RE5jI=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jRAPeuRdk2nVUPawgkWxLmQ5GslBf67t2Ox9vTzxDn/korRImMyU1Ao9x8UbYCHMYUMPeeMaInvXHWN5Ahnenf/AFc588ZjtFHlE8WC859wBRhhKD6Nns/bkmpiqdD9m5VNvI5oCMh+fROc54xUJ5w1Q71NsoenezIuhW2h1djBJ3GuoUuAeBs1qIfSI/oRG2XdxNnZiCb8qmS0Wf/NRdRvH2TsJrrlzmz7jfXPMhofXJicUy3yeNALFnr6fybGOio5E5387+IBrqxf43FiSqDw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberRndyG9fVvzNTM0LzGimA6+3NDIR9wA1JpsuEtI+IpK</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkblZjabxnR9biu/pEJuY2A4kjfj2YRZvvS+iAVF36flc/zLOH9CK9smWwDVxHuZvTMhN7/ZuZcDilRr3S/gp/VvOjEsURRiebOF76G6YWZ8xpNaqw3kbMXE08He/zI7tyWcUdz9Q0kgG3nxdunjxGnQHmSpIHZchHfoPCLC/CigPtCEx7kaP7zsNHqhDRuU5WFRujWYi7hTeo6DE6VVF0n4WnYlK6wiPpXuGtvrEvyuyFmeVSQW2L/w5oNB7gg49cqcQYdTPkM+gDK/yLH6IF83WJl4jf7z3UJpHf7Yf15FkDhSaFToKTbdYLg8m19a1rgJvYA4CAQQRek70AMNEces</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>