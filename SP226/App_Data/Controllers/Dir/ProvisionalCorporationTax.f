<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
]>
<dir table="tax0128_luu" code="ma_dvcs, ma_so, ky, nam" order="ma_dvcs, ma_so, ky, nam" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số liệu tờ khai thuế thu nhập doanh nghiệp tạm tính" e="Provisional Corporation Tax Return"></title>

  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" allowNulls="false" clientDefault="Default">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from dmdvcs where @@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1')" check="ma_dvcs in (select ma_dvcs from dmdvcs where @@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID))" information="ma_dvcs$dmdvcs.ten_dvcs%l" row="1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" allowNulls="false" clientDefault="Default" dataFormatString="@upperCaseFormat">
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

    <field name="ky" type="Decimal" isPrimaryKey="true" align="right" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
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
      <item value="1111: [ma_so].Label, [ma_so], [ky], [nam]"/>
      <item value="11: [tien].Label, [tien]"/>
      <item value="111: [tien_nt].Label, [tien_nt], [dv_yn]"/>
    </view>
  </views>

  <commands>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/ctqPB1iTlWOtC78LQxRAHhDEu7c6jEG8tSP6X4f9Mj1ukcljbPLUzWkBOPZkZQaHVqF00BcT8kGt/E91IZ2k7vdYKP+V8uGaQnmwwRzVxwZO/hmeiIqDnwnV6tG6hYQ//o8WmpiYwgzm+4A/tdUDtFdChdbEN3dwnJ5YuwzrFpDi6Y0N1l1biaJr1ufkVhAkCNEQmuKYNA/iFPEjAQrKcFsQF3CNbLBk8ZiX73MC6vbww9eiIMp/V4ByoZMkzoSReNjqasxaRko8I5H79ZfpOGZjJRA3FEaa/K11KTgNQm6zk1o7VJfWibW/OkSaMlMcgVSBov9chXcBvgI0BWDIDqNjcxoA8mw42bT1rzx7orBUNTWGfrt46cpsdH48xs2BO0=</encrypted>]]>
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nS0Ignx/uQretofeaHgl1PHGK7klEH9AhCqRqFNLemaLN26uwH9DeRiPwAonw21Y0KdcX+U+if5NWH0kTSb9+88HjmsI7tEGL9wnR5rXqsAVl2eoH91VmsAnZj3FYCGqn/VaFE3OyR9jUsrU8gLmDSQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jPX+9//UVyVOvGC9jzOM6o2I5rgzzjYiSVkc890LWyrh61W9vHNdvHHwNPaalPnEhVrq023WqT/pQz9oOpZkQBopg8tFKarRXH7d15p9efWHvCbqjs17NuNo3HZSbeWM8YGxN2Y/+mISA+FLGjSlCBBQRihXJ5PmA0N4biylEJPz/nAZcMLq4OraCrAr5m9Krpgr+kpphERoIr4QK859lKKU97MHtNzUqpe1EmiaXafZK+CcdNpjSDrnkTM54f5ss2LWu8kLtOwabVovHrAfdCr6Ls62wuL7iIrRLOJuMlBI=</encrypted>]]>
      </text>
    </command>

    &CheckIrregular;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AuTRkyrTg9yhnqOvB2FtMwhzFhkHXwh951ofYyskFgBUIr0W0QaxQbqdMDTRUHy0bWD/eskzZ1DCPRd0IO3GDJ260bZrhutTWsEEkCuvTCTDK9aUJ0Ke1llBN0SvrJh979VfmCwi8GuP53ZyuVsV6bCHZebe1cNIwEOdG1hLbkr</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>