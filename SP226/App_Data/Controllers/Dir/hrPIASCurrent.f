<?xml version="1.0" encoding="utf-8"?>

<dir table="hreqtlkdht" code="stt_rec, stt_rec0" order="stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin lương hiện tại" e="Current Salary Information"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true" allowNulls="false">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày bắt đầu" e="Start Date"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQqH2PFj6y805gxzFR2cjceLqIcOFm/KYHgSpT6bCJk83GNVHtv4RUIa9mWGt4A5emPxRdIY2S9i6vEqXonfp2w=</encrypted>]]></clientScript>
    </field>
    <field name="ma_nt" allowNulls="false">
      <header v="Loại tiền" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" key="status = 1" check="1 = 1" reference="ten_nt%l" information="ma_nt$dmnt.ten_nt%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQqH2PFj6y805gxzFR2cjceLqIcOFm/KYHgSpT6bCJk83GNVHtv4RUIa9mWGt4A5emPxRdIY2S9i6vEqXonfp2w=</encrypted>]]></clientScript>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tinh_chat" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false">
      <header v="Tính chất" e="Nature"></header>
      <footer v="1 - Chính thức, 2 - Thử việc" e="1 - Official, 2 - Probationary"></footer>
      <items style="Mask"/>
    </field>
    <field name="he_so" type="Decimal" dataFormatString="##0.00">
      <header v="Hệ số lương" e="Salary Coefficient"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQqH2PFj6y805gxzFR2cjcfjgUqflUJSiJIMc9BEb/Z7Mo5/zw1o6WWSQMc/CDYlHH8Xbopv+9GBKix3JbtZDurGha8592FkOmklp5qXslsz</encrypted>]]></clientScript>
    </field>
    <field name="luong_co_ban" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Lương cơ bản" e="Basic Salary"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQqH2PFj6y805gxzFR2cjcdX4cc+d2clHuYyZBep507yyKXPbkRg7MACXXs+8KHjxIXZGBTGU27mDGEWB9DswCA=</encrypted>]]></clientScript>
    </field>
    <field name="hs_phu_cap1" type="Decimal" dataFormatString="##0.00">
      <header v="Hệ số phụ cấp 1" e="Allowance Coeff. 1"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQqH2PFj6y805gxzFR2cjcfjgUqflUJSiJIMc9BEb/Z771YZYOExFfg5d5SBYjRnPCAEq14Z9rGpDsPZljgw5gvM0JB2YAm++9XVmlQoznHm</encrypted>]]></clientScript>
    </field>
    <field name="tien_phu_cap1" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Tiền phụ cấp 1" e="Allowance Amount 1"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQqH2PFj6y805gxzFR2cjcdX4cc+d2clHuYyZBep507yyKXPbkRg7MACXXs+8KHjxIXZGBTGU27mDGEWB9DswCA=</encrypted>]]></clientScript>
    </field>
    <field name="hs_phu_cap2" type="Decimal" dataFormatString="##0.00">
      <header v="Hệ số phụ cấp 2" e="Allowance Coeff. 2"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQqH2PFj6y805gxzFR2cjcfjgUqflUJSiJIMc9BEb/Z771YZYOExFfg5d5SBYjRnPIaS4ibmpDo/nQEQMEnBDeUv3lTG3b+1Gg4ywm6vwg2A</encrypted>]]></clientScript>
    </field>
    <field name="tien_phu_cap2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Tiền phụ cấp 2" e="Allowance Amount 2"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQqH2PFj6y805gxzFR2cjcdX4cc+d2clHuYyZBep507yyKXPbkRg7MACXXs+8KHjxIXZGBTGU27mDGEWB9DswCA=</encrypted>]]></clientScript>
    </field>
    <field name="hs_phu_cap3" type="Decimal" dataFormatString="##0.00">
      <header v="Hệ số phụ cấp 3" e="Allowance Coeff. 3"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQqH2PFj6y805gxzFR2cjcfjgUqflUJSiJIMc9BEb/Z771YZYOExFfg5d5SBYjRnPMyX89LCQcwCscmcMxGDAUds8GaAgs3wpJHO0u/w48vI</encrypted>]]></clientScript>
    </field>
    <field name="tien_phu_cap3" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Tiền phụ cấp 3" e="Allowance Amount 3"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQqH2PFj6y805gxzFR2cjcdX4cc+d2clHuYyZBep507y3GdoVJvs6u846xj9BVLoOPmsUnufyKmpEahkIqPK4Bs=</encrypted>]]></clientScript>
    </field>
    <field name="t_tien_phu_cap" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Tổng tiền phụ cấp" e="Total Allowance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQqH2PFj6y805gxzFR2cjce3rzZd6ZCdD1BTeFr1kKIfbRxD8GYH2Tl/fxwh4Hm4eGQ9U39M2HZ5siV5STgKHaA=</encrypted>]]></clientScript>
    </field>
    <field name="t_thu_nhap" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Tổng thu nhập" e="Total Income"></header>
      <items style="Numeric"/>
    </field>
    <field name="ly_do">
      <header v="Lý do thay đổi" e="Reason for Change"></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="ten_tc%l" external="true" hidden="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="luong_tt" external="true" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" hidden="true" defaultValue="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="110---1: [ngay_bd].Label, [ngay_bd], [stt_rec]"/>
      <item value="11010011: [ma_nt].Label, [ma_nt], [ten_nt%l], [stt_rec0], [line_nbr]"/>
      <item value="111000: [tinh_chat].Label, [tinh_chat], [tinh_chat].Description"/>
      <item value="110---1: [he_so].Label, [he_so], [luong_tt]"/>
      <item value="110: [luong_co_ban].Label, [luong_co_ban]"/>
      <item value="110: [hs_phu_cap1].Label, [hs_phu_cap1]"/>
      <item value="110: [tien_phu_cap1].Label, [tien_phu_cap1]"/>
      <item value="110: [hs_phu_cap2].Label, [hs_phu_cap2]"/>
      <item value="110: [tien_phu_cap2].Label, [tien_phu_cap2]"/>
      <item value="110: [hs_phu_cap3].Label, [hs_phu_cap3]"/>
      <item value="110: [tien_phu_cap3].Label, [tien_phu_cap3]"/>
      <item value="110: [t_tien_phu_cap].Label, [t_tien_phu_cap]"/>
      <item value="110: [t_thu_nhap].Label, [t_thu_nhap]"/>
      <item value="11000: [ly_do].Label, [ly_do]"/>
      <item value="1100001: [ghi_chu].Label, [ghi_chu], [ten_tc%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9NfuaG7i3j7e+c+oQhTXMYAxJVNBx0KLk1Xbs+Pa2K56cjUUP2nZhIUCK9noioBe/HFS7wOSrg7tAng9llqLPSOMpzVI3l6fGx07sjbl+c3PcKhbAJftCovgK9wNJ1b4Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%PqkM3HnrVADZFaHe07aaRaSoDLWuk1fz5yC64DMhrjpFeM+TGtReWMTX0QHoNYG+5v9OBaOVU+NLtcR7om84QpaeiDaBe+oAI2/ydykhVoVpN+gJj8Lx5J3hph0fVQfGHUV/BgEuEUPQkJkROt7x7A==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1DvqYPEGhvkhcFFLA0md0CU8JCl3l8yMlhGiXpYo/WUCRwYNxEegCxDIiPCoxLSBNsOf56dn014yVVUl3KDr5VpIb5ZS/ciAbX52xhfzUnL0pTOkS3sAFpTLWxBcJkpP/lVYunKxh1s3hP6CpDL3NZ9fWNEWB2hvbHW8BZJBrc55X86mIblpt4pG2pCgkI/8AUs+ZcxfwPQZ27x7uvuSbYAYnO+PAXZLCdekwrHYWcPuWBg/Z8yfZU1hLiNIbInIB9+XJLmoQClMaf1gltMw0SI53H7jNXm+1UmIpmaelSajZ0PuiEkXbMc3cGHKTOHWBecIvarqDxLKIJk93AxFeLT1fv7C0yW37WeQuPclAajLT20WxdHL52yxrdBDwhBgLHsOWnkn559DyuPBHkks6RBT642NUqAkA7EhXLEJ2OV</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbRptsr13iekuFddlJY0mM2fK+oF3iRl1qC+7kUXOWfRbMJJ3FfD2ehqzYE9ZPEHqtRZcMnWjPHjLWCKBwTAJvxid7byGHmj5J16Qyn40O1QIS0ZKu1vxGBYeydMpGQgQwQkTi5bc8vMPVskB6crgAzLk8wrDhM8Dpfd+v/1C8xe4unbYKGnCR381ob/+Np3cO7bzgmRlt9WVOf06G/ErLGe9iU97mcYnB3f2LyNPW66Yg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nHj3i4krrIRNEYHuPn1y3sieIq5SdHxIyXrRGeS2/rQH9qQ5qpoDtWZKhpfluZQLqYEBRmsFErTYzMwQBCSYsQIy3MorSVpZexq9X9vBbx3uigAxcUjhd6dT50qDdUsSdzVrPepGMaiVoJhpraDKs2rqC1vPzA2myQc8/XhKdwalwNUMlVhHr3MiMARgQim8VwFlDViPvaUjOxyzHgaZQ8Mt/i/HAEGkluLitGuhROjlL+i2RRR+RBK40/h8WxcI/0ru74q/97DIYO/QhRWFhewo/WdSYCes+olQ8UP6HfVFxfOhMctX0INlbdsEUCisq</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzeUaxPtI2chZ+wuVcUrt9qPM9B6yx8jpXR/ZoD80ElFSlt6aT4RSdwoPh5DOi3usuTiudABnZzu0GPdN557qWH0+CSoFOo8jxJWXu25ld5/LPa4W7yOf9t5v+cn1h/grSIrDPyjWJpucKjA2WD3xadCOuoARabq5NH7fr0SHbTKcduI+snVcV8DHFE03520cbU/FQU244NSRJf6YpxuzO+NBFQm8+Mby6LX3fLdaMZQ</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cUSXeTZYZV+H7Fxc7qoNsKkTI3LamDgLUhmk3enSFtQdsGzwCh9fvXk735JeMyaAcxTcwAl5oEEPnEdoJB72c2YxL5uVRDidv1ZFGXihseckewqcIfePl3uwUIXdFDUclIf0G3qYmTx4QYAJGaknLrA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberoa6jRl0HozQ9/2em7TRgbrTnBkM9V66adsOULFhX3uwVUdM79rWzpaIn1blGcebzDD3QiCeGb7dGLnw8VmbSWUgqToni03OZDsdUnJBiEO2H9ygb/zGNYBOTG8+hgx2feMSROZLce/Jde12TxMLdUmzNKhikoEhkAKlFpX3t98hk3mmgtGuS6PBFvEQRQANW+dCBdChmSbkKMi2S7uUCCK+n4zuixHB5wTemS/nmV4MuyfF+NWRPGoxhPb3KFyqA==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf40pD87bHfbum1c1d69u90pyH9cHJj4xdvXJRMAYOsR+7XT7Xly8b+p2F6iIJxoaprbLA2cmL4/XJeLPWVptHOI=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70BoT2fnsDFeRV5Rc/SUj0vyuIKshmFZkTUO/m3aHnP1i0o+R1mrqmwim13ZXN0EcONLgfCuH3Vd43H6lxBD7E1XQTIg8xpeCqaQzf2Jr3DGuHSI3QEe/IdO94wEDF6J1NR18bmFWtoW52e6gz6L6LIJcwaT4u5O8xT/J0vupAQmXEJAcnsvRPHNiA5Zv9+P2ElpZU25hUSs1n2/mCEFqbV+1g3JPWnYGtV98Xqk937Xqf3+LWW9aBOSpSnCOQWD2gRegFBp7nOnKbGwDlUEuQhhhsklFW15HVDIQpUXWQvOLbFbQ7qAtfSDM6qWuAnjKKTUiE5kgYeO5PQJfMeZE7K9QcVBNSlUth+xNATSD9T3oMDjAbsZMfBWG9+iNPfthZHigwYfGF9apvmutfXE9Y1StU9xpmF9bHj/bQk8rE/NsdtqQXE7BX6zR/Vp/i4OA7NzhBiUXYovi91F4bx0Q12JIAWh1ZQ0tzSM3/rNFBXAyAeZNrb51lwo37XePaeUrgD2Qd3g1ww7opVVTqa67KQS+/GL8Kl/01J4TXdiqflBVlKLRAIVJykKyS4AJRyhXcgSr9fBU0JecRC+VCX94bReslXqteP11ZaHNJ0pVUoGQVR4z2QRuUzyLBawVW+7a53e5aNO2R9VruI762QI/tMoydUp6DSQmOHVsbxnXSAtl01ugxJjlkbqSUifA6KClJSZnLv4NfD+tPar8C9uowcLEJL1+yj04LvW9l00NrnvXttwt79xQccHJngSSAbvYXeTmJCEIsOZXL7WfM+dVtIQ4f0ODO9i0+QQFM/kE97c7hkz8JViRFx80duNfO2FsMHm/x5uf9zEbRT4+Scv6JJhbdovuDfuHcRqXyLucQeGWlA+SHjGwauHev1VK2Eq6UFngFnU+iF8kEGymxIzPFv7k1merNWm4zvIattfOYQK3</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="MinimumSalary">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6dflQzfv/pezEDIAzMv7+Ze9fBdozmh7Ur4Ja9aKMT4+IzM3NISiQp0+m8RFAF2DkcpjbnE8cgIKEQEjCz5zgTu4Vjpr7FTDQQxhxniKV7ZxpIVC7pGTaY/aykicHrrhNTiymdFmFDTCLvOs90ghKcVWh0HGRAgKcpF5yAI0APPp4YuaAFtwTqgoDxpVWb0jsAT++obhdTUICJ1G47IpgIddrXe6m6HSRA8hb6IDHt5J01P8Di5TYaamvuNGqSn1cMVidXbmJw0PaZD8ryXcMqHcm+TwmkqkRsJ680kPdMNvRwL3U/flrFg/j05UMWR/hOwsUHZD8I5fF2B11tkdZ6qxwbHs8O+Xc73NMC0i4g3e</encrypted>]]>
      </text>
    </action>
  </response>

</dir>