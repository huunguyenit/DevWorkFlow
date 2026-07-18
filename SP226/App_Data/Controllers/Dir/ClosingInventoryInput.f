<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ControlFocus "ma_yt">
  <!ENTITY LockedDateKey "ngay_ks >= dateadd(mm, 1, cast(str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01' as smalldatetime)) - 1">

  <!ENTITY CostingUnitLockedBeforeEdit SYSTEM "..\Include\Command\CostingUnitLockedBeforeEdit.txt">
  <!ENTITY CostingUnitLockedBeforeDelete SYSTEM "..\Include\Command\CostingUnitLockedBeforeDelete.txt">
  <!ENTITY CostingUnitFunction SYSTEM "..\Include\Javascript\CostingUnitFunction.txt">
  <!ENTITY CostingUnitFormOpening SYSTEM "..\Include\Command\CostingUnitFilterFormOpening.txt">
]>

<dir table="xcdvtdd2" code="ky, nam, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" order="ky, nam, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="kiểm kê vật tư cuối kỳ" e="Closing Inventory"></title>
  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" hidden="true" readOnly="true" >
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" hidden="true" readOnly="true" >
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_yt" isPrimaryKey="true" allowNulls="false">
      <header v="Mã yếu tố" e="Cost Factor"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="(ma_dvcs = '{$%c[ma_dvcs]}' or exists(select 1 from options where name = 'm_gt_dvcs' and val = '0')) and kieu_yt= '1' and status = '1'" check="(ma_dvcs = '{$%c[ma_dvcs]}' or exists(select 1 from options where name = 'm_gt_dvcs' and val = '0')) and kieu_yt = '1'" information="ma_yt$xdmyt.ten_yt%l"/>
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
      <items style="AutoComplete" controller="Section" reference="ten_bp%l" key="status = '1' and truc_tiep ='1' and ma_bp in (select ma_bp from dmbp where status = '1')" check="truc_tiep ='1' and ma_bp in (select ma_bp from dmbp where status = '1')" information="ma_bp$vxdmbp.ten_bp%l"/>
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
    <field name="ma_vt" isPrimaryKey="true" allowNulls="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="sl_ck" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng " e="Quantity"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="1110: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1110: [ma_yt].Label, [ma_yt], [ten_yt%l]"/>
      <item value="1110: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1110: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1110: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="1110: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1111: [sl_ck].Label, [sl_ck], [ky], [nam]"/>
    </view>
  </views>

  <commands>
    &CostingUnitFormOpening;
    <command event="Loading">
      <text>
        &CostingUnitLockedBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0Vgpvlx1NsG14QnsBp2HSa+8c2DSwAAvG/ojLaQZZSbJ6NbSfhTi2mus3IWy5MG6ZLXVQPUfYUgGrHbJvcWg+adUoy6MNPTTCBM5jVic+mS</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CostingUnitLockedBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0Vgpvlx1NsG14QnsBp2HSa+8c2DSwAAvG/ojLaQZZSbJ6NbSfhTi2mus3IWy5MG6ZLXVQPUfYUgGrHbJvcWg+adUoy6MNPTTCBM5jVic+mS</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/ctAxS/sx4a4xUWgYGelBbDDh34Bc5kIQKzACB1c7nBA0xSmVBfrX6iUEI/kOemEfdyPV/aOtMLMMdK6Aj7zjLDLQmx7/yEmudHFsojxPDUaBzHBlYpsLfPFXiagYuqGmDlUinCey8D+AEirI0XjPzwvzy++UWnaVuBGTqsPwiX/3mtIZu/SLbpENBPoPh8xFaEm4tRz+3lPNtKAYoJoakWCPc3BEtXkY/RMwqZatFlewPkFEEWWLmiGVW8cc4INq1LzhSW66NS0zb/pOyZCiapTST2Zfh2rvgFqGTRMJA4wGJNa9Y8It+WIH2i9o/HcP9ECkfPup8O8zpQVvFd4AEguJV+R5G7Qxy/4LUwB7kXAZXsFkQ0MOYmknP5KZ9klwLs=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nAOrOZxyVGGDKRK+zbLuJ+mYIONGOX7y/LodXuEuqxsnjKbthgmdhDej9HtCqi6tyOtaj7TvwkIuY65wwBYsxWml+WiKD9JXfYswO2A4yDBCdDzjrQVUrYn/4R1xmKRvntgZgZ3VWbZ9zwcyWE5OQTZFIFkcNHIjDkWViSsb5mDIDdxOpEpWj8ecs/mQZ7QypeGWeCcanc2+RhVyjKbynZbKPLWsm3031jP4zMJXCBNc=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jzydpBRLZc7FqA1Xm5nA40wHWjw0zM717GEbS2YLveKVJUZECi3iZW8babU6uxNmg14kZDXbQFKkaxpzA21hmqzvjrINFzo9opYNEHZa8dJ8UoybXxhDEsokxctSU5YE++xxyU4fDBrs20Ze3dx9jr1aAhlEZo631uPDyl+Vz0oBTmhMdk1ClZV64nTgh5ZIG7F3CQVF/WzaoJTJwXu/kFrdT73N05yx91g9/qSQ+E25vN242B9/BPsfhZiL5ZDyyPhZl2iKZH4HmJlFutZDNVatged89P8R9bJYyB7ZQghBRmPsnZvVX2YVZfPHq0yQt/hY3EzDn+ZVYHrg5uk8rrlZCL3oCu4QZE8hpCmfVGhiEbN557zMXm54ML0OnwXUc</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeoa0w+CPb4N3csANl6HRMO9+k5UbvuavP8ILz2sx3NAzPfgEdP+7xIoYvm8oMEmvi57yMVjnWEAHBg8Tk3vwov+Oxl5FqTV92/fzxeqmmVQMu4zcEenicM1Ew0r8570xUg==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KJmMO+Yd1S+lDJwwglwkrYzBxe3JUO3iym2Alf6GhGufq9uqqLQcezots+LudgfU6ZOJQ0vXfVOvcG8xG0YzIwOrfSRJobXX6bfoIqpVr3eUUMavQoqWLKNekjJhxI1oyf333xEN1FEmxZg0DEZS3LaO4KC+9xDKNolqc6JDdBPMSgTxrJEn3+DqcTpyUji/dLCoR1/CAGZl+6KcgtRIBcXsbgJIcJ0PHB/zsgcSgAB</encrypted>]]>
      &CostingUnitFunction;
    </text>
  </script>
</dir>