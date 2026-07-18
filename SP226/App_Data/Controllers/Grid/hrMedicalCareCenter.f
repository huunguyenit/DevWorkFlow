<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmkcb" code="ma_kcb" order="ma_kcb" xmlns="urn:schemas-fast-com:data-grid">
	<title v="Danh mục nơi đăng ký KCB" e="Medical Care Center List"></title>
	<subTitle v="Cập nhật nơi đăng ký KCB: thêm, sửa, xóa..." e="Add, Edit, Delete Medical Care Center..."></subTitle>
	<fields>
		<field name="ma_kcb" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
			<header v="Mã đăng ký" e="Code"></header>
		</field>
		<field name="ten_kcb%l" width="300" allowSorting="true" allowFilter="true">
			<header v="Tên đăng ký" e="Description"></header>
		</field>
		<field name="ma_tinh" width="100" allowSorting="true" allowFilter="true">
			<header v="Tỉnh thành" e="Province/City"></header>
		</field>
		<field name="benh_vien" width="100" allowSorting="true" allowFilter="true">
			<header v="Bệnh viện" e="Hospital"></header>
		</field>
	</fields>

	<views>
		<view id="Grid">
			<field name="ma_kcb"/>
			<field name="ten_kcb%l"/>
			<field name="ma_tinh"/>
			<field name="benh_vien"/>
		</view>
	</views>
</grid>