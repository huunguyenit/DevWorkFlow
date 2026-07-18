<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="gndmttcttg" code="loai_duyet, u_status" order="loai_duyet, u_status" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo trạng thái duyệt" e="Approval Indicator"></title>
  <fields>
    <field name="loai_duyet" isPrimaryKey="true" allowNulls="false" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="u_status" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã trạng thái duyệt" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="u_status_name" allowNulls="false">
      <header v="Tên trạng thái duyệt" e="Description"></header>
    </field>
    <field name="u_status_name2">
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
      <item value = "120, 30, 70, 100, 100, 130, 0"/>
      <item value = "110---1: [u_status].Label, [u_status], [loai_duyet]"/>
      <item value = "110000: [u_status_name].Label, [u_status_name]"/>
      <item value = "110000: [u_status_name2].Label, [u_status_name2]"/>

      <item value = "111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwcjm9SxH/y4VIpRsGHHn/jM+fXl6JXv8RUcETw0R+N/7MkSUQZ1VANNyJaWW1Jj5fKJjXreytwEv+UTn/q1HhNC</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyKnXBmEw6DYKI2ILG6IQpA9MmmW0+kXnJWAoj59ChAzvDNpXqhWrqKCfy0qO9lO9DxlGz5cL5/VmP+JqPJ6OzI0HjpA+4AhIAGcQpvxKjtY</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYIUwq9j9odRCQr7GMg8hMFg/kXGTNoZdOKd1WB7kJo/szpayH0XChrhjjQB4uR+t7UWZAdOqNLmfzs2Gqp/ldJi</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI7lMPQHdMINJSk1a+Yh4TGBCL7MkIH1urWs9dVvTPkeV/pyo15MybS27YYbXeY6ZFLAOYWhnJvok9wBKkwPwpeukMw1I1VFR1iV9U+Qyo6cmtUIoy3pE+lC292uPuZ7sjD1Ip4+dI+qZaJzYSi9om1RXxDunsBzQkqI4VierkMQMUrzgJUAFGzeX6FTyvCVyA5kK8RapG3mf1RY8S/OZVBCviXeDzfyGu8jv6qo13FR0u+XqLW/qCD3Nx+wH4eTrWNHvvRANq7EsFWt8NvuqQUJIcb/KacuH++SkTb9EetUmAx75pqJwrhWhmbyF+DXdIhLTsu/RK2aeGipsvyhTt/j+bGadJsLcPNKNfHfrFzhU51p4R2NX5bDwub4Y3VjJmlhPeDa59GLmlvAvhGQwMK5m+X9uR8D8oHbwEA5e1jB1PcywyygcPPyZGxGWufhC7ZP6WXbgkxY83rkpDMS7O2URz3Y54aXHjBDh9GOxE1/7Jrwco4Qko6C1qKPchwBynhfwWuZ1UmptuLyzNPJxkS9aPYlSRRC56W74EwxVJxUb</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3csvAk3aTxNq6MBVp4Ya23iXSc/kUdACWcGPfYFlcVxs7+ht13jQWHZia0qe85QQcvDKrN23M10zg7TNAfWrJTPwDYL+cYpuz0USzaBBHHImDUop5wYWY3G5Rw3cJ2eNOCZjGiRIdACL+x1rLzli+WXSF11HQw6q6m/js6LP2diqXXTpilWIUMx/F93ya1D5zpT5eeXvHKnROcA6g/OKwTWXIUarB7EH4R/YbszTmiiJQ=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf67UfxqEUrOXQ9cNkgwkChtomv/jTbjiSl1s0r1cEHWBVuNl9nNUuaffcU4454QOLg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBqdxKyVHbMFGSgctjyato7A1i6wmHInud9BfX4aLhawjC1VMYPtzeq4dGuB3lf7Z41vtyCFfajyOkXOscOH/0aKx5I+pbP310sK0kpOgqtGnILmp8z3XxRk0RBfsjJMRSlCg0wxOO9kEGreyGsTmm6GrJbn85aMcX7Gkq9+3F1dHPISBJCh3R0eXNajAgqpl8G9ZKqVq8krAsk7LB9bP30smsYaVjbxjP1ud6wh0jD2ZrvmyBRGd4nA96QLchwHv63Gj7u8w/+70Z0xSkg2cTVT6PHaCQxpQNSTLjGZ5EcbrdufXWe6c757zD+Ca0QdKKlGwdmhLVz1I4QcCKeiWopQ0I3Bq7uGS2ovXvuwScvgAjwVjemHHmSpcIqjFHL+sL4=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbepO0ilnh+0Azn1b+WSVXhj/vmF6LxQ7OXV1l+YSnhzV03mF3Xc8/2XEvQIBb9i+mng==</encrypted>]]>
      </text>
    </command>

    <command event ="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3csvAk3aTxNq6MBVp4Ya23icf8+faKy6xULeu1blkOePPU0qKc6elpGdmIWu0NAeBbHsYrJj5EGveDSoC7KOnI/yvr8auDlyxKqXVIR/pz8Khu0zcW/1yKDZnBnz5xjmVvQBJL/WCJh65PJW7C1/8p9ds4GW1DD2XZWbfpfwnC/m030WXATMWpjI7h9vZ5eJ7T2dg7/Kj1t0I3zzOu+EJy3uD8JjHCoI0IkKgg+PgWwBQXQZIwCes7NGTvZcI16eQTFmTDKVVdJQX+x0xiQTVgR9D2zXwwM9P2Vr+1DlRzbjs=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkYGwj+h6FxzneBoGme09vYWyDLbfGo2O5cVJnhv3qhuijaK3Yju8UiXVwo1jknX6zR+laDm9NuP1HimmSFgpDOEE3m8aaVmGJRu7yqfk5JF6M4Lj7ABCaAWbQYXKiAMaZboDB1Y8zfdYggZswx8ZLQkEIrmOdqhEC5aBoDzvat5keVSAIG+gMuHfTVozqEulpipOrwRqw2RAk5852tNI8VRNvnK2XQrjFMSADwsUTR+IgyitUyS+3mIzTsm8iTl9cYZ1zSeAVVgyGnpTg2MrE3GFtOIAvR4sIYhVd0AmNTv1yg/imrMSvCzdKMeeIGRubXwXyhKXUQZ2LXvnzcty/mRQ2O3J3xQCFZYQjjRwoGz8ShqYXlAXJVyrIZyMVvQnN8Sjpw80qMS/Cr978+UIBcON3gYyjLmBtizQb319ZO4re3Lai92n9/H0HkjgTWoSDMP/dDDEDq0L/Unv1fMPb55</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>