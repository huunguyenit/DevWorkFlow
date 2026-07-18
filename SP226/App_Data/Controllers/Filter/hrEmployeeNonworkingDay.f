<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="hrnvnghi0" code="stt_rec, thu, ngay_hl_tu" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>

    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Jm2jmNNsr1kP/rKP3K21hLrLdfdK6b/TkdSF39kKe2m7hEXAOYKRoprskk/b+Thcw==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" information="ma_nv$vhrnv.ten"/>
    </field>
    <field name="ho_ten" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130, 0"/>
      <item value="111--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="11100: [ma_nv].Label, [ma_nv], [ho_ten]"/>
      <item value="111001: [ma_bp].Label, [ma_bp], [ten_bp%l], [bp_ref]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPjhEzai8T7X2+pXUtYHCLtVAlFukQfbrr4Dk2n5QFLsnZ/mTviyfKVD2ffaQvtfr+BKCuQ0cWelsRax86QJkvqlpXyosOx/t0uv3hbP+vp0esT0igx2YOJ9/8GjGnJxO1+a+QVGgr+Mfz4+ZKriZgrATGZ9P2+ggnAojYdOO93JYyEK3CWNgpiHBZEnHuDeB6m4o6LKxUC4fkzESubi4Vb2SY6J3pGtXyaQ18ViuGBtUITuq/beoAdyNlAudpBwmCnL5MQ0vrLY1OLe4cn1WMCjAEHyFC9twtzrSixnf9e6UP5ATs3W43ByXvYOJE/gHy3YvVXS+PyVhxxYOn1ifrJvJ1l4W5ouwPtfsxe3k7ZesxkMkdQ/2tAOLVB4o8HDXInFI7r5zvriy23ZRiLxXtHAfgl6CwwXuyNCRFX0LABki5K7BioCQAxuoa3phTCy2eANxom1EKB0WCyFlm5kJq5T0BQiVMoBXu0xFS/OWKNMh9GK7R1ZytRu71dHlE9Ws9GMk0Dh4rCarxDLUjHC+J8Q==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reference">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4OhCFRfCy1GRSSaAdSJi+cHge8GidPcTUFYh+BLklXj/Zxvj0g2R28PNZronJwlbwBMIDUmAIbcm97sICIQDRHYIpobgdLnpsqbdqmotnciw==</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>