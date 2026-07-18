<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">

  <!ENTITY ControlFocus "ma_sp">

  <!ENTITY CostingUnitRightBeforeEdit SYSTEM "..\Include\Command\CostingUnitRightBeforeEdit.txt">
  <!ENTITY CostingUnitRightBeforeDelete SYSTEM "..\Include\Command\CostingUnitRightBeforeDelete.txt">
  <!ENTITY CostingUnitFunction SYSTEM "..\Include\Javascript\CostingUnitFunction.txt">
  <!ENTITY CostingUnitFormOpening SYSTEM "..\Include\Command\CostingUnitFormOpening.txt">
]>

<dir table="xcdytdd" code="ky, nam, ma_dvcs, ma_sp, ma_bp, so_lsx, ma_yt" order="ky, nam, ma_dvcs, ma_sp, ma_bp, so_lsx, ma_yt" xmlns="urn:schemas-fast-com:data-dir">
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
      <items style="AutoComplete" controller="MO" reference="dien_giai%l" key="ma_dvcs = '{$%c[ma_dvcs]}' or (exists(select 1 from options where name = 'm_gt_dvcs' and val = '0'))" information="so_lsx$phlsx.dien_giai%l" />
    </field>
    <field name="dien_giai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_yt" isPrimaryKey="true" allowNulls="false">
      <header v="Mã ytcp" e="Cost Factor"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="ma_dvcs = '{$%c[ma_dvcs]}' and dd_ck = '1' and status = '1'" check="ma_dvcs = '{$%c[ma_dvcs]}' and dd_ck = '1'" information="ma_yt$xdmyt.ten_yt%l" row ="1"/>
    </field>
    <field name="ten_yt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
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
      <item value="111: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="111: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="111: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="111: [ma_yt].Label, [ma_yt], [ten_yt%l]"/>
      <item value="111: [dd_ck_nt].Label, [dd_ck_nt], [nam]"/>
      <item value="111: [dd_ck].Label, [dd_ck], [ky]"/>
    </view>
  </views>

  <commands>
    &CostingUnitFormOpening;
    <command event="Loading">
      <text>
        &CostingUnitRightBeforeEdit;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHY1X8UtDmCQxRKhh6aOFgFa3q8t4B29WBmoXEwhwbrorq85dMEUc4bpMtnUsVtRy/4l8vbT1nc+IAu5qpb3wXci61+IITjQDZQgIqGtosoiNQ3g/5gThwzyHTTsqH6p0zMCZWaRNQMORNhPMAi2E9PhWnxfFWo9wZUqX24MYwjfLRkUu91N9W0iIPejFsREuRk=</encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        &CostingUnitRightBeforeEdit;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb1W+i4Yu2FYMddmulhaGEZLPcjjAuDk1bBeWBvftzkUobzx6KL7UVD68oZRpI0KMOrbQR6XyKUm3W080/J0SK0JFJIxM/Pf/r3VwPxeYvw/w==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/csrEs6W1GbLOn1X3CO5GUatNHlOHEBJqvCFfTe1+tUl3JXo2/LE2JuqK//25+aOuyesw4nEkxJfqJ7vMoHGTVQafvLQ5jsJowNshoNEdVgfAN8zF4ZeLvahEP1/b2oW/O3iBoe6mbNS34hLHkCs7x28mUNMPVNN5uCltJMBBLsWKG5Nqq048ySrzpBati0Xmcfx0rHVasAUB5egOlt7qnl9n/JNjxG8NUqG+8VjwDQ+NTIs8BLPCZw3gBsvkcj1eBH2OR09TWJeaHx1oXYZe00ES2sFVqd3hDiMNZOOxGWONy9RWeGMcZEhJo2cb9pPPHAYAlPcBlp1o60R0bAq4PvjPc8z4UWIzkcvcmk40DNiCa49GItjIwLZylLWdFpTAn1MlGusXdXZRG7ZR4Fw654D</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nAOrOZxyVGGDKRK+zbLuJ+mYIONGOX7y/LodXuEuqxskPWXKQAD5ebdJ29oW8XEab0tXJ2l9zWlNHCpywGUEiSnfSrhyj8a260jKQajHmLaWKZ6L7NlHC04gWoviAKQtNjSQxufS00DXlOYpZLijXhpUJIiP5kMhIMEgj/3EOlhr5gqVYnZTje1mhYbgp7FTDX9wEJ6oHu8Om1rSVVCEevKTEkoPtrkqVpJOkMPI6aMw=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jzydpBRLZc7FqA1Xm5nA40wHWjw0zM717GEbS2YLveKWCwjIDx1CQPhWjC51SkFRkPUFVyegw2a/YwHl2KP8lEU4/14LULDsTf+7aoni9CacnXm2paOjt1lGESzsa9O9+GgvfyDVK4kj4ThoeXYV8jGDX1c9/ZScPdLIiXjib0sCrrxuAB72I4Olg3hu4KIXx/T5Hz2HTFciXYc1EH7qS59MSRdSTthuxRrdIap1epbxiI9AJJ/r8S0ArlBJGbqjW3JpDD3oHeYv2Cb4DYikbHE5M4juoK42dw0AzSxLoZA0yMYd0F5ugh8b9XpGiluqzbHZKYW+u3L17yF4PAqC1YTWKjoa962LmPkwNbiuKpGk=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GqjSF6Nhvbl/5fYH6s4mH6hoJ7hK5KH7ORoV2I3NFpjMZfdB6cuW2WkPplcTPFVjVVbbsrgC5HCQXSXBKXJd1DKwBLFb//SbNcUYqvxoeWfKNKmJ5uapKZuD0R+5KGMBJ1S+0AemfhTJRzYjLvXQKIWwqr3taJbJkjLsbthx/Gt</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Kw9xKZUg/hs/uweeYRI1Uvrm7JawuxlHYgWOPOaF3OAGKxq0Nq929iJbWVAVwMEIqE/rowSLWbMQf50sWXx05ESYxz6baX8f7sARVLpcQUZsX/7n2ln/4QG0aXojBBI7R7U1Yvx2iuIK3RtMJVKBWtqh6LwGeNr0uFvJfO5QLstm8m2/nMssk6fx48wEjPpWvpUCAbHPv0p/G/3dWT6IFBXcE7AtQRfbgz14dG2F5bZ</encrypted>]]>
      &CostingUnitFunction;
    </text>
  </script>
</dir>