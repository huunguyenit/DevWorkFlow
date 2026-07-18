<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmtths" code="ma_tt" order="ma_tt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="trạng thái hồ sơ" e="Application Form Status"></title>
  <fields>
    <field name="ma_tt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã trạng thái" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_tt" allowNulls="false">
      <header v="Tên trạng thái" e="Description"></header>
    </field>
    <field name="ten_tt2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="loai" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Hồ sơ đang xét, 2 - Hồ sơ hợp lệ, 3 - Hồ sơ bị từ chối" e="1 - Reviewed, 2 - Accepted, 3 - Rejected"></footer>
      <items style="Mask"/>
    </field>
    <field name="stt" type="Int32" dataFormatString="####0" defaultValue="0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [ma_tt].Label, [ma_tt]"/>
      <item value="110000: [ten_tt].Label, [ten_tt]"/>
      <item value="110000: [ten_tt2].Label, [ten_tt2]"/>
      <item value="111000: [loai].Label, [loai], [loai].Description"></item>
      <item value="110: [stt].Label, [stt]"/>
      <item value="111000: [status].Label, [status], [status].Description"></item>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf8oL9Sb+iVxZvx8UT8ZQVr1bOcI0IOtZB+2UK4/NuCNT6Si6moTgca4d6YDHWzuL3JlGx0JVPCmGmaBUTo21IhY=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwmSyUjMAaE5fH62G/kRIaDVwtDfIsWmon4s6pWbAImaiwC2R/b0ZujI1U7oJ9CibQHtnPs7fv1i9jLdA98pEFg=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliarL9hCPrFuL9s7O5o0IjKT9IFvru7QkbcYyCW0nlp6ewUO6Usv4Rony9mPhqXTgdkbv7FJFVIGYnKIvI9rcvha5KmUPXIB4MHN+EAXW9Fgv+IiWklViGDQ/tdjTQ7x9URX7vr4P+6/izzdQsxc8N4d7yIXno1yYo049KcmuCE16FS7t3es8i+eu+xMlK7reTKqpDwwOa1aep2fIpdgJkpVEc7oVKT8gsf2oyToNOc3NW/TbdDSk0Oeykgtgi+uxzc7XUqoJ1uC+ASxd8mdu53hfPU+9ztg5CeidsL7N2vnK4s9IsWcKW2Wo6deSNIa9ewYyXiSt9dNCsZ+kvQJwyIEXWTCHIopXSZzfQl3+VFpM=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nDyl4A5JHIh3nJgop6pUWPbmGHkttABoSGYhDghb1t/HSqHN38oWDZ4zEumU5Jibi7jesj/5Uf09+hyFBkHnEiQReFCIAEu9JiDLF9LQ9m3a37VeuEAje+wOrmMSeh6/2O3GapbVHh/w7d9WrUqC/Nr/oHZNq7ep5EKLtepff6H13a9sPUGX54fpXS6tT1pj6RjIXXZaiFOjO+lvNcF4Qeg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jQM9qS97fjejHbcEUelPgPSIK1Os5baKK4q6RHi2vtrpq8lWUgrF9wws4aqKr0hhfCmFtodL3iPrwOrbbSX1ZB8kwkr4CJqEnUDm26AHFCx2JkAJBtQkFwwHuo85ekWLzgFUAvLfcBeGK2wnRlFFcSSBD1S6V1si1gpTfHA/v1XhKnKSz7zy0aFk01w2AmKVf3iH2HEPPFsZOViDaQyjNUqIhQ/pfxWl3HfmmYYskHhsb96RpVhtvlby/B3DnLKqt</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbenyZLiaN/koN0JqTN4HzTH61yHiLzsqdrgMZawkbP1A9</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KtrnExM/ebiVa20nIvF3fwb0bTICpksvdRbcVFRnfVjVxLZfGXi08RZlkQEfjp64Ps/AsH45BUHKTxPAMdyRxq1qEHFq8nwWcBcDL08qqOr9lqxblPErL5iXNVUOkq35aHYhJEC3+R0IOHWmiFL0Hx+LjUuEMJZwmlltqDGyPiDH38Tkwt2jzBmlyoXVU7qEIbf5uZVB2E/gHeQng4nAkWG5LRvQv3u83/UeHM8hgbWN/ur9SppLvmvBWvQ238+O/Nk3OghOC4zRk1fNrA2JVggCVkTbus5wQYx1WO3kFmzaWgUX/gBeNDL4mlRXItP9vwRTrBl/fxaUuC8khrOxlJqW02z89ZSImr6JSKOBaMM</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>