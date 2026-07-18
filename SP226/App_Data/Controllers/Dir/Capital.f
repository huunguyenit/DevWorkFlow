<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnv" code="ma_nv" order="ma_nv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nguồn vốn" e="Capital"></title>
  <fields>
    <field name="ma_nv" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nguồn vốn" e="Capital Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nv" allowNulls="false">
      <header v="Tên nguồn vốn" e="Description"></header>
    </field>
    <field name="ten_nv2">
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
      <item value="110: [ma_nv].Label, [ma_nv]"/>
      <item value="1100: [ten_nv].Label, [ten_nv]"/>
      <item value="1100: [ten_nv2].Label, [ten_nv2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwf+kfASMXVulwwkjQdIqojA9kdBhO1KXsnrexDMPmho8g3NRnF7YMB5Yo7GVmRcP8c=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN01ml96YE7v6Y3w4z0K7h2Y59oMtKO8NIMFB76Wltot5Iz1AtFdeiFJhOeuVIokNm8=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7d8QzWctpSS84wzeZ/fyt8QqWiy4RfoMXSAEtwIqW05crzU59t5yBVRBKUG+pcXxDfNQBoMP4BmLkEGxrNHJZlF0oR4ASUPVWeWGELpGzsUSbbGoDW7ICvOd3XnEoQpR9acPGQUoiMyeFGM/mjIVzZOnciRvuRYce3whZoGptpgFeHpB6/Vib6cVmzJ9j+kGDd+d4L44xzTOD8FRgebuXTRRgGXcYw+5JreqqgqxW9o8Wv6j9g6Tl9OxOWFzHt4tEzNZ7XAdQA+g62U94G9JjTAk1JoPmXIpVt8ZcvVXYSdUYTBlLyF2A4mZBsWZsDsIhTpxLS7tCxF+mZ30BuLmisIE4bq8dgI+629s5no/ukZnUOtfj5sjdIE1PfBxZ9R6w19vP5QXkT70I6MMYOP3cdSZL7sA+In+Ww5f/tXWsR5aA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nyboxBLQhDi72Hmm+4NjdShHN2Tu4H7dB+vSrrku+xh76JhAbSU+QyxBpl9v7v65I0+P5VH2tNoMgafZRDjzy5oOLr54CF6pGacpOxC4kyIznAl+cgt+yr9wgD2a5LB8C3wKsrlrkF3JswDcjZNa1LHpZSQbPEvTGoB1I4gmlOKmuJ7qc44Ltv0HUEng0P1ZT/bxwVNZh2wWJbGoGaKUftKBk5BXsWDuF0lhbSWh2Dkg=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jyTVdI5rnF89Bb9+S080DZAkeCAPRdvLelD9AMzBUK46kxiAxn20ZIVbU1Z5IQN4m4wf3gsN2Wy+60dPOS9wTxEohmCWhQVSViAP38pX/3RzDaamCaGVl+nLjVy1/TFp4tXk7MRptxFW1us/N0537gu5gWspcDrnkApTjhlvhR4JFaK3EpF/eZObnPQn/PVqbz6PiEjrHLA1QdB7R02OKyuXrURgNbpWLkZVuvv9dJ8HH9oU+6mEMF9vvJiMYAopENoomaoSjEXLiN3tX9xQDtw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbesIiS/BPxbWyVU1RuEex4LlnUM81DcMNBWdMn9zqfn0c</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkatCb5aVyHkziTU4PXl2J9Cm5gftec7BzTK0EvfIULegRYzuYNl9QgaLOYkvu9KBx68wT0yIdjgF6wrj26qNmlKROKryCiCK+12Uo8Vg3YDusVSOhTYFEPZ6BbsCtXd54swLBEFGqh15y9YEVBJdQuSiB0I9I/hJSTXYImP7QYLPwYBAR8hSFIV6Cdj4zTjkYYIqFFIqQR5n/0+209SbbBzyus1uyQuKlFctu6GHNmgEFzf/a+uR1ZAENTyIUxHw7oSZ91oO5WhcRpwPGppAl5Ks9cFdZGKIplSwztLDb6htHinaIm3CRVTUNTWzNJWSDp6PgjW3ICPydEKtSh/+IFJ</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>