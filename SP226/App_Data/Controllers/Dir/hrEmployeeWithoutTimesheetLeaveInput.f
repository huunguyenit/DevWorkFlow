<?xml version="1.0" encoding="utf-8"?>

<dir table="hrkcccong" code="stt_rec, ngay_tu" order="stt_rec, ngay_tu" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin nhân viên không cần chấm công" e="Employee"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1A/kBMDl1Rq/sKz2aj5mTUlXhZviCABxOoqrrUBMxtLMi2feTs06YUucDFIy3TqVEV8OLVdxBwWO6fFbT8Htlpk</encrypted>]]></clientScript>
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

    <field name="ma_ca" allowNulls="false">
      <header v="Ca" e="Shift"></header>
      <items style="AutoComplete" controller="hrWorkingShift" reference="ten_ca%l" key="status = '1'" check="1 = 1" information="ma_ca$hrdmca.ten_ca%l"/>
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
      <item value="110100: [ma_ca].Label, [ma_ca], [ten_ca%l]"/>
      <item value="110100: [ma_cong].Label, [ma_cong], [ten_cong%l]"/>
      <item value="110---: [so_gio].Label, [so_gio]"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+AUuhaXa5OzoDCGtBAwQvqUIJ0avJ5JJh57paeg5frXmlUduVmows56GoskgA3IZOI+7Bl95gqmYLxsPKn65o2ikyaTLbolX4fZd2Ci+5lI</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7pzHFhXaFflgm5c+NyaPONvksEMzQSoA6jFwrcOhJSnCxpsKioE/ljRf505vZ/ODqUksmIh5XSYO/mOfLqmSxTLSqLg1NC7dLsbho8W0qdq</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TLfoWKwwcQ/O7FyNadU2tk1CUaqVq1aM8LqGcoVzj0zCGhcc+UWrIUk8TFYAscunj2k/01lWOaKl3CrePVFnqtcTjVKMchOPj4UYvW77m9s0tz9DJh0HEmIXcRcZG19qyyjtlZ7t+70+PVZCgWjZcu0GmF04jikhVd8MNwLfDLcoKqj2Y0WOTw0V5kgfN+3jA==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI/Lp7jTAr+svmvCLwfUJ0RzujYTuzr/s9NMeSOJh9YpgjQidZO6Ah1PwIuipzqbKIOxG+1WA+5EapXaOrJkzGBuxWheY9hhdFE9alVzoBB5BZB6E2sE540mn2UdXU+tHB4YzTKPNdm8cwTf2m/X4euBSYm3WEAIFOE3PBsN22sZ+62df8OM5CgCoczvE0r58+438MFYLoO6MGLWeTaavboqyaKWe/8m6Rpds7WYKuy0JJmg0I9e02hvX6o+ESQIFvDgs8RNnYu/r/pXO+36MxfY/QBemlwjPLtCNG91HgfryvtpTShVVvrPl0GXvX18BjEpEnk0tCAY+u8HbgrA/4CsOa8jFEGg3alX7e8wFIHfb185Rvp+MIitL/ntgIbdHxP3RkGhZhVebH7mh/mRNmZxpx6rvegs1V92GTZ4exqobLQJaSPa+fbyYjJRFgcjtFJlVR9b0RcXQpKDaAn9arj66/BKwlLZ8nKulWt59Pekpz9IKqOdy0THeM/y8mIXbGY4tK+tAhxLv043Ek7aP7FPnY8ZSSCl/MuHmzIyniwgX</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cUSXeTZYZV+H7Fxc7qoNsKtgy/EZP/snNT4sGy0ZoCKTmQaq7wd2+O/g+7PKVujbf167mPrE4QleoAJlrO5H9AC9PCxy5yMmbx7/KqerGQtbWknt5A4LXqwCekO750rlo+xuH6jDP8Hv34u00QPNbJXZBi+dYyhGdV6p9bKFAaZ2Sg4ZoKUGBQugfe/aMym4kBlSSLOMdAkwzBWAArDm2JRw1STSt6cJ4vLdL+3irY4pnyzEwhBCmnNhB8HGfCO/QQtr4ohZkngBcNGIXspjeuA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBqdxKyVHbMFGSgctjyato7Aayr/ag9xF2GQauZP+4vTgdUX8+b0hDi/+HLtgYMwId5oSr7uWZc0QgIRPI4SSeupFrxzejGT5YcF/j4jEMch1iA6LWy1dxVzm7I8XTsAnRCBRHQN61GiE5p6oIu58RckPxP73LAZzwb/ULhxjFroR8LQTMeyA7FH3MhND2cKLsP8TRym7o+WhY6zjXAIH4q+iEG66uLFfDVLLVQx6zg9SQI18uaRrd2RrWF+l9gcBzeWoE2dFEyv78kyANO0PjPbbWwDTHtgmkufxs5Ag3/HrwY+Jgm/+Zs4qvOZ5BkmAVStG1kNUcvLhlvUr05BPzvAYXiuFxybwzsDPh1b0vVXDBOyJ51FyhcSUATlzfycbtM=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GCYx7S/VJHxGKXDPD7ojwLVL0rt2chECAPAYCCiQGFsyu6ocoLWgA4KPHl/nWwTj3PntROPv5PbjYImGtisfqTKD3JV6S+b/UGomcv3mIDiBEQxqAviMOWKwE529FfJFdVmdjBpP5dKRdQNnLYUAx4LuEFRZ91EvChjV4AZOJzfr6EINN2vtQNLHsYgalW66UHT1xcr4fETlmsKEGsy9HOSjoO+mx/SQPtphWLratFQ8lNe0eQUlIK6qYQkXoSu8SAKyTCcOXyTy22c9zFD7U9HoscbECLBY0HXnMPONyzEUykAyGMszicayI2Q/N2WbN+eSLHX1wLMgFz1yOLA+QiAOyvXQKC/PZT5dHjST4oJcmUynFabWVfDakd0SzjGN3gXHZQUQOjSbpqaxRQ9cXH36APqYYhGqPAaly+dKH+nhwMiPX/vCXX+Na8Ve7MWywXIewX79wF3/eQzL7PX2d4=</encrypted>]]>
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