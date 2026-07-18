<?xml version="1.0" encoding="utf-8"?>

<grid table="dmcpnh" code="ma_cp" order="ma_cp" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục phí ngân hàng" e="Bank Charges List"></title>
  <subTitle v="Cập nhật phí ngân hàng: thêm, sửa, xóa..." e="Add, Edit, Delete Bank Charges..."></subTitle>

  <fields>
    <field name="ma_cp" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã phí" e="Charges Code"></header>
    </field>
    <field name="ten_cp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên phí" e="Description"></header>
    </field>
    <field name="tk_cp" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Tài khoản phí" e="Charges Account"></header>
    </field>
    <field name="ma_thue" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã thuế" e="Tax Code"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma_cp"/>
      <field name="ten_cp%l"/>
      <field name="tk_cp"/>
      <field name="ma_thue"/>
    </view>
  </views>

</grid>