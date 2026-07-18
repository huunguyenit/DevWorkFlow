<?xml version="1.0" encoding="utf-8"?>

<dir table="hrtthd" code="ma_dvcs" order="ma_dvcs" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin chung hợp đồng" e="Labor Contract General Information"></title>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l" />
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dai_dien" allowNulls="false">
      <header v="Người đại diện" e="Representative"></header>
    </field>
    <field name="quoc_tich" allowNulls="false" clientDefault="Default">
      <header v="Quốc tịch" e="Nationality"></header>
      <items style="AutoComplete" controller="hrNationality" reference="ten_qt%l" key="status ='1'" check="1=1" information="ma_qt$dmqt.ten_qt%l" new="Nationality"/>
    </field>
    <field name="ten_qt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>

    <field name="chuc_vu" allowNulls="false">
      <header v="Chức vụ" e="Position"></header>
    </field>
    <field name="chuc_vu2">
      <header v="" e=""></header>
    </field>
    <field name="dai_dien_cty">
      <header v="Đại diện cho" e="On behalf of"></header>
    </field>
    <field name="dai_dien_cty2">
      <header v="" e=""></header>
    </field>
    <field name="dia_chi">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="dia_chi2">
      <header v="" e=""></header>
    </field>
    <field name="dien_thoai">
      <header v="Điện thoại" e="Telephone"></header>
    </field>

    <field name="ht_tra_lg" clientDefault="Default">
      <header v="Hình thức trả lương" e="Form of Payment"></header>
    </field>
    <field name="ht_tra_lg2" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="tg_tra_lg" clientDefault="Default">
      <header v="Thời gian trả lương" e="Payment Time"></header>
    </field>
    <field name="tg_tra_lg2" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="cd_nang_lg" clientDefault="Default">
      <header v="Chế độ nâng lương" e="Salary Review"></header>
    </field>
    <field name="cd_nang_lg2" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="cd_nghi" clientDefault="Default">
      <header v="Chế độ nghỉ ngơi" e="Annual Holidays"></header>
    </field>
    <field name="cd_nghi2" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="ty_le_bh" clientDefault="Default">
      <header v="Bảo hiểm" e="Insurance"></header>
    </field>
    <field name="ty_le_bh2" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="cd_dao_tao" clientDefault="Default">
      <header v="Chế độ đào tạo" e="Training"></header>
    </field>
    <field name="cd_dao_tao2" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="boi_thuong" clientDefault="Default">
      <header v="Bồi thường vi phạm" e="Violation Compensation"></header>
    </field>
    <field name="boi_thuong2" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="noi_lap" clientDefault="Default">
      <header v="Nơi lập hợp đồng" e="Created at"></header>
    </field>
    <field name="noi_lap2" clientDefault="Default">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 111, 8, 211"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1100--: [dai_dien].Label, [dai_dien]"/>
      <item value="110100: [quoc_tich].Label, [quoc_tich], [ten_qt%l]"/>
      <item value="1100-1: [chuc_vu].Label, [chuc_vu], [chuc_vu2]"/>
      <item value="1100-1: [dai_dien_cty].Label, [dai_dien_cty], [dai_dien_cty2]"/>
      <item value="1100-1: [dia_chi].Label, [dia_chi], [dia_chi2]"/>
      <item value="110--: [dien_thoai].Label, [dien_thoai]"/>

      <item value="1100-1: [ht_tra_lg].Label, [ht_tra_lg], [ht_tra_lg2]"/>
      <item value="1100-1: [tg_tra_lg].Label, [tg_tra_lg], [tg_tra_lg2]"/>
      <item value="1100-1: [cd_nang_lg].Label, [cd_nang_lg], [cd_nang_lg2]"/>
      <item value="1100-1: [cd_nghi].Label, [cd_nghi], [cd_nghi2]"/>
      <item value="1100-1: [ty_le_bh].Label, [ty_le_bh], [ty_le_bh2]"/>
      <item value="1100-1: [cd_dao_tao].Label, [cd_dao_tao], [cd_dao_tao2]"/>
      <item value="1100-1: [boi_thuong].Label, [boi_thuong], [boi_thuong2]"/>
      <item value="1100-1: [noi_lap].Label, [noi_lap], [noi_lap2]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZgJkw7M0ADa6mad427Rdou7rbij1W55cpzU2s4UlFXzHSBYbk4laDHPQjprcPQF2dZOjXNrLv6iYeKDkWpRYdUlHlVWyOdfHjGQfjZ2XkqYKfbJixhAqFuyE7RUpXK1wv99ZzPzF+RZn6SL/krNKbmDITleKULJv1HFKXvy9+ViRa/OayP8RIvOWHsgHquByE8udUk9CnaVVL9QAnsE6sOt8zFuLE2ML34I4Xg496tva3FOAHFgIuNU4wuqzxyhr+QtkjIC2SWgrmyAYQbI2bMaXYXn5ouqFYdWx2UU2h0fCeD3sif1U36JSrrjZbxS7w=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cuz/rdDKk2I9EPY7ll46pVabieLqdaXGxH+xpMMSOBv05JalWAwcu/kVHoDpubOpqj5Vh5RY4k+ye4gphiitjhsdptgE3zP7ipLws9V6bGC4udUf54GqqnnXJI+T32RMG/+PGEdoINgJbeVo9+vtYqEa7wVsxNUmLMFZ4WpbKOjXaGdJ5+W/ZoX11c+K6IeDO+nboMNHCUSGFecCoO2KXEHpM1FZupfkYW7VtHh1JIt8Shjyzm3Ex1ug9DJgX9Gyyfc2TKMXoZxMR2iu2keazcU34h7JFNqY81MGNr0DNsiKXlpCtbORfFbLHYBNLpYZrgiXLkzdTcCiYFfkM7BwDjUn/S95EsCuoJb9i2KXq5j4A==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nqEOUNbI9lariN7rzgxpkBnssANVidGjYnXi0SZ7GDfSoTzFkSfXd1XkBh28u8Y0+JPmhQxOm2GPCa4lXt3sy2TcJDu6OHDreryBeCn4YeOHciU8oxEhoBj+qf/71QHHruL3TeXx5iyAzuwWdjW82LEpvH0IdI/9ZMogpePiVU6A=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%cuXNkLI/9J0no/A5pPbabpf0AQyetWdN/zNcTpAiAHT2kbCElDjMUH1JWlOzbX4nBlzHaxzH4ppb+d2pY6K8Zpv7naSs9KDpNXWWPmGcQDDnT05v2wPuo2UnCyNlgXX0O10zeIpAXr3VtnFrHl8ro4U5Kx3aYVD+sYdpV0mb8LxD+j1fCXQtRi9VaS3tRjG0JE7fWylHTH1fseJlgM5t5wvccWdszH+VhSRRLGm9neVPcyLh9JK9o6vnKilMrZT0LjCxLVOttCVLXE01yq3ipQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeuQkjfwNNbUg9TmXvW/awhgSSH4yt4a4mTJ7prLX2Lm2</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70L5vfJMQUexDNLp5uJYiTf7KYZ9RDOnYk3zihRhfYjvSVXwsWAoWqH3u1HdiK00lihu33cES9Sx9OjODLiGwcs3WswAmBCQDsvsT8RUxNwY/yAlUF6yN755+LhZBit6pFykWr0IpEi0WKKn+1ocrHwcHe+Ow2JqvoyrrcGD9MEtI0MIW7jswkz7xJp4Y0AbnC9SFYtrUyJh1lJKL0RpOBRA=</encrypted>]]>
    </text>
  </script>

</dir>