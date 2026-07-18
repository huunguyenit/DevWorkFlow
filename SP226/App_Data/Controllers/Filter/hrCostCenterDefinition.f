<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vhrdccongbp" code="stt_rec, ma_bp, ngay_hl" order="stt_rec, ma_bp, ngay_hl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="bo_phan" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1AOQlA0h5WGczBnwyQ6Ay2gCnirCyUK2nDxbEvHzEBYubNP2Yz97ru+1l/Tv9gjZmM=</encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="bo_phan = case when '{$%c[bo_phan]}' = '' then '' else '{$%c[bo_phan]}' end and status = '1'" check="bo_phan = case when '{$%c[bo_phan]}' = '' then '' else '{$%c[bo_phan]}' end"/>
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
      <item value="120, 30, 70, 100, 100, 130, 0, 0"/>
      <item value="1101-11: [ngay1].Description, [ngay1], [ngay2], [stt_rec], [bp_ref]"/>
      <item value="1101000: [bo_phan].Label, [bo_phan], [ten_bp%l]"/>
      <item value="1101000: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="1101000: [vi_tri].Label, [vi_tri], [ten_vtr%l]"/>
      <item value="1101000: [bac_quan_ly].Label, [bac_quan_ly], [ten_bac%l]"/>
    </view>
  </views>
  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBb2AweetwuRSjNIt/RVItfnwj8KETZUspDystuKQRyhTh86bwcTpQag/xXBgmMcjIp6PvgqEXudtm/PtmqEMpB5UC0FBX55mAmI5/ISTWc01LxoLiRFwZQwLZquTw52g87Ca9HBVPe5vQEn03LnqSfIvBdBdOyn3w1ovGD2nNoenxAhU5oAAhTh67zF8sa55NZfzWUnaBKej9w3k2OSnZ7nW8HWB4x1eGW0WSu7M+h2KjPSFFwLess/TN1KSnX05IGGaS+Zg3XvZekIHWFIVWlkaFkoO9PqTbSbDkeZtm9i5sjFF8KkEANmEmlOc0dMZPw0CMOyDHYKfWfRlHUT4PcfQcOv17KkMh3xPGiX/8Sib9BdlIal7sYCA9JctRIP5taqkIBMRcX7iedKpiXNLd4D9UJxB8YiY9KuQHsTOsa7X+BFlu/KP8eddYs00CWHB030+uuRzw2luhL1t8w0cqzcrhAxx1bkpDwvpFn+FZBo+L7qpzuwX3YIWNhX3SxRylQ2R2XSphAwk66yHNB5hLmznmKxZZdU2hMAHJ0FGnEqfRdBiNUKx84TgvIBJMX7goD7jeCLroQpGpdw2r8cvLmfZQSe+QtPrIntNQEKb5js6XOX2BtePiN9gjmQRr2RgP4oMIsFm3DDZ5S4NzpXcV/W65K2J4lKkXqQirtVmg4vUxasYKD1Hh5u/PjBKXN5hIxk4zE/Nw753dEBF7/99KS9XHC62Q+1q4uDsYKcli5TKg3wyN1qHLc6efTwtdYSVtbf/s/aMIgIpS0G9iqQ0CfOG9Q/PWvsf8MK23Wcj+M8gNLsPbTPQMZ07SPyl9Nq0urWKEmNiCx+9WQpOwBX9scs</encrypted>]]>
    </text>
  </script>
  <response>
    <action id="DepartmentRef">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK5AnMsH6nWz5jWh8N7/f2bQkgLsQYVSpqEemRHWTf1mhj/Zta8wLN8KCPgPSXbL9YK0BJAPffxD1MADDJJcormBMMT0yYGS4j09QGJxDSsoQg==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>