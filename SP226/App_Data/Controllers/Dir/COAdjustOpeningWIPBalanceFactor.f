<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ControlFocus "ma_sp">
  <!ENTITY LockedDateKey "ngay_ks >= str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01'">

  <!ENTITY CostingUnitLockedBeforeEdit SYSTEM "..\Include\Command\CostingUnitLockedBeforeEdit.txt">
  <!ENTITY CostingUnitLockedBeforeDelete SYSTEM "..\Include\Command\CostingUnitLockedBeforeDelete.txt">
  <!ENTITY CostingUnitFunction SYSTEM "..\Include\Javascript\CostingUnitFunction.txt">
  <!ENTITY CostingUnitFormOpening SYSTEM "..\Include\Command\CostingUnitFilterFormOpening.txt">
]>

<dir table="xcdytdd0" code="ky, nam, ma_dvcs, ma_sp, ma_bp, so_lsx, ma_yt" order="ky, nam, ma_dvcs, ma_sp, ma_bp, so_lsx, ma_yt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giá trị dở dang đầu kỳ theo yếu tố chi phí" e="Opening WIP Balance by Cost Factor"></title>
  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" align="right" readOnly="true" hidden="true" >
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal"  isPrimaryKey="true" align="right" readOnly="true" hidden="true">
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
      <items style="AutoComplete" controller="MO" reference="dien_giai%l" key="(ma_dvcs = '{$%c[ma_dvcs]}' or exists(select 1 from options where name = 'm_gt_dvcs' and val = '0'))" information="so_lsx$phlsx.dien_giai%l" />
    </field>
    <field name="dien_giai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_yt" isPrimaryKey="true" allowNulls="false">
      <header v="Mã ytcp" e="Cost Factor"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="(ma_dvcs = '{$%c[ma_dvcs]}' or exists(select 1 from options where name = 'm_gt_dvcs' and val = '0')) and dd_ck = '1' and status = '1'" check="(ma_dvcs = '{$%c[ma_dvcs]}' or exists(select 1 from options where name = 'm_gt_dvcs' and val = '0')) and dd_ck = '1'" information="ma_yt$xdmyt.ten_yt%l" row ="1"/>
    </field>
    <field name="ten_yt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dd_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="dd_dk" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="111: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="111: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="111: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="111: [ma_yt].Label, [ma_yt], [ten_yt%l]"/>
      <item value="111: [dd_dk_nt].Label, [dd_dk_nt], [nam]"/>
      <item value="111: [dd_dk].Label, [dd_dk], [ky]"/>
    </view>
  </views>

  <commands>
    &CostingUnitFormOpening;
    <command event="Loading">
      <text>
        &CostingUnitLockedBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw9P9keegRGTJEvWuNJvU7880aZF/jy7sGqVpRLWzXAC7Ldi6J0u2qxHmw/VZ3W4gQ+pD+yWNPa6WVQptvjO2bA=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CostingUnitLockedBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw9P9keegRGTJEvWuNJvU7880aZF/jy7sGqVpRLWzXAC7Ldi6J0u2qxHmw/VZ3W4gQ+pD+yWNPa6WVQptvjO2bA=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/csrEs6W1GbLOn1X3CO5GUatNHlOHEBJqvCFfTe1+tUl3JXo2/LE2JuqK//25+aOuyesw4nEkxJfqJ7vMoHGTVQafvLQ5jsJowNshoNEdVgfAN8zF4ZeLvahEP1/b2oW/O3iBoe6mbNS34hLHkCs7x28mUNMPVNN5uCltJMBBLsWKG5Nqq048ySrzpBati0Xmcfx0rHVasAUB5egOlt7qnl9n/JNjxG8NUqG+8VjwDQ+NTIs8BLPCZw3gBsvkcj1eBH2OR09TWJeaHx1oXYZe00ES2sFVqd3hDiMNZOOxGWONy9RWeGMcZEhJo2cb9pPPHAYAlPcBlp1o60R0bAq4PvjPc8z4UWIzkcvcmk40DNiCa49GItjIwLZylLWdFpTAn1MlGusXdXZRG7ZR4Fw654D</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nAOrOZxyVGGDKRK+zbLuJ+mYIONGOX7y/LodXuEuqxskPWXKQAD5ebdJ29oW8XEabtMqNeOKqlQHX4dHPYeC6r7q+kn/BJqOlYOETjLEMNHMky0+7/acSVy6qZOH6QIacd9U+xlaFa2vwWlDaA7XqQCOR0vWujLitthV8YrpHJ77fASD1TzHWUhz4xi7cQqom6Vs6GiHo2udhTHmA1EONF2I4uIDxpCZmAig5JdDC7V0=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jzydpBRLZc7FqA1Xm5nA40wHWjw0zM717GEbS2YLveKWCwjIDx1CQPhWjC51SkFRkPUFVyegw2a/YwHl2KP8lEV0no9nmeopN46nFwlJUZ5uT/LysZEK4st92XnRJNeYwzffcktMh+ccA+1rEzkXiAlbr98PpbG5knjcvVE0X23JSbds0ZIE3anRPFm5nr0ULlVqZnH728OINXDamG5U0IfK0sDpWsI/kuw1UgC168YJqhsJLGXoqiKpHwWFb2fmiqVaKdPB2LSKKbELlMNDqYKDlzxHf9XD5rBClPNr3eG5utKVIwzv81BpDa+ejZygHcA8dXMN7rg/pdCk/VzgM39qV1kyZ70Y1eqzTkYGK2To=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GqjSF6Nhvbl/5fYH6s4mH6hoJ7hK5KH7ORoV2I3NFpjMZfdB6cuW2WkPplcTPFVjVVbbsrgC5HCQXSXBKXJd1DKwBLFb//SbNcUYqvxoeWfKNKmJ5uapKZuD0R+5KGMBJ1S+0AemfhTJRzYjLvXQKIWwqr3taJbJkjLsbthx/Gt</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CostingUnitLockedBeforeDelete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Kw9xKZUg/hs/uweeYRI1Uvrm7JawuxlHYgWOPOaF3OAGKxq0Nq929iJbWVAVwMEIrTZaU6nLjGsayouUUjiLfHNkBKDkxbGlqod/q+DfhW0DY25IA/GHNOij5XnyWPVupNTmrL+5+f2c0tKJpDBA/OzmVB9BlB/AF8v7CZ/m0uaS5wYecsTKVOWvyNuVqsf+qeCSp9xUms6yQAeO4HW97vMlqJiYM1NRVr5XkzHHjuY</encrypted>]]>
      &CostingUnitFunction;
    </text>
  </script>
</dir>