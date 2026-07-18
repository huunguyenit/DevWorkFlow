<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmttcttg" code="loai_duyet, u_status" order="loai_duyet, u_status" xmlns="urn:schemas-fast-com:data-dir">
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwcS56GXFmZw7Ei7d/rJustZF2ARuRKlQPo+o1vnx5nbadwVcm28qazmjlwvHlHKmiypet/ptNuhIuuKGx2IDiWr</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyKnXBmEw6DYKI2ILG6IQpAJJUxoZJIQH+fF0Wm4W7oYzYLgR2J1U7vJXvXYYLI+GTK+4CUCKpEdstxdUyDSOfkAlg+SUFUOdzSAVPzb9Puq</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN3KsM7NHMEeDIbxs0gztF9kzNDMY0B9olBV4jTaPup5QWiEl8+Qjm5MApaJfCP3fxDKdCc8wcLSTvczzhsWKfkn</encrypted>]]>
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBqdxKyVHbMFGSgctjyato7A1i6wmHInud9BfX4aLhawjC1VMYPtzeq4dGuB3lf7Z41vtyCFfajyOkXOscOH/0aKx5I+pbP310sK0kpOgqtGnILmp8z3XxRk0RBfsjJMRSlCg0wxOO9kEGreyGsTmm6GrJbn85aMcX7Gkq9+3F1dHPISBJCh3R0eXNajAgqpl8G9ZKqVq8krAsk7LB9bP30smsYaVjbxjP1ud6wh0jD2Zmj4WYlBf0nd/l5jvMHhURFaz3CZDfSsT0OsNKIyJriL8qnzyg1qrGwAXwed+LWet4Os6m0KwQGvfTgKNX3Ixq1dtnwltUjw/ZLO7aPJkD9SttNXapZ6OhIir5KATxg1+KmNLQ10U7n0nilBLrLKnek=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbepO0ilnh+0Azn1b+WSVXhj/vmF6LxQ7OXV1l+YSnhzV03mF3Xc8/2XEvQIBb9i+mng==</encrypted>]]>
      </text>
    </command>

    <command event ="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3csvAk3aTxNq6MBVp4Ya23icf8+faKy6xULeu1blkOePPU0qKc6elpGdmIWu0NAeBbHsYrJj5EGveDSoC7KOnI/yvr8auDlyxKqXVIR/pz8Khu0zcW/1yKDZnBnz5xjmVvKYKGrVhkaevOzqwZFRqr+MLJceUwUAYoLUBRMi3hAFbZhWf3ehDTOnZZU3Ocy0SqrYluHt51RIsdUL+yJwoWQwZUkDeRam7OnUFEVecTHS9VlysOVb+oPEHnyvVdLK2fO8ZCdEjV63OKs12csxAjNw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkYVveeRubIG0pHO1IMJI2Y2Uy/qO9SfWgUica3EuKA41cOjDdS1G9Td72BIFf8EcAiDP+la6sH2SCwn0s+13yW7xXptZxzZSJxCg/RN5C9WR7iJoxKowDCozldatJ96sSh5SRIdJJ+X/uAc1NwdRi5/l23EZxIqmR9BtyAJBc4B5zDxZZTzlXenoSs8nWJ874Kq2wbqVCQ6LbD/DdCelunNn61Hz4IfbIUn/EJ30fT6uig44zuDDx2fz6BcwIwU7LxOVLRI0eOJsfXGo4t2m7u2F0uxUwMNK+dQfUsmahTqNELy6p4CU47tapwdXvnUINDF6dOTQe0znhGqJgfO5ZdwHKSJFNuQBrI46h4WK6+HuFSA5J8tFj6f1ERSgYa1Z+qE1rS7i/3sU3Y6/kZKYPANBtqbo7lbhEZiFcRusaSYmy86rMVDTtKgtc6IqpIdR1a6q0w7RkhzhKqG2SzqAYjx</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>