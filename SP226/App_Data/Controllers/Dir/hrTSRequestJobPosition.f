<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrccyc" code="ma_bp, vi_tri, ma_cc, ngay_hl" order="ma_bp, vi_tri, ma_cc, ngay_hl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="yêu cầu công cụ, dụng cụ theo vị trí công việc" e="Tool &#38; Supply Request by Job Position"></title>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" clientDefault="Default" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" check="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" clientDefault="Default" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri" isPrimaryKey="true" clientDefault="Default" allowNulls="false">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1=1" information="ma_vtr$hrvt.ten_vtr%l" new="Default"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" clientDefault="Default" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_cc" isPrimaryKey="true" clientDefault="Default" allowNulls="false">
      <header v="Công cụ, dụng cụ" e="Tool &#38; Supply"></header>
      <items style="AutoComplete" controller="hrTSList" reference="ten_cc%l" key="status = '1'" check="1=1" information="ma_cc$hrcc.ten_cc%l"/>
    </field>
    <field name="ten_cc%l" readOnly="true" clientDefault="Default" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 20, 50, 330"/>
      <item value="11001: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11001: [vi_tri].Label, [vi_tri], [ten_vtr%l]"/>
      <item value="11001: [ma_cc].Label, [ma_cc], [ten_cc%l]"/>
      <item value="1100: [so_luong].Label, [so_luong]"/>
      <item value="1100: [ngay_hl].Label, [ngay_hl]"/>
      <item value="11000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx5ygYUqBflFA7N7aGadDr7V5ExyeqKQ4Sx/WhiImYT9yMZTZvFdvLQUamC4P1xByIpeNXZzmrBEt47fx3+QnatF1KdNqvrv8L8G7u0Jqk63</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzEp+Wwpz9WFbS9qn2vXwT0AAVLFWppbL+ZTFahNC3dx5k2TsF4uF1kAdYxyPuYYW5+cPjYnBSMyg7lYyqOod47/M5/lKnJAMrDcWib+v0nD</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cthiwEnilrFBvFf4bpUf5XFJPujX12mNjkMdP0ymY64aU9yaKV73yE7mdjzaoxnAF7AiCflihwp4Zh7onrIJdS7nHc3nNmascoXSHrwJF7eMqhh2r3JRyOxWCAPcfF6wiyNf9bgIxRBUwrkROZb7Wmuh1sZslbUOmkSPPJAEnYrKPpcEnW3bkGFsR1/yBFxHgdt8pVwrlR4c9R0aVeX8TTNAjWTQkU6+U5YEb2m9AuiNoigqJWYNij/0ax45G1mwudXFY8XvLPCG77WvcYIoUmCFAa2SKP6ys5eH2DbPT6MUc2+I7y1THcjAxLV96EPeJptQ01go68qEY4iD97O+eFtzTX3mXuk56piA+lOYin1VA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n+gc6I1IwNvfKKeTjfqbOPnr7cEtG9ckdLIKVKaZTHnDgMS+aBhYVmVOEw2cohJ6NYsQLhD0H5FPkiAoTaTUa1nsvhxot6HrQtP9Oo9tqAq30pXVpM2PQAXs00yCaNR5YZZJYmEv5Q4Kw8lUwTj2O7UM+3U5vfIlipy2KcYKvdcBu2ItYRpCVbO5ZG8xCfBfSwwvTEOMiemorfojB+ua6Hw==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jbmjLVEaL5LOirB19XEEBSdBt28fOdiaNc/HeS346UFuUkGgP1512b9JESNQullrXsAsAASa9liJq3+Dzxmgj7qO02rFN72yga4dsPNrWVzE8bkXtzfxh3hsH99ipJegM6ujNRmasDCMsFHzTSg20+5auhMSqMhnUMXVaEMNdX+gSjZvV2AXT1RPhv6Nuf4iomTxtcC9iIUkPC7d7SDEOieAeQ8d6CnVr/N7W9zvwOzuE8zLZ0sKXLLtQ/mVdQNIVKSi35Kg3axzrYeeD7CrneYZ7ZF10ga5PeQ2QCdBh/5ZBD6oyESUbg4/Bi/vHckgC</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeuZh6ZMhJ3z4eB1uSgYugrZQcRCM7JCED3IZZxz1UFr41HDLmSfM+34Pi1t6amtHRoInJ72OC8YoVjy2nqnJFR8=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Oc0QJdCnkoxRoPQPeia/JU8sfde2Hd9kj0LMlqduLZbe4257goNIIr5nosUNfSfRwIglyyAOhHe4eVWKnCi3284z/KY2y/nG0a31WX3T4Bd0eK8kHTsXpVluCvSXhHofv+scVyXMImp1KoEIpQweZXCkIpuBV98iyH6Q4WFVeTAMUouvrF+Ha95WemD14wC7+Ux6spIQ6TfO+vyfsbSkISzLKaIyIDi3igd47wmHceUducGQIqqOcUjS5ACejilCcNBXO+GcsL076kO943hdjCxelIMHvLOEu62XW4aZL8i</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>