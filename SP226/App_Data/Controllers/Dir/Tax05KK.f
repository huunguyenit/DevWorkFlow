<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
]>
<dir table="t05kk_luu" code="ma_dvcs, ma_so, nam" order="ma_dvcs, ma_so, nam" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số liệu tờ khai quyết toán thuế TNCN" e="Item"></title>

  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" allowNulls="false" clientDefault="Default">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from dmdvcs where @@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1')" check="ma_dvcs in (select ma_dvcs from dmdvcs where @@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID))" information="ma_dvcs$dmdvcs.ten_dvcs%l" row="1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã số" e="Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Số tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Số tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="nam" type="Decimal" isPrimaryKey="true" align="right" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="1110: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="111-: [ma_so].Label, [ma_so], [nam]"/>
      <item value="11--: [tien].Label, [tien]"/>
      <item value="111-: [tien_nt].Label, [tien_nt], [dv_yn]"/>
    </view>
  </views>

  <commands>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cs2J9BKGAKclpobnEl09uqZM+vtGmj0nLBP67c9PhlKNYL6kXKJyf+EwOpJy4bc6HSt6t3AsMc6lr9TlsNlZM0+DXY38DHoOIJl74F3BohEG+vk9wVJRCWk1En/Fqha0G+25DdyUtJFTuVainTtVwv+Gbv4OMP44XxB7FlSsqba3iISLm1fmZCLv1+lagrNVJ6xFdE3uYNtwGoNmlrE2l8JTC+UeE30Q6jAgjx3b9yAEjx6lAWIRakLsTTahCDjxuKPPRQXbSbku7CEYpxUGaonCl6NXJY62r+7fiIBONQ0yu1g+kEH+jY//T+ZjbRM/sw+hJZC8Py274qbCuqy82isIPBk92r0w/mGZRhUumDGTcTG+G6eTBNMGjLwKFFPBc453kidMoR/k1OsqmNC4IQM</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOuGTZC5LNergnSog2YqV/Td2j2a3knpcdwi4kcExiVoiLxd/bpf0CyQwrXUaA6bAuFijGj+RlzVJ4FIBYlP8iJA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOuGTZC5LNergnSog2YqV/Td2j2a3knpcdwi4kcExiVoiLxd/bpf0CyQwrXUaA6bAuFijGj+RlzVJ4FIBYlP8iJA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nS0Ignx/uQretofeaHgl1POMAWtmj+csC1m2P0uHIXYUrjrAF+xIZ8cLI9m2PD5JejmsHmWV8V7//7lwxry7c8YRPnu+XbdMu8DUsgzHml9GIOmxk4XMnZCdUVGtc1apx</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jPX+9//UVyVOvGC9jzOM6o2I5rgzzjYiSVkc890LWyrhm/F/4ULolq5Rf+6Gw2yznshPH/KR0A2g5UIozyV/7+wpTmVcX+hzby/acQHUW6Z7nXoMfHbzgfAXWwo/3L4XXxxws6LtNkF/0cC5UA9k4/eRKmMaYi3uUo9hFkbRvbdtYo3ehYUIHzkdzpvNQA+wmaYNHllv8LWSB3wTMjnHSnEVnCv3mVcEtwFYVYcMrWzMMNxqntPxqvrwHQBHxZPd1f+TSui3zbfIg6Gdvf1dC0A==</encrypted>]]>
      </text>
    </command>

    &CheckIrregular;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AuTRkyrTg9yhnqOvB2FtMwsfsPuxTHDjoIOu1d4IOx5PvE0mYp3V0/dXFUOuKmXPG/Un3kxITO7i0DJm9gCQ+rmoRB3MI4mmmSz7PYakSzu6vN3taz8KG2V24mdg4jmPQ==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>