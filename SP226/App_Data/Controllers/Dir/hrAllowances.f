<?xml version="1.0" encoding="utf-8"?>

<dir table="hrctpc" code="stt_rec, ma_pc, ngay_hl_tu" order="stt_rec, ma_pc, ngay_hl_tu" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin phụ cấp" e="Allowances"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZdC9fIKj0CC0rgB2HGA3lpUjFO5JVNmOvLpOCmEtnk6bTrqb7j8q2mA8UBxACVJREA==</encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_pc" isPrimaryKey="true" allowNulls="false">
      <header v="Mã phụ cấp" e="Allowance"></header>
      <items style="AutoComplete" controller="hrAllowance" reference="ten_pc%l" key="kieu_pc = '1' and status = '1'" check="kieu_pc = '1'" information="ma_pc$hrdmpc.ten_pc%l"/>
    </field>
    <field name="ten_pc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl_tu" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Hiệu lực từ ngày" e="Effective Date from"></header>
    </field>
    <field name="ngay_hl_den" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Đến ngày" e="Effective Date to"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0, 0"/>
      <item value="1101000: [ma_pc].Label, [ma_pc], [ten_pc%l]"/>
      <item value="110101-: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="110----: [ngay_hl_tu].Label, [ngay_hl_tu]"/>
      <item value="110----: [ngay_hl_den].Label, [ngay_hl_den]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9EA73KXAz472j8BxCRLPsu8bjz7iqNFkkaCgEydVlxrIrA41xCe1HUzV6UgYTgtNnDIuEbIgvlJqaR3CjlGH7c=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1MpVFDKK00MnirxsgsajDep+CmwBtwIRfA3uKzJdOATl8U/msm02faGORA+YUdjhHPEDuL3Zcr3ZS7/DBB1a3s=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TLfoWKwwcQ/O7FyNadU2tk1CUaqVq1aM8LqGcoVzj0zCGhcc+UWrIUk8TFYAscunj2k/01lWOaKl3CrePVFnqtcTjVKMchOPj4UYvW77m9s0tz9DJh0HEmIXcRcZG19qyyjtlZ7t+70+PVZCgWjZcu0GmF04jikhVd8MNwLfDLcoKqj2Y0WOTw0V5kgfN+3jA==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cub5dyNkkGvt7I2JcOPUA5FAOBr61U1HvqzemmBaKubBp8kb9uZqlbbTUpqkVKwAX54Ov+aWb29CYPb+mGwa+BH07n6c3rpW6SJqqiGDbssBu7akkKZOwakNu42IZgckcYMDBSMf8dtiVHl0C5mPPedrUZ9XF0dlgrx7mNqiSkaK6Fx+wIFc5XZYfHpFFeITYiQueu6Vf5wuv7NrmvwXut598I4nZMUmJY8x+3UGXS+Dfd96olnwl3Ta1c5szR81tDpotDrOA6AumNmM/13A8dg0ykTwVAkZpJNhuZZ1wlQMc/YATrADqDWQVZKXthgPk/x9M9oe2co/rmXaMH7DgDM</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0ob5zXQy72Mi8+VsqJ5Q2ycOeQZR6K+aPJ1lir81ZHYTwTPD4duVPNiKo0ZW9Kfxe/4JawzxQgtNVFErCeWPiDesnxkgvv1ENoN5ARl4gs/aj9QwQ1mBr8E30mkKM2B1DRz2MmYNvhwZsd0iob1gHltHs+TzOjB6RF818WwuxfXv6U2vPJK80zw8ZU8qwIO6NFDlz37xnxTXgsJB4zuACQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%cuXNkLI/9J0no/A5pPbabpf0AQyetWdN/zNcTpAiAHT2kbCElDjMUH1JWlOzbX4n7dXElil6WVxebTA09gxhBA7+LR6CMYAXNozlp8ZkTpM7v2zwxTopywIaq/swCJzJsYvPjFcwIjHjV6x7Nmd9cmFJYe5GWn1q2ls99xqf4T0I5ejvKTIZwxYsvdoddM4chtdQxFl4WGRnwGQR7Y9Mm3VkaPMa7ciNf1A6wamWdhnFmN/ijwuCCuyntRZNfUs6ULlqMD5iyFrTHuM/tL+NDq9Bmz82tJN7IdMUuu4o6MiorQvDB1SSHnIsSUreDevIjFWbTLFIHsNjEL+mVfQR68YupZ4twUDJmjoLKMgyx1Q=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberoa6jRl0HozQ9/2em7TRgaojCWUEU9k+NKTNJYLVms5bPbNSajSzIPNvufOXaIxxH59DigvsnuS3vKVF29T+vw=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KInAnqcXJOY1YJQqLL4krhl46OH701sAJ0MiCdr1ukk5ka8UBqYnEyDtJu4zi17ns7CG4UGoWuzvQJ+G9Q4sp3/QWsXWPlbA0uQUqL7Z18J0XQhg3r4w/rCvUx1Qnhi32i+zqKv75goQwTmA5I/IYwuKDlX8fsxAcxS6b2hPmHmBynvvevttmdc1BeGlRxnNYKCgNcrao4lKue+Zfjh64B03oe55iBkHm+LqWfY0jlzbBXidbj/q2mZoF2tWeWXPnfE5uQBhj2/pRtPS7KZ7D3dmFT4a3B6n6EfUA4VyklowV1CDY9B2yaKzuukeQO02nXbCqoaaPMJnaB4CZqdnjqF6D7Uw1q0xCWntVliz1dKZS9N3XbiHPpE/Y0Aoinxow==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70I8cKshdMVFC4j1XKHyCocMU0egT70fPJWAScerVO2cH5VXdCIQTTDafIQeXtSOq3CHsLRkQ2+4CsXDcW1aUGzjVCsbTsKz3R54+TRRAUeMhi+s6GhjkqtBznsJvP3ifuktpxrVb6p13VDp+dFyYk3WFxiJjZ65gJYxWLsY+XzdCD1A1H/csBW7aH1W35Wwh8uIQs04IYJRnAlowYjmvUS9DLdJXnvnuY3ZwP/HGLp7hprAYHU2zymZIRabH3oXvt17R44RaE3vV4TIT29zOaVlkkM8oT/I7vwBpK+f7XFgAEz/yLQ41eDYl4Rr021FrjOYt/giyiioofpPHzQX4P/1bFCkL3cPfBesmR8Ncjh0yc25o23BE1xDupvFhCLtBQvX2sAB6SnHMkN2SIE80IpQdj+t58lOVxThPxpAJAErW</encrypted>]]>
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
