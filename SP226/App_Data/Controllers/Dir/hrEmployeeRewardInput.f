<?xml version="1.0" encoding="utf-8"?>

<dir table="hrctloaikt" code="stt_rec, ky, nam" order="stt_rec, ky, nam" xmlns="urn:schemas-fast-com:data-dir">
  <title v="cập nhật đánh giá khen thưởng" e="Employee Reward Input"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ky" isPrimaryKey="true" type="Decimal" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" external="true" defaultValue="''" allowNulls="false">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1Dz3ZdmR8WYEsLeCxApFsoqsvSjASoFn/auQ1tXoOr5qhS5pAdD/p/7uHdCQ8km0KQ=</encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_kt" allowNulls="false">
      <header v="Loại khen thưởng" e="Reward Type"></header>
      <items style="AutoComplete" controller="hrAwardTypeList" key="status = 1" check="1 = 1" reference="ten_loai%l" information="ma_loai$hrdmloaikt.ten_loai%l" new="Default"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>
    <field name="ten_bp%l" external="true" defaultValue="''" hidden="true" readOnly="true">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230, 0, 0, 0"/>
      <item value="11010111: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec], [ky], [nam]"/>
      <item value="110101: [loai_kt].Label, [loai_kt], [ten_loai%l], [ten_bp%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+AUuhaXa5OzoDCGtBAwQvpTbhKbWpGk66eDxF4vWD7GNDBFZdcPUgjvXx0c+Mw0vw5xD40fXClWA8XV4OvN1rBWZTZbm1S8XZCVmwsYA1sZ</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7pzHFhXaFflgm5c+NyaPOOO2AH8g6JendOs5vHY76WBOR9Xc2R0Vp9NbaqYFSf4d1FVk+dq0QgfJ+tCqa9xlKKPsQlKsxThQDhADDRSJzRf</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4UtpCzURbs+rP8RwDz7BClkVDifL6mp1TbAeS7dm7uTmUlkRYliecwXbELsZw5UX1HKlUpPQyIYVxvezOqyMyPPXasXtPJ1Dqmx02Vj+P3S</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ZsPdzreX2I2lLtaTe9OosDqHerrPb1vLIZq7T6DPOUcuP0CtpZ5GEJW189IlCAdMV4Z+UHx6bOWJ5u6Ud7cpqHEUK4/1B197uTjOq5PDcH5iTUhJtsnKCTu2neoMAkdK0yNv/x7LOW7Ls0DcGpo54aUYhj2qv+6VTlNBUVSLkxej32lw6kI6YlT+NzOckOdWA==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/ctIDfmr3oHisCC6dsa98N8Fda6kyTgbyw8onf2VZ03CTc/I2oPzYW4acWboqHZWouB8JrWKNR5/lW80I607KSG8WUmWgQuS9mmCxnVBJJIz0AKczMYEchZnspaqx7fyYjguWP0qOxofJyOgOPEaW04L3b3V49zyBmk7EWLrgYM/ntQsvb+U9zZWPI2xFtwghr8tsnqLC3NdzBY4EQH8BXyU6R79uvEHVAXVgxCOmsubKVpT6aY5crHv0Kj2P7GcdhaLgGWGDmkXAl0GLBh+gNACC3Hp8IPCnrTwkDmHff8u4wTJxjMmIkHVzBc0Ul3hAQNLpXMvL+C2IxWGE6kelxjcT4LK7JDeWOJWJdwYazcSog==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0ob5zXQy72Mi8+VsqJ5Q23ExThsQBOUXawa/aPiwAh0H/9tDdo+44D0ETYAEzIddBkgxA/XzqQxvay6OPRmD+b/hPmIeir3xQeHDLTKIHz2xLWnZXGICXawuEWgrIi4EEY/DjEpP8uO+al4PRXznNs5ooo4f3EIe3ZH6mQoKgKDOlEE0kJ+Tih2JjYRaHXsZBnZ4OyhqHhCk5N4iRISztQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%cuXNkLI/9J0no/A5pPbabpf0AQyetWdN/zNcTpAiAHT2kbCElDjMUH1JWlOzbX4n7dXElil6WVxebTA09gxhBPzbqHUzw74vqmb2YQcQSe59IWHriG/KGDLEVgNl7XtKRzMqQVw9xx808ANqb731G1FDCy9ejbVmL8WBxHD/oI+JHfVSV8zSdSS7eMg1Z5L1QGd68rAKNA/2dDMjOjkgB5ldaw7BFFqVQW32AFVYBHZlJU9yLZmqxl9Mg22PbZuNcfUWjPsCf8juuzAnNtScMvGxrKRPGHb6a632byoR4XbM+T2dLYzzA+/1kMEf961gmY+HqKCQ7cqhMltmoy8kHw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeifCRlnmuX3C5qSLhjIsQr6U13+jTaWrgwrJB5AHhR1E7TWcGg/VlmjFhntc1fD8/g==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GCYx7S/VJHxGKXDPD7ojwLCX2uqu3URrfUdI1LjQF6FQEbfVwYU2TQv1QWWu9UIwBqDYG3/jF6oYDcMZQ64GS51Al0QbQAXUgcN0VMU7igGPApMOgtkspNBI7Ae3JpaUvMZbJyXasu0FVg4DbcFSu4Xn8tC1OWGdL7CPRGovkxPztB5GQxDS1QdA+/2qe97XrXMbhp2Q0JgOfL2XoLvKAISouSa80eAurWGwAMmOpO0Ijf8ZwNdmMIi8pqKXeUCkdUZNA0wcQpJgm2JJtRf/yzTvd9kWDAXAJConiV8leFnEkEgrcfBZraxmMKbFDX5mjx8DZJic7eIi1y7vKAgvv6kjvZBTb3mrvQZLUbWroxoZldDp2kyhDgJSBUCTSr0kx61WDsHrrPrmSNUuf6rr8fYKqCk31cVbmGj6Xz5GuR0TYkwIftonuExo37Xp6CIUAIWnFqAPdJBl9zpW4QJaxJhY6JDbfSveAzpnHX+Gtro4rhnQEfZNAfUjU41iZYze1Qj7QnOpoEy/jaMfaiKM/CAPWozEVoh6hheJ/83v28AtsE8WjMTd4wEo4F/j+e8lNMCTc6gg5It6n/rAgTE+lk=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="IDNumber">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6Wdyk9aPi/fGimY6rlT0N8nVAGzan76LcTwu5Z5TgGNU9+eRivvPaZEU/1sCnAPB9on51t3kKTLsIEU0nAdcUXdozVFFIrwU5YZ+ZBE0uNfyE/cJkmrAQs2Ks3tk9Xos4LS3mzHKaXToeaBEf9SG+awJGSuqaXIfG8RqtP2UUOu08ThxBSNHvB/pXzl2WyjY0X0NakGusK5c+uxJTkBIq1</encrypted>]]>
      </text>
    </action>
  </response>
</dir>