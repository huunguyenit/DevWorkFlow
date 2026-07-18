<?xml version="1.0" encoding="utf-8"?>

<grid table="hrkhaibao" code="line_nbr, id" order="line_nbr" filter="id = 'OVERTIME'" xmlns="urn:schemas-fast-com:data-grid">
	<title v="Khai báo loại công tăng ca" e="Overtime Shift Workday Type"></title>
	<subTitle v="Khai báo loại công tăng ca: mới, sửa, xóa..." e="Add New, Edit, Delete Overtime Shift Workday Type..."></subTitle>

	<fields>
		<field name="line_nbr" isPrimaryKey="true" type="Int16" width="0" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="id" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
			<header v="Mã" e="Overtime"></header>
		</field>
		<field name="name%l" width="300">
			<header v="Tên" e="Description"></header>
		</field>
		<field name="val" width="100" allowSorting="true" allowFilter="true">
			<header v="Giá trị" e="Value"></header>
		</field>
	</fields>

	<views>
		<view id="Grid">
			<field name="line_nbr"/>
			<field name="id"/>
			<field name="name%l"/>
			<field name="val"/>
		</view>
	</views>
	<toolbar>
		<button command="Edit">
			<title v="Toolbar.Edit" e="Toolbar.Edit"></title>
		</button>
		<button command="Seprate">
			<title v="-" e="-"></title>
		</button>
	</toolbar>
</grid>