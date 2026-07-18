<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ControlFocus "ma_yt">

  <!ENTITY CostingUnitRightBeforeEdit SYSTEM "..\Include\Command\CostingUnitRightBeforeEdit.txt">
  <!ENTITY CostingUnitRightBeforeDelete SYSTEM "..\Include\Command\CostingUnitRightBeforeDelete.txt">
  <!ENTITY CostingUnitFunction SYSTEM "..\Include\Javascript\CostingUnitFunction.txt">
  <!ENTITY CostingUnitFormShowing SYSTEM "..\Include\Command\CostingUnitFilterFormOpening.txt">
]>

<dir table="xcdvtdd" code="ky, nam, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" order="ky, nam, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="vật tư dở dang đầu kỳ" e="Opening WIP Balance by Item"></title>
  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" align="right" readOnly="true" hidden="true" >
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" align="right" readOnly="true" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_yt" isPrimaryKey="true" allowNulls="false" clientDefault="Default">
      <header v="Mã yếu tố" e="Cost Factor"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="ma_dvcs = '{$%c[ma_dvcs]}' and kieu_yt= '1' and status = '1'" check="ma_dvcs = '{$%c[ma_dvcs]}' and kieu_yt = '1'" information="ma_yt$xdmyt.ten_yt%l" row ="1"/>
    </field>
    <field name="ten_yt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" allowNulls="false">
      <header v="Mã sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Item"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" filterSource="Optional">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Section" reference="ten_bp%l" key="truc_tiep = '1' and status = '1' and ma_bp in (select ma_bp from dmbp where status = '1')" check="truc_tiep = '1'" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" align="right" filterSource="Optional">
      <header v="Số lsx" e="MO Number"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai%l" key="ma_dvcs = '{$%c[ma_dvcs]}' or (exists(select 1 from options where name = 'm_gt_dvcs' and val = '0'))" information="so_lsx$phlsx.dien_giai%l" />
    </field>
    <field name="ma_vt" isPrimaryKey="true" allowNulls="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="sl_ck" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="dd_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="dd_ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="111: [ma_yt].Label, [ma_yt], [ten_yt%l]"/>
      <item value="111: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="111: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="111: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="111: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="111: [sl_ck].Label, [sl_ck], [ky]"/>
      <item value="111: [dd_ck_nt].Label, [dd_ck_nt], [nam]"/>
      <item value="11: [dd_ck].Label, [dd_ck]"/>
    </view>
  </views>

  <commands>
    &CostingUnitFormShowing;
    <command event="Loading">
      <text>
        &CostingUnitRightBeforeEdit;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TNdakMw2KcvSyyMWw3SRErNguO+8TSmPfX6MpoGjZNOWbcALYzcKeSOxzxHQO445EfvrL00uL6ftTiUm1eZvd09qcX9sZVAsgBKo1f5BQZhR+NY2sh4l8B7fO04YpkH+9KjbceJtUXAHgwmWY6hess9KHFEOhz3TG37mVPOXQ0D</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CostingUnitRightBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw9P9keegRGTJEvWuNJvU7880aZF/jy7sGqVpRLWzXAC7Ldi6J0u2qxHmw/VZ3W4gQ+pD+yWNPa6WVQptvjO2bA=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cuceJVbNuj5giGWZ2jnR67oZe5Y2tidnt0QZY1KfjfrZ6wDxGds8rqhsN8DKlhlz1AF3DNVra4Lr14zG5T/nRAKEOFqZa7+UbsXuIRZmBI/gBxPWbfMm31aL+3u3dzVJiZrybxcgh1ld+vjum7EPrAitROhjo8hVmZvUP7A9QsZf8JX8P9gYFdnwIGq/GRTljBTlxL+A3Ya08UslXaNLLX6mftJri1ZgjK5RvL67w+KWvNyawDOCJS8F+i38kYNj9Aj1QOzy4aZ60IHQJyPEzf2xCatNSKwCfL4il0CVgnVsy8NRFCcCS7moVHuGXF6O0MbPgkRJxfd1kMJsa2nj9C9uUPrZrwDEzRQvvbKzcyPZV9PZM/L0iikFStsR3rubnk=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nAOrOZxyVGGDKRK+zbLuJ+mYIONGOX7y/LodXuEuqxsmnQNlqiVvhN1z8oFGGsXYy4q162q0Cz27rq0yoNdgXY+F85El73DOQBryn6/GQf182MSlfMtLi60Z7gJBKrv4CzLlNrWDkjCOx6BBLewmJGnfdoXf34elVpwnL8e0/JTi6V6WOOFJWhfw+Y4SToJ2UNLsjNT5F0/Ue3aCa+fpqldr30jEyICPfBha9N4/DyYY=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jzydpBRLZc7FqA1Xm5nA40wHWjw0zM717GEbS2YLveKWCwjIDx1CQPhWjC51SkFRksPCfbz9gSxR92EgXksU5uECv4JkhQvLY3sYc3XoJj9J3fxcKgsdmev6BI6fz4qCze7QStxnnmZd0YPyJmzi8Q3rRp1nUrnhxtCawixm65jxXnRA38GKf6VrVGuN1CkHVZ3V3iKn8eCObkNJdM+TJ42R7qt3kH9F8RV6UQm3TgfVl+Cwp80Qn2kGT5DEFck1KVA8aw7b0haJ98VZJetyQnsAe68H5bDSH3GfvdkMN6BpwhVAjitZ8DvkJ8owbKweavLPSIiWrFMKI3i6uVgBcgbGncz7lNzmt8feKc5GB4xV8bhtZTiMbu85RWOW01OtK</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeoa0w+CPb4N3csANl6HRMO9+k5UbvuavP8ILz2sx3NAz132wJPhJpJD+GYZ/u6R1EUzULIcrLHkLqZNelqKLUJgg96s3xLMPxH4tkye6diffwC83ZO4CsT+voX4PbU5PMw==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CostingUnitRightBeforeDelete;
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Kw9xKZUg/hs/uweeYRI1Uvrm7JawuxlHYgWOPOaF3OAGKxq0Nq929iJbWVAVwMEIrTZaU6nLjGsayouUUjiLfEkgpzWsZ0IBEDxosx2uamzIahmaJYwBg+Pk6jUdqi/Rhk+yDE+1thS3PX73f1INFp/k7PYW3lgE7BvVQq7qf4uSuyko7fpw8GckoRHw2hDb94CFmJMuDwI31CtH43hBLl3PpWQGqhI1E9+KwvYDQ2j</encrypted>]]>
      &CostingUnitFunction;
    </text>
  </script>
</dir>