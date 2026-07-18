<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmkysohddt" code="ma_kn" order="ma_kn" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hình thức ký số theo kết nối" e="Item"></title>
  <fields>
    <field name="ma_kn" allowNulls="false" isPrimaryKey="true">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="EIAccount" reference="ten_kn%l" normal="true" key="status = '1'" check="1 = 1" information="ma_kn$tkhddt.ten_kn%l"/>
    </field>
    <field name="ten_kn%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="kieu_ky_so" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Hình thức ký số" e="Method"></header>
      <footer v="0 - Hệ thống, 1 - Người sử dụng" e="0 - HSM, 1 - USB Token"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [ma_kn].Label, [ma_kn], [ten_kn%l]"/>
      <item value="111000: [kieu_ky_so].Label, [kieu_ky_so], [kieu_ky_so].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyK4NEMN0xcC8SkA+Bm0J3wMdnxIPBHQyenZ6X1vZG5LGCbyIM+X55g0//KrXUCL0Vp/3VDVxxWoFigrHHTI7D1L3fuV8EpuqT1Ky+2JTsAA</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5CHfGScPAASS+YkFLaL1SCnz8LcyRf7RKbD50FRpF0stUKDFpEjbAaVNW5WuRDAwEoC47ZDVvbl7+KJuD2e/WKO2cPo6yrWnQuts4SEF6S9</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulisdn1gPaxIUXjDlGlcLxpQPVWDQ2SvLpGMT420mlq0jywhLSw2TMonTZTCLristch9JVcv+T+P3ZBPMRo39zBU/fs8P0xKC3G+/hazY/1Dv4iM+9+VPNuouOfqvDCx2YZe0VSsnQ/aXi1v8wXW+wnA0nSyw+aRjbH4MGTVzt5Tn3ZcBTzOnp5j9uGVGEmP6ynex47dawH95QBzVAbbOh4LFV1W4AdMSZBUG0RoKQpiPLLxRe0BD0Eg15uqxECkTDgIAJHn37I1NLMnpTSZUfhP5KJUT7DCI/C0U+0et87Me43DEHr3qF8VEyO0l0ZfVrJtG5d1qHGDkWrqMTxbm2dC006u0MzKfoRUJq85ElM3fpY6G3iOV2wJgBvxCQXfPqR</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nyLUT4LMQ4eCOc2r20DXcpMpWwwR+hBbZ6HYgHHpl7P7XFOX20Fqhk0nUo4w781cEi/Patu5oLIquQDtKCLqv2hvT2NPtnZOgEViAB6kF3xZgJShOfT7EffJVIhxhN7yLul/ZDl9tjHr1Wyi8UWWleNBLU0rgYkzCI/Te/mQT6imZwMk8njjloUmNzd7oMzuI</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jXrBJI+YG1GhUn3JOuXWbx+gvLJByw6NYsyFkNprDI8ooJZyw/KAeyWl+f/exobjPVVAU1PNeTP7mlIGu2K5OxVS8SbO/sXqaKKcLgsjLEVKlOyCKabMgO/t8XuEFEuO2VQZDPoAcS5+tFWZ2Us1q8wfk7godtAevAsNxHdeyV2yRLhi5L7aut8fGWe81us3Cj0nKzySkVGqlSFOnAB/bcZiIMaRWM/ROetuvruNuFNs=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbes3+fT9Dvz6H9tLF6RcF/KUUn7TsLCnzpUB9nIH6DkJT</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70HjNkFMCMT+dFvazG+JBPLtneFbVWlO3yGujkfLQxZj+3hkUsBy6oNTpno6Qv1BbsHb31M+Sf9fZZAkuOOSUcMsDMA1szzMsP60azoRoP4pUmTC1lg/grxe51d2RvH/nHemEuL2bRzLmZdSQjxLBO0qUqR9b412QDiNOOZMGn3lNHhB656wQtxV6i1C43JnOlIhdaCwYtTmFidEPDkzmBa2o/Are5EX6GzIJct8KK8S6Np99hM8OJOTJvYyBLkslEjEc4f76K/+zErVkHzulp0RwdJgC9bRzFrSsDoRQ+YsCDv0YIxuMnFsLtp+64lmWNGOWw8Nv5uwMtF1ryCd3IL/vpsEIi9OeSY0Tvr4OrWnr</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>