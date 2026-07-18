<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmdc2" code="ma_kh, ma_dc" order="ma_kh, ma_dc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="địa chỉ giao hàng" e="Delivery Address" />
  <fields>
    <field name="ma_kh" isPrimaryKey="true" clientDefault="Default" allowNulls="false">
      <header v="Mã khách hàng" e="Customer" />
      <items style="AutoComplete" controller="Customer" key="status = '1'" reference="ten_kh%l" information="ma_kh$dmkh.ten_kh%l" />
    </field>
    <field name="ten_kh%l" clientDefault="Default" defaultValue="''" readOnly="true" external="true">
      <header v="" e="" />
    </field>
    <field name="ma_dc" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã địa chỉ" e="Address" />
      <items style="Mask" />
    </field>

    <field name="ten_dc">
      <header v="Tên địa chỉ" e="Description" />
    </field>
    <field name="ten_dc2">
      <header v="Tên khác" e="Other Name" />
    </field>

    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note" />
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status" />
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive" />
      <items style="Mask" />
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330" />
      <item value="1101: [ma_kh].Label, [ma_kh], [ten_kh%l]" />
      <item value="110: [ma_dc].Label, [ma_dc]" />
      <item value="1100: [ten_dc].Label, [ten_dc]" />
      <item value="1100: [ten_dc2].Label, [ten_dc2]" />
      <item value="1100: [ghi_chu].Label, [ghi_chu]" />
      <item value="1110: [status].Label, [status], [status].Description" />
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1efBJoDjhE1pYmZXsMJTHOJ/7uAzl0m8XH+CJNOQP0ASDpvjrpbZbxVrwjSOUf1/H4=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFLTtxwxLS0qUVnguBBCPvPW8E7SNf7oGwp6t9pqyseLMwbF6DAls8efPd6s5dK+edNKQj0lh9Gkrp0jQbe9Dhc=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&uYb9to1gMBcqIjRn56aMn86Utz5IXgsCsrrGOl0kcaTsPTGQvs6BO2JXgi3kbHeBHJnKzevCIxbbxo5LWuLazkGSxb9ioEx3S4ZyDve4GQk2w9fCFYtfjBTKRxVICchu6Cj6qzqCWEE4rYk0mi5mws/50Qkjv1snR5gqTPvDyAlcX0FqpbgIkZf5DKY3bV13hPoTFHkWyW2O9SKaBa/3t/AnN+vdpf5awFidwq1p6f+XJTnlGZhyAMVdTxP36+JwxW7yWWQRTtzABMGAYpDOlWHgwzHBmQsavktMzG30sq829xsVDhaWRf/iBj25z0fboo4vA/RKmLtbkb7inzItEWnWgWv+43jbmpNAsMInWyUefObolWTe7tY6/ocZMSM5NScadD534V9uv/Ocey5F+DZ5MwbcESPDb2h0GN4JjdofbJXXuSyRWvs/T7TsypW/GAVRmupdAZ/NaCrfXqmtz8wXFGiZ8MgmGVSKQvUrPT6eqZtLcQ43KplFcqBL0S+10ENUXsZMJWdh1HA9BcWDjm/PlDWOWgBWddNNlzrBrg8qJPjQsM8mCe980/3nmu8Y</Encrypted>]]>
      </text>
    </command>
    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&uYb9to1gMBcqIjRn56aMn5ZtL5koPrySA5GaHrJVlcbFKAQ/2S4QOEFpSkG10qpwW3Qm4yiqw3pe/5sAUI72+sYKxqMWLxqY45HXVewpigPWMqsq70/IbOq6Nk222gkUtdAMYa24AKybZq7P/u61f0GJSdCYB6+WmAtLN5UusyuCfLFWmHqRIUE3c7WFIlRypa4uIWQTdGFtUcGO+LDO3QH7yaY2HRWvMlnnRhIMF10USnMv/lS1i/ZPjzg15YPkmnwReubB/lJhFBLtghmR/aPuaslPV8plItsE/Z7RM7ruEuQbpet+tws+VOaMw/ru</Encrypted>]]>
      </text>
    </command>
    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvztejTmsyHaWvkdMY9YUhIlymbwnYdUL4Efhqa/55gn2aHelCQw77ZEPpjSrGFs4sakDFjdyQ4cBaqAYuJw3IRZ4yu7oqRhaGveo8efy9hbmDEyCYtrtkuksAcTGeCP5dyZ3dbP8nz93s9fVW8W++wuD/WBnZRUuDz23icJrDwc4jK2nSIGgAYOKwxHTeu+72fr+9F1sEoRM0gAur9Z33PoNv6maSdSae9xyE79XwlRgREuyb3TEsQoHx8lIA8PA43bJwu9dlFFogYnjn1b1k85UOAI/L6+xtSoaQiM8AydrOwJcx+y9FU1hikIPRh+Ew+bZQ55+ZmOZE2ACFKvnmajQFg==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV/0+nWnoDCFc9QfaheFK9oplY+3Jmey/0HsUk4NdQ7UUmzF+/grJQiHlo14Xcc7g6g==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VbYGAhwaJV2zV4US7c/nl243r5HWVBMPP3oKLvyitTlr+A8EzuGyh84CaQaMQiP118iyMiXTTXkUStslmUSsenTRn/RqM9oXuc/hxxDk5pek5KJEBqrHsMKRhcDH7HV/2+rYSTfzb32FhZhGF63h5ZnphjRxNhjKhjF6HEVCvxwD4nWA9GIs+1NaRBgT6mcfeHHM1kyb/JyMelnH+0qx0Q1AP/qFxJ4yU6l6m1LbJWcVZDpqG8Wd5r4835w1JYNVUUjH6ylAEOElTxnt98Mup69qJvhUcpfXEnBTKLg6qfdCD0Z8rvnOSD33MzDJV8UCy8u9KcvGBFbS/uLuU0E2leegrIFSYjEk+BuGV6XMhLn</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>