<?xml version="1.0" encoding="utf-8" ?>

<dir table="hrnv" cache="true" code="stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày vào từ" e="Date in from"></header>
      <footer v="Ngày vào từ/đến" e="Date in from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày vào đến" e="Date in to"></header>
    </field>
    <field name="ngay_vao_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Chính thức từ" e="Permanent from"></header>
      <footer v="Chính thức từ/đến" e="Permanent from/to"></footer>
    </field>
    <field name="ngay_vao_den" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Chính thức đến" e="Permanent to"></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bac" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="official_yn" dataFormatString="0, 1, 2" clientDefault="0" align="right" inactivate="true" allowContain="true">
      <header v="Loại" e="Type"></header>
      <footer v="0 - Tất cả, 1 - Chưa khai báo, 2 - Chưa nhập thông tin trong chi tiết" e="0 - All, 1 - Undeclared, 2 - Employees without fulfilled detail information"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101: [ngay_vao_tu].Description, [ngay_vao_tu], [ngay_vao_den]"/>
      <item value="110100: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [vi_tri].Label, [vi_tri], [ten_vtr%l]"/>
      <item value="110100: [ma_bac].Label, [ma_bac], [ten_bac%l]"/>
      <item value="111000: [official_yn].Label, [official_yn], [official_yn].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHj+qpqrYi1uSk2p6sLvrQKXgWdrvm/6ggOC3H6uOB1AwZdCk9soa7cNqD4P2G0XDLEBCV41+3XCGaJT8jO4luYp1saqpp7boFwnthVLxp6i</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAnfmKSAJtKy5hx6O7sHsw62NEDwNLJDQWn2VGcNHgaN4sO8xmnkU63JIqNgkS/4vB901UqWkXTGiplEl2kCxZnfuZ7iCcnSZ2Y8EhtU3Ybw</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtcUTywWAtjp5kQe+T2zsL5cBa+ehnlWayMA3Rb/hrVppVHziuQ6yj08ZSOiAXl5/2l382rY71HqcCEKjkKLmuyUlgqfRcQga29/alAxIXVyvW9ZB0tT9N7XtOa1URSks9DPsjFiRE/p2+RdybkeqXFSRfOpXgrFTvx+zno76nnw8/tlMwg/JR58ed18qw+zXuvfTLykn8hW+0oBaReRswMZ1d61vXm8n6bGG3Wg5JdRpRytrHcTFChAbf44z79tv3jo1dXHGxjqLCiNrg45KnsIw93oP/MrXeGYOm3Z/zhPoIjHqr+picA5SyShOc84pdbQCwjQSMAX5wHppNcEsVs0zOw8uiPyl4mKd39KMCaSDxPEhTwUp+0+Z8F4JfM9LNCGYchxzEsU+CCSOFkhsfO256SMxXHVOHLri+rRWOfsX6M0l+LdGm8arLB6K96HzHUd77HERy20m3qd5KKYSiqoNCk+q/SFv6jfFDpgVt97VReeiy2tyIvHul9F4bryfwg==</Encrypted>]]>
    </text>
  </script>
</dir>