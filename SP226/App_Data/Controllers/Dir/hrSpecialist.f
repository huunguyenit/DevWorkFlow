<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmcm" code="ma_cm" order="ma_cm" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chuyên môn" e="Speciality"></title>
  <fields>
    <field name="ma_cm" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã chuyên môn" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_cm" allowNulls="false">
      <header v="Tên chuyên môn" e="Description"></header>
    </field>
    <field name="ten_cm2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0">
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
      <item value="120, 30, 10, 60, 330"/>
      <item value="1100: [ma_cm].Label, [ma_cm]"/>
      <item value="11000: [ten_cm].Label, [ten_cm]"/>
      <item value="11000: [ten_cm2].Label, [ten_cm2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwecdD3R6lAqnTHHxanZU2lf6Pv6R5KECf+1iDAy7caq0iMvWL6TMEcTMAwsH23jl5Y=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYamusGG2hgD4cF6T1sSD/XwnYGFxIFfrFFWKiru5gnx24UmdckQ0ni7BVGMEQHo7U8=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliIh+z35jtD1Gy3LfNY1IZSSwcOz+SGJL4v0D0glq/JrYcxjphTRGfVsAh1ruSd2+L+C4pqYUAehJj8l3HSLXZDVhBhNday/j7otMQKmh2k0UZ+E7s8Uav/eJ0Bjv2YcvOFUpXSW0aopQ7JCAvVJQefhgNcYRcNDeLuM7vyLYm7bsMyVKVjQWrrwWK9A6bBZtUPg5SekYNWYxrXvFw707BUJfyxFEMXpiZlGlw989ACuCxRFGZVD/CCFMjGojXXkQIP3EyItkjOjav+THuZHOI3+Z6e27p6n40zH+smn0onsepieBS1xYc65enLBRdKeTyOsZm7gD03Xmtjq+b9lBzuKoPg61SjbCg1btlFRDKTBQ=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0FArc54C6jnifWhiBYGsx776F/qlu06sfYoq4yHHvz1Watt+gIoMHYaQzwLn7bzt0s6Tn6yHM2Ecz6Gvxn+t0CoQSKNEPBsqexfx2djrk3FrwiFG1sWFfo3IzhqyxWOvK19ijxUhgW5z900GbpKopkpSw7F7dnCUKXdJUlK75tNp2TLKi0dvbOFoK+5AFwYbFXwcGLPSTDS4w5PgjcgaKY/SqH2pL4AWF0v7vhKnnHg=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jJOx2D/T5UwIX+jo+Pl62vM+fHNQUDVD+RSSAvqL0TWVF3fHTbualvj/B97G/COCccgvjNAMmBhIaCRC2Zc1SBnHnu5ep3j/nfHx62Anf/q60qP4AVK/TyVDaNRuwXQKBDj111VtDVShnvS2gjb9tpC2QxSaUpJ/uvPO4O6OufLMYUfH2IomFue7pa4vDw6uWor6bL8AFrbyWaGN+hLvorGA5AoBpUbfWF6SUXUOhl+251BjRrS3OAvzurDbc0cuW</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeoQ4xaf6eIb/hMiSyZD+eNK9TEBMhIaQuMr7of5G7hWi</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCka3NkI6L/eG8bJtl1/YmpgAtJs4p4vHLJ+4Lbjq/eQ7+OdSPBZeyK/q6o33uKKO1MSOJnRRDxPWNcHOUS2NZXUzNAqZcHE49paA0gcP00cRkZt/n9j/q3NL5VRxrSJXzUfG8e00cR43io+xmIndSuu2JHzLLdfo+vXPkGPbcvn6DVs06z/U69W8gbSUllUHdNr9hRkF+dY1hehlWHhM20vdW/UIVoAsMk4VXjQDljxd7D2ozB8YjX92XLKBRtR8Ua1W/hrr0OxmwPyLNe3brd3DYASdQTFogRry/vXbjDjq7+2W65ziatbsMklPNDHC9at031gFbmj+hpysUEha61GN</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>