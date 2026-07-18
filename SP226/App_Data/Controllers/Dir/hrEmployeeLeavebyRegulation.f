<?xml version="1.0" encoding="utf-8"?>

<dir table="hrnghicd" code="stt_rec, ngay_tu" order="stt_rec, ngay_tu" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin nhân viên nghỉ theo chế độ" e="Item"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1CDWm8R+VT/j99OgMn0PN6R+zh4dgFyZzduCYcWMOM2jJUmTxgEi8f/W1plIcpxwJU=</encrypted>]]></clientScript>
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

    <field name="loai_nghi" allowNulls="false">
      <header v="Loại nghỉ" e="Leave Type"></header>
      <items style="AutoComplete" controller="hrLeaveType" reference="ten_loai%l" key="status = '1' and tinh_chat = '2'" check="tinh_chat = '2'" information="ma_loai$hrdmloainghi.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_ca" allowNulls="false">
      <header v="Ca" e="Shift"></header>
      <items style="AutoComplete" controller="hrWorkingShift" reference="ten_ca%l" key="tinh_chat = '1' and status = '1'" check="tinh_chat = '1'" information="ma_ca$hrdmca.ten_ca%l"/>
    </field>
    <field name="ten_ca%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_cong" allowNulls="false">
      <header v="Công" e="Workday"></header>
      <items style="AutoComplete" controller="hrWorkday" reference="ten_cong%l" key="status = '1'" check="1 = 1" information="ma_cong$hrdmcong.ten_cong%l"/>
    </field>
    <field name="ten_cong%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="so_gio" type="Decimal" dataFormatString="#0.00" clientDefault="0" allowNulls="false">
      <header v="Số giờ" e="Hours"></header>
      <items style="Numeric"/>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="110101: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="1101--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="110100: [loai_nghi].Label, [loai_nghi], [ten_loai%l]"/>
      <item value="110100: [ma_ca].Label, [ma_ca], [ten_ca%l]"/>
      <item value="110100: [ma_cong].Label, [ma_cong], [ten_cong%l]"/>
      <item value="110---: [so_gio].Label, [so_gio]"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+AUuhaXa5OzoDCGtBAwQvrRdbXVTcNQBRrqVFGzxlKrkbHlcaL0SJ/1OKUFOvltguEMsyS22xNRVpn/om15Shor2pGWMcQfqYv7HwL2RQGB</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7pzHFhXaFflgm5c+NyaPOOwX06WYgcWiyO8xYpMK42qU4DEmxFMrDS4xS4u1eIwSyDR1U8qlTPFcMZg0Q+niCHdM+gwqYkYbWadDmlNw8Sd</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TLfoWKwwcQ/O7FyNadU2tk1CUaqVq1aM8LqGcoVzj0zCGhcc+UWrIUk8TFYAscunj2k/01lWOaKl3CrePVFnqtcTjVKMchOPj4UYvW77m9s0tz9DJh0HEmIXcRcZG19qyyjtlZ7t+70+PVZCgWjZcu0GmF04jikhVd8MNwLfDLcoKqj2Y0WOTw0V5kgfN+3jA==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cteRdRwmGoxHz1yyjDCQSyEb9kfyTl/alOqqkZCZSZ9+dkjLyRaN6aqr1jWPSLqYCps6FtRj8oty4ZueUrbpzjizn405rpTK5GnxfZMj9fQFePq3VTmxM9c6XAhUgSi8yUwrMS+nvSRlbJEIhgFNcntZC6JZKg4GcfrskxtPOEX3jLTgU5PvujUksbvC7ablLwD0dWSFWmLX4hrNb5AV3wzjBapbg5hsOrDxuvWZzBcpT45LDHaHiHfGTyysnxzJ6ZLdTtF3NBcV5QqlyGhDNauhkwJtBXL5I0VHNpTMYNYKzb9pIvLKKRbBf+/q4+v8Tx05O/U20nzc5uEUouWqoUDotvqMUbXpY6kj7yLFRNC4goNDg9EUcgCtg1evQsZtto=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0ob5zXQy72Mi8+VsqJ5Q22fpZtPw4fK+Vog1AwjCdm1fzt8xomb9RWuMCoeYNgjZdfnrRTXOdTQzcKIPEC/8Gt5hI1FXcYJorC7+mKNWgOC3ESGmxK+Qy8Sw1CUL2tYrQIr6oDUP7alOD5iU5JMN1Yy0OoEAXIk138/suH7wWztKSGSEFc5ol/jTSZTLmftY</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jJnB667LtEUPA6OOQKoTz1etCLKpFQp4H2IsPY0USPHdpWkCu9pNPqaBt5AgKzeA0Fbxe6E8iO/1apZve5bc52dCngzzYH6xLe/aKgCxzrv8MPiCie2cBtLI4s6tV0cdw+zR8JHKyADD7dP387ukgEfek62hQ74bqk3dgprCYLqei6FYPY7SHANztI2t5EYRHbcnKxdnizH+fBXDs5VsMpA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbehbuBSZ3R5J0fmx04jKJBOaUHnf92Nn5Tb4YPko7V9Qlc9jED4hAtmeaWRrafV10oQ==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GCYx7S/VJHxGKXDPD7ojwL9tQ9Bo4Yu8kXtJ07RNuysb2lg1cZS3tbSVBl6Lt5gdyBo9J+r8ykvInXTRG0Z5u2u6erudF3kpzRLOyJgh/1F5AsRJbT87SQF9AvQFnYeyWOrqNPWtbu+3lPftPOuz4+R1X1+OvPIVsSoU/yXGhtxJL+STbV7o6nEytxV+G6PjWjZYALcuyVgay+KPkxTGFDX1LZN0lJHkwrEOo/1OJAotJgvbK0VKyMZDXoGJDq4Cq3vc8dWg1QdD0PLnMPxhCxiCxGzROPe0vDTBDSGHTIlpL6iVRTxKd89i0tATGR361WVyQJ2Bvt+xTh4AL9OFvSmOPna8jdDHg7nJFTzistu1pbai9C46UFiaB7fv4stwho5byBCabdukugpb4J4bIPy2wASvC2Qf/kYiJ7mbqN9ayPqbsDinU4eGEodG8eXQQ==</encrypted>]]>
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