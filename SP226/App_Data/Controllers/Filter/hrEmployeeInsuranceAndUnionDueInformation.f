<?xml version="1.0" encoding="utf-8" ?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="hrnv" code="stt_rec" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày vào từ" e="Date in from"></header>
      <footer v="Ngày vào từ/đến" e="Date in from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày vào đến" e="Date in to"></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bac" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="empty" type="Boolean" defaultValue="0">
      <header v="Chỉ lọc những nhân viên chưa khai báo thông tin bảo hiểm, công đoàn" e="Only employees have not been declared"></header>
      <items style="CheckBox"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="110100: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [vi_tri].Label, [vi_tri], [ten_vtr%l]"/>
      <item value="110100: [ma_bac].Label, [ma_bac], [ten_bac%l]"/>
      <item value="-11000: [empty], [empty].Label"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHj+qpqrYi1uSk2p6sLvrQJYRgdT56NvZ84OI0/hkNLdqbwLZnGaRfHDFwUlcrf2OSrd8aqX315/F0UShgPx6mgEjhVYvHG158B3xKgtO0+cko7TcuDFllpRPIOluihN2g==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAnfmKSAJtKy5hx6O7sHsw7rSTcxDkY96or398oIU4jkMdULdgTUQCu1irlXoMsbKB2fobVL3jyzoL2PPnxijYLDFNQBQagVgE1zCE4VAtzsvupJLNT2U21Tx6sVDxjQZQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtcUTywWAtjp5kQe+T2zsL5eyMBDQbmTOm4nWfNMcGNo8ksJvZHHlbDxarD+CyMW/DEzQqdwd2kcJjekyCm8PIFz1WsKJSzXUvRGrL1czU+pxN62IKvtqYem/rtsFVmU4SCH86s1o0OxqdoxKsQ/fHu7fpYFl0mNA/HP4SDgUDlfxUEJx/xBrNF/Zuw+j6SscZEVeKnnAFQPqNe9byzv2c/RDHtxmgS8FmQsgYtgr5vfwuLRD7w3UTVH1OMKauXayixegfWmwZNdZ08DunQYSAhhTq+xlELlHaUSJ9kNsHPY/umOxXGXe+n8Xc2OyHbPAMMgH79ppecR0R+bLEAvSxUIvRdxJPT3XqOAS6QdZhCMenCTZn1anKLK49gNgCHwhVP3czeKc5Al6ZeBsTfTyZJ+mqkSiUZiLLozXJJU7jrwb</Encrypted>]]>
    </text>
  </script>
</dir>