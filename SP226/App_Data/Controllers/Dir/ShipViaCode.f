<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmhtvc" code="ma_htvc" order="ma_htvc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hình thức vận chuyển" e="Ship Via Information"></title>
  <fields>
    <field name="ma_htvc" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã hình thức" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_htvc" allowNulls="false">
      <header v="Tên hình thức" e="Description"></header>
    </field>
    <field name="ten_htvc2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100,130"/>
      <item value="110: [ma_htvc].Label, [ma_htvc]"/>
      <item value="11000: [ten_htvc].Label, [ten_htvc]"/>
      <item value="11000: [ten_htvc2].Label, [ten_htvc2]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwcfcsXXQci05DpCm3QGI8yqCXy9YynUhxibQq/ygsOa9RHpyUF/rMVGVD9IumMhBrU=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYaq2bClOTS+E0EgWU4rZAl7+ZSktKhnmDRiRLVs8gOOz9s7Zi246832VnIZyfXEtlc=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7em9J8nNcf33O5U8l6OlkY9CPryFola+Hfwiuz5zMDCiKMRMWM2tjI5wIQiC5u6GuxGDDap9Pv3QEzkP8KILXleqTPts1LnuUyK9X09+Kio1Cqbn9NpZDWRSzY6QYeUCrsk1aTxdlDaarZZUG0Fxy7vRJXNZ5EQpyGs/evZ0vrFf26Nb2X7ZBntyM0roHqKuvlkzhaHF1GRPvC4Zx7fX579QsS64tIcr9HLQ+U2M7Zui6f17paN/OvxPAsZTV74YEHQNnUvvrEfvMLTFpbzWM1BSsc9t0WRIPdzX4wwMbbP1hCn9QU6HgQx45CfyvC1GUD8Uq2hA4C3Yf9T/2oDbgge8GWo/asPOza522xXn4QmP0XYRecpW5g75jGzXXYdh4pxe3FXWOHZC7x9d6/2x54cyJyMA0ra64ImyVCTGhqZCbZJYLyCPhOdUDNYjeN7sFJzX7dzwEJ4QhZ+NfZRchXp</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nL7Y1y7PXdXhQ/37+fAYaNGPhhe1BIlB4MsMEZB01DF1BvOxdgA7hulNonPr0i2B1PjD2xD4m24wxGQHmsOX9vQLLlcuJ1XAhJfMsyVS21Feu4SybNW5Mb8bUYBSfuu10ygV6YU/l2NNjMyIDRrBt/eTocK+ATHT3YNxlCi+j9UXBol07qdWye0/Vx6ItDrWLk/rNfiDIMc913KTDYdqWVyVEtrMRqWiiLVG24I/C4p0=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jaozPVT1ovip3ToTPE9ZZFtTIAdn3IPrRNspcmqaDDCuULXpXTXWwrUay92GhUY/FCNvcOrU7gHap9BHUVHSzhRCVhjCyZ4bRDnBsx7eBY0KQB5ClHD+lWviYMBRd1PMon1TWNa0/8UrlgM2aZhyO7ZpOMDzAn7mvpEhCBZedEDIIYPD5H4Ryz7M7vv64UthFDd+8w5dSKDYWePfmt3K/Et0YuAfrqGi+hkWnVvoBYWBFAYciKJHnRNvWZXcIpD6VgixfKXE1EcnJMsrCyPj8xw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbesDXXoxaO1l/tMOKfDTEalAVVyQ8rhc3x5JunVJ9zO9o</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkbyyVcGm0bXyRU1h1jopcOCWF6PDHxKWkHY3g6FN4oPAf7VcsHwcfdOiCiZQRQdDFcOJG2drH7XfY2nqWfLID1O19dl4YKI9xjIMeYYzimZp2hTRdw9M+MYmJ7awpUZsdtMDvMgXMT8ZqlRdEEwDFF2zO/OtvWGejKudGHUHYL0m0huUHAqufym0oxvnh+uG0xF55AwAZq8ctIvSp9APzUfeCuFNG8GiJ5e+6WCe58DEFBNpx/U7PKFcWNDj6vZiv/lNjCe9v3GsFOoAaRytkvxQfzK485cfzzbI1tRwjtvM7kG4pOFme4TmRp8m7HruVtZNrtgOnHdCYktBDGvUuZf</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>