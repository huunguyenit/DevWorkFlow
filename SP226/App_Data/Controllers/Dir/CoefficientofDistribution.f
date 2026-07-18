<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ClauseWhenInsert " and exists(select 1 from @@table where nam = @nam and ky = @ky and ma_dvcs = @ma_dvcs and ma_yt = @ma_yt and ">
  <!ENTITY ClauseWhenUpdate " and exists(select 1 from @@table where ((not (nam = $nam.OldValue and ky = $ky.OldValue and ma_dvcs = $ma_dvcs.OldValue and ma_yt = $ma_yt.OldValue and ma_sp = $ma_sp.OldValue and ma_bp = $ma_bp.OldValue and so_lsx = $so_lsx.OldValue and ma_bp0 = $ma_bp0.OldValue and ma_vt = $ma_vt.OldValue))) and nam = @nam and ky = @ky and ma_dvcs = @ma_dvcs and ma_yt = @ma_yt and ">
  <!ENTITY UpdateConflict "begin
  select 'ma_yt' as field, @$updateConflict as message
  return
end">
  <!ENTITY CheckEmpty "if @ma_sp = '' and @ma_bp = '' and @so_lsx = '' and @ma_bp0 = '' and @ma_vt = '' &UpdateConflict;">

  <!ENTITY ControlFocus "ma_yt">
  <!ENTITY LockedDateKey "ngay_ks >= dateadd(mm, 1, cast(str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01' as smalldatetime)) - 1">
  <!ENTITY CostingUnitLockedBeforeEdit SYSTEM "..\Include\Command\CostingUnitLockedBeforeEdit.txt">
  <!ENTITY CostingUnitLockedBeforeDelete SYSTEM "..\Include\Command\CostingUnitLockedBeforeDelete.txt">
  <!ENTITY CostingUnitFunction SYSTEM "..\Include\Javascript\CostingUnitFunction.txt">
  <!ENTITY CostingUnitFormShowing SYSTEM "..\Include\Command\CostingUnitFormShowing.txt">
]>

<dir table="xcthspb" code="nam, ky, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx" order="nam, ky, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo hệ số phân bổ" e="Setup Coefficient of Distribution"></title>
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
      <header v="Mã ytcp" e="Factor Code"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="(ma_dvcs = '{$%c[ma_dvcs]}' or exists(select 1 from options where name = 'm_gt_dvcs' and val = '0')) and status = '1'" check="(ma_dvcs = '{$%c[ma_dvcs]}' or exists(select 1 from options where name = 'm_gt_dvcs' and val = '0'))" information="ma_yt$xdmyt.ten_yt%l"/>
    </field>
    <field name="ten_yt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true">
      <header v="Sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1" information="ma_vt$vdmsp.ten_vt%l" new="Item"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true">
      <header v="Mã bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Section" reference="ten_bp%l" key="truc_tiep = '1' and ma_bp in (select ma_bp from dmbp where status = '1')" check="truc_tiep = '1' and ma_bp in (select ma_bp from dmbp)" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" align="right">
      <header v="Số lsx" e="MO Number"></header>
      <items style="AutoComplete" controller="MO" reference="ten_lsx%l" key="(ma_dvcs = '{$%c[ma_dvcs]}' or exists(select 1 from options where name = 'm_gt_dvcs' and val = '0'))" information="so_lsx$phlsx.dien_giai%l" />
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ma_bp0" isPrimaryKey="true">
      <header v="Bp gián tiếp" e="Indirect Dept."></header>
      <items style="AutoComplete" controller="Section" reference="ten_bp0%l" key="truc_tiep = '0' and ma_bp in (select ma_bp from dmbp where status = '1')" check="truc_tiep = '0' and ma_bp in (select ma_bp from dmbp)" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp0%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true">
      <header v="Mã vật tư" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Item"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="he_so"  type="Decimal" dataFormatString="### ### ### ### ##0.0000" >
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330,0"/>
      <item value="1110: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1111: [ma_yt].Label, [ma_yt], [ten_yt%l], [nam]"/>
      <item value="1111: [ma_sp].Label, [ma_sp], [ten_sp%l], [ky]"/>
      <item value="1110: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1110: [so_lsx].Label, [so_lsx], [ten_lsx%l]"/>
      <item value="1110: [ma_bp0].Label, [ma_bp0], [ten_bp0%l]"/>
      <item value="1110: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11--: [he_so].Label, [he_so]"/>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaIziHZbPp4zAIjBspBaIWaRm2bwxu0QIsEQQhSSwSy9cf+SKoILJvX5FgZ5qq7ewguCN8kViAqoUokYKvCjdamGLkXu+Re2jJqMdtsjP76bR5PMmXNemLyQ69zDCUHHNSfVP/aTdb3guyI9yIxwyv0yWh3pzsJ5ZJqxfTMdqFfV5pPR6uEDMoWytxi5DNFVs+eLboo0au5j8aAGj1vOGeqccVE9I/cuwxBD3D8XW0s2dCpNH8f+iy2S7TPp3wozWN8g+MEZeUb86y8wNIuyYwAWUmWRYgJneavvavJfRw6OzGwkePizv6Er3rj4SRGJe5m8PPb+dWvzy5Lz7m5zTRH00JbSZRUyXe5mTJVQjjXIlAyE7ttG4qxtWeEYTOx8W1H3oa7yAZi75/+0sVDNMzc7lRZWq46Sjpc1lYeutDpov3u+MKB2GShV7vR6qy89Y1IVAcRqxFY0VCecXI2MwHT2iuSrkhg2Vnkm70JXisvAt+zJ9oWszwhlBxbI6kV6ijEw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n+Q3Aq3n/NodUEib/RjpokEjf+fiidbN9iNvmLNz4INNZOOqNvRdyexnNkQalZupTWBzLVfrviJbt2IUu70DcsF7skDQwAJdiZ1ehIjuOpoJGD06iJDWWhSffKWpcn9Oz48JezWf/8IiJEWmJ1G7eM+07bgcP8KR7ryD7cEpUn/h8XxIx+NMUwJcvk8Kt7njU</encrypted>]]>&CheckEmpty;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzs7LqP2Wwn+KY2noa6cpYlISL8xeYplEG6X65satDAR</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>%uaN7kJhMjY5D75EGcimrbLIAPz7sj5g45x6NUwMGIZ1igKdmHl3uc0qxp05cIwM+</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxdiTmRbfGbnGjlIMY/ENxtnjZZGblHLpODDn0WjFKND</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>%uaN7kJhMjY5D75EGcimrbBtx39kofJY/D8nCpGxnUXCfv65dbOeNp8Q7BqlJIXoO</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyf9oDqCEzDsBwjGIPzUcuDgOYYjeNOWuC5Cf318ovY1</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>%uaN7kJhMjY5D75EGcimrbKS4WCkljzpxjCG/N07Fg2lslIP2vKB0WDoLvoTrA604</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyepLe/iUquhShCMgyTEtAVhCgwoVPHgB8UrSV747MTL</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>%uaN7kJhMjY5D75EGcimrbANGhwqPXQh8Y/QcIOh6txjheajaMbCHkR5pPkYfB6Jc</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf32uDx7HUAeKdo1EzUEZ+M5I6U0DTECt6ulpO0oF9BTc</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>%TicnN14EVETceMDdqqJRy/yENWzqRXtWIASeSQkffd+gwrTiB0obBq4ct/4ffER6</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx7qYxJTGruajYwBDZDObHUgK/BD0g5fNZduHrVSOK2n</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>%TicnN14EVETceMDdqqJRy5JNQfQEaotVT8J4iUkixwP1SBAo0luREsnjbLarRLwH</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3KjKfCyuXgf9kEKA3gxdaa9dygkCzta2Fvp+VC4hFZh</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>%uaN7kJhMjY5D75EGcimrbA89KXcsnveVcfnY8CccmK95WgvvafhRnBXl8qA971mn</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/J2ws7uQp9hEUUGLm0q+njzR7mdxkTVy548QOg/6tJd</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>%uaN7kJhMjY5D75EGcimrbKOf9CKH2d88ey9Pqn86tmnb7vhZ/rdOMkxi4ZLv8QjI</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1blbzqx2pd+G7fznWcRvIrLneGUbeijyWYBfqgG0GaP</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>%uaN7kJhMjY5D75EGcimrbGo4bmBrATkpfoH6o29xXB1cvM+4/Csre0k3GW7w0LHG</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9be6ddLlsCqrO5G7a9gS8f/kSA9iq3GGouBdzVvZck2</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>%uaN7kJhMjY5D75EGcimrbGx7kff4zffIAsAzbGW7EIdOYjWixg+LPy3xlk/8AgqK</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw9voEGmT31btGChKToWwF+RN4f58QyaKkJAlUtGdl5iNSHp0qW6Z/CxLtJvSWYy1oj6FhEFVj+DhsKx8kUWrss=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHbjveXsmJ4pkjBvMl7kGE4JJNIOINcnMIHJwihpJ14bRlO+BE0k0gD3+LmDlqRw2xuOR1KaM5Wnl1Pb/AmBSZPDketRepNxTnTB3kc1KE/vwcp+aexLx7Ff8I+cFWiSCgzkjnPdMf3MGWN3ZtICNkuCGMCTbQdb4Ze0YN8NUE0abmmYfU+h97x/bs+Z1UXRv339iLxHZFtik+Hyhe9Ns1mx5IXHFnCBDYLa3/LXtB6g300ukzLfkHUNBNYl+Hz10pf68J6lTyV84H4JY/jPa1Bcw1t3q22lpiRCgEmca7mkfQW52JX2p3rFauvILi30/M/EC+tL4KLKB3SO7ZnVpS5Xw9dsKzc6gJem1bGuJFizdEgkG9FmCbutC31loTVjSTEr0NXfOuNoNR6T8/JJL4GocphtPQydCrg0wC0cZV8c=</encrypted>]]>&CheckEmpty;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzs7LqP2Wwn+KY2noa6cpYlISL8xeYplEG6X65satDAR</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>%uaN7kJhMjY5D75EGcimrbLIAPz7sj5g45x6NUwMGIZ1igKdmHl3uc0qxp05cIwM+</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxdiTmRbfGbnGjlIMY/ENxtnjZZGblHLpODDn0WjFKND</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>%uaN7kJhMjY5D75EGcimrbBtx39kofJY/D8nCpGxnUXCfv65dbOeNp8Q7BqlJIXoO</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyf9oDqCEzDsBwjGIPzUcuDgOYYjeNOWuC5Cf318ovY1</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>%uaN7kJhMjY5D75EGcimrbKS4WCkljzpxjCG/N07Fg2lslIP2vKB0WDoLvoTrA604</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyepLe/iUquhShCMgyTEtAVhCgwoVPHgB8UrSV747MTL</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>%uaN7kJhMjY5D75EGcimrbANGhwqPXQh8Y/QcIOh6txjheajaMbCHkR5pPkYfB6Jc</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf32uDx7HUAeKdo1EzUEZ+M5I6U0DTECt6ulpO0oF9BTc</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>%TicnN14EVETceMDdqqJRy/yENWzqRXtWIASeSQkffd+gwrTiB0obBq4ct/4ffER6</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx7qYxJTGruajYwBDZDObHUgK/BD0g5fNZduHrVSOK2n</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>%TicnN14EVETceMDdqqJRy5JNQfQEaotVT8J4iUkixwP1SBAo0luREsnjbLarRLwH</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3KjKfCyuXgf9kEKA3gxdaa9dygkCzta2Fvp+VC4hFZh</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>%uaN7kJhMjY5D75EGcimrbA89KXcsnveVcfnY8CccmK95WgvvafhRnBXl8qA971mn</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/J2ws7uQp9hEUUGLm0q+njzR7mdxkTVy548QOg/6tJd</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>%uaN7kJhMjY5D75EGcimrbKOf9CKH2d88ey9Pqn86tmnb7vhZ/rdOMkxi4ZLv8QjI</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1blbzqx2pd+G7fznWcRvIrLneGUbeijyWYBfqgG0GaP</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>%uaN7kJhMjY5D75EGcimrbGo4bmBrATkpfoH6o29xXB1cvM+4/Csre0k3GW7w0LHG</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9be6ddLlsCqrO5G7a9gS8f/kSA9iq3GGouBdzVvZck2</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>%uaN7kJhMjY5D75EGcimrbGx7kff4zffIAsAzbGW7EIdOYjWixg+LPy3xlk/8AgqK</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FZ7Du3m7Rny2+OPmYoEles=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbekcvOsKVOZ2bTiN7g1JoBfRbP3o9JQ8h0eK1k3s6cntsWXcAwSHX9LjZYa6ISCAbPvnrv1FOVWP7bbR973VC/2QjXvP2HjwBpBULtgP3QXN6ca+LVZJ6dYxCB1OdbFk+IQ==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Kw9xKZUg/hs/uweeYRI1Uvrm7JawuxlHYgWOPOaF3OAGKxq0Nq929iJbWVAVwMEIqE/rowSLWbMQf50sWXx05Fqsdumr8ID8GhutbKFE10AdCrMPl5rFxnxBOU9mTe+5mhKzVftvhMJokF27VMbwdKSLYGV15XS6NARraph5JTciBMv/i1WYGyz30OdeplDJdiOGArXYIrQVVvCC15n8sUa7Uy4bh7p8gcZE3QHlad6</encrypted>]]>
      &CostingUnitFunction;
    </text>
  </script>
</dir>