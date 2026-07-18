<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmkl" code="ma_kl" order="ma_kl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hình thức kỷ luật" e="Disciplinary Action"></title>
  <fields>
    <field name="ma_kl" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã kỷ luật" e="Disciplinary Action"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_kl" allowNulls="false">
      <header v="Tên kỷ luật" e="Description"></header>
    </field>
    <field name="ten_kl2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0" defaultValue="0">
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
      <item value="1100: [ma_kl].Label, [ma_kl]"/>
      <item value="11000: [ten_kl].Label, [ten_kl]"/>
      <item value="11000: [ten_kl2].Label, [ten_kl2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwfOqrS6hjHgRWfZYofRZIBoIsdHKDohTmkmedJPQQ+VBuF26r6VoK87fTN0/GlP4rsGmg7q9Mle1A0gidUYUPeQ</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYZVRj7UbmlU6EbJvV/luTyO4ODjYmk/aQyatrtxDuO0v1OpvDjYJqrGYGWGa9zdetkDGE6hgY1OLD9mcf4KGHeG</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulibNAujXIvc25ZF4P2lmh50MdT2aWOxJelKiKz7WIUc0A+coHUIgv17R/u3SeBp8sTzwCwGGeRP38baRyrggQHjq6hVOQQHXoFcw8XS/x5+RAJTJ5VfRg7l3g7QPB5TzoL7qbCHK9TRP26bNwbCth1BxYpKTVWfYsns+8HDEKVGpmj1DDoiNsDPfQQah/ODd3/0HBqtPFf7Okxhc9OcIqTSyTnVHudg+9hWqGgCV00YTM7r//nRv+DFncrYa6v8TKJN16r8Je2TgJoo1Sb3iwKojfg3UYmhaYBj1FeVS6duaJpAs/GD5aubc/SbmsEPzUI82kubZsy32cojHABsdtuJFevjQbyLlY0SNWmwvZr2WppGp8MToEmiVEIiAo3Adar</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n8U8imwM841/cjOMpgsRJWQ67nXVdE4nF0eVeN8d8/d9yBBSeyA3HNQtwGT7yMHQI/o5uh3F+nkE9j61m77I33IKJSrMGx9NJ+e83s7BdgUcdfLkeCjZO2EFwZ85Nk8FegNc40CxxBf+kIgGRNqfm9H46/rQJMsxDgkSLetWP6drz2kCydmWmzEuj92ICNfehDJ9OhR2FZZjZClJ99WBUEM1Ep1zoipbBoNGqMMG5ZUk=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/juX+tJBWtc/y2Bq5qJCru+vRqud+3D9ZZPEZvIaqe8QN+uZBzmQ83vTthBfJbvr87BeyCHItmutZ/7zryqeaYzqVLFlLo73MmPJzOviM0J7pjKWwyIfvlWH5RpakUuJdy3HFhtDsqMkBt8DOLEJ6B24PumbCd3Wpthdl4WZ1xMGmyTzomt5GLEv2Eix/Tt+7h0S31FTAisVA5oDOoMLytnUZoc8n2XMOkt0OXLzDfRZrGCducVhBJDiyVjBiPqU1I</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbevoFVfQJZYPdRsG1fBWirUYV1p5qrJm5sdygSdP0sbE0</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkaubwJulugtNVBVMJlJRTiMjiTKr7GxU081T0k8MWclYKuIsPc64gnF30DeLEF/DyTFLP4jvv10iHBAtjOSCf9p10a5kBgImnUAN2AMyHH1mNKMh+O0RQ/ufI2VdANdSANpYdIpptZV+VPvw+wK1qTqF8MKIhzBpr2owLyqcdAyt0LlG0onw9194h4GqVpV5MYGRK8weInyHrHzcqg4F2rqUcfS9Ccp6Egh10vzkNyDwq9i2/YGnoMZsYMy4WbTQ3RZMymPA13NnsEm2fSLo58SOzdCpsh86J/5roycV3LJ79ZgGxgibS5XQ6d2/t1a8szbN2mfzl3cM1vq0QtK7zHu</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>