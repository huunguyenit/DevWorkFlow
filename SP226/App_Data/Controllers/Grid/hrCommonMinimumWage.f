<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmlttc" code="ngay_hl" order="stt, ngay_hl desc" xmlns="urn:schemas-fast-com:data-grid">
	<title v="Cập nhật lương tối thiểu" e="Minimum Wage Levels"></title>
	<subTitle v="Cập nhật lương tối thiểu: thêm, sửa, xóa..." e="Add, Edit, Delete Minimum Wage Levels..."></subTitle>

	<fields>
		<field name="stt" type="Int32" width="50" allowSorting="true" allowFilter="true" align="right">
			<header v="Stt" e="No."/>
		</field>
		<field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="120" allowSorting="true" allowFilter="true">
			<header v="Ngày hiệu lực" e="Effective Date"></header>
		</field>
		<field name="luong_tt" type="Decimal" width="120" dataFormatString="@generalCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right">
			<header v="Lương tối thiểu" e="Minimum Salary"></header>
		</field>
	</fields>

	<views>
		<view id="Grid">
			<field name="stt"/>
			<field name="ngay_hl"/>
			<field name="luong_tt"/>
		</view>
	</views>

</grid>