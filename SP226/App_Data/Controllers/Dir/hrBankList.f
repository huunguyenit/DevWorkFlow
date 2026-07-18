<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmnh" code="ma_nh" order="ma_nh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="ngân hàng" e="Bank"></title>
  <fields>
    <field name="ma_nh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã ngân hàng" e="Bank"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nh" allowNulls="false">
      <header v="Tên ngân hàng" e="Description"></header>
    </field>
    <field name="ten_nh2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
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
      <item value="110: [ma_nh].Label, [ma_nh]"/>
      <item value="1100: [ten_nh].Label, [ten_nh]"/>
      <item value="1100: [ten_nh2].Label, [ten_nh2]"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwf4te1tURDMfNRmMmvxcU0wm8gVZfA5x0DSR4cntNn8jN3cZr+2gyNKEXLdUVGXeng=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYYo7shYmj9heykA+c8QsWx6Ym5n7jxnFCcFZj/gRncOykjH5bmjl+yelj1V471LHoE=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliCLmmKorJ5ChNwyznzBlBR08haxGDlG4sg23sS0JTWvOa1FS1N0IMLt4Vxc/mgiSKTAfo+cK8ctwhcuBNuhrPfVNylIMFPNkXbSAW3/L3UOaeSgz3waNuQiZblgYcWQBhGpIbyeN9I8uahA7IZn2TG/5JXMdsdJh8O7VSrhpIivfL3L9QhG7M3cj1O1Pb99FGFLrNhrl4xtdZZatgo60BQCcgaC9EzJvD9/Dg8VzUrdpsJF/cNgbC7RHWkezCK1tVlu9JlS1mw9rXf9mz3zw3B+eCPrjfJxv0BTJ6GfWyy55WJb5NU1eeIq/NPyr82Nvup1BPHVmHx/aEks5IbxkDlg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nmO7HEg6pdRyICA0emyDinOvgPt6yN1NuJeKazRV1qUB4kkycvzaLvyBc6e66+Xhu2Fx16hlXjSi/LFXfVRiC+L0O9Gyz8ebFA4mKvElPDp6kh5VApuKzyHk/GT2w73wwO1ktuWdFpSP7n3wLhWX3xQY+z/dIF2lYNT3k5v/e8k2LwsM710hbjsknvs8sgezRwdRFQGdPxfP59QcKgssI8Fap6Wlp5shBCmB/YOa9e8o=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jlUm+KYjerF4fyFdcFcgOgS1/aHNIWKipQEx1ecJhWiy6OBvoVyOxF8AWjya/yW26SEkuhx7F9PLk5maBSiBC6QHveh94sZk4sY4sMnEpOkoYU9hPkSwBzerdqMviB9MFMfj4kvWb9uzrBp45HtSjyAiSKa84gtedNEOpcjR0RcBqX0DUofX0dFDBcCCvQekbtaWBo5L6IrrNZQpBIfgsKzW85n1GFQAH4/xkv64rmivjNdmCVPt/yyekN3jtkuGLzpslLGjtXt4IINGufaa1bQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbesgG9joAWjFtSRPOCAjSMfO0qGd8m52QOCxTlqRlPLBS</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZO9VS+SF407bwZDjy8wNNLKXci20dYRuLn2nIe+gQXtJtJCTqdgXqE28/ZNipJR22ylPQzwCRCzqqL7JYUHqb3WvtKoEu85IFAi2Hf4FvnMPl9s57ytjfm3ueREXY9wVnky2KDDaIsNOhd4Bz7CnAsUR8wS2NisMlhptnZSa8PM0ik4LC13BB2F0KRmnERlBfgbUW4flhfDjAikpopYT8QvMSYptt08kLT1S12kGcEVTkd4m1IHz77W1igqYdZtJeLPS/rGrJgfyHcMHJM0g6FETzHCAOeVBJbg1dJzouCPP5g2SKGVwKNUQygtSJfYrI=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>