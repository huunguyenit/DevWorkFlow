<?xml version="1.0" encoding="utf-8"?>

<dir table="hrphepnv" code="stt_rec, ngay_hl" order="stt_rec, ngay_hl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo số phép cộng thêm cho nhân viên" e="Employee Additional Annual Leave"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1CbyTY7MwhV9A8AgNMRosuBGqi4ya+3GOtXzcr6lc1xSj6HHSnBK9Tnrpjn5cl+0d4=</encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_phep" type="Decimal" dataFormatString="##0.00" clientDefault="0">
      <header v="Số ngày" e="Annual Leave"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0, 0"/>
      <item value="110101-: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="110---: [so_phep].Label, [so_phep]"/>
      <item value="110---: [ngay_hl].Label, [ngay_hl]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+AUuhaXa5OzoDCGtBAwQvrasoQ/n43OdIIBBvxoclsKXmWFrKHsuROHfY9IU6tmLPwDo33Z2SLHhqlZwbwyS39aO/KiVQ15Xs735NWt2VKD</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7pzHFhXaFflgm5c+NyaPONzMPdMOLBHIu1uXj+YiFTyL7Pcv8V3CyXw0yxIEoiaXlEDIZrxbTDz+0c2QbUA5YckzMOqXHqbWD8OoiLqErn1</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TLfoWKwwcQ/O7FyNadU2tk1CUaqVq1aM8LqGcoVzj0zCGhcc+UWrIUk8TFYAscunj2k/01lWOaKl3CrePVFnqtcTjVKMchOPj4UYvW77m9s0tz9DJh0HEmIXcRcZG19qyyjtlZ7t+70+PVZCgWjZcu0GmF04jikhVd8MNwLfDLcoKqj2Y0WOTw0V5kgfN+3jA==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cuMgNGj8tJDJ6wTG3GYYmjUX/4c40GA7QfMT5JCXxH0lktYHyxL0K7Gdq8S0SrdK1GmeBj1kGRCMn6phjnVV7OTuvc4Lcw/18Pslk0u5AoIUcSIB6QsBw+eGtru8uOGicDHXj3TLByXHoITnuMV7RPgA8UFIOwo4IFJTFZKfrVTaZ9+PcBnoP9nND8LvdAJO+8S11kDyw+ESfQ7spsG2ZPkuu2dgDH9VeHMw/X7V82ytXNzYuzIMG2yfNVLUQkN8DfVKx/xbpJK9T+lEh8p3eRHYS+MWjp1TOBmoxX+cEAYUKN0LNHMuW9tR+LD27P+PVbkEFQX7PHNrj8derhIq+bhoy8GcVO3xhDSX2tILGk3edbch09oTUd6V27LsfF8OoY=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0ob5zXQy72Mi8+VsqJ5Q286yu0Sq/c3EwEekBU5KD/FSjqAfnjEeG0cK/QPonftDHTvG0cRfG4XxXxC1lIIfP1hRWc1bab1zdl1UYkO2f5a7Vo3/GaySsS/D+SLlEn8V0RHhW0dRS1Oi+eyasSDTKpICWJIlTcmEJhf746NwX4tv96pM64XktDNLdcFOmgeJ</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%cuXNkLI/9J0no/A5pPbabpf0AQyetWdN/zNcTpAiAHT2kbCElDjMUH1JWlOzbX4n7dXElil6WVxebTA09gxhBKQJskU80aVjRlKL7GzUa5zlaMAqxFf+h0XxibPfhJU43YjGAA39sc3vmXVu+T90d7r4QL7fZmyCcgOmCPp9RdEJOaY6W6DEPutgcv6k/bMf9MQx9I/HSoIlaKAnVodMGUhfsXqyJ4LfbuLBQC4PhHCTJm950PrrkM5dVmnkHaWJnGGCTUWxtE4xnGfeK10hBWLJYoN8wI7H2vZwPpv6ssw8cTkfh9N1u6j7JHlY2i0P</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberoa6jRl0HozQ9/2em7TRgb7icautGPJhC8S3fSbZCfhJ3SZPmG/hi00cdPWMFFQ8w==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GCYx7S/VJHxGKXDPD7ojwKYlUZ2JZaEDU992ilL4S8ZIlssPlRTrnm4CU3MjlBkv9d3QuzmsNk8yyIi/XOTXq3OPM/v5DSP9g1zlk3ZEmzOyhNxSGGnHWa+vG+2NMTR+Vr8ai+asDA/jdGnY6M4RlZq6ETa9dZ62a3fZT1wr8XJ5gEm/vujDmUPj9Ny9Pdk1LDJovwrZd1lCNigsljR/2cBz3+elmSHkvHqfOvuJa3EX+YG6MKFkPNSISJRgz57j9uiDHxihWxYn/0WbrelvQirTBLipjWgOKaXGplb8j6rHoY+38rwO2B/id4p6l+yZ3vNoU7J52tPc4ycIxyTpVzNJv4f54TUn+KGfwaZEdbbEpcMwZByJGCQvZI8OTPPHOYoQF7e1//9BCqYOmz6QGISkukxu9ArByvXQW644shc</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="IDNumber">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6Wdyk9aPi/fGimY6rlT0N8nVAGzan76LcTwu5Z5TgGNe1NWZAFthZQVFXCS3ORqLbPILfY5lclrzI1lzkCB9izQcDmPERv+f/FcKknTu+wPw==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>