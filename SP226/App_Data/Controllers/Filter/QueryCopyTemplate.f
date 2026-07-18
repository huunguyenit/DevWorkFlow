<?xml version="1.0" encoding="utf-8"?>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Sao chép mẫu truy vấn" e="Copy Query Template"></title>

  <fields>
    <field name="title" maxLength="64" allowNulls="false">
      <header v="Tên mẫu" e="Template Name"></header>
    </field>
    <field name="other_title" maxLength="64">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="is_private" type="Boolean">
      <header v="Mẫu chung" e="Public Template"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 100, 100, 100, 30"/>
      <item value="1100000: [title].Label, [title]"/>
      <item value="1100000: [other_title].Label, [other_title]"/>
      <item value="11: [is_private].Label, [is_private]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzbfMHAK5/527khHL63L/Dyc27JGvgVY5yasxJ4pC6h7odCloiCb6UC6LE/ORlWnuk6zp81PUa1anNXIK8NDnuFBlX89fdz7VEUTl3GawAXT</encrypted>]]>
      </text>

    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0/ELKHll8CmLZDxLX1FoNbNAvZYbfGrdsQxOovwwTnC79VYtQ5/iMnXVgYgsLUVIhS+X/1VCMQanloi2W2ewIxwir/tRCdQ14PRZNbAfP8tdWn7RC47hM7XGIdBLCamtVHzhh8HjUvKZNL+zofhaPwF8rUlddRWKrJSuLFrHQQnkG6DSrTXhyrzfcnaCxShRzhUomr3uQhM3eOlhVctpXkvfQX9JjM3AND2v1So5qvXzC9aD4huSk8FNRp3nO58DRQ=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70J7JUyyaDug/AnyV05Kfct23F8EjjJPY+GYawx/7UaTQYzRVlxm4JnDYLxLCqxZ2wmoNRdlRF2h/c1SscH1582mZzs6avEShmgfMDpDAvyM9/T3cyQEGUvmdGoPGnIhrU5Y6oTCx3T0GzhYKz92XS7YYtacN9AIFVjEQ+gZJd+ODOCdWsnNRpqKYEym551XvvRkCEPc6SJrnIEKZSSCXUnAGhFCAMdg1yJd5Z+VgICtIlvfKJYYUcrjELoJpJVfEwMyAC4zuRZYyH1UcqeN3ORPZ5/pfdybsFWkYKjbaHbpfkdR5D5DFHQ+svDExuPu+HA==</encrypted>]]>
    </text>
  </script>
</dir>