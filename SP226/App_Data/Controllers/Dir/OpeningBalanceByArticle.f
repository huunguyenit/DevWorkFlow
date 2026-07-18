<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">
]>

<dir table="dtcdct" code="ma_dvcs, nam, ma_vv, ma_so" order="ma_dvcs, nam, ma_vv, ma_so" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số dư đầu kỳ các chỉ tiêu" e="Opening Balance by Article"></title>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l" />
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" dataFormatString="###0" allowNulls="false" hidden="true" readOnly="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Chỉ tiêu" e="Article"></header>
      <items style="AutoComplete" controller="Article" reference="chi_tieu%l" key="status = '1'" check="1=1" information="ma_so$dtdmct.chi_tieu%l"/>
    </field>
    <field name="ma_vv" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Công trình" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="ma_vv in (select ma_vv from dmvv where vv_sd_pslk = 1 and status = 1)" check="ma_vv in (select ma_vv from dmvv where vv_sd_pslk = 1)" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="chi_tieu%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="du_no00" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Dư nợ đầu kỳ" e="Debit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpvQJN/ksbIqriTKzmH5qrBJTCu5SWfl4zM8vMYnn0Gbw=</encrypted>]]></clientScript>
    </field>
    <field name="du_co00" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Dư có đầu kỳ" e="Credit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpbNxUpnLPFYtk5Fexs8kBTGQ8G6UEJwU05GLL2dTWZHQ=</encrypted>]]></clientScript>
    </field>
    <field name="du_no_nt00" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Dư nợ đầu kỳ nt" e="FC Debit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpaCYPG9+MS/CqVmemSXMECo62yMrolwF5+Afd0oKK354=</encrypted>]]></clientScript>
    </field>
    <field name="du_co_nt00" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Dư có đầu kỳ nt" e="FC Credit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpw2AsXz6rjXDexlXZk+W5KJ1gbGPNlrKsiocXd9QlXw0=</encrypted>]]></clientScript>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="111: [ma_so].Label, [ma_so], [chi_tieu%l]"/>
      <item value="111: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="111: [du_no00].Label, [du_no00], [nam]"/>
      <item value="11-: [du_co00].Label, [du_co00]"/>
      <item value="11-: [du_no_nt00].Label, [du_no_nt00]"/>
      <item value="11-: [du_co_nt00].Label, [du_co_nt00]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0MKKZRloTB5ZPc6LtOPrEI/EvbZIHj2JQX0N4Pe4sjW3gX7pIOGVdK5TQ3kGBbqQeFfskWYEVddbByAtrOg/ro=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHY1X8UtDmCQxRKhh6aOFgFaK1o8p+L8QMNjoFL84PVBX7mely3y2ac4Iy153G5j/lJqqmkLN3chf+mvGragDraDQG1MPoXIomNTjYnesiZYXPypTagNYJcZW8yPjQ8gzaYkEsWxZ9RDnNKF/Hsd29M6larj0M4X5kjwzju9Lg261+yjdiS9X1/EyxmYR+pKcv5U/YHlkhqaYhhAoCS+fOXlcmJ/kQlNrs3cKlWqnMytXXWneNIeOzYMwIoHKFNjlMpKIz0+zdv2dcSYrwHRu6N5QNpI5HhLNmvYDtCMiOXeYFMcRyCV/DhrSNCkdaidLm+mmg4KOrVqEli/prhdDK+p</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOmf7U01vaOUFYyufwSdHK2W6CCn75vubM3YY/KtPc0qx33OMOlRSbwHdReWkoGS+4</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cvKmxZaA0Va6EHRAisY3KwNKNJNw3+YA0HNID0WHcqWysJfqbHcQBnj06BpqjRvWD0RE1S1QNvseXwnlU57oGwsHtcs6QMhANrtK2ePr65QnX1Vm4GjWZIo9aP9eDjuqAi62Rsfgx0csgipD4WwAtsVt2pxJ3oqQo4bRZrQSbR2amvj90fV7s7bzUOJG1i+XoOuDxSx0oc7Wd6Ys9kQkscHjUm5WBmc/DH9LyulBrMDZaZxcsgBk/EnVoSXgM69Ds1bBMCav0binJZITTuPXVRYF4NG8yrW4B89ARtBL4xVfK9Jd1eGU0aOVrZS5QfSRBqsKwYeRbh8oGvQ37ORLGnigKON8zrHukMR9e9gDzIGuIBn6e9Wq8AJGxN+xVbRGaTRGW+xer5xG2D2AxhEUTHi</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nS0Ignx/uQretofeaHgl1PDDi6N6m8prqrqjOmB4vfuHyoudU+yZtalFro0J0CGqZKQj/UoJw/oznB0RZ9izD7vozLnLXWK4yP/R+P7ZtcLj93H0KXqU0db5zx/FT8sS3W994qsAetexGefxhTHN1QLmCIgJsR4NsNAGjybE0jlzZ/zSSKRWOEstN7kwGW1k+</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jPX+9//UVyVOvGC9jzOM6owXXKF2kg6MF5unCSLP/tubzCZPHRzgRVSRbzKo+it/CyppmZ3IaHk/owgQYZJoH++aM+B8Q0rE6vkVzVvRmYIsNMOwYGQ/sRSnKnHzOhZ/bVi3zxyF/6upv0KHPzbjhCQj+G+FPr1u3QbR+322oS4w6vD4MoesJOs6fSI3BD9kLj1DrijPJhdpkUn4T5y7ql89cdn9vx9t17V5hqSc1/Y28lwxQyrpJCtDF+k1Fd4CTMT/8Er9Ka7EgkujgmhC/XQ+4XlRiyH6APehhf65pxMA=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeoJ+DOf3ngC8YWY8utprm/FUDXW2R3LN70Al5xHlFXlyH2dME+kKk+GfwWHxhsNObtwH8JZXyFc6v3zxZpvGbIY=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenBalanceBeforeDelete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Ea2vn9Ickk7Cn0ocBTQLGg8WmFS7bmId/lV0EEPgs3WaAnf8XwKzyzHm9ccb3w4qevoaBTZEX+t2f54PTr5P2HNdKZtnjOcmvKAxCdCa1LIXfc1qirR0Vu0jrpOQplhZg8U9dB/hydFM0aWvd89zWVLOKi0lPnkZYoluMADZOq3lGGScsp3T7zg3n29kLCYM/amktwPS1blX9l/5QY4XAvch+LmMRb+DBKYKlMkNkL7DoNePwopIqhw+ft5mYhjXqZfzJ5gCjVjiFdHIhTlWDwXw8PZT6JOH2QXzOnM+v90y4LKQxHIc0aFCbTYQx5PJY2fReHkc4OZzejyJQoInj0=</encrypted>]]>
    </text>
  </script>

</dir>