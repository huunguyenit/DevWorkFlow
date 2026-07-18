<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ControlFocus "ma_yt">
  <!ENTITY LockedDateKey "ngay_ks >= dateadd(mm, 1, cast(str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01' as smalldatetime)) - 1">
  <!ENTITY CostingUnitLockedBeforeEdit SYSTEM "..\Include\Command\CostingUnitLockedBeforeEdit.txt">
  <!ENTITY CostingUnitLockedBeforeDelete SYSTEM "..\Include\Command\CostingUnitLockedBeforeDelete.txt">
  <!ENTITY CostingUnitFunction SYSTEM "..\Include\Javascript\CostingUnitFunction.txt">
  <!ENTITY CostingUnitFormShowing SYSTEM "..\Include\Command\CostingUnitFormShowing.txt">
]>
<dir table="xdmcdsp" code="nam, ky, ma_dvcs, ma_yt, ma_bp0, ma_bp, so_lsx, ma_sp" order="nam, ky, ma_dvcs, ma_yt, ma_bp0, ma_bp, so_lsx, ma_sp" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo đối tượng nhận phân bổ chi phí" e="Setup Rule of Coefficient"></title>

  <fields>
    <field name="nam" type="Decimal"  isPrimaryKey="true" dataFormatString="###0" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" hidden="true" readOnly="true" dataFormatString="#0">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_yt" allowNulls="false" isPrimaryKey="true">
      <header v="Mã yếu tố" e="Factor Code"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="ma_dvcs = '{$%c[ma_dvcs]}' and status = '1'" check="ma_dvcs = '{$%c[ma_dvcs]}'" information="ma_yt$xdmyt.ten_yt%l"/>
    </field>
    <field name="ten_yt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp0" isPrimaryKey="true">
      <header v="Bp gián tiếp" e="Indirect Dept."></header>
      <items style="AutoComplete" controller="Section" reference="ten_bp0%l" key="truc_tiep = 0 and ma_bp in (select ma_bp from dmbp where status = '1')" check="truc_tiep = 0" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp0%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Section" reference="ten_bp%l" key="truc_tiep = 1 and ma_bp in (select ma_bp from dmbp where status = '1')" check="truc_tiep = 1" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx" align="right" isPrimaryKey="true" >
      <header v="Số lsx" e="MO Number"></header>
      <items style="AutoComplete" controller="MO" reference="ten_lsx%l" key="ma_dvcs = '{$%c[ma_dvcs]}' or (exists(select 1 from options where name = 'm_gt_dvcs' and val = '0'))" information="so_lsx$phlsx.dien_giai%l" />
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true">
      <header v="Mã sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$vdmsp.ten_vt%l" new="Item"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330,0"/>
      <item value="1110: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1111: [ma_yt].Label, [ma_yt], [ten_yt%l], [nam]"/>
      <item value="1111: [ma_bp0].Label, [ma_bp0], [ten_bp0%l], [ky]"/>
      <item value="1110: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1110: [so_lsx].Label, [so_lsx], [ten_lsx%l]"/>
      <item value="1110: [ma_sp].Label, [ma_sp], [ten_vt%l]"/>
    </view>
  </views>

  <commands>
    &CostingUnitFormShowing;

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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cuyA1z/R7FSb930/3cljWPVmkxpCWmINPSbgu/ohU1y0QNvuu9s8peFKKc0BFh9vT1u4Xox1P22vKFrvPt3kZla1zT3VQN0NYykZcvWNXFI4pcwx6VHWk7JsX9asBSZ4jR7wuXlk6Vsqoqajr/yKf2P20bA/tBWiiaEgaIOsT0FlFuLbnD8p/mcujkdk5S111sHshrOTiXqJkoptCajiTECXOQ58DIj/neztlc9CWZtR1ixmyiisg7SSOeuD6ey8Q7Ti3GkwhSRDZIuaN72DA3LTfgNh7pn/AYZMqLmHC8yIX41G1spCmfIESrHBicKiVlTvTIcNBtSwtMaEXUM97vxuERnwLG+59Q4b9v125mIdYeWw5SQAs4R+jbVe4eAzEI=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n+Q3Aq3n/NodUEib/RjpokEjf+fiidbN9iNvmLNz4INNJjuKFRLdJSNMpuPu/4ONtGW8ygQcZhIcCXd9WxTQ2I1wvrrcvIQYpZWSWvJww0g7OYWpao1RUTJ1/ayaE+BuqvJRx73FwVNY94Kl/N6eYL0JlCf06+PB7ZVND15KJIa2RVhirJ4hTR7qXNwcUeSKCWkpLqql+jFl3tp26xSp3oRR//lS/gyTp2JSZVyHgbJ4=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHbjveXsmJ4pkjBvMl7kGE4JJNIOINcnMIHJwihpJ14bRlO+BE0k0gD3+LmDlqRw2TbMP5YgJUtBBCoH70F05rWeo44RRgT139BmRLfP3soY1kYp9yW9X7HOhZVdRJAzBE+avjP6E1VfHM81lLn4kpqymPwZ8yGem0AzYsaEJVhrVrJpftZdOu7WOu6IITJGt1oCR9lxxMcYJpUtnnxDweGMaibbw6GprFe/CuhC5N+Q1h6NLk9ZwtZaNC86Q/H2vuHxEPrTOxTizg+MtYUMlyI6E7XYOT/AZHjLBxBhfOQmqw9AhkXyMz+J5XybWzN8lpuHqmsH67sCzea4akcJXUVYPj8nqm0ddEFxJEFDC66O/FVZSP5MhZHxq2s7Gecx37G6PXmtptC9UykRMySL8aA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbekcvOsKVOZ2bTiN7g1JoBfRbP3o9JQ8h0eK1k3s6cntsWXcAwSHX9LjZYa6ISCAbPpULRqNvj9BpM8kfT6pqRtjJ4Z6Y3lShFCG+MYHcs9NX</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Kw9xKZUg/hs/uweeYRI1Uvrm7JawuxlHYgWOPOaF3OAGKxq0Nq929iJbWVAVwMEIqE/rowSLWbMQf50sWXx05Fqsdumr8ID8GhutbKFE10AqGCqETyvLsABU8ZLTm1Iv94LOvAu1uZkY9ybF51uPuCX/ueA5QEuNTCovFgM93uDoOAsZiCj7wLuTnhoPzAxxYpgFwAaOTQ5Cb/nRk/N/CJ5yDKIyCouR7hUCzen6GmG</encrypted>]]>
      &CostingUnitFunction;
    </text>
  </script>

</dir>