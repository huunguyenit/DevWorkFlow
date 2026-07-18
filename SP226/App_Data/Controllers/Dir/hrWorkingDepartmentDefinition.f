<?xml version="1.0" encoding="utf-8"?>

<dir table="hrdccongbp" code="stt_rec, ngay_hl" order="stt_rec, ngay_hl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="điều chỉnh bộ phận tính công cho nhân viên" e="Item"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hiệu lực từ" e="Effective Date from"></header>
      <footer v="Ngày hiệu lực từ/đến" e="Effective Date from/to"></footer>
    </field>
    <field name="ngay_gh" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hiệu lực đến" e="Effective Date to"></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1A8lG+zRs8GxiThSXgNSpKagFr89YEgFzthzkvyICFFOtlh9o/sNP8gG7qMBQ3eI+KVE/ibhXlV018guteNti5a</encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="110101: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1101--: [ngay_hl].Description, [ngay_hl], [ngay_gh]"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+AUuhaXa5OzoDCGtBAwQvrA4/38COHHGvw3djJcFE2RA1OqjhUqywEmcjcJev56xo+ffWIGsUzVTFa4+kzFeBWX/MsBb+FkFxTOB3Pah3Qt</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7pzHFhXaFflgm5c+NyaPOMVPquE0MHvQIffkiv5onkSRSzN7m5ezw9QmN9lOM5WO8zAaLb/fz34rXrGyRkWMDRbzmj+ku2B9YZM8PltRnPC</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TLfoWKwwcQ/O7FyNadU2tk1CUaqVq1aM8LqGcoVzj0zCGhcc+UWrIUk8TFYAscunj2k/01lWOaKl3CrePVFnqtcTjVKMchOPj4UYvW77m9s0tz9DJh0HEmIXcRcZG19qyyjtlZ7t+70+PVZCgWjZcu0GmF04jikhVd8MNwLfDLcoKqj2Y0WOTw0V5kgfN+3jA==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cs2J9BKGAKclpobnEl09uqZFk4sCevtqIBfkcV8bCvexUaEGIMr5PiHJUD1gHl8uJNIZJ3Np+HJE9DMUCrneA98SvWE0DVqG9Q7+iPiNq5Eqvf74iFoXxng2FMGIt5eOZkvxCKteHXFooCJyZzt0nOZE+jEcHan028mCvhDWIXpz7fZGGBdTcmEWn6zB3HsNA+RsRGoH11n8q/7fREb6v+CyhQX6FaaPKejhPET4Si/SG2UyLnJPzaLyuHASuneINXWs96p6a+HmWTCMnB0+/fFy3FB9gj+gTBZ865TsFxtObEW7if5lwO+d4rb1oXUzDNvGw22dxh+vlyyZL15aCjcrZO1S+dkTjiONB6YV6dHC1DVc0+r4Z4p/Yedsp7tsY7WBaYwJ8Lx0O1rZbTaHvGz</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0ob5zXQy72Mi8+VsqJ5Q286yu0Sq/c3EwEekBU5KD/FSjqAfnjEeG0cK/QPonftDHTvG0cRfG4XxXxC1lIIfP1hRWc1bab1zdl1UYkO2f5a7Vo3/GaySsS/D+SLlEn8V0RHhW0dRS1Oi+eyasSDTKpICWJIlTcmEJhf746NwX4tv96pM64XktDNLdcFOmgeJ</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jiOhBfHQ+ZMen7E/3asYGu4oEHdG3+gpc/iet+52K1eZjMbyA/PFDxC6DaLFjs78YIT3Dl2+88iIIsCm3Nc1+SYbY/jIxtartYc6pEDv6Hjzy4eUjKyCJvE3jtc/76Q9o3uSFUO0b37VARIELArrIX5yU2/K0Ig+OeoE8U5YDzAE9E4Exk05AiI9xi0zvxA5WwA07C1On28zWS5wwuv3mbNYPgvyVtTRvjjK7OqMrFxB1I7EYLa15sIyPnmsBbXWY</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbemvHmePhRNTNC1xPpvXDDdyG6bHr5Rq1ZTtEx/RKKqgiQLgJlHP1lWuNIIE0fmIH/A==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KInAnqcXJOY1YJQqLL4krhl46OH701sAJ0MiCdr1ukkjdESRzdm0xjZXWPiQ/THRHPMAQKnReeHuPO/e4gxkJJfnAsj0yFZJbEqNY+wxJffmaVOhfHyDKNuUwg2J+TM3YSgFrXtee1FvPIYszpaVxg/obf63Xb+v257iOHkSZt+YBJsSlZ/UOAImz7jSHmPIMx4sB3mdC1JsgNN8N7/cnEWpPe2DX7ynaDOOtlZNAcXEV4smtZITlusBvs1Hd3HdMeUss/Rh/eLVFKRTgnDmoCWyvmrmXlGocud8YNQNovELcT4E1brfskMm5iovLiJOwRuy5gs1zxiQuAkTeK6liVt3wGqwjB8kmBAY28Wv0g7vo8w2O6t7amBEFyPj5U2sbk79N8Cov06/fJGhfDExsfWpOejmdNNzjxxi4GcuSu7p/f74IVD4XHEnOMc7CEIoY+0v9F//IJDdY1HnATchx51r7Q7VU57z1UL+QcsC4ZY</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GCYx7S/VJHxGKXDPD7ojwKcAXiV66kxUmBBKb9I4ieRoa6cmQ7xj/iONb9EKQIE1I1w2Qb9wNaGhwYgow8UNbe6Sf5828zOl74B65EYTDSQz4i8XUt3GEI1rKEFMOgVnq2hgAuWi+hnDopGfizxxalG3Jf05aJ8UQhHoPyEUp/0syADDdalIF7NFYr2sBNudeTKQ3XumIdvxLQnQjDfKs6YcyR6E77alrG/LXYf9aMPjRC3fv+Xc9aQRAD2dcnsf0t8bu6m/IRPKVFRyZVKH6+Yf3Sw1vTMCUxyXzmUdjEXdLGz5EdgVyqKyAyOEPcmUqiBveHQFS+FFxSQrrKEwwyDem08SpFuNYw3RTreL4iY5ByES/12OIOWOYkEd7BAPhhyikrZ2rnVk4q8VYRyVcUXtWY2aYNXrd+aFqzCMk4Zj2hETwSinT2rk88deU5h5g==</encrypted>]]>
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