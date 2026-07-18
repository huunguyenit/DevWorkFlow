<?xml version="1.0" encoding="utf-8"?>

<dir table="v20covvth3" code="stt, ma_so" order="stt, ma_so" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chi phí sản xuất theo vụ việc" e="Costing By Job"></title>
  <fields>
    <field name="stt" isPrimaryKey="true" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Stt" e="Number"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZc2BhLBElWRAVkyDaSFOGx51cx4EoJu7rACxVXtlT5dfswfGo0dw45B25evsyHoVGw==</encrypted>]]></clientScript>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="X" allowNulls="false" clientDefault="Default" hidden="true" disabled="true">
      <header v="Mã số" e="Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="chi_tieu" allowNulls="false">
      <header v="Chỉ tiêu" e="Norm "></header>
    </field>
    <field name="chi_tieu2">
      <header v="Chỉ tiêu khác" e="Other Norm"></header>
    </field>
    <field name="tang_giam" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Tăng/giảm" e="Increase/Decrease"></header>
      <footer v="1 - Tăng, 2 - Giảm" e="1 - Increase, 2 - Decrease"></footer>
      <items style="Mask"/>
    </field>
    <field name="no_co" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Ps nợ/có" e="Debit/Credit"></header>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="tk_du">
      <header v="Tài khoản đối ứng" e="Ref. Account"></header>
    </field>
    <field name="tk_gt">
      <header v="Tài khoản giảm trừ" e="Deduct Account"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="120, 40, 390, 0"/>
      <item value="11-1: [stt].Label, [stt], [ma_so]"/>
      <item value="1100: [chi_tieu].Label, [chi_tieu]"/>
      <item value="1100: [chi_tieu2].Label, [chi_tieu2]"/>

      <item value="1110: [tang_giam].Label, [tang_giam], [tang_giam].Description"/>
      <item value="1110: [no_co].Label, [no_co], [no_co].Description"/>

      <item value="1100: [tk].Label, [tk]"/>
      <item value="1100: [tk_du].Label, [tk_du]"/>
      <item value="1100: [tk_gt].Label, [tk_gt]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DFQdm3rK5K8JpimLnRaFlYRR2SOu98hJJnZP4GpFO+XmGC9qjDodou4wVI7EsK1e1e1IYs5cvuCDyYsM5q7pd45clNL4JLxR6IEtL0toO7MvmZX6kyApLcuRmG9JS73RMfhYkpo4jsV5pslpMwH6NoJG+yLBDTxK+yVirmeRuMSdEfPysyWIeTfmEM1luXSfh+yfg4kqjXXkXabWXgcW1vXzHKTLGxpISRDoeHNYIfOwubRYpMSjVO555LqYYG9t9</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nI4nSMv0F571KShY2QixF9e0+8/XcjknmLNNLXrbMPQsPzJuQJ8rdkd3SKvsr7kp6kAN08A/D26fsR+ZVywGNqmJGb7UzdfhiSZ5JD1kBFw5+fpp+abJCsBnEn9V6hc5p5rKomu0OvjJrOCx/BkNI8w==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6o9bYjO0o6ni+bFtDN8x8ZB9HblSstQUwi0W2U9ncEbkcfJXSwss15PMzxunSxTquwO91HjBp7DsvtwgR6z5do0KWsCnjy9QkXi/DYT84jKFJDLEprX2v4JnQFGbNkIRaYVnt5eOTBOVMpT9fMjrf5vXud6G9IjYM2qKuGfIHoElbEXwegpgGzkjAqatUL1ADx8e+nTU39uGYhP95WqgCAU5hpEkl2zwNw69quQN21U</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KcCh58IJwrFKWH4ieU3gZlclhSY2RXEAVhhFNPjMYv4oiBM87+LiNCyzoCDAfQ/RWZ4NRX1azIApHqu7q0PQf+rPo+LD37c3F2zTzeOAtWTPO1MFUioK9tLrq50cZXeEO5wexYp11tQAvwGMZK1F+hPr5HhSv5bz7wvB9/4RkQC</encrypted>]]>
    </text>
  </script>
</dir>