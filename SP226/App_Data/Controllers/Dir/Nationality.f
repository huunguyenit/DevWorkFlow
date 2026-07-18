<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmqt" code="ma_qt" order="ma_qt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quốc tịch" e="Nationality"></title>
  <fields>
    <field name="ma_qt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã quốc tịch" e="Nationality"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_qt" allowNulls="false">
      <header v="Tên quốc tịch" e="Description"></header>
    </field>
    <field name="ten_qt2">
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
      <item value = "120, 30, 70, 100, 100, 130"/>
      <item value = "110-: [ma_qt].Label, [ma_qt]"/>
      <item value = "110000: [ten_qt].Label, [ten_qt]"/>
      <item value = "110000: [ten_qt2].Label, [ten_qt2]"/>
      <item value = "111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwcCLmEOoiYUO8aswV7hvlOAj5JTCSJC2uFS9ycG8pzQ1+2OShwqxvQhW3vOAG46Op0=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYbK17Sw8Z0YW0iQ7u21ubynIpsbJ5h8qIWOQ4oHvgo7zRyAJncmp6MJxntCKcJlUno=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7eRTtyuM9mRTtJiETgiZiCDns15yMTC/ldgnqtrFDPFi5iOAM6RBWxxfWs9BgeKoCxLilCf2495t1+UaMGm8KakrC0cI1dDYSqdO9N64tdyP+R4welP0qA5oFffymFj9RRn7Go7rSD3QK5dkAv5ZhgPu7XRPP+aEYiB5etDBahszPU5Or84sNzjC37PmkD7UNLCqs2xTVTmcN4nc+eIlvoNbc1PYw2ChRObyFOnKEIE5zMMuvCBRnFTehyqBsZs9/drieTcQfKRkyvHsagTDzvd+CY1CkMp7RdwYvowvHdS585tPGS7WtwXg+c+YX9PMVWVVHHG5Vc5aOCacBnNSkJhr+nH9LztgN8txAHv531SrmZtOouokcekiDHcXi2p+sENFEiZXLQK+mQV4wysqa4GLQs9OuqI8b38zy85FJqs0ZWDP9zWYTjUmP/gsHz1hkg=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82ndQF3euTiN6RHozTzj/48fj0T6pHKH1KrsD07sD5A54rOneBCG43V72oSBi/t+FVwuETAoHJQdudSjN9Qm66jUhX0k0f66BuauWubI1RoEqzSvhTwZCyudf1D6tjCWcX6oMJ9ymQj62Ukq0cm3OH5H1cJouKRDYLQpxEvWYpHrzeoq9H3d/xpoT7rO0WNimge</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBqdxKyVHbMFGSgctjyato7AQrOYfu8LgkznAkBxn/6wGQWDXqsNjIEIko0D7/oORgD8p1lG+kGNZc1TjTk3i7ZbznoZrr1qA5gDZNw241rUdUj7DQR02kE2Ah6J0ewBTBZUGuKhXzmRoQE9BfBFxtJUUk/rSDz8kSzJ7FnYt3mRCjnyoN3h6/Ds0rNrW/iyCkcez4LdJT+I2gIuIUOpMDGiX6gT/JPswmyx3TlHwea9/YMEoi9LYBTWn2EyA5hwX3THYVqFvz/OjMempR9/3zk7riFkXK2xE0/EuOzF8CPOAw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbesg9bVO3u4FjIEHKro4SDuLcgHCutWs90pNhSYUbAgMr</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK5ExGMWQrBnf6NUvFdPRJvdb3gyADn4pIz8Tf6GMgKD/Ctub17pMVV6SdgaXtAB1xhp0T3OrckEQ+MSt6ANTfGQe2f4QxzR2HPWkFtXSHUWJPzM+oekjE86w18+SySf9Hz+8EogcAz5B61gkxCbRlEq</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZ04TSovLp3k4OzMlcAxORM1qDEr7JAad9AMaDThkPjOqwwF1f95rGmxT9LzAtC71NLlNSPw3ehEnj6A7YGpMWpSEdGl05W3b4gNplh//HiKCp/AglhUq/ljEhqA6E6sXMtg3MnE35OlkFlsRLdzU+ofWnmD9VuIi3SmuNYuOKauaqXnScUYFzyhIIQIC0G8byeji45ZL/Esei0gDmI0KmIOPjNZzz10D3ChMH7qmUHmyxd+k2lhXK+THs4zjvhUUNGS/b/1LYlPWjKTZRsg7C+TitFJBm3/CKjxdr0EqTx5phuXdLjsuIIyVjZNR/8zto70sJ4U/s+6gJ0qvS3Jmy9</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>