<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmquyen" code="ma_quyen" order="ma_quyen" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quyền" e="Access Right"></title>
  <fields>
    <field name="ma_quyen" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã quyền" e="Access Right"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_quyen" allowNulls="false">
      <header v="Tên quyền" e="Description"></header>
    </field>
    <field name="ten_quyen2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="loai_quyen" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Loại quyền" e="Type"></header>
      <footer v="1 - Chức năng, 2 - Bộ phận, 3 - Nhân viên" e="1 - Task, 2 - Department, 3 - User"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="110: [ma_quyen].Label, [ma_quyen]"/>
      <item value="11000: [ten_quyen].Label, [ten_quyen]"/>
      <item value="11000: [ten_quyen2].Label, [ten_quyen2]"/>
      <item value="11100: [loai_quyen].Label, [loai_quyen], [loai_quyen].Description"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwdIyzEc4r4kG3n25VC+NliUc0o/wWo4Lz+HL1By9al64MAGJ0rUUOqO2UJB04xuIXU=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYYjU7yuv7omrIOuThCO6CuAaox+Py1Ji0GuCh9aFIP/AhoXAlejxTpUdS7fLgdD6ao=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8Diww1NTurvE61UC/cD7mFIsGGGXyIJUzCtsk7IyRzpQHJM6yKaJU9hf3L2/G1tZNro4LGv/FxupoQABfjSe1OStSyBzjBOuE7j/Hfd2l4tGt5mr9NqOBGXOEe3m+aYgXh8T//OJ4+FfCvh7XqFrvchQnZbxexRslq3M9y6p5eng1Nj3WXKwmWrsGEAoPBDLsfnW4K+mBXirBvwSSXcPat2OevD32P/J6xlfeokJioWiAQRfCLZa4dcZxkTYRIpw5BCsEIm7Ux9oUy8TnbFhu2rv7n0VxsG8Fh0xYQJY6v5XTmEYEWXJs1oWSzwanq/ggrHk7Zb/ziguAovGUGSp9XC0dgyfU67sYlLKf1IXtBCirAh9qZh4n7x3BWqcvMQ6xhHyoIHyErLalhjQSRtVHaXUf0pIx8QLmv0aGu+KYdQJP/4vrOtNkhTkLlgu+gUCaMxDHvsqxQIHbHKkjQ9HXQAyOvHO4ixqoXB0KrfAbloUF7M0K9hHh5OVM9XSGXq+Aa7GZ0YS8Y7/tJZBYmrHDNioXqS+82xhTGMBZwUBU4XcQ=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2FwRxVRdbmVu5HNSCp5ZzJXabelzac6jVOUXSFCLtuGIwiz5l1yzZfp2wK1NJw29ZjENIIhFAOqmG9hfYz66XSXq5hvf92m2qNkZY5zbSdelANvw6yN0B/E9LZBi7ALz0dvTDN9IxxovZBIeX9Qc8ZphG6Y80IHvUamBpxdHoMj6Kbwo4cho6arm6oQTtT4ZChGd9ReF8C7uui/8IZPq5DjxbNVcGtjhhzIkFYZHvKdUReK0zdCr/w2yjkT78iPpHNt2SsfxuhsN0PVAamKgUp/p2nteWhKan3w7eyc29qe</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2FwRxVRdbmVu5HNSCp5ZzLZxosfPAOt9ojKQB33X0vUcezmf387wsrdxldw6qMwEmB2BeaiAfHZQx7vy/61HnZwJaMsHwZIU47W9waY1TWZwXlsD8ExkhXzbcfAi+W8ucTBvjKus6WxJLPx1AzMn1jEnTpr3RTLJK3QIdNqLqc3vJKL3g6uK1YKzO6/krxpRy2on6KA7j0i+7qOyGrqoeWv2qTL0uFhxhen0Hyj+MvJDYHkCZg5O3sUMbfKwGn9SQO9VOJEn/dGAzqBYQRJ5KpDFVXNoPflSthMRjlBiJhxhRh/1CBh1uarYS4xruSHHc3YLZvYijIywth73RvGlu8EqhKxWMyh92fWM18DUy7DmKSfqQw2eI+7FlMfMMOM32hOifgwRjwRgrrYL6J60lTJtYNoRhKjmSOeR7dklnoW</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeiZLCjicxxWl8AUgJy+Qn8/1QylmGv6YRKuZjepBY83k</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2FwRxVRdbmVu5HNSCp5ZzLozXS5+Mi4fPu/w2pp2nmPLZ8mnbcIa+hTVoSmrPOfMGmWqBYHLLlmf8OoMpo4AvDVOGX03BL52A1BNF8GES2L1w8egx+jmFjUb0HVZe9SefkDSmS+x9eRmEj2dWqQ2WXL7Wa3+t+RgyULxaxdVPdWTSwFrKohJE6z5AyuFqfJVBtQVvAd59HrJ0ctWiWHPyHMvuECTzJHSw+WG4HmT/JF</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkY4irL7j0Z3urJGuyO6GKMAa+BtmOUZ2kHz3BJVL9yjybCYGGa22KU7/5xXj36/ipA9OOBoKlfjAfrxsTXxjCEV9QZMJyk/DG4JImARHE0JeUi3neqOOJeVcV8ZtSy0BffFi5wAy45Iji7qXqcvfS/UXHKPtjlDAhDxHseGnnmn0gGV9lZuBVBxxUhjjEgWz4U+fWHmZT7vnKEyZBuXoE9InZZUMx6EWFcEgMaaL31WsB2C3BHH11WHAD2PKySBOnHbhBI7NagSUxXpdQ739P+f0fR4P/B2hSfoo3JUw28szvWEQODD7/e58BafSyvQXWix29eI5klkWYIXieQ669YF</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>