<?xml version="1.0" encoding="utf-8"?>

<dir table="hrnghi" code="stt_rec, ngay_tu, loai_nghi" order="stt_rec, ngay_tu, loai_nghi" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin nhân viên nghỉ, vắng mặt" e="Item"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1A7VWsR18fywI1tcLqfWwIPC+rRcAdop6l4FskCJN5a30QdKrKl9onXEcEIpIw+WsU=</encrypted>]]></clientScript>
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

    <field name="loai_nghi" isPrimaryKey="true" allowNulls="false">
      <header v="Loại nghỉ" e="Leave Type"></header>
      <items style="AutoComplete" controller="hrLeaveType" reference="ten_loai%l" key="status = '1' and tinh_chat = '2'" check="tinh_chat = '2'" information="ma_loai$hrdmloainghi.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
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
    <field name="muc_do" dataFormatString="*, 1, 2" clientDefault="2" align="right" allowNulls="false">
      <header v="Mức độ ưu tiên" e="Priority"></header>
      <footer v="1 - Theo công khai báo, 2 - Theo công ngày lễ khi trùng ngày, * - Cả hai" e="1 - By Defined Workday, 2 - By Public Holiday, * - All"></footer>
      <items style="Mask"/>
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
      <item value="111000: [muc_do].Label, [muc_do], [muc_do].Description"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+AUuhaXa5OzoDCGtBAwQvorol8p+TMGnni7Sf3nWB9IvxiMxgsMZFzorhHErY1Bflu2X+2UMuVV6qW+05N6GjIGNZGARbFrOtX9zBstGV4y</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7pzHFhXaFflgm5c+NyaPOM3HmZjwG6nBeaU3yP7vRhnouIfCewmFvRHeEfty0y+CDSDsGvHcM5UY09HLKMHlzQ=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TLfoWKwwcQ/O7FyNadU2tk1CUaqVq1aM8LqGcoVzj0zCGhcc+UWrIUk8TFYAscunj2k/01lWOaKl3CrePVFnqtcTjVKMchOPj4UYvW77m9s0tz9DJh0HEmIXcRcZG19qyyjtlZ7t+70+PVZCgWjZcu0GmF04jikhVd8MNwLfDLcoKqj2Y0WOTw0V5kgfN+3jA==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI+xBe/9ExYncuJwi7B+iI1X2kt1F/yu41/wNnflXxilhe1boBm0Io0L0LumvMfnJjK1PbObmyuSt5bivn66tF0n3Qn7PtX+zQJG5m0DQd5lbHLxnFHGKU0WU9iQCRuig6kGlHRKlwFk7lXGavoJ9Z1b4yFLmakJe0U10hrSCkT903qt+L0MAQfWbxO4N8tKc5H4cLF8bIeapEqwmWkMMRvXC+TzLUFGEPNtlxaEA7VuuL+JXvCGEwvnFRPZuO12n+t3Eje5tHWhJXYojyIerlXPayvSKDGd7tK2ohlySUZCTsXDYzEXrMrmgAEmtcHPotWIHqgoiH029LyEWgcJEHz3jBc8fU1t4PGMBed3aPMAd6wooSOIwB0n5bIEunFsFRh2sZ2awJkTsvULrMWB94kzScsAoyTx7WTtOZr4RxBeTwyDVqXLccFF6+GcbBOICc0vvcvJa+CKB0R8LjM5FfzuOL4+Q/R9OImRQu4XUbQ3+YDyxH6BImWUR3A3U4ZW8eN5geCG9A4bCDptEZEBEXRXOQY0uR3eDgHfcdixvpJ1S</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0ob5zXQy72Mi8+VsqJ5Q29SPnj56dnaC+k7a7PboLua6yDNR+rAYX/ZG7W0ji6K0R88CFjg16qVxi9q5E+fkYWJwIzdHQdck9pQNrjguh533Pt0ydC1XQ5gA/94n5xGudSpL+3C9AyZgtcyQWaZFvDcwNL8w7jAX+ZrW9TCzRJuErmx1MvNa6VvQlDbV4hxLNLI+zcQUzU9VmOB4/Prm3RE7wyy2TS/CbRqJy5WW/kXBVubWqZWwwWjynstOjCNvmn+CKJaQXjtE/jM5XHMaOTQBronxfriN/K3lumnadKjPfTg2RIwS0qPBOr1yC3Ok3bsO0IR3lro187y3D1mGOg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0ob5zXQy72Mi8+VsqJ5Q29SPnj56dnaC+k7a7PboLua6yDNR+rAYX/ZG7W0ji6K0R88CFjg16qVxi9q5E+fkYbwDMunxldX5UU7BCL8KM/5UTG0DfEhZcp5+xAha6lgIyxnKRwtL6xcidZtgicTB+YYn3Shfwc2IPM2f9Ik+s1cmKe1niYnOKRi2wbpXzZiEByb1JqAdCmYj48eorvGTSGxyQE11icjtRs7H5lMbn+F9rHRjuz3TgdWyscs34F4cluSjSBmGHo6GMhsdOWDB7y5kwEG41SAM1YJ565xKF9twB+WJFlllCEJvFFPmjYPnqUNHTkx0aceleyEAjhy3Z2l55X/yBp5ZJif+Y3DiPZ43/jvJ2VEjDYgGrkkN8/kdO3kt4A7jkl/+q2xytdBezA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbehbuBSZ3R5J0fmx04jKJBObdOEhsJTIySe2XHbAz/+a5SOqS9hyAyOCtLQeVP7yCrQb5vAQFRuepBS3PcBQ7uMs=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GCYx7S/VJHxGKXDPD7ojwJoe/bC28lXjCKrkjLuSrf92ujsOkqRneMBwMeDxNlTu/8rwf7TwvXVTzLC05tqs6sId1h9w09/fGl9a3CyCmG2PERbBceVXlfSwr9CGgxBc9woCIXa4Tz5wbxKWlmfejoiMtcg3034LmSeS7SotEUU178AEdL/PbiAYYGkg+8wHZh6Bs5BpQy8TcyLw58rpQnCtpbAVz2VnjeZ2UzDHBSDKEFOlkZT6UZ+XltmSg8Y8svy7t4PwQCY8RetQ9RklomHMijwe4OPuKL5a1Ak64d/Svm2jZeuv91HHvlJiFOPFseviG+LnBqt8QXDMYkgjnyJLZtMuSk9CyXBhQuRRFxQ/8OUuvzKZ8nFZw5h17D29wK9wqW+4CkjCeWKGnEgZfC1Ti9xa0YamyQbqi9VUJHQqaeVDOFZw8WqfOdWBFoaOA==</encrypted>]]>
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