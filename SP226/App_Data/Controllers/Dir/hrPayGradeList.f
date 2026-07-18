<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmnl" code="ma_ngach" order="ma_ngach" xmlns="urn:schemas-fast-com:data-dir">
  <title v="ngạch lương" e="Pay Grade"></title>
  <fields>
    <field name="ma_ngach" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã ngạch lương" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ngach" allowNulls="false">
      <header v="Tên ngạch lương" e="Description"></header>
    </field>
    <field name="ten_ngach2">
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
      <item value="120, 30, 70, 330"/>
      <item value="110: [ma_ngach].Label, [ma_ngach]"/>
      <item value="1100: [ten_ngach].Label, [ten_ngach]"/>
      <item value="1100: [ten_ngach2].Label, [ten_ngach2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwc1HLqqwYqI5cKYi1+EQFAPKPDbVGtgBkqmjuumwmeE6q26vzPoMbHDyNP8NxstawA=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYaJTg1e2+CDfVrtC61GCKQ5cxTQz6TclKX/OQkukQXuns6rttYBymTns4Fzl0GdHNg=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliCLmmKorJ5ChNwyznzBlBR0PsEz5VCJOne5H9YHrdkb9h/8yXSMtfNvd+o0dIyMXxeJzZjkXosnkhdH9dD1aPNyV1CWnizLznxN+hB0wdVzWqCLMrCeaE0UT7yrJI8jUEo/SI8z+Y0JHro6PTnj88d+zawGp5KMx562S8ZoSV0hJ5gO7eZXdtyb/ddBr9k5ESiGBhOG5Pal+IgfSSgYWwBmRoLReDS1QD8EUlsNpfvfD5s1sxYhN7x0Tjw07vE8cmUDdc2Gt9TclMc1QP3Fjb2D1GuVtNnjhMPRmyGmPx3U4dFERIrM+J0Y2xLREV6XgZBjTC1A0wOcogiljVkCcQlX4uEDH3uLQqS87LFE55ccw=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nvw40zChadVB6I0hT3FAdsetD2kHAKNDd6WrW6OP+TpCqmC8CeLMPBkt70GLuChMrI2DGqqqlMY/puOgZQpHdisSUfONPzAbpSgOwWvVhlaZJXdG5oQJT0xQqouiHsWgAG7BkEQcpmMWIjDrs2LFMc76vXm+ZcOIUVXvCBCJTky/tmfXYs65o+vt+d8bJuqSIv12BdeJS4Ys+uTKEwf+4bkgiDl+kNMWO82KYSbVstTc=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jcBKr2f9M9GgcxtUeQzdDxYszwjgxHUwvP3FUke1L+Hsyr6w73CBxRnV2+msjni2Wu8T0EaRYKMgBlkvCPj9IxIsi2SvimXbCOW5LaUjXosOvabMT7mkT1EWQ44Kh3OnHW22EOfRLkp9oCIPIPqcioXFD+YBUG9speDodUwz2L7uO8vX0+FgBBECl3VjUeJLxsFQny6YtZ5r7zojQCEKtWwXJ5iT12LUXlH9kb4hJUWSU2r54TB9AB83NBoQZz/jh</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbei/ERYwynnlYgPHJ8UDiDWHn41nucqOiRqeB68lQHIPZ</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkasuaPKbsVoGHAQ8WRG3tdN+shnfG7SOnQLEY7wGWHD90nhy2Zfshy4c3LXNuAVuHGcBsQ6ebmIsW7WVoAy6v+KZErMfSG8hxE5Iv/Y9f+dwrNZqQrsue3JXrhKOfYYybpedgB04UEFgWMZIEOS83MbbH3//VgLchDznIsri4F+N3yFoTOPDiLAIPMfGxjGQEvIpCucyTuUXbGp6NsUHWvAP89DO7pWI9aEru97CyqRbY2qYahNFPm1+/cNGqUiMXy7QipEfgrAxNeSvjZ2zgTiHBGYp8PLyvt6L/vQCH19E2j1JqnX1i7fNXsw9LbLYZIOge99X0+6z6OrxUoCN2wI</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>