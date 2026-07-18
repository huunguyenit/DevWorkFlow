<?xml version="1.0" encoding="utf-8"?>

<dir table="hrdktangca" code="ma_ca, ma_ca_ct, stt_rec, ngay_tu" order="ma_ca, ma_ca_ct, stt_rec, ngay_tu" xmlns="urn:schemas-fast-com:data-dir">
  <title v="đăng ký tăng ca cho nhân viên" e="Item"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1BmSMxgqpct8XNjmshEfaRnHRaLHkb/o8hfa9rKu8AuoDlihLsNoajdTnopkdp9rzI=</encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_tu" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ma_ca" isPrimaryKey="true" allowNulls="false">
      <header v="Mã ca" e="Shift Code"></header>
      <items style="AutoComplete" controller="hrWorkingShift" reference="ten_ca%l" key="status = '1'" check="1 = 1" information="ma_ca$hrdmca.ten_ca%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZTT5x6fyYfEiLds00d2ZBV3NfHdvtzBBhm2Wjkvnyr17KkwLlk9HxBSZzOHphFdl1g==</encrypted>]]></clientScript>
    </field>
    <field name="ten_ca%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_ca_ct" isPrimaryKey="true">
      <header v="Chi tiết ca" e="Detailed Shift"></header>
      <items style="AutoComplete" controller="hrOvertimeShiftDetail" reference="ten_ca_ct" key="ma_ca = '{$%c[ma_ca]}'" check="ma_ca = '{$%c[ma_ca]}'" information="ma_ca_ct$hrdmctca.dien_giai"/>
    </field>
    <field name="ten_ca_ct" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_phut_tt" type="Decimal" dataFormatString="#00.00">
      <header v="Số phút tối thiểu" e="Minimum Minutes"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_gio_td" type="Decimal" dataFormatString="#00.00">
      <header v="Số giờ tối đa" e="Maximum Hours"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_ly_do">
      <header v="Lý do tăng ca" e="Overtime Reason"></header>
      <items style="AutoComplete" controller="hrOvertimeReason" reference="ten_ly_do%l" key="status = '1'" check="1 = 1" information="ma_ly_do$hrdmldtca.ten_ly_do%l"/>
    </field>
    <field name="ten_ly_do%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="ma_tang_ca" readOnly="true">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="110101: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="1101-1: [ngay_tu].Description, [ngay_tu], [ngay_den], [ma_tang_ca]"/>
      <item value="110100: [ma_ca].Label, [ma_ca], [ten_ca%l]"/>
      <item value="110100: [ma_ca_ct].Label, [ma_ca_ct], [ten_ca_ct]"/>
      <item value="110---: [so_phut_tt].Label, [so_phut_tt]"/>
      <item value="110---: [so_gio_td].Label, [so_gio_td]"/>
      <item value="110100: [ma_ly_do].Label, [ma_ly_do], [ten_ly_do%l]"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+AUuhaXa5OzoDCGtBAwQvrunHPZKZOlYYQ4OAZjBqNYxS131DGnFpuFLkd7NkkRnlvq6tP4tyNDRdiEEQZAf0FFAtlD7rtteKfrq+g7U4MO</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7pzHFhXaFflgm5c+NyaPOMtZarB+CYRmHvngydUSoiYkMsrW9zynUxAiEmReq1jENmnuxFmYgOZA4YIDOcEnluCmUST3cc/Zb/RCF6zm6YO</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TLfoWKwwcQ/O7FyNadU2tk1CUaqVq1aM8LqGcoVzj0zmeHcZ0iB7x0AH+iKEx+Gn1zYmcPf4Pa2CK+b+NNprhQ4Jlo44t5Dm0xuXRQ8qALhLDJAi0P9RyCH+ihR3KTvAZ+wJjGVRXgApgNuwfvDQHBhhumIiQPPT7TCaSBUABcewJamn/l5YX79zeMIp/hVmcHq/omd6Kb07lZCXa0/OWN0Hl9+uaRXuDAyeavllKpySScVLqaTquZrLZV3bmaR62/4LVHG3n9d+LqbBHSd8Zs=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cteRdRwmGoxHz1yyjDCQSyE0HE9DzmBMi6PHq4wcZNxGgIuwk/L1yIIBPSNz33LwoAWV4rSlIjHaHRNObSVPzSgr92GMRLNvjbB+JpDrs+aLg66xs3xppST5SO0TMQXItUEKVQzcbkGquDVHHl56RHiXTgICBgNQm1+EKHxF2YSkrDF0DzFzhuoNjgg01JhYvDTtlOqah/pGRVqFnPuMJ5vt4Zzl4lKdAvuwzL1E8i9rU2Akvdrc7xmaG5A3raZUFrA/fvalJp8RjU7EJnyb4xXcdWkOgPeFh/zvV6pssp42G7qIeH4zTsSi9xfmTu2kySdv39zKEJxcKZenoR6cRb43x8JFFaBhZkWcgJVaVJnQdH2Cy5DQVYDuXX8Apjb++0=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0ob5zXQy72Mi8+VsqJ5Q2we8YITiGIE/YNLt9WfTcezRXzX5H3mv5tunPwr0posHhsHin8NDh2oSxLA8ZzxikmeSwAlP2Lbw1Krsn8w4vCDRpEabYd4DMdvqFm+5gl9LZJXntEXkMvI+CqDX2QBtXXQY5kiEszc84orTaDpSX3mqk9/GIidWzPieOePRhZLOePWYew2gVv3hRMp+9HMKH7ykwPnCd+sO0RGeQBv4dQFQZO4ty7IX0UxNKvyZkSWB</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jJnB667LtEUPA6OOQKoTz1YrnToUhIeC/org8QJYzRJf6YOoxDuxU6JlP9LRafVYtdSF9Nbz5ydclzklVmQZtngLYE263GX4sTcE8dsl3Bz7p6S/WQ0fRqKBg6Qdd5EnDsjBnmkTJ94fN/v4RzxS/qYzH/nUU4K7y8nxBTppulaZ8PsyxXbJSajZHWgg+UZb4/bBjvgEmLev4c57SdCjsU6wZr1yx3Di/HxofUO6Y4rMiPG02/QbigLfDxnA3Dd9MRIq+ORq3ijpTNB6xg6RmoqfRnQguC6ZuTGn4lnC0EUw=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbehbuBSZ3R5J0fmx04jKJBOaPQu6FEaKKzrNBZ9oyWinV3eefFrJQwJp0I5JBdOPgLN/roRtzTt0j6ychnrUvq4w=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70IJIy5GRlZSP70WOTb1clYIT5ZRKwct15/rKnOjGim2ICAwFklKNZVUjCSW4laK7BJqkt65lj6QHFzWGuzrOBMgS7mnriEkTRRh4q8VkKV32zdILvOduJNLVVpsEV0jXdwuQpuc57cpWFVjwiF/tven32hha+XNLGADUXpWF+2kNvwh3xMqXnjBojDmjWhILFmMpju0IfIWAQgna+gxL2vAjt+oGbN7HHI7tjNdvzuYJB+Xrh7RcTVkbD/zdirW20XHI22ZkcI2myg3qPKzUmHvucGCSEplo0xR7dSPTLgwM4Ks3sg7tKGIYuqcVOz+GvWTrWtBonmctoL5sKZV+Hpf+IAGEkoWXdnuKZyCypGvz+vBqdvVbTyg1cDTFcWdfWsLiqDJN+ZBeJdk97oknPvX/ou+7E56NTTdMQ4Wv4Dk67cpU+PJJRz5XzFG6HaBvM0Zl4n9Nt7dMXvw99iRwHtG59IZvAaLb0nrkOePIIi8E</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GCYx7S/VJHxGKXDPD7ojwI7MpL5drs72OG94tZQCkKYembclKXfHH90/uOqzVUbv37bOWZCxFgOm66K7N0LfPvYyq/f4BcXByGCQDh88Ml8e1C2elmSw4y/rDggTubNeungN5XLM0aypj1UuvrCpH2q1tenSfu9lpW+SX9qruRTjpm0F9/ycAHoo6FCgJfRsolRfwJ0HWhJa8zu5D84daaap7IynFqw39W1lmxN94bpzSJeegQzGVMlA4Hbb6NyI9aDEgXEIJzEHjmL3DpWI0YqB85fZlT3tG3EaB2aGdUoxh2KzmYwehkBHqoTPjilpb7SqcvxesfSVnFmizCGqV0WRMgiUg4zsfBrbeS94FSiPNlPmNGzS55kMpsypkhT2KtBp+T/3g8NU0WkpWouj+p3jefP1r6Cu5ZVXZ6CIHjTsns/R4u/pizkvo2oWaH+Wkew/IZMRbx3penq0tetfIaqvmz9Jy79h6kYaMZkutHIAqhbyCYf9ANHUD2R2QrZ72LTj7g6b768fNZyOMreeNR7Ph1xJHihxSnL0/kO4QsbAfaIvToyE8ShLgvg0RlftUPcMmdWyNHUKctweslRXe3IXHHc5jNJod9zDzklqP6KACw8O23tSBG7wVHRl+3btxAfm/HwYJ9V/V+QVxw4Kk7qYeflIwyDQArnHXfgKa70fg2pdOIsDQlWoOjQI2tcbckoHJfs57ecOQE1mQ/iO4DHXKS/MiSpeK4HWRMdE7wsF3sUN2k2DS3UA4nYMwGsEqAR+15uEiXeN4i4F/VKzcg=</encrypted>]]>
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