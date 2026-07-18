<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Khai báo tham số bảng cân đối số phát sinh của các tài khoản" e="General Trial Balance Declaration"></title>

  <fields>
    <field name="M_ds_tk_ctr" clientDefault="Default" >
      <header v="Danh sách tài khoản được bù trừ giữa các đơn vị" e="List of Account Mutually Balanced among Units"></header>
      <items style="Lookup" controller="Account" key="status = '1' and tk_me = ''" check="tk_me = ''" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="M_ds_tk_cn_1ve" clientDefault="Default" >
      <header v="Danh sách tài khoản công nợ hiện số dư một bên" e="List of AR-AP Accounts with Balance in One Side"></header>
      <items style="Lookup" controller="Account" key="status = '1' and tk_me = ''" check="tk_me = ''" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="M_ds_tk_2ve" clientDefault="Default" >
      <header v="Danh sách tài khoản hiện số dư hai bên" e="List of AR-AP Accounts with Balance in Two Side"></header>
      <items style="Lookup" controller="Account" key="status = '1' and tk_me = ''" check="tk_me = ''" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="name_M_ds_tk_2ve"  hidden="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="name_M_ds_tk_cn_1ve"  hidden="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="name_M_ds_tk_ctr"  hidden="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="157">
      <item value="250, 300, 0"/>
      <item value="111: [M_ds_tk_ctr].Label, [M_ds_tk_ctr], [name_M_ds_tk_ctr]"/>
      <item value="111: [M_ds_tk_cn_1ve].Label, [M_ds_tk_cn_1ve], [name_M_ds_tk_cn_1ve]"/>
      <item value="111: [M_ds_tk_2ve].Label, [M_ds_tk_2ve], [name_M_ds_tk_2ve]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6UyjQQRlOSUeYd3J2Bs7LT/I0nTKPRaVbYTG2pYTnLWmqvGP95xpcALgjglnSxBwfybiyiIk7O1szPSEiAbjtuyaaNJ1+c+6tjjGqkNmBoi85lJeUR9Mi+dSZeQQp7PHGruWn2Hxkd/HU0IYdQbDpcCVODdWwYi3VKH+yBflnVzKw3OEnCJ4Hperoa2NdZpzPlfWIhk5JCUHm2mmmnNn52tVQD5zzXN9EOHXqlvJXgBrgYwicQQLuctp4GEzBg4eke8I0qOav9I4wwMEMSL0pnNuzIUSXF8yMfrZPNWy3AS9iLhiDwMc2mzrWl6cPBbS2BVazWHYVvSRPIVoJ73/Heg=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Zr1Tl7it+pYBXTKv6swDrEv3VHjSR8VlrVFKaJSvzQehSkW3L2DaLAs/wkLKQZ7XnPtzUFZgNWW4BHFi9xW8/9t/jF3POLwDvYeathGXaqtKvIvKqf0fYqw/N0v8PnnWg==</encrypted>]]>
      </text>

    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70JVAU7kSPYn/O4W9vtyXO73SvBRe8lu6rL+zTy0ymCnd+4sNPThf1GaWTA2tQdovqC5zce9AvJEeAPKi9FlcMlkyrKCHp6GrD3f0OuF26GMoqjFZ/1TisW2nOkB6fwmZYfph4Et8weVJDwS/OnqYQ9c60qHC2cmF17WIHGvKkYzMhPRs3w3HO/VvTlJV+czKgRGKfaJRgv37QEOJP8GukfJ6axp7teap2OIMBKrwJ/t1</encrypted>]]>
    </text>
  </script>

</dir>