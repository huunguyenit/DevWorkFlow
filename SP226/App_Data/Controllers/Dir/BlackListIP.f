<?xml version="1.0" encoding="utf-8"?>

<dir table="blacklistip" code="ip_address" order="ip_address" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giới hạn địa chỉ truy cập" e="IP Address"></title>
  <fields>
    <field name="ip_address" isPrimaryKey="true" allowNulls="false">
      <header v="Địa chỉ truy cập" e="IP Address"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 90, 80, 230"/>
      <item value="110: [ip_address].Label, [ip_address]"/>
      <item value="11000: [dien_giai].Label, [dien_giai]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliRLGU4FVZzJfLpiS+HmWAefhSCAbYTnQGG7de+xA5cRjEJ4TBGayPzObz+jov0G5U4vGV1vOT6zj/BYkfWnSVrGxY9Z13CZ2XNglLGeqgPRFxcSawkc/wydQgJrbI2R7T1w1haNgfNyBJak21cn2uBEfk4l35QJ8o5BB8awbhtpARYUnwANVS93ttf9xbeiAkgHZOQlIBO3idqwFZScgypP9F/UGhGKbTD7iXmUmlfAL8YrWlQtJDXr3uzFrbelZ2WlzwZ1AOKBsRw6fPOlRsYNU7Xpa0yqRfErWwCkDZz/kvj3E6bmgkHoy6gDezXfdE7Oi70ginuFwcji/wOxjK4NkRkr7A4Y0LxW98H7UemF0=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nqCA/sI6Omwjpc1tYz1d571ng4M4ptO/PzKKk9d+3zBlvVy5g4KFh1LZFZ08xGIk3vXMALXwvkAfYPs7QNeKaO/rE+0D/mxpw5jRB9jWTIaTCIZi4p2xlhK1trUHHKoVFaJJiyi8aykHTb56IicUisekOO8XOGfq5eooe7dbPfL8d/hPxkv+qixlRugk0do4a</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jRNbLpePrwFxBV6uW7tZca0z+UL4HVXJ8XygKx3zFZ0RzWDAjNYfT4mF+PZtyXmgwiVjjW5moQRZzejt9Q3MeOZGa/iharqi/+hzEdZ75FjT0WtphhNDjB096DzmxrjDyEBUB44nqqtGuCEm329kLOneyouJFTx7SiB6NVYDt/meRa/QcwEwTPEm2cmwUQWdgthjy73UuFiNMlBe+BG6xo/YK0s67hCAKYVB1DP1yvJk=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbetIDly/rUKtMBW8NsjmERtvgFTjcJ6QmmmMwaU3EtUn4</encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KlkBPW8xKtDiwP3gicSpZtykoN3YrZY8hjBaZXrlr4BMwdFZHNVOkuM0oEGhYq/phXAPA16DhhH+YuAzxQovLF/TF5f85f1mqCgKaA4cM9H8JNDV8Z7fvR0n/0Uj9kT6ct2SernloUXeHp7pgbmSr9MUqqG6oy2ZZYVtSKpf1XkAWcbfIuXXDheFnVNh3TuPhY009IA0rUnvbfWrm6809wjERi4EtwlZ5wV7xbl9YcFwFqtMABqI2mBhJtjukw8u1naQcJl6wY8qdoiexTSd9ox99fElvThYQHvjmgXdMkSTVDjOM1eNcRFf8+ukeqO29a21/9r/ZmKizp7AgCfR/DtuDrQx/lXcDYnu/y61OcUzrUercH3GsmQSyw4vDf9n0PRt2jBDiQG9EvvL+YTpjtHQ30gMqR7DODu6Gd0q0mAsdPOJyv8mfOI2gG23V8eD2BdjaJ1T3kABjIjwCRaU44=</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>