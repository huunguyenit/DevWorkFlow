<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
	<!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
	<!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
	<!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="hrkhaibao" code="line_nbr, id" order="line_nbr" xmlns="urn:schemas-fast-com:data-dir">
	<title v="khai báo loại công tăng ca" e="Overtime Shift Workday Type"></title>
	<fields>
		<field name="line_nbr" isPrimaryKey="true" type="Int32" hidden="true" readOnly="true">
			<header v="" e=""></header>
			<items style="Numeric"></items>
		</field>
		<field name="id" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" disabled="true">
			<header v="Mã" e="Overtime"></header>
			<items style="Mask"/>
		</field>
		<field name="name" allowNulls="false" disabled="true">
			<header v="Tên" e="Description"></header>
		</field>
		<field name="name2" disabled="true">
			<header v="Tên khác" e="Other Name"></header >
		</field>
		<field name="val">
			<header v="Giá trị" e="Value"></header>
			<items style="Lookup" controller="hrWorkdayType" key="tinh_chat = '2' and status = '1'" check="tinh_chat='2'" information="ma_loai$hrdmloaicong.ten_loai%l"/>
		</field>
	</fields>

	<views>
		<view id="Dir">
			<item value="120, 30, 10, 60, 330, 0"/>
			<item value="1100-1: [id].Label, [id], [line_nbr]"/>
			<item value="11000-: [name].Label, [name]"/>
			<item value="11000-: [name2].Label, [name2]"/>
			<item value="11000-: [val].Label, [val]"/>
		</view>
	</views>

	<commands>
		<command event="Loading">
			<text>
				<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwfmEkTep6OOw6QCh+UhIMMqoDTmiWUZ53y1h25E2JmnZP2EhMEOsPtWdluVayoTReA=</encrypted>]]>
			</text>
		</command>

		<command event="Closing">
			<text>
				<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0XJssK5ClaqdrinLDeEE2LQn5huKSZ/3tUiz/8gj+DiI/c0/4vgbsJBQ7YypzB0mUCyvgfntQNeEv2Py/F2DIM=</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			&OutlineEntry;
			<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkavXi7dT1ntS5cPsZf5Z4pXkf3GcqAD/LHXjm0uTVMLJQX/0yq3pJjjl4Ydj/vJFfOq/eSlc9ZFmKSSxCHotbNRfuKb0CZBhT7G+oskjioQQ3HXBkUznmyDgy3c6vW2ubNDksNTW9r/D9mIewuxXxwducy9jsCWZnl29KdeCGli58MuuwAabmaLT4+R0yi9oz2GkxqbxyPb+XQGbfFjwZCZdhBVZNRux+xX0stGbWao/9nHWIX6/OI8GFFKaHrK6pug4PKsZmSqdLLHoGpagjytwIbkrMCc9+J9mHh918VLnVq3HWThdcCbFMAqgrLiWldcLNygJAgKCYkGQcuPSU0F</encrypted>]]>
		</text>
	</script>

	&OutlineCss;
</dir>