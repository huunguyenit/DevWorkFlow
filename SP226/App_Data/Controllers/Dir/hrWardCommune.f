<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">

  <!ENTITY k0 "@ma_tinh = $ma_tinh.OldValue and @ma_quan = $ma_quan.OldValue and @ma_phuong = $ma_phuong.OldValue">
  <!ENTITY k1 "ma_tinh = @ma_tinh and ma_quan = @ma_quan and ma_phuong = @ma_phuong">
  <!ENTITY k2 "ma_tinh = $ma_tinh.OldValue and ma_quan = $ma_quan.OldValue and ma_phuong = $ma_phuong.OldValue">
  <!ENTITY k3 "ma_tinh = @ma_tinh and ma_quan = @ma_quan and @ma_phuong = ma_phuong">
]>

<dir table="hrdmphuong" code="ma_tinh, ma_quan, ma_phuong" order="ma_tinh, ma_quan, ma_phuong" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phường/xã" e="Ward/Commune"></title>

  <fields>
    <field name="ma_tinh" isPrimaryKey="true" clientDefault="Default" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã tỉnh/thành" e="Province/City"></header>
      <items style="AutoComplete" controller="hrProvinceCity" reference="ten_tinh%l" key="status ='1'" check="1=1" information="ma_tinh$hrdmtinh.ten_tinh%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfFkdHUJGZRzLddtfeDImmNNg3IS+JK9ZeDzzp8fmgQ0a7Bgcr6eMuqxWU7UuaBVwT6OfjCjV2J65KosI01uXVc=</encrypted>]]></clientScript>
    </field>
    <field name="ten_tinh%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="ma_quan" isPrimaryKey="true" clientDefault="Default" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã quận/huyện" e="District"></header>
      <items style="AutoComplete" controller="hrDistrict" reference="ten_quan%l" key="ma_tinh = '{$%c[ma_tinh]}' and status = '1'" check="ma_tinh = '{$%c[ma_tinh]}'" information="ma_quan$hrdmquan.ten_quan%l" new="Default"/>
    </field>
    <field name="ten_quan%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>

    <field name="ma_phuong" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã phường/xã" e="Ward/Commune"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_phuong" allowNulls="false">
      <header v="Tên phường/xã" e="Description"></header>
    </field>
    <field name="ten_phuong2">
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
      <item value="11001: [ma_tinh].Label, [ma_tinh], [ten_tinh%l]"/>
      <item value="11001: [ma_quan].Label, [ma_quan], [ten_quan%l]"/>
      <item value="1100: [ma_phuong].Label, [ma_phuong]"/>
      <item value="11000: [ten_phuong].Label, [ten_phuong]"/>
      <item value="11000: [ten_phuong2].Label, [ten_phuong2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxweot9NJW+wP+VCj5e71JcYNtOpkOQlvNXzKBlM8860zhqlKlV30L5jyNzx1K1TbJ4/0ixTfvSYnfZUPZ/2lBOJP</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYKKarmaghHeUAMSBSkabqe1Wgd54IlnhGaDpcnrmVgPGIVp0IueWRqsTsD4EYUvCmTV4VupxodoT3A030A2qSmx</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ZP8F7DUj1ODBkGD8clM51RNQYcKgsOgZftBtfVVlEtue388IDPsNlixE7xrQaqZ1uUOaeXOVh2lWgAM6s4KSKHVIHu4mKVVt1TzPUcLXOtakjUYLbKzsyx9FNXwpEbplvHDblFmBpvFj/ZBOeuhpOU=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliFwhsA4eMqfxwHuG5jbSlvsb2vuMPbRyhLXPLWQ7tCwH1mZjVBaL4RWLjuRs1PMcHum+X1IsioQuh/pODbPp068Mq8dr/mgyiD8l+38QavOyy8tvVT/AF9A8VEgsk9rW0MT2ZQXL0nEMJORTRFAjZUNYOkPHFnT4yRTZm1I2LU//QNJm9tnYXrSrlBgColQamjKrosUeE+LdHd3DjAdVie0ddrcz5m9kiKWJ9OtnnnJMjHCqxgHV90GvVswgboGUac6E10obpSOob6kK0yEWJ4G09/nkXAcOgbNBtDUJUJ84P4AUp8/R5r47SxAiMMJKWksdFqDUCEd+YYgY8aZaJX1XwxyQzHTlxkT/7uJn3H4wWmh+LMLq3vKEEO4nCToOL/J5iBeTpqa/N94thSqdXcvtD5wi3XV3sRJEEHOEiSBudiBXz0oNNYtNQiS+mFqMClUhC+1RMFW01PFu+a5tXEzAArF1l++TQNL822bcH0i0=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3chGulZx9js/QAMlXiOyoG+w==</encrypted>]]>&k1;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cN+5r5DGxhHZBSzn67khvmgM3qh0tTSHEHAJ3lwnnH/xk3gIHPQFdKeJ6802lhVxT0IHUFK9ODEKRvEaUnyG96Hg/1VmwKruAeowWS18iIIRbETGsNqcaWWRqrwmMFj4g2PMTqpXGrjEWibVBHRk/LhIZOoPYSVpYmf0hesgjFZGiCQYP4Ej5L3ZQxpB/R7eUcJhAwB1808elGr7Pyf4B1jAyZd2E6ClwvtdwMGkIyf3</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHIfhvN/FgzGs7XWCpp4tNw==</encrypted>]]>&k2;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cN+5r5DGxhHZBSzn67khvmgM3qh0tTSHEHAJ3lwnnH/xztRIdx+MSKlNiK8O/wEW38PuyMn1XkLYduIjNGuvC99jM+xDdFOflCgSQWnzZx7S9EstE+KG7fexCAVS2DvQUoUa7ZfPkgSnKZXdzRlTCRdE/6L3aPet7Y4kQrAv6FvLZrYHBuukP0Srt2RQ5BSW3aRbfgVpKMIBonCk66VpZzY=</encrypted>]]>&k0;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cE/hpETWHna8gLwEu3sbtN4/gTNFFQu0uenpQvEOpfKo64C+/GJR6A+stLGmvWCenQWjmiZXH5Ms/sggehN2p6w=</encrypted>]]>&k2;<![CDATA[<encrypted>%ShDm4LooPFnWfxWGAKIehxn5IEU5hwC3K054s/5gYTI=</encrypted>]]>&k1;<![CDATA[<encrypted>%ynJ3B2IMttZ3swIzstMMYbqlZD4zfaX6Mwe4vIA/i8Z+QPZHo5XuzwQduBEdxL8PcQx1VyRxWGxUcAfnZIxf60JcSwpsBvSueYZi4EZEdftN6zTJMr826QC5lXHflUiNae0BjMi9SbpZLB31XznxMiCIvfOj6On1+eJeqPgPyX8IP931koRAypItr5x8Niqw</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqMboCxcWZPqmgVHI4rxdBdE5v2XLyIc5gSWiGIG4xro</encrypted>]]>&k1;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkY71aLrfEuK5fnh8NwEuNe0vFTQLs7o8aoP/W2ch+4tbcXs78F6L4HBmi9KHBlS1mCC+Ho46Xszck7XkxNB3LU6yK4dNG027u2mwWFi+3oUw34vPvtNDvpd67JfiV6KBXNhww7fGNGiCm5HsGfYbgy8JaCX+bCnb54ocEzIltyIsns8OAhIUfOsd5W5NeV7T1ZazsIxzSGMTZr7ITgdKlwbOH3lYHRX/cBtDlgdOke7zAuvmMhLMP2hF2vqC2I3VbMLePvlqv9FpR4jtw110TfP75scWyWCLLMZk0Wp0e3NFuKFPGCJkgae2W5ARDxMA+6Z9DqNA9taHWzzdcDCHN+J8chuNwdkKwPU8CJvtay8j1Eam02b8797pMQAt9oOPoMDVw4bUaaGOUfZf6QQIuXaJPnxm3eJQgiBtci++6Lj7A==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>