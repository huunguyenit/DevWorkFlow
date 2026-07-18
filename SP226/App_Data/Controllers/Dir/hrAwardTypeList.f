<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
	<!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmloaikt" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
	<title v="loại khen thưởng" e="Award Type"></title>
	<fields>
		<field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
			<header v="Loại" e="Type"></header>
			<items style="Mask"/>
		</field>
		<field name="ten_loai" allowNulls="false">
			<header v="Tên loại" e="Description"></header>
		</field>
		<field name="ten_loai2">
			<header v="Tên khác" e="Other Name"></header>
		</field>
		<field name="he_so" type="Decimal" dataFormatString="### ### ### ##0.000">
			<header v="Hệ số" e="Coefficient"></header>
			<items style="Numeric"></items>
		</field>
		<field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
			<header v="Trạng thái" e="Status"></header>
			<footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
			<items style="Mask"/>
		</field>
	</fields>

	<views>
		<view id="Dir">
			<item value="120, 30, 20, 50, 330"/>
			<item value="1100: [ma_loai].Label, [ma_loai]"/>
			<item value="11000: [ten_loai].Label, [ten_loai]"/>
			<item value="11000: [ten_loai2].Label, [ten_loai2]"/>
			<item value="1100-: [he_so].Label, [he_so]"/>
			<item value="11100: [status].Label, [status], [status].Description"/>
		</view>
	</views>

	<commands>
		<command event="Loading">
			<text>
				<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzh9VBnL3Sc9uWcwAXvA3TeoNxHWun7VDy4estxJwZFx9ujBx2Pq8OPjWFI8KC5hciEV12JAWv+l+DPKQChci2w=</encrypted>]]>
			</text>
		</command>

		<command event="Closing">
			<text>
				<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7ofypjYnBkSUjsaW332rdcKYfsiRPFnCC0aFksgeM1VKygx73z7+1BWcumbz2plRKUCZfevIJSW3GRA+T9K9zo=</encrypted>]]>
			</text>
		</command>

		<command event="Declare">
			<text>
				<![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEBmQrqbwdoGZ9qaUepn4inSDMT6ol22ugXb1z9G5UNxYvj21cIJHhuMP0+dHcx5mmjkVOnGsFLFn8kKVkLBOVOmrYjziimVs498Zug264jvmkEnIdRfVjbwKpvvXcA6iwYBnn9DefZyTYokW/hnODkWPaILSX4OIQ9L4CF23/RBD80T7Vux2V+aB1HKYK6uqFzAgCQbCyd6Gi3o3WcDgPxzGoKP4K6BGxeCfRCWuqKBx7+eWUfgQLh87/6KEMuALKoscFvupucENk0lyPs/ApWPTH0cUGxi6k1YSo7ZwZEniiCjARpmZ4UD6SScok7KSQw==</encrypted>]]>
			</text>
		</command>

		<command event="Inserting">
			<text>
				<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n2yWu9hjJFlfsBY3klD8tats3kDmCDyXhi3KEawqMkLJjEmgas7elA3cWsletFMJG3+ikghBWn7L9uXLnJw3YB4lL3x0gPDj2HEL34gPeSYTh8krYoJgcFNIfBcN/ndXlwFLkxlyF2/pCAVNTvpJz0+ttcdeCyFnJThNkyOmDp26qJyYqjGtz9yh4ov6WLQ7NkMXPJhf6WS7GNO2TEp7GYSZEKblp+7ptT6m1ZPDZbE4=</encrypted>]]>
			</text>
		</command>

		<command event="Updating">
			<text>
				<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jwMlrCDlMuk2ZBU7CprWOeBQqJNNbL3cRPPtAK5XkyLEJq2svAsXCP7+LbQLrg4c2RwaxfRslgI020qRuS++u4NrmktKayefu3ipuW4+qsOZqqhSMXVr5QZOVtB4jUTslzm12GHiiSi0I/q4BGZyp1eF295uGZWb0oHuyYpa2Bz0UMRUdzyN3Tl1HuYmJNRBtRMvu3ftydnHDvkJDsN+m5e8Zn0T+BJlKoCwPN+thma1/X6YXLVao3leSCbPa/9QxIjGo574rOScuE7TnAj8RIg==</encrypted>]]>
			</text>
		</command>

		<command event="Updated">
			<text>
				<![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbetWfBl0hcG73VT+s/+ZHj2hznlozytuZ4Xiqd+p6WVUY</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KUda97fh/VgeRrMKrNykFroGkYYKzr53RvbGaYOYSDdEomgn6QZexamI7lX6plhrChOVcEBQAJgyj0C/fHkClx5lR3fsVopxBulkEcB23xnyFva08A3ZjzpT6Z3gI9ToS1NHaF01M0Ji16Mx8NHclwcjgtfbjeVmWiV1i/w08YqR5rpc12Fb9krYUEumwZ8mJqyaI+0f6udnKPITKLK0XLblnpWvNricQYygQjRwPLMRdo19gBSXoxRBxKmjf1DB2HW6RigYsSJFtywzcSn+qRApv980DgAvhK1Kv894BXcwsGPZ7rHILwHTcFN76v/aYPNa2dwXrntOPwrZTAkiGM=</encrypted>]]>
			&ScriptIrregular;
		</text>
	</script>
</dir>