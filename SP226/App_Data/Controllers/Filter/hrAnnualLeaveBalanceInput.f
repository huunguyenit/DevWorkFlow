<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vhrphepnam" code="nam, stt_rec" order="nam, stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="bo_phan" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1AA4i9XFVMJ64TqTf4ZK+NcHEMVvT5eWAo7Y6qpSKWysECQc0w52hExp4NCu1HjZKk=</encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bac_quan_ly" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182">
      <item value="120, 30, 10, 60, 100, 100, 130, 0, 0"/>
      <item value="110----11: [nam].Label, [nam], [stt_rec], [bp_ref]"/>
      <item value="110010000: [bo_phan].Label, [bo_phan], [ten_bp%l]"/>
      <item value="110010000: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="110010000: [vi_tri].Label, [vi_tri], [ten_vtr%l]"/>
      <item value="110010000: [bac_quan_ly].Label, [bac_quan_ly], [ten_bac%l]"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TkFfbm+hKnQy3Pyn4h91TZ5fuPen+zVRfYcwLd4Vg79/LcqQm1CK+I8FMuhYZ/7P5KKJN6MAIRze6zFSvqSNmhHcrzOK6BAq5bU0+xHnO1iGZVkDbID6fj4E2hzwobgp681l/B6Sx1APdMSdr4MTwaJTqrBR4iEQhjKX4YtjSX2UHAS/Qpq69O0SZ5Ity+qYtbmqYQAol3lqCXtJsf0l78=</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xtdKU95PYcbtZIJ1aIxl3z+oJiPBkh0JrrXjixTETCbgzWmvMZmCVXeEUC2wv933cp0AYYFOgZg09DznH4iEvtKA84TTcZb/jupBvaxr2dwROX84H9MoTwIA/ZBvM5jKSuHIaSWg64DWrX3JEeW/69JZLZQk9JxGrmwlItnljzN8N6/mbwWq0E4AUpoAP6k1n1vO25QeLNhbxwuVKZfQIq4O8FJ411CD8WihzAI8NQy0LQvY1BAI5WMw6/HM3Vdrrp3fPNMRW162kc3HL4pUkbMhe6EhI8aP4c5WwZxqVM1oPPW0SFytw7qAOduMjPZXd95dWr2j8vTo3jwuyCyjPe5tW6cBNsymfGcBPnVzHA/9wjGw1UR6qRJAsdpcZWR5Cn1L2BZ+bIpLlBAqvD/KpOVyRZPNPmsIMi2XUvTGeoNTCvmgczuu1Pxho6+8sdU/f0qFuj04z2El0xd7UAgquxoCQAGU7jwFxpWsJhSnVkmKllgT01q2RLBBundB4Ax2cvIWhh4Vsojm7ctEqnZ/THsg3Z+sY2I9YEZhDfxQXMf051nFcVKjQ+MMesZ8NsbJ9zaBWtlRA7JsGFqtNqu+uexpTy5w3w+OciRVR25k8iRRqmb/Ssid+Dv9HQBv5WEzeehfpM1APS1mASl4Iupyh27aGgONOUN9+AP0NtAAlXth8TB4jyZQyGebqiw3zUEcbIxT9KLmzRlKcdgw5Wn4kLj5yeRGT5ONmFIX30V6HPt4ZTDSRqKHLPda68YWyBb1mTT9rJPOO8imEIqR81NzgPz3X4/bYbIaMgA1D4aJ0sdoIYnT5YQlSE3vC3e5h5Z+cNX0kebjjyCxYdwBmKz6mYoEj1p4BbuVMZF2OALJDxBulEDz+6KHlA/egReu7GDNZU+tLdXYxk6fz+Pbkbj4nNkzzq0yxaGKkAAK8H8paoRCifTvXbSaUpU3TdYBG28ptRvVAHQ0vF+GQAIC3FCK+RkoBTCd75LCJOpIuml95gGdmxa6ofR3Cg7j6vJg30wA8XM8/ZwCFIFUfCoh/EbmoOBc</encrypted>]]>
    </text>
  </script>
  <response>
    <action id="Reference">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK5AnMsH6nWz5jWh8N7/f2bQkgLsQYVSpqEemRHWTf1mhj/Zta8wLN8KCPgPSXbL9YK0BJAPffxD1MADDJJcormBMMT0yYGS4j09QGJxDSsoQg==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>