<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrmapbh" code="ma_tc" order="ma_tc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo tham chiếu BHXH" e="Standard SI Code Mapping"></title>

  <fields>
    <field name="ma_tc" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã tham chiếu" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_tc" allowNulls="false">
      <header v="Tên tham chiếu" e="Description"></header>
    </field>
    <field name="ten_tc2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="loai" allowNulls="false">
      <header v="Loại" e="Type"></header>
      <items style="AutoComplete" controller="hrStandardSICodeMappingType" reference="ten_loai%l" key="status = '1'" check="1 = 1" information="ma_loai$hrloaibh.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="hrmapbhltd" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="283" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <items style="Grid" controller="hrStandardSICodeMappingChangeType" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_tc, ma_tc" e="String: ma_tc, ma_tc"></text>
        </item>
      </items>
    </field>

    <field name="hrmapbhltc" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="283" filterSource="Tidy" categoryIndex="3">
      <header v="" e=""></header>
      <items style="Grid" controller="hrStandardSICodeMappingPenefitTypes" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_tc, ma_tc" e="String: ma_tc, ma_tc"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="343" anchor="5">
      <item value="100, 30, 20, 50, 100, 100, 137, 8, 108, 50, 50"/>
      <item value="1100-------: [ma_tc].Label, [ma_tc]"/>
      <item value="1100000----: [ten_tc].Label, [ten_tc]"/>
      <item value="1100000----: [ten_tc2].Label, [ten_tc2]"/>
      <item value="11001000000: [loai].Label, [loai], [ten_loai%l]"/>

      <item value="1: [hrmapbhltd]"/>
      <item value="1: [hrmapbhltc]"/>

      <categories>
        <category index="2" columns="769" anchor="1" >
          <header v="Loại thay đổi" e="SI Change Type"/>
        </category>
        <category index="3" columns="769" anchor="1" >
          <header v="Loại trợ cấp" e="Benefit Types"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwcaRwE9doGPkKgFDPHcFGDtpwJ8FGS+43KddPGQrHY9gK8KOa4/uCrO7xPNgRm8kQvMPOOT517dWiA6f4iw0oe2</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYZs08XFQZ8dc8K4baat6Go+YN9ewFu3oSQqFgdJhFNpnBElnf+2NbNVY5WPiQ6dOIzYfZaWaRKZ+Fn8J/fgh0H9</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI+NeTSmiMfzhT63+yZQrqG17p1LZZhv48U5XK+mPJ7bTDfr4TuxD8Xdeb6BGqyyY6LGR+gfW4KXXshFIM8Rm3oHyhI+4d0ykE46cwqe8WH34/parwFXbQ5VxyuV0+7YqS8CKyMtndJLDAZ+9vwD0S9iEyHKrP0E5T32tkcAyEMBvLhCkMVhNQc3MA0kSfIgbgDzxLV0etYRZ3HC3oTb6+fb/DWsVKKMQRmqjR92NeeZ/NNiGxcivjfrX8amVhWYG+QK1FJKj++Zup4N3GeKbCndS8wxHDfdHjNwEjgQFSyvv8uWBQEsEc0aYYmMBp/tyJR+EqHxEt4tgYT06gR4diOnM/Y9iu1ITyRjMCaraSsyKEiKsWuLhGY9fZDcwsar14Op7pR73fT7wR3vcae4gJL4gSHmK9hxsQLaVWe97hdTg4Y2IhEWoHQq2Q67wK7iAaT903Po9hA7A8RMftudSQWv3kXuNP5DxeP38hX9JYhogAy/GmFig/mZPpXwIvmEreFBITOZNMWHadz7CnSL2lp4=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cryqWhAbIEAz1Ft/mKpDu36KGjSlo8pchNvPYlgFrNQDS4qtGY+BZYA+u9Ng5vAgx/rF9VY7k5nLCPF8eH45AJMUU+meDprNlXbTutTYHNtzWh/F1/H9bshv8MVDEOlB/NHKOQtJnlSXG42gqEbTQvc86pUYU98+7ytcr30wE/wck1ddGW+HvA6MhOqbZ/FqjG8/cttqsDBHEZzLWZ/MvUzBjUwLiY1qrBWomHRvuJNSTu4RGwitE5/574du5BiEs5QTCdEo9baZSmDvigD4t/ICF0uI1FQqcOMQSR6UiRXA=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBqdxKyVHbMFGSgctjyato7AI996UUGaEe1D3vHnzYQjAEcsMiGZKdwwgIucvqnYcCjCVwPmiDlt72odZl2TV2G8YZeMV9hpWuBnQX8oao7Jfzq8L9GexXFQqZGpdlrc+4xxuUSebg7FYe3bX57HC6Mm3OhwgMD74RqfN310Oq5OVhL0HCzZ0ZszEMCsgAwDEzuLBfquDRAPT6kwSP/h0cdDqZy6tFKxHID05oZq9PMP7Wf5OB1jGyWeG7H4xjZead6c6bS/ufhmsCZ92mci6cUsk4hTPbLMHkZxdiLRToSmiEWbl20kuXvO9YSDzx+EZCth5PVnspoB7zi7Bbgn2RF0mr+BlGOvjABnaXVjuBb0MvA9xBtxvFCOWW0O9iC4gCIo4NPObYvFikVnA81Q9kwO+PR/sP4E3zF3fM4gSqRBdehK3ExEVUfG3QWoTinzAj/KUG31ed04XFkTg9OoJZYC</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbegbYz4ScSHCGCQnU1mKieiI3rPMWoYw8OBem8bD6F40p</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHa4HSNpQqaLYb21Ug8O3ctatXuUaQwzlI3c7qyIFJM4AVgv7qxCn9+61Sc3eCUPi6WiU7fsfBVpyXMGgOfAxbKHaaocrp/UxiI7/7tQC4DJ72ZRATaK3Zm7MZsX4DsQ6fDwZpU8yPsrh1PYMaCrz6MVvFEOjpq/1/DZepG0x5dwVdH4oe0boEV/G5VnPlpRUrs2n9s3eCDpaDirxtqHmRZf</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KInAnqcXJOY1YJQqLL4krj343tLk84p6GXurRhnHxYYUEolXfVpkcHiqCLepD6Pzb98GmtnnxAncBQB+BboAa0LGO3tbQDk1YBONIuzwZr3rnL6wzanPiisSeBL4yENx0AmJL+iZNZ3SaMW6uU23aEsOY8YNuM2trr+aY5ko2dLzI8hlv+wcdlT0Z57ycjFPdF8JWonRIrlwDQTyN3wfrgzQUtGaNGNY0QPWrvZB2+eJ563Dz+/Ba3S29iMRCn+jghRFB55Gldi196D0o+5FdaqaBitPkIKecWNQCqlutZKsa3/aJYmxuwBMGoVdeXR1e3kO7LDFm0K6iiXZ7z4ONXUwOx0QwR8g/Ll6Ktbtkge80rTykb/WCzGN6nMFQZFbgAYEY81KyV7KFtCmsk6tRaWNZEa+cJlkaOQzj3vwZgGnSqWdrQMJyviwKI65rssBKVlg5xLG/8uBbvE3d33DvfEEWSPqmkTQCz4JxsfOJGBuXAvDCU6IXKlAQvw1SyvrpJSW74SRS2GQYvEC1DRfTzYnoRDv+nHtW3FBxreUlPoatfpnCGCkB4Mfqhi+t9hECY3/IIhi8uLMaseW9Pe6Hbm3j88PNnn1F3bwnWlQcsfQ2MzkIMC7vQ4ZOTK3m+7dw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZqOUtVfcWG3qA6CzXgPQfIYqSBCFKe1VFtgRbjeqzQIJYdpygLSoLSZE6d0LEJMYnA8XFInG4O/0WtYURjHhw6R0U+U5LROT177c6tw1XLuzZ6pJQCZwU05/ARmdfWhk6zBOWl+oXa5FAb9xHqdr+BjjxpLi50XR3/U0Zbj6n1nj/QWje2BUfAWJ4uFfsB37CKx2+dJfyc9HWjx45nWVsQ8NhIqVGk1CQw//EIt8roi92f2YBiiR75QGfPWiylGG6sI3sbbRt/ugZ4qujQulQ9flEOCxF+0o7IIUyARHtSK0yMBmttcKtaAepU3Qd9AcY3Z0/hyz7u+wZGKfQ36Yt6cCqn03b7Kksopqwb8sncQBcUjmuAiPGeGdX0NLO5TIDC1N8Z+VwJCIswnHfw7zo08vrKk2BmKyU+RbFlg65RYcsA1GU98LMTq1IE8W8kT5d1mDIdsdMgg3mkM1nOTpn/uDFxeDbT2jNiKQfwoX33/FClLQKxxvH3oQDBHNSSIHIxVYcvoN2PicKsrgYAoarbPeRHs1D3y9s4CTamRLtuUjBbvhdt19k39lntDgL75K2POTeRe2MwyD56UTlH3KKMnRy9zeWabcfxELqk0bVzIBkB+mesOIKECLOMd9+m7UQpEjQ1DKSxJ0A/+XVE40KSL+U6Qms9qqO2zoifXj9rT8aWxfM4cPSot0mGs6EwlJO+0ymGK9DwqrmC0nhJyQpSbQWz3PuAbOlafk0I2gGTNuJ+w7S4RmC5SENhWiuOigQlHRlpbXbjN1KybxJxOAnIRGTCGkmrA5E6xJbrinzD41y3g5VcYnYwEgebvMhTDXZnanY0LvuKjgJvk2EGzQUCd0cEy+S33FAsCXi+UkNVop7QUz/TzJkslivyWPfJUCANBSDjZyo5bFNtWciIQL6z9fFyidyFkDCkg6HegRLACA==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>