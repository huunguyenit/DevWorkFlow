<?xml version="1.0" encoding="utf-8"?>

<dir table="hrccdk" code="nam, stt_rec_nv, ma_cc, ngay_hh0" order="nam, stt_rec_nv, ma_cc, ngay_hh0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="công cụ, dụng cụ sử dụng đầu kỳ" e="Tool &amp; Supply Opening Quantity"></title>
  <fields>
    <field name="stt_rec_nv" isPrimaryKey="true" disabled="true">
      <header v="" e=""></header>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" readOnly="true" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVCmRx6vpey6ZpM8tUTBpO0VsP1+xLWXyJrtfZ/R+a4HNbbw1w6bc/9LWskZehnINw==</encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_cc" isPrimaryKey="true" allowNulls="false" allowContain="true">
      <header v="Công cụ" e="Tool &amp; Supply"></header>
      <items style="AutoComplete" controller ="hrTSList" key="status=1" check="1=1" reference="ten_cc%l" information="ma_cc$hrcc.ten_cc%l"></items>
    </field>
    <field name="ten_cc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_hh" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hết hạn" e="Expiry Date"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVCmRx6vpey6ZpM8tUTBpO3/dIhlzKL+40NYjqdQYLyp+QMkG32Yb3zy43PAlF28+g==</encrypted>]]></clientScript>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="ngay_hh0" isPrimaryKey="true" disabled="true">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101001: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec_nv]"/>
      <item value="1101001: [ma_cc].Label, [ma_cc], [ten_cc%l], [nam]"/>
      <item value="110: [so_luong].Label, [so_luong]"/>
      <item value="110: [ngay_hh].Label, [ngay_hh]"/>
      <item value="1100001: [ghi_chu].Label, [ghi_chu], [ngay_hh0]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHY1X8UtDmCQxRKhh6aOFgFa3q8t4B29WBmoXEwhwbrorq85dMEUc4bpMtnUsVtRy/4PaQa4WdLJbu465SienBIMooyD0L+DA9rH+kDpafj1WPBbjthRGjw/EDKZyhrSDXmFtgab60Rn/sghDpG4MO5ZP8+U5oSjo0sNU4mKSocViNmuckKP+CVP3v6Uad4Ut2Q=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHY1X8UtDmCQxRKhh6aOFgFa3q8t4B29WBmoXEwhwbrorq85dMEUc4bpMtnUsVtRy/4PaQa4WdLJbu465SienBIMooyD0L+DA9rH+kDpafj1WF7HwGqSaxe4Trj32FZ4PeVsom0fWjdOrXfuBuP/Vt057pQQ3AlXQb4maEYfxyBinW22aEGU4RAXCL1kmsRPyX0=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzEp+Wwpz9WFbS9qn2vXwT02+g6wQ6cIrPIu7mC2P8DHD7efP+bM30lLlrpqsQSBMmCm0qS4P+dpIxBF6FAZ1rQ=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulidlfppHwj/13UD+6SfFokqBdbLJ5orK2Kci2zw6k1CrROr1HuyqFkl528RowpSNlNj7Uq9P5v7hMnCstuz0ho4Wlzn1Q0UdgP57E+4cSBaEyXX7d8hXykuCsDU43Z7Ria/6L7OSWsJLUTdHVrxnDo/bA6woo9sHj6MA75T4tyqQBLmAyRBp7nQPPh8kmRP5UEXVEwwWlHW3XLcFwroCdhVjB10oYTzoE7WEFDrMgnhOB68O6yoTLhLtfQnleyu9mKyfnDJFwkZH/uRtON8hc18hRqIyz5PcKsIZMpaOFhfLdotIbSB1PN9APC79dknu6wxFH0qSUYXjYxHZwWBHteJkPn42y0K/RO82q4xcijIDtfv6av7cyAqM+4aSk5z3S7</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TLfoWKwwcQ/O7FyNadU2tk1CUaqVq1aM8LqGcoVzj0zCGhcc+UWrIUk8TFYAscunj2k/01lWOaKl3CrePVFnqtcTjVKMchOPj4UYvW77m9s0tz9DJh0HEmIXcRcZG19q2NKrz68t1vGr9/xtCuGRzPxBeOAFz46zLyYX8bLlh2/rLAa/Rd+GOMMQKxloUrmhQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82na4MSkFNDZZNhDT3Y97+mdK/kz/fSmWgwm2S/CF0r8nRo5KoZXvpnR6uA3eDxXogAPoNjscfw6wjll7sxbDwAH64iyUB18JiRFR1Rqy+3J5XA4//shXURpCLHvlzrKRKxIx9ELL8hvLLbeHbGYWhln0OFNd+TPGy/K1qng5cRK8/HS4HrHybPBHtLjHHZy3Fym7N3Rb9aB5mD7/siLgBwj5YBDrcVT3NR3M4NRJSKHyDyhGpFCWCSL4HhQkasWfaL</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jMimkyiXTat+dRl8N0eGBclKNBgAVvptb+US5UEYVM7uKPH1cDJ++5XrNf3gDFAQW7jfTZI34rJXHX6zTM29Aq6JItd4sZbNuuQGOUMwblQXDnOaKBEw0362xHpLt1X0bwuaprW7beHriaSE8uXz+zxb67AWtjjOCig3JRwKXpYUwBE4lQscMUTI3WU9TjVGzf1y00EFZoWSjksG251+lXRViYJFgV6Z6r5NNeHUBLBA6/2qz9WacyRWZDeYg54vO2J4/TYbQIQ+FyI/9fbO/aEl/Wipx7OEonjXO+6eMx5ddrQ5a8MlOHI7xXlztCSkb6A4W9qhJ9kMTQTMN04zgyw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeoIveB64Gsf9nnJckknY+g5EqjFy9sKqO46itQ4KT/KU5Bp6wXmb5ZGkOtQn5WaPWXqTjj0MqCYN6rXNaW0yy0s=</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GMMAYfzQwLz7OjeeRVsBZqUpVOwlnejVKrBoIr3p+wEj54I3+pU+nf38CANEVRRRq3dgbqdKjWNeevtph/Kgi0tzDDDMbSrxs1AGNinQvpjsPtdZQgCj/sSOhonPk+XDy94ynCxDzEbLhMkBiBymRNB7Q3E/uAuPtmMfnmiOmXsUtPnV22ddro3sX3jldSo92IbYLBYwQM8baJezIqI0EL3zqxzaNoYxq1XVjBZ5bRPhPcKeDJwyN3aEfXjLiNYDOt/t0oFV3tedN6GpfmCumIq0j1Y0C9RM/SqwPxsqUzyRIjk31u8yWHkv33uRw32AJ8IrLwVVT5mcIr/tUAdxQlQbFEH2xBhG4wRhqwlfPFAcH3ZgcLzk43CoYwENFOUQn8mA7W+3KfiOiT7XClhI+1OOucbp9fVgxkwDYu41vhNRrYrH3bEPXEzmaTgMGdV6qXUKveaT+/2z2CkCL24cX62S6P7zlq7hXFCjqx2G1XdnaeeLUt4DB80xJbPCsrZtIbbDLRkAa5cSke4axrMFeLSFgjCIpa54/yVcesOSB38KoEzSkAC9M6Hky9Nf0b7bqv8sbzKtc8NGy+u9HNZOzzuFBo+/mXh3LRmoYZmARv+CsVe+bE4VYLaIr9elFNReucEEKrtirtkSsXXinCa0YI=</encrypted>]]>
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
