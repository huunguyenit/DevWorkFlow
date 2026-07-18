<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="mdmky" code="ma_ky" order="ma_ky" xmlns="urn:schemas-fast-com:data-dir">
  <title v="kỳ hoạch định" e="Time Bucket"></title>
  <fields>
    <field name="ma_ky" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã kỳ" e="Period Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ky" allowNulls="false">
      <header v="Tên kỳ" e="Period Name"></header>
    </field>
    <field name="ten_ky2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="status" allowNulls="false" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110---: [ma_ky].Label, [ma_ky]"/>
      <item value="110000: [ten_ky].Label, [ten_ky]"/>
      <item value="110000: [ten_ky2].Label, [ten_ky2]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf48u/lxPp/cc+BQWYnSPSVriIoMvsw/DU4goJvoTX/Vh18nHBP5hoZIs2On0im5/53GTMDaPK1VPJqyLoIgafGmMbe7xvBExL3G0XkbROIkl</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2K7Dj9/X/ZYwDDVhsN8eNqBhS23USVNkY/HMF/TcPmcSAgFgr+i4iOs2NZYhE1P9rNNJ94Hf0dNnnsrSJus8hs=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7dY9IURvoEsxUUilGJPC7okw9w1umLqzdlAHoD/n/5B7qlqAjWonymt3AXrBTErug+6XyNlzAyBH63ZK6F8qnpTQMuusK1x/Phr5bBPaRm5lSOQt1lIi0i5s0TABTP4L0AmEkAxJMrlWyhkokN4XQQ2FEbMZA86G5g0E7mNbTpqOgkR41NMz4Kq655xvunZYJZUn5I0Wq1ht2gAj5nRkRCBB7YaN0TD3FaZFZMzx0mNcrREgwFKhzzME9CSd+85xSkhmwb7KVvV61Gy7eKhAepoihcbdQ+R8iqcVimidCtuE8IYEdQKxQUynTsGgpyASJdyqGuGYs2F+3ACY1v/x2qOEY1GXrS17GWHsqzt+Q2GSDL5DZflv1MVkKq/ceHmKr/YKEt7ybmSrC8TsUrR8k1D3fcQU+V/3sDt9Is3fjpqmrnLgtWzbegr6g/n6tBIOVjgk+zwTNaAaHdlc+T45tYA</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3c5kQQ7hAoMeQUYmTcb+5luV9JmZ56XH4Ax7utKqO8u04R2S5t62aPSh6qgvHjVxJ+lfZ1CeyuqtCmwLgG5PqWunwsDxTg55Bn8V+pB8+HVXQddcZ/CbPHRubfm7HQSJyw2anQBGfu2mtjXi3DAZxV0CXAZB5N7hh8dlVh4ZhtY2fO0qhVAtE1+GgSTpTz7Lx7Hbmo7RRfvRnpYnSn4JX2PTDxZyYnTcCMkTKyC6veZVM=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jxzQLsveFE3z3hHd3mi/hY3SLhBCRTFf0ZWnIFUWM6GTlwHe2/Hm1H6skvjdwy/uRoa4td/0VgwbuuBeekln5cxXDP+/Mnej2VSW+D/JWQnX+0Ko671Luqvha7Fy1r9xNbkpoMLwQMFn5Lsfzn6+vhAPATwzN6zu+MUb5R0RHs3k1v44mpT8daOwj/Y6OyOmz2i2QQSZWPVDVhaFvBXbf4MLsbDW7ZiuiKNvYs8d9OsIeuTObp5wFvg7DpXLg/2ZOcds+9sfhF97dwNc/ecyEQYlFEmFcilUerNnA+6valwgIBwk6Wjo6ZsUuhuWnTCZiPtfyQQ1X0cfSAGgbG3H6i/Xv1DU2rP5ABminb8Xhk8XOe2HGS3s1qcLbj6u/kcRR</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberhImNFdMxcrPrWIl0AJkuXkJ5tGetT3jR2efB1PI53A</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHaMIJOIdLApwJ5aUDBaYRCa8TKB7auek8Z09swsfSYjgbIIaOKnK1kG6zAUXWyTvguTqtjXJXEvyLUuv4GX2IAdYMamWOyBDBcjxrtjhsl5tvOE5nQldlKJ5LEsAgyrqoUZ/SoG93weGJuHar/sxNeO9r86J7gjLA/auynBcPFfHANh5fGiiG0dTKdHKMQ6BIw=</encrypted>]]>
      </text>
    </command>

  </commands>
  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70O0wy9SVvmau+gtMzpgUrhcM9uxhqURzXWugn5q/us1OvC7a9fOvhYqxtVCSD2FJ8nb5IKQFtO84IzWRMisshlO/dSwumwoe5To+NJgZ4UtT0S6Bclrc+4eGKwAnjtppLpuUVGRTQ06uuh9caRbyP0r/2qpL1cYyU+6vhgKpKTxwICZYk7j0rhzgr3i1j9PLDJ/muULZqugTP5C0yaS5TXJrYpVrzR78MBJAxfyFBbMYVQF6U5xRjh42tbrHa6nfY85BpOWeg0WrZ1qoOYR+0SUx+OU30PwUpYoObBuf4qUvSF+BNu5otOKVzO1bBAK1+dw05uk/+mYfnr0bKzFSOOkDSkIVz8Jkvk1k20yRRqIC</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>