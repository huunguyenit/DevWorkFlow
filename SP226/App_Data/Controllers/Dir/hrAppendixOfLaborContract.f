<?xml version="1.0" encoding="utf-8"?>

<dir table="hrplhd" code="stt_rec, ngay_ky_plhd" order="stt_rec, ngay_ky_plhd" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin phụ lục hợp đồng" e="Appendix of Labor Contract"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZSHuEstxxVsQIUwpcFMimIjKbLDxNPEwRU55kUBdKcELSu86fzFT74FFISFnMlL6bTjIni1s+0Pp25UKEMKtR6E=</encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ten_bp%l" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_plhd" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã số phụ lục" e="Contract Appendix No."></header>
      <items style="Mask"/>
    </field>
    <field name="ma_so_hdld" dataFormatString="@upperCaseFormat" allowNulls="false" onDemand="true">
      <header v="Mã số hợp đồng" e="Labor Contract No."></header>
      <items style="AutoComplete" controller="hrLaborContract" reference="so_hdld" key="stt_rec='{$%c[stt_rec]}'" check="stt_rec='{$%c[stt_rec]}'" information="so_hdld$vhrcthd.ma_nv"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZSHuEstxxVsQIUwpcFMimIjKbLDxNPEwRU55kUBdKcELVXyLNwhd8/zR91E4/et/NI0PR3+59aH7MFNSqji//3g=</encrypted>]]></clientScript>
    </field>
    <field name="so_hdld" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ky_hd" type="DateTime" dataFormatString="@datetimeFormat" align="left" external="true" defaultValue="null">
      <header v="Ngày ký hợp đồng" e="Date Signed"></header>
    </field>

    <field name="ngay_ky_plhd" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" categoryIndex="1">
      <header v="Ngày ký" e="Date Signed"></header>
    </field>
    <field name="so_ld" clientDefault="Default" categoryIndex="1" dataFormatString="@upperCaseFormat">
      <header v="Số sổ lao động" e="Labor Book No."></header>
      <items style="Mask"/>
    </field>
    <field name="so_ngay_cap" clientDefault="Default" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày cấp sổ" e="Date of Issue"></header>
    </field>
    <field name="so_noi_cap" clientDefault="Default" categoryIndex="1">
      <header v="Nơi cấp sổ" e="Place of Issue"></header>
    </field>
    <field name="noi_dung_td" clientDefault="Default" categoryIndex="1">
      <header v="Nội dung thay đổi" e="New contents"></header>
    </field>
    <field name="noi_dung_td2" clientDefault="Default" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="thoi_gian_th" clientDefault="Default" categoryIndex="1">
      <header v="Thời gian thực hiện" e="Effective Period"></header>
    </field>
    <field name="thoi_gian_th2" clientDefault="Default" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" align="left" external="true" defaultValue="null" categoryIndex="9">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="noi_sinh" external="true" defaultValue="''" categoryIndex="9">
      <header v="Nơi sinh" e="Place of Birth"></header>
    </field>
    <field name="dia_chi_th_tru" categoryIndex="9">
      <header v="Hộ khẩu" e="Permanent Residence"></header>
    </field>
    <field name="cmnd_so" categoryIndex="9">
      <header v="Số CMND/Hộ chiếu" e="ID Card/ Passport No."></header>
    </field>
    <field name="cmnd_ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="9">
      <header v="Ngày cấp" e="Date of Issue"></header>
    </field>
    <field name="cmnd_noi_cap" categoryIndex="9">
      <header v="Nơi cấp" e="Place of Issue"></header>
    </field>
    <field name="nghe_nghiep" clientDefault="Default" categoryIndex="-1">
      <header v="Nghề nghiệp" e="Occupation"></header>
    </field>
    <field name="nghe_nghiep2" clientDefault="Default" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="160">
      <item value="120, 30, 70, 111, 8, 100, 111, 0, 0"/>
      <item value="110100-1: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="110-----: [so_plhd].Label, [so_plhd]"/>
      <item value="110----1: [ma_so_hdld].Label, [ma_so_hdld], [so_hdld]"/>
      <item value="110-----: [ngay_ky_hd].Label, [ngay_ky_hd]"/>

      <item value="110-----: [ngay_ky_plhd].Label, [ngay_ky_plhd]"/>
      <item value="110-----: [so_ld].Label, [so_ld]"/>
      <item value="110-----: [so_ngay_cap].Label, [so_ngay_cap]"/>
      <item value="11000000: [so_noi_cap].Label, [so_noi_cap]"/>
      <item value="1100-10-: [noi_dung_td].Label, [noi_dung_td], [noi_dung_td2]"/>
      <item value="1100-10-: [thoi_gian_th].Label, [thoi_gian_th], [thoi_gian_th2]"/>

      <item value="110----1: [ngay_sinh].Label, [ngay_sinh], [ten_bp%l]"/>
      <item value="11000000: [noi_sinh].Label, [noi_sinh]"/>
      <item value="11000000: [dia_chi_th_tru].Label, [dia_chi_th_tru]"/>
      <item value="110-----: [cmnd_so].Label, [cmnd_so]"/>
      <item value="110-----: [cmnd_ngay_hl].Label, [cmnd_ngay_hl]"/>
      <item value="11000000: [cmnd_noi_cap].Label, [cmnd_noi_cap]"/>

      <item value="1100-10-: [nghe_nghiep].Label, [nghe_nghiep], [nghe_nghiep2]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 111, 8, 100, 111, 0, 0">
          <header v="Thông tin chung" e="General Information"/>
        </category>
        <category index="9" columns="120, 30, 70, 100, 100, 130, 0, 0">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxCxZR7zNcUYP0J1E6QPJ/wWs0pK8C+6FnVBSxau+jmAkMeFxF2Tde7MVn9+fDygVEipSAy51w7motdfe4jxEzEIOjlk84ZXro9osFsj+BI/</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxAyLajNmZUQ7d66BVIEEKdcdlJF3oUHTG/Hd3NN4kfszgH1Z915dF6CiGZY84Akresclfx2XQGseitl0A25/vN8XF1PmWSRfHyF+57asebw</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxrXLmZhYYpuGME5lnLB2A0pEp4H8v28UlUYxhH81d37FeiDstNC9eDEx5Hp+8oX7sIYM1NtpPBvbSTNy048y8iO3NXIAv8CBGldRaWoAq2+</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TLfoWKwwcQ/O7FyNadU2tk1CUaqVq1aM8LqGcoVzj0z1JFFV8g39ZGJS0+4zQHeSBDqpeES9HzATCJNS4Te8dR5NdHS81zYZKVeWvWIIV+jcNmz7f1/AhPlMiIm9w+os+m+Y2GZqfNXMoLBohy2074t+tkDQyRfdLpvsuFVAnmjG+nrI5Jpzdyv1ilJzVO97l9lvEvlXcka+IjOhFaeuAMIpXoo24yXDxNfKpLNKM96p3Bq3dWlHF3wd7+Idklt2Wc449qPMNdTo8wRDBGURmi1mXKB1RcmgqUHFC/0JPyBIB4CrGleuzo+CBDrD3aKs2UjwPbXxmF5oX/RkoPRTADDgJZUsItRPIFNyyQnxDdEkcIbzbkQUsCuOjz49fFLMjN+phsfyFuFJSD7pFbF0XqVWIWviMTd1jS8hxJWNLz2vWAuQZRCYTSlXcBtF2N6LDacvbBZ7P4bjSfp7YHY/rBhJddBzk06yjrOMjfAoujKTgycVf5BJkfcY2kYp26qnA==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/ct00KRyBKqMo03863w96E/5jstyKrQFf2dUR2ADmpQZyZqrplZcYYW1RtM15ThmtVS5rxvEIQ0a2s/OuDbVfC8cpktWzdg5Nd7/6CD+vloiRycpuUSTuadIdVBCFOdEpQ1xqh4GYwpCV6dWWVeTyVUZbfxvDM7vNNHZpRFRyRsu+aIcfW5tvBL8qG2ssbP+PostvGMIBn7Nz8orMlVuiqX/8O9PY1i1nW6BEuJI5ilYL8wAoFRP69Lv7UgQ7wp23rr2z0Vr2+uW6JdxM5QJYjQjhHSHYlzpfaL62i6r2Kd36EDaPL1wGOMMVlUmzznnV86LF3G6S54IZXIHzUrkx9d4scv4e52pSenbatTau9vk7g==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0ob5zXQy72Mi8+VsqJ5Q29QObARM6N47uIEYkTdVkvgdAqkXHGsLsIHHhDhfWidHgrpCHGikvgFkHmD9tytuv1yAFBJlEEoEYSP3MDlaNBi7qNHTddPO6MjSjDNg/IjFOzQCIMCY+CJMSOx/QX990qnwiwDveHTgVrEQlKa31BDf/MAv9yK54FhHtROW2M6rbCej2PtGfOkakuNeiZbYIg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%cuXNkLI/9J0no/A5pPbabpf0AQyetWdN/zNcTpAiAHT2kbCElDjMUH1JWlOzbX4n7dXElil6WVxebTA09gxhBKQJskU80aVjRlKL7GzUa5z/yLWhVBAtU0B7Dnw3frUxEvlaqbRYKgM3f5inKK/veeuqm7Yp0/j5rjlr9OTYtjQ/DSqJ0MDQhXAzJ8RYTpZRR01HSdeKO3+0RadlpnNaOf2pScctNSFtAh7UAHrZ/ZSC5CZBHxLL81STyKwqFbhejwlRO6ySm8kWAyoxgaGFs+QGG+TyXU+8vkbtFEG9geWVn/+wULcjcuq0jJX5hl5/am/qB5Tm6AEhmzXHnveLUrNXdT0v7oqLd7j+HnBYXzE=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberoa6jRl0HozQ9/2em7TRgaM/2Eg7xuowOjSgSEp3yOKnpm8FoYTu4nlRabMHpY5rA==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D8gsCyrwe8q0mepelHgZtMuNNQIcaUmShEihMH87pivBo8vjr3ptzK2J0LiPiZp+iZNRT3LtpAKdLnVK3sIQ0yUNFMIRW3LBZek7V7j33MOGDb0Kjtx9VVppokPSK1N57FoIuRNzV4hoeV5BkEpz56JnlX2RjKejrsDbvuIyqOpjhJIUibxIZHHaKU7SYsp+sPS24fQkW1jrvvSxPHkcWN+8teqdbuphaMoFxmOo8nuCuuYWi18BfcFaHgwykJQzaxBLxwujikEohNfWd88zXTBDa2qScFPCwikX5wpf6hJ3QhUCRMTuh96+/n8CYqHcsdtrb2ks8mMMaS+UJxe/2Vfv/k3lUZqjXpmq3vZNunuoNpZ/onKoUhdc4jd2K4YzniJ4kSbEGn4RxmtIh54HWDrCmyQl8427/WU3nMDEOFfKF6EY8QJfTy4hENsXbid34v0an0RkJopw38prxWWLSk7j+OfAh4iU0DnaSVD/tHUL4XtpixXCGkDhx6Tm5gGPp/Y1lBbZcDOXTDcZAJCpdZlEf9GDMmgwuiJWYS96HSGwSbvwJmfxHsHdOjeqKK/SUGMI74zgmkXkqgoRo5Zs0VeVsEdG+RWuuECPJ2PEE3MBRLe1+ILGGOE8Spcyx2/rALuzcZrsvpkSTHOIWMxqP8vESho2Q3aNpj76CPNoBk89kPMmzz+cUW433KRjn9RDgA3foa8GBjtanl9xMxpzJNBUqJb8XavSlVr0hpbtd25hWF9tQ5DFVWWHoTh7tjyoEW8UHQoPa7xLvgOjQ1N5zNR1hRsc+8jXQWQy5SaXK8uaX91MwjY3ORJOjMg1Y0GKI6Nx2+01T4XMRRkIXt7vhmAJvvKw2MVNdDNuIfklLgfFm+fADidWYDZ8OJeVVGT4+XgbnJdhqteuJ4AmTVrkpzx+lIEy9295YicFRygrwBzukMxsq8fGwVWaJF3ZlWQsG2rY2CpTX5WWfd2mInh2K8=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="IDNumber">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6Wdyk9aPi/fGimY6rlT0N8nVAGzan76LcTwu5Z5TgGNcBqKLEU9wRjw9uy0XNP4941yxo2A9vFCYqn36IAKVtdZUm6fKLl/yFkgq6PYbtqHNNyA66r/2jY0goZCXdy6eBkLx0Nvd2+MUm1Jw5ch+szkjKszblJmkB1JdezeGZD5AHTOqR/SED0jUk1BdzIPV0eEMqGoUrvanGGK8CyIw/HEHU6SIC9WzW13ZS8nv3i0qMPVe5ESOAwXcUUlYqmd7psSAP4TZ0iPA0/T9Ymu+fT2dOT+5s6AyrKMpnz/xtExwfHt+lGD0YcOk0c7SrQxNSFxSvom+XAjgVkJHv4Sjdu4pO0GhOuuWd4XCunmZscFFEFbsVVvDKOshD92P4C8l8GNRRRgiEfZrbz49BRPbOzEWUGHHH+HSt9HB9tDtnLhlb6DkHSFReK0N+tCxqWJgKF2NEcXs8aNn5w2anQ/Ee8e0Kv/M89R2bpRL/PSxfRxlijDWVRlM24U6QHt9uwv5p5Zr3/OEhajuhhERh3TcsUkp6nau4pWwEr63dSm0Jdsu7c23xBRNNUFwORJPN0mJ195WzCy7bYht0OciqNWR2kb/+GbfPp3YkOhG/rkIpREk1Vbu+7RjKG3EzAuNGDj6o=</encrypted>]]>
      </text>
    </action>

    <action id="LaborContract">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK7BP1NkyP6ZFTsR15j3lFY2TVEqP6Ah7IdAAn0FhDdfMHreT7YrVNE3qfDVXmiFa6sLkGgWTbVsoZfq7btxp4XYTChn6CZuWRiMxbARIMdgWjwHnhGzzXPXEbW7r9ZWXYrNksfFVtNhZdrS1TjWjvXCOuMB6aK4HnC+TSftilGiLA==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>