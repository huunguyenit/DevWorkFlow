<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrghphep" filter="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" code="ma_bp, nam_hl" order="stt_ref, nam_hl, thang, ngay" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo chuyển phép sang năm sau" e="Carried Forward Annual Leave Declaration"></title>
  <subTitle v="Cập nhật khai báo chuyển phép sang năm sau: thêm, sửa, xóa..." e="Add, Edit, Delete Carried Forward Annual Leave..."></subTitle>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ngay_thang" width="100" allowSorting="true" allowFilter="true" align="right">
      <header v="Ngày giới hạn" e="Due Date"></header>
    </field>
    <field name="so_ngay" type="Decimal" dataFormatString="##0.00" width="100" allowSorting="true" allowFilter="true">
      <header v="Số ngày tối đa" e="Maximum Days"></header>
    </field>
    <field name="nam_hl" isPrimaryKey="true" type="Decimal" dataFormatString="###0" width="100" allowSorting="true" allowFilter="true">
      <header v="Năm hiệu lực" e="Effective Year"></header>
    </field>
    <field name="stt_ref" width="0" hidden="true">
      <header v="" e=""/>
    </field>
    <field name="thang" type="Int32" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay" type="Int32" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="ngay_thang"/>
      <field name="so_ngay"/>
      <field name="nam_hl"/>
      <field name="stt_ref"/>
      <field name="thang"/>
      <field name="ngay"/>
    </view>
  </views>
</grid>