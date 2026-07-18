<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY WhenBalanceBeforeEdit "
if @@view = 0 begin
  declare @$checkVoucherUnit varchar(32), @$lockedDate nvarchar(512)
  if @@action = 'Edit' begin
    select @$checkVoucherUnit = ma_dvcs from dmkho where ma_kho = @ma_kho
    if @@admin &lt;&gt; 1 begin
      if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @$checkVoucherUnit and r_edit = 1) begin
        select @message as script, '$NotAuthorized' as message
        return
      end
    end
    select @$lockedDate = case when @@language = 'v' then N'Đã khóa số liệu, kiểm tra lại ngày khóa sổ.' else N'Data is locked, you must modify system locked date.' end
    if exists(select 1 from dmdvcsks where ma_dvcs = @$checkVoucherUnit and year(ngay_ks) >= (select nam_bd from dmstt)) begin
      select @message as script, @$lockedDate as message
      return
    end
  end
end">
  <!ENTITY SiteKey " and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))">
]>

<dir table="cdlo2" code="nam, ma_vt, ma_kho, ma_vi_tri, ma_lo" order="nam, ma_vt, ma_kho, ma_vi_tri, ma_lo" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tồn kho đầu kỳ thực tế" e=" Physical Stock Opening Balance"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" readOnly="true" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_vt" isPrimaryKey="true" allowNulls ="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYrBN+8y/coU/Wwpt8Gu7F0/6je//P29XBx9NhVoDEw+YA2L7/I2Xbsi2PN/h1SdXg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true" allowNulls ="false">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs = @@unit and status = '1'&SiteKey;" check="ma_dvcs = @@unit" information="ma_kho$dmkho.ten_kho%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYrBN+8y/coU/Wwpt8Gu7F0v68+51hJsNwFrfSMtO1AkK/5zj8OKGVPasKS81WALUg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" isPrimaryKey="true" filterSource="Optional">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c[ma_kho]}' and status = '1'" check="ma_kho = '{$%c[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" isPrimaryKey="true" filterSource="Optional">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c[ma_vt]}' and status = '1'" check="ma_vt = '{$%c[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ton00" type="Decimal" dataFormatString="@quantityInputFormat" align="right">
      <header v="Tồn đầu " e="Opening Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="du00" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Dư đầu" e="Opening Balance"></header>
      <items style="Numeric"/>
    </field>
    <field name="du_nt00" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Dư đầu ngoại tệ" e="FC Opening Balance"></header>
      <items style="Numeric"/>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330, 0"/>
      <item value="111: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="111: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="111: [ma_vi_tri].Label, [ma_vi_tri], [ten_vi_tri%l]"/>
      <item value="111: [ma_lo].Label, [ma_lo], [ten_lo%l]"/>
      <item value="111: [ton00].Label, [ton00], [nam]"/>
      <item value="111: [du00].Label, [du00], [lo_yn]"/>
      <item value="1111: [du_nt00].Label, [du_nt00], [vi_tri_yn], [dv_yn]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHY1X8UtDmCQxRKhh6aOFgFa3q8t4B29WBmoXEwhwbrorq85dMEUc4bpMtnUsVtRy/4PaQa4WdLJbu465SienBIMooyD0L+DA9rH+kDpafj1WNYLYi2ny0otxoptFU8zVeLXolcZokkT0h6Nn7sbvDJ1Rqb7shfFJ78YBmvh6fHDyg==</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOmf7U01vaOUFYyufwSdHK2W6CCn75vubM3YY/KtPc0qx33OMOlRSbwHdReWkoGS+4</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzaAVAljzWNpJ0WTf2zklqZzH3jJ83WteQg0XfS12JbsUsC1dq3nUn6lHwjgC9uAHzHQ3TGQIVIZ9N3/8I7mS1V1/9+84nP/1WARr8i345FM</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6RRLqhnDeT1KgypE/7fJWgrl/WobVtEbS29f2d3ETUWYdCqWX1nXftU07WM+3GDaI6GxyRIjQUulLp+CTOgqfzkZbrhNYLgQYpY0vu91vTHYseig/Icfb6zuiXfCURXyfz2Eg95kaDB03aSJleuD27vIq/BInoIQpzKwhQ1t5T48T9HBaEqUlNHXo4KyNegld5Qawd7fODd5BXhFKMlzl0mRNDYRmS/nt1EUxLAPxZJ46Um4r/sETQUcXWJ9GBkyVgZyTQskbsmRMhA/8AgEU825rflKex8xQCe/Se0COJyX</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI4TNPzqTjPmaEhODU346NNS4FRV6lZ30K1BukzjQ9bsf3iWBuDhpCXg5ARuSKpgj3WVKGhA7vHVk04pkFmZm/rZs8rpjbZcBEqlZJGeTlWH985MLLulWf2OXw7w9GDNMWsA2r8QrkLI/9/f4tsYo7/5jun7bA2IQ1eglA4vj/k+p7snLniSUj04GYEoBMeSXofYwC8EcObLATe1L/9ARD4BD0xg/KT71wSZdoeULYtW8FDjVNXtW2oh8AtHHlisHwGUMDdXsd9948HoPCKUUTVJ/FDd39bi2J6OHuZ0Kd4Gi4HxSoK4OYHTcFBmTWKUMjeNQ++S79XITu4pYEagkNCqUXeKq5CaxgIUZcb+ECCuHcvHbnooD+mbhxuxK9nWkWFa4EcrhxiRwFeT5GPTHzBdMabppKlDYJ0uta2FVyRMcAJqWh+AgGzUlogmNbpk5FhGvSr9tAYuetulV2xFmyY8=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nFJssn+cBPm60rXisaJgw0tH2dh1q4WwrBb34Hxf2BazO782SVgQsgtjuGChWHGanjT7wlTPASfyVCGzSNOntrwsBi7NUkYEKDGxrxeO+Rvd9p+SeuS4ywYpepONxjxua/g9s75YX2WDIQ3a6oYIwxwHpiCjEIv8ZjwKxHei8VXcbh5U1Ob4+xf4edj8JxaztBIZvZmqUrUEHkShVunvK4w==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KmRo54ol5vOnEpdrVadgaudPllJrIQFKbo2h8Tf8LMeFawB7OP2smDDoCBiNCRyFznOSYRxy7+nBApozNxBLcy+uVGnc+mDsh2AjoiebgSi7rDtheOFszASuhRF2kTrV7POIK+cI7zz6eg3FRPXdGIN3BWNpTCb/GcQNjbwHM0G3</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHbjveXsmJ4pkjBvMl7kGE81gubBe0B1ueTRifxICBajjbI6W/ugeN69pPDapP/wq2FbcE6VfmlW+PiJHkKDHL6L+xrWhF9fZMPA8dbX3GbvaoO9t/PwgrQBh2f7YbO8BOk8s9ykxcGqWsX05cei8VVYWi3+Dp8eTzY0/c5e+dsb3j1twx7aH38u0gbaSHacw63pU1UwZlveb9bI6k12VQQXx1cg2J9tYbGfEdfArwEK4e4kns54FRn4xXQF+MVBjkz1jAKp6s+MiFg9HJxoVP+A4C5nI+ufAwDO24NHK6V9AV0DXrKYQO18sip6C6pf4l/ogDrSIbeW39hXy1xJivgXGcB6odeMLsTFoDU+TgwZjdg8ca7nnEGZIupNJF/R2o5di8ECxOMq8wXH7yyUag2hQf9uzrQ+IyDAqOt6e5o4=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbev+SPD20ydJUl3KFBhnojPBuR5nFl0phMPj+z6QNEOOjhmwT2oawoOi+tFKQrlaN8sWLGEFrOCKljXKAXyvAkO8R3ccTmMeBzqNeb4BLqt4Ehtd+OK8Qv7USWDf29sTDDDs86j/ElAMS8uJlFdR2rYXQNUvl3MCUil+wejvKWde+NrXcuqUMITtCeW8btVGRqs7qZNBYMM+RBQSbEVFXz8F3Q8IXI9y8JDNw6V7v1sWbYadpwUb8A0dfOUkO/PORnQ==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bMRBc3PwiCOabpkm3Xd3MfOXkj5CgPtPwkn224gO1AfwQrv9u7uTyruPUzUE+P6XOt2/imEA2h4Bq0FPEPCx/LJhQaUPBu22BYehi5xMBK0zr9esqcGJAhYCFE+jCmqTZTlERf5N9mluDwBvVxO8Ic+HqHokMKcJ7mkV8nIb+6w15xXXm3C03tvTQ0HqsdO/UmJsRd/UMeVyIyLPX1ZmjeISCSGX6bxSgBwZSpual/aiUafDjuxPLWCh7JZN0EgobQ/rSH1HplDwB6VoNfdNQ3Fx2LaL65Lgv8G8JL6E07sAtwbjs9mzJJ+xNNC4kvbDVPUdZnp+K6po0QKn8T5T16G3LeDQrD6rW0dVJoy5NejmTnHYx/ONUJtJWHm9p3ZLSPKHXgRQJxj1h0R0NVJAdI0oZ0+XEu7nNrzoIHcnqpJSa+UUIfs6s573X6ry1Bg8EUrthiXhC5EPkSdTrAJ9r1PyAEE5uaKHDB1GCfk0oaBO9L4W9GPl8ajM1ONE7iMhxCCEUhU741x+OM0fwdlUht8YDcM/KzKxApaNiQuccPm1oXArO/7yLdUparX362HGXeC4TSnDbfw7c4h4EQ0Ty0zAY2YIkljScK+Jjg/hfbqCgBlJalKyEGQ0HrtNrSGVz4hQAjlE1H5MNMH4uWD0N4=</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KmRo54ol5vOnEpdrVadgaudPllJrIQFKbo2h8Tf8LMeFawB7OP2smDDoCBiNCRyFzijHwsofmz4uG+p4vNkqeqXuFUS9jcM6FX9rlphjJ5qw</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FU+vVRD9MAiT40fyPJ1UwGdim7Q8gl1GwVC4I8h3cEHPmcPjd/wy/0rsPnyCO0h+GkYJAHNl0D0L7BDw9ngMDLA+tkeRNhpF75vR3BortSiAe4caZI9AapOpSjM7IHy0/F/Xd2jLftflRqw+C2exSq4aLujMqWTx3eeBQQHJI/Srq3GmNpRl368IQcysDYFvN18GAPVDuSACvRGTTgPGrm9J5YuOqPTDRsvssrCvzD5qgY/dqxOP1RgIcyDgHrMWUDivqQzS2PDzWRJNURtmbS77AOu5R22XEUv83/DdU9OP11+gLUbnLfmzrteXInl+JtUjFOJPbNT52kCKbiWZmOy0QkgGBn8Pu7ZbvLTKp/q9Ic0zXYoYnSrtueIQlnMWX88674LwycEO/AshJvQRqbGkefC5Zdux4R5i09M5/NZExXNwyKX/JEFU6QKWv4/mYe2lZtp2WhgbfNqjs0fAXC9h7TjwaWv4eKAxvzLlnTkTtJZL8MVNp+V4aaEHQB8O8QIxcvNk0TG1h4qG8QvsJKj6cU0c8x7uabW03H2EeI7GYAOEGgwwUP+KZ5Mq7rtKOQc78DLyBkYFdymU4D7OQjpw6PJt1C7PeCxxrXnbZeAXYRq9Tb0t/d/2373yjv+pwI5dbJSmw4wDbLm0hlpsA1ddlFve9PXd3NhfDWJLNhC</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6+INkQWNmjEwlPl+HrVfmFblOAvAZL0v+DJo8dRepZoDJG76x8jnEtjrZJ2uzFtq8ySonUkCcq4oIEoybiNUZgDhBgj4Z9x/O8OadEtHKLMg==</encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwiJFTp716WGUT+dOSl6JLyhU2V5kcjVLfYU47Q4Zfk3sImhBOotbX7TJiMbrAdYbmNJPHACWnlZCqwzchNJiub+b+gnU1ChJ2sm1+OjNtzUb9rSD/gZdrxka+SvfuG+HD9QTyE0+BwIAyFs57lG8Vw=</encrypted>]]>
      </text>
    </action>

  </response>

</dir>