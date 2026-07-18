<?xml version="1.0" encoding="utf-8"?>

<grid table="vtdmtn" code="ma_tn" order="loai, loai_tn, ma_tn" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục chỉ tiêu thu nhập/giảm trừ" e="Income/Deduction List"></title>
  <subTitle v="Cập nhật chỉ tiêu thu nhập/giảm trừ: thêm, sửa, xóa..." e="Add, Edit, Delete Income/Deduction..."></subTitle>
  <fields>
    <field name="ma_tn" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Mã chỉ tiêu" e="Article Code"></header>
    </field>
    <field name="ten_tn%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chỉ tiêu" e="Article Name"></header>
    </field>
    <field name="loai_tn" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Loại thu nhập" e="Income Type"></header>
    </field>
    <field name="loai" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Tính chất" e="Nature"></header>
    </field>
    <field name="nguong_thue" type ="Decimal" width="120" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Ngưỡng chịu thuế" e="Tax Threshold"></header>
      <items style="Numeric"/>
    </field>
    <field name="nguong_thue_nt" type ="Decimal" width="120" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Ngưỡng chịu thuế nt" e="FC Tax Threshold"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_thue_tp" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Mã thuế" e="Tax Code"></header>
    </field>
    <field name="thue_suat" type ="Decimal" width="100" dataFormatString="#0.00" allowSorting="true" allowFilter="true" align="right">
      <header v="Thuế suất (%)" e="Tax Rate (%)"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tn"/>
      <field name="ten_tn%l"/>
      <field name="loai_tn"/>
      <field name="loai"/>
      <field name="nguong_thue"/>
      <field name="nguong_thue_nt"/>
      <field name="ma_thue_tp"/>
      <field name="thue_suat"/>
    </view>
  </views>
</grid>