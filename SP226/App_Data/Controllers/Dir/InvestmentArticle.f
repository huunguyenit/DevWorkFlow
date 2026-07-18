<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dtdmct" code="ma_so" order="ma_so" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chỉ tiêu" e="Article"></title>
  <fields>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Chỉ tiêu" e="Article"></header>
      <items style="Mask"/>
    </field>
    <field name="chi_tieu" allowNulls="false">
      <header v="Tên chỉ tiêu" e="Description"></header>
    </field>
    <field name="chi_tieu2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="tk_no" dataFormatString="@upperCaseFormat">
      <header v="Ds tk nợ" e="Debit Accounts"></header>
      <items style="Mask"/>
    </field>
    <field name="tk_no_du" dataFormatString="@upperCaseFormat">
      <header v="Ds tk nợ đối ứng" e="Reference Debit Accts"></header>
      <items style="Mask"/>
    </field>
    <field name="tk_no_gt" dataFormatString="@upperCaseFormat">
      <header v="Ds tk nợ giảm trừ" e="Deduction Debit Accts"></header>
      <items style="Mask"/>
    </field>

    <field name="tk_co" dataFormatString="@upperCaseFormat">
      <header v="Ds tk có" e="Credit Accounts"></header>
      <items style="Mask"/>
    </field>
    <field name="tk_co_du" dataFormatString="@upperCaseFormat">
      <header v="Ds tk có đối ứng" e="Reference Credit Accts"></header>
      <items style="Mask"/>
    </field>
    <field name="tk_co_gt" dataFormatString="@upperCaseFormat">
      <header v="Ds tk có giảm trừ" e="Deduction Credit Accts"></header>
      <items style="Mask"/>
    </field>

    <field name="loai_sd" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Số dư" e="Balance Type"></header>
      <footer v="1 - Dư nợ, 2 - Dư có" e="1 - Debit Balance, 2 - Credit Balance"></footer>
      <items style="Mask"/>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 50, 280"/>
      <item value="110: [ma_so].Label, [ma_so]"/>
      <item value="11000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="11000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="11000: [tk_no].Label, [tk_no]"/>
      <item value="11000: [tk_no_du].Label, [tk_no_du]"/>
      <item value="11000: [tk_no_gt].Label, [tk_no_gt]"/>
      <item value="11000: [tk_co].Label, [tk_co]"/>
      <item value="11000: [tk_co_du].Label, [tk_co_du]"/>
      <item value="11000: [tk_co_gt].Label, [tk_co_gt]"/>
      <item value="11100: [loai_sd].Label, [loai_sd], [loai_sd].Description"></item>
      <item value="11100: [status].Label, [status], [status].Description"></item>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwetJMwRYxXApuEnruDtx32t+C3L/7C0odiMXdkKIt3JnUiTtgFl0iOtI0XU3bThdX0Rs+9dKdK2ulBF7XTe0QcF</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN3IORMRQMR2XbnGBTgYmKPl2nG6JaAR59WA620TwbLA8WHrWPDVk3Wkj0MW9fjA2aaLdUBOWY3xA7J3dMlc8YWz</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26Qci/5V74y4GLvbBXmPEQouvL7ZIwVWuBL3D0G4jEIu18QBbsleCGsCsAQdizQTRBhvohDTjUlvEKH8XdnUiJkiMDBGFXiXwxAt7Yw1XcQN+vP82HeEDjc7Gzp5JoCWhK56G3cxv9TLT6maxEC5Aqyy0UhXw7vPnann57ManzM7J088K/KI02RACyxAdGhzygf76oVzTiV8gmeN8TlvxYu4TnecXSG2VRlqRKxIpVbdm/Kl/suAAgpnuMkw0sFMaziyQ5bIK+QJM1NR/CgRL0JCKv4NDh8kr61D4NB3iQbs6kzKU0eIlUN1lSv5apA24LucDaVpkIiEtm4uFJMGT4r9Ni7SeHUgAoYiL2rg/8ae7y1q773AagyX4PyfMpvcXXg05BsLxlMjAJ5zOzZP/hNR5HilJi3RoS2utgyfL7KRPuDSE+m41VOZUK60yXg67tZPw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82ncJ4BfxXGg6VmZC53vbUlcm+jhVpjxU4ppfJfMyNYqYHlki+mY8qhIW7gkRPPtMD0kfjXok/6WeAdoOjOELXd1pj9D+KzjD7g6J7OSvi7kpRFqCV4HxFV3ykBPZzQb7GnCTikCoeZ8n+L+UgwmqyncnTIFjt2HWspXs2s/KcBoUOlZQnPpUZXZ45IUIGQMmLhvrkr7Y0K3TCZFxqYesgfEGRM9wGt8E51Km1UOB1MjiQ=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/js8BccZyXatWYNcD7v/+jwMSk+mW82zaZ2Z4SeY7/sXRXgDs6ZNmW5r0bzeethrP5yHr0LX72ZlaDq3FzxpDNaeOB1GCVTvE6bIEe48Qx/JTNSsifT73O6t3GvauuQXvMoouMk/dfIDSHE0Ivg4BE0GtWNqVrUDF/ELHml3LB4Ig2IMfa04pXZsCerSpiUX0yUDxSQGL2qEBvmxOa2f7N1beobFpQfZYgKwAaHHXbznB7Wj/jEgyUQ46QmPGQB7jjFhPzWqz0EhtjktPok243Mw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbehvacIG4MsZYImnYxXc/4f8bZ4p7QzZd/v+KxerYs3dB</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkboGykMIy29ofb2t5JzCGdegTIXFhHtHITvIU0FXtK4UWLvgMwfUWuoyTfAL7b6pcedItQ4CwepvvbWJmOsNjEo688qnTd//4ooSEAoLyC1BmnoZiolOZ2BObtn/U59zzEyUvKFBcD0TYvHlG1sE9H574M0g79vxkKSUhZD0Up7A6kgbd46hdSCtMnm2Cs0z8QFhfidWa2D29KDp1vM3vC9do5qpIi3x9AioY7GX1ThdF8DHx6Bas6e+QRE3zhWJ4M58p41N+9fP6JMHnQ8/AWzM1e/iwDRDWderjZi7B7AdQbhdDGzQjWdPz21Ltt40M1lYgfcstDdX1tkqeFzWOCN</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>