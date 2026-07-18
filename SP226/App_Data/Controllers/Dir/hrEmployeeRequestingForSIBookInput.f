<?xml version="1.0" encoding="utf-8"?>

<dir table="hrdncbh" code="nam, ky, dot, stt_rec" order="nam, ky, dot, ma_nv" xmlns="urn:schemas-fast-com:data-dir">
	<title v="danh sách lao động đề nghị cấp sổ bảo hiểm" e="Employee Requesting for SI Book Input"></title>

	<fields>
		<field name="stt_rec" isPrimaryKey="true" hidden="true">
			<header v="" e=""></header>
		</field>

		<field name="dot" isPrimaryKey="true" type="Decimal" dataFormatString="#0" clientDefault="Default" defaultValue="1" allowNulls="false">
			<header v="Đợt" e="Time"></header>
			<items style="Numeric"/>
		</field>
		<field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" readOnly="true">
			<header v="Tháng" e="Month"></header>
			<items style="Numeric"/>
		</field>
		<field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" readOnly="true">
			<header v="Năm" e="Year"></header>
			<items style="Numeric"/>
		</field>
		<field name="ma_nv" allowNulls="false" external="true" defaultValue="''" allowContain="true">
			<header v="Mã nhân viên" e="Employee ID"></header>
			<items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
			<clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQ0bXKwKS2XDMbvgI+yk0CLhXytbqOFlpnYUFoxlYmGlfHo4IUdpER2NgDv9NHvmqDC+GtTe+AIEmQVSVFtgCpe0VXdNhBh7EntO7pNe06s3</encrypted>]]></clientScript>
		</field>
		<field name="ho_ten" readOnly="true" external="true" defaultValue="''">
			<header v="" e=""></header>
		</field>

		<field name="ngay_vao" type="DateTime" dataFormatString="@datetimeFormat" external="true" defaultValue="''" allowContain="true" readOnly="true" hidden="true">
			<header v="Ngày vào" e="Join Date"></header>
		</field>
		<field name="ngay_chinh_thuc" type="DateTime" dataFormatString="@datetimeFormat" external="true" defaultValue="''" allowContain="true" readOnly="true" hidden="true">
			<header v="Ngày chính thức" e="Official Hire Date"></header>
		</field>
	</fields>

	<views>
		<view id="Dir">
			<item value="120, 30, 10, 60, 330, 0, 0, 0"/>
			<item value="11001111: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec], [ngay_vao], [ngay_chinh_thuc]"/>
			<item value="110---11: [dot].Label, [dot], [ky], [nam]"/>
		</view>
	</views>

	<commands>
		<command event="Loading">
			<text>
				<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxSjdyqoQlcfWuujhnF65no35Z0WFAdv1HLtBpwAhgXgUJI6kScPkhF6zNvOMkUwJpq9c6YmmnQJepPpMyEcWWXbw33PW4SrgPeluk1aUpoJAFMRrQj9o3oUE5tnRYtHQg==</encrypted>]]>
			</text>
		</command>

		<command event="Scattering">
			<text>
				<![CDATA[<encrypted>%PqkM3HnrVADZFaHe07aaRdQkPdS1Qz9oqptD1IdLQRBquRIG5GAiJDW94JQ940AiTCu6Zqx6ov7SpX+v8T4kCHTNMfKErlY8NpA6RMJ58ZjBc+Nt8R9p3Yhl9c8w6lMfnfpgz0wSJYnEqZo7mY+vaw==</encrypted>]]>
			</text>
		</command>

		<command event="Closing">
			<text>
				<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6kEa1OdkhM9qqyLoo738lOhbwUOBlLAcpMv0J1RckLvA+ZVUVVYh8qcJXGQskTxFBZ5kfK/CQUSiV6XlU4jpatDvMMZ+z7e6QPjBr6P77w8Xyp9bwWvppGDP3YRDtfE7A==</encrypted>]]>
			</text>
		</command>

		<command event="Declare">
			<text>
				<![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulidlfppHwj/13UD+6SfFokqBdbLJ5orK2Kci2zw6k1CrROr1HuyqFkl528RowpSNlNj7Uq9P5v7hMnCstuz0ho4XtasMhIeI6xEdmIqMzuVOO8za51W2QPHxThZ3bbPOEbQfSsTEZb6H8+/+M0b/9F769eFeCeBIO19budmOTCb3KCru2Y0dSHHclfiShkM+WBzQNbxgyLm32HjWYAtiRzTJ4vqf9NqzIj1xlg9DtFRkgchpBdllOwO4xDPBijDW9NfK4/6KxRjGkJ+nfc/6q0n6TGZ+Djk1LA+IwYIEHWgZZP4+9dSt45+Rfi1i+j1zJ2EMiO5M/ECGayGKWZduE+goMqkei93tpOktYNmabFRcMi6SohRgSQw6G+OAR1sCEW921KmnH50lwNb/L1bLorSCrEYEJIEfSYc5TT2J6JxQiXhUUXaYxNJ27i0GhN5Z99</encrypted>]]>
			</text>
		</command>

		<command event="InitExternalFields">
			<text>
				<![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TLfoWKwwcQ/O7FyNadU2tk1CUaqVq1aM8LqGcoVzj0zDQsu618Ms8fqlzSwGweXPB9KfoClFOC0IqUSWIB3eCWmGa/X6fQkbkpfWlXFecP3u+QQIUDvSs87IqMdxcGMGwST5kikR6NPS4OScetemlO/H7AEo0T1UTkDSQ2vs9RPS1YosGz73YVMzIMXAs0S0Co+ly3CqnHWNT+kO+HW/EOWAwlkhUQNHTfI3Nqi71nsKcLuCZR1xRwkggQ72hJ+HA==</encrypted>]]>
			</text>
		</command>

		<command event="Inserting">
			<text>
				<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0ob5zXQy72Mi8+VsqJ5Q27/dFvvMfzPxxoEEwcK2qUSnZu6tdZH8w3W+YkME0xnR0kWFplPJQ8pECA0uR+h1QiILhW6qSG0ERHmibIbE23WqOpOVUZigPi1MDabgeg4LPqEox853tj5RVkVvufNMNLJW1gaqNQVbQ/Tub577YBbqqSsWIyrzMdl8UXg2EL6TWpbclN9kPbjpF1Pbxhlx1d+O3K9EtD7EzrwGb4IqCDuMIh0a7uTGhmQjXCGnwwV1</encrypted>]]>
			</text>
		</command>

		<command event="Updating">
			<text>
				<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jQk4zwK0lrw3EQTrbKSKixH52YL3vVf3tPlDESZ0Ps2AKV63ICKQA9nvbNwvYlGBw2cRNmgQVEpV5VXso3XEVZqxzYt4CcuIhxz1QV9VHjMtCrpOfpugjjVeRgfy8Ffqd0egRWL1P51D3MATmdhJsPdy67CHYmN0KlgG/g3zW9KP+ReXNfmh7uHdMkb1VKFcLdi+2/gLAzApWPP4d7b/l8HLzBYO90p646hFrp+xeueHqQ+3FRrjnaZUWRBc3NjlO0+8bP1/jBul/pOH5Jug7lrJMDb9B3L73FAfEOWKPpm7qHkPlGwIhkLy5Cp4GFCPlQNS4k3fMiRA/vfq+rO7TJQ==</encrypted>]]>
			</text>
		</command>

		<command event="Updated">
			<text>
				<![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberoa6jRl0HozQ9/2em7TRgYa6Qh2IjtAiIskMMncmJ6QQOO+qxTmlMLELG98v0LHNUtqvhLDQWbh5+H01WyxW2Q=</encrypted>]]>
			</text>
		</command>

	</commands>

	<script>
		<text>
			<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70LxSN5W6BIZ1/4bFXxNrrdFJyRS1ibqzDyzzKubw7+qcurs2qMCc2uc9m/qIn1F4TsTd7O6Zs6aqRXJF6O55uzxrlJPlG3xpMs9p3HQI25F8q1F5pP/xcy8DmRky6oVoaUJ1jZLT5Q15kcac7nK7EGyKgLaCwgVQBsJIAE4kwpoFYkw76ovpP513P/bYBAm+6F4ivdseNHiNvZnui388wmJI3p4wyPhUDGAyRLOZz0S9cWyk6ntf58VCRRXfiUA+kUZuGCXaBGlaqUw+aG+VWRMngmgFBjJy8/68sa5W2ABSYKr24FQsTamPemURdHwgiyEfFBPqtN3Eom4lLIlqyI2P7m07LmOrxOh75/HsgavQ5/Hbe2diOTKtpBovqeYxgKrJ0CTDWJyMOVXBcQx4+AUe4gChK25xcj0+KFtSXBm0+75y1H8Lf1mHn1fRnMFjSekBv6VCKNYW8Yxh1Fvm10V3oo19O8SyApCyuJjykbfeNnce2Vw3WjAxiJk97B/4LsD7iW9N3BJWuDVUCwTQ4FxQV9Y1Eao4JFzybSvM0rFEKAZFcyEwmzrWmaEZBrxeZaRXyYrWyFDEKSLN5NyHLCNNEx4V8NaM0qYgp8g0aqrUeQjZwSbjEuo1Du//EkvpIw==</encrypted>]]>
		</text>
	</script>

	<response>
		<action id="IDNumber">
			<text>
				<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6Wdyk9aPi/fGimY6rlT0N8nVAGzan76LcTwu5Z5TgGNQpv2cB7lbLB5KrU6eg9JAbvPNsOTpykCE4LAKA0XcUPMH7Z9OaRX5nYzIDQfWVGTaln/Z/luifL9eeXFzOhcHM=</encrypted>]]>
			</text>
		</action>
	</response>

</dir>
