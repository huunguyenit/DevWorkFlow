<?xml version="1.0" encoding="utf-8"?>

<dir table="hrky" code="ky, nam" order="nam, ky" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Sao chép số liệu năm trước" e="Copy Data from Previous Year"></title>

  <fields>
    <field name="del" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Xóa năm hiện tại" e="Clear before copy"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="type" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kiểu sao chép" e="Type"></header>
      <footer v="1 - Chép đè, 0 - Không" e="1 - Overwrite, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="ky" type="Decimal" dataFormatString="#0" isPrimaryKey="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" isPrimaryKey="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 100, 230, 0, 0, 0"/>
      <item value="11100011-: [del].Label, [del], [del].Description, [ky], [nam]"/>
      <item value="111000000: [type].Label, [type], [type].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+zYgXkWUL4wyG2/0lrZA5vN7IRsLr0MG3x7aaLpxjhRZgfjigeq2AID0gGk6QZBjLekodetMkI4Z5OhPj5vm2angc+L/Ir0/Ad9almi9IfL</encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6d+6C7P3CHzoid/ndSKe2q4yi0+yOgoDD6/aKihme2bss8JsUn78ng9zZosVlyLT4tDp3gs+IrQVvI6I2lMEtVFqnRO3tl30GAm5cW6SiDmVMA7Jn/zQ5PeqcUQ4sSoPfg+vs2lzVxm45iucJ1jmbKv5HYBzYUrhDHLiTZbohJVf1ZgCiO+tRmhoYCc6CjbDJ65wV+56Vesx7QDxfiEAPTfXC/mnVQRIwn4UdU5Sk7owLLHqNrbAYWqPgzq1OgWXrewvTApFamsKzwlQXjuCmWWVzjnIlqa73LJGgbACMa+V3nhhxE2u0ksrboKp+pk06KZWa1al4Z9lMJ5tzcWqIVTtkGiFt5WIZa0KTN5GjH+fQiirThD68uKhH1rf2XKrz0CVBQD34lMMvQdJZCr77cD5mYAzXw7gXpA4fze2mk+khjzsDh2UXnQCgm7rMV5uWKy+ur2USt0J+JBAsWFQG7X+JrQTZdFMzMyFRfWFITaTv6z4TKMx2GwHzVYnHaQyBCnB1Ey+6joeS3E5SezOTj5U/BGU7ftEyIpTo4iRLjG3bvj5o3/Tvgn3bm+Tys8U1kmh/RzLK+S8lxKnzlk9X4j/Iw9MmhBl3nspFlI04A8Ba5Vkg1aCD31eEnpSmwjNJA==</encrypted>]]>
      </text>
    </command>

  </commands>

</dir>