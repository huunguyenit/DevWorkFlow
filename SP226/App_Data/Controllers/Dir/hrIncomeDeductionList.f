<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
	<!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmtngt" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
	<title v="thu nhập, giảm trừ khác" e="Income, Deduction"></title>
	<fields>
		<field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
			<header v="Mã thu nhập, giảm trừ" e="Code"></header>
			<items style="Mask"/>
		</field>
		<field name="ten_loai" allowNulls="false">
			<header v="Tên thu nhập, giảm trừ" e="Description"></header>
		</field>
		<field name="ten_loai2">
			<header v="Tên khác" e="Other Name"></header>
		</field>
		<field name="loai" dataFormatString="1, 2" clientDefault="1" align="right">
			<header v="Loại" e="Type"></header>
			<footer v="1 - Thu nhập, 2 - Giảm trừ" e="1 - Income, 2 - Deduction"></footer>
			<items style="Mask"/>
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
			<item value="11100: [loai].Label, [loai], [loai].Description"/>
			<item value="11100: [status].Label, [status], [status].Description"/>
		</view>
	</views>

	<commands>
		<command event="Loading">
			<text>
				<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5mFHrl0xzAUBTGei+DLGpdo5mcYLvXtDij/j7orE/Kkj8rJI1OP/rgzOCtg33PtRfTs2KVvg3R2ZD965bjOc1Q=</encrypted>]]>
			</text>
		</command>

		<command event="Closing">
			<text>
				<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0aMEBukbDpav0hd4MHIrUmjDN+JJkpJ3oVAKuU3f2DRJrcrGoQVtivzJ/nxYoeUe/usof1Hc68HbqsC3W/5pzA=</encrypted>]]>
			</text>
		</command>

		<command event="Declare">
			<text>
				<![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuli++xR2NORWTdAdIopz8mbrVQzIg63MtFrhEq9MLlPhCvXq/fU4zw7G8LOt1WNrnG6ffQYukC1RUN4MPbQtpnurhekGx58cvleNoz2+mk+fEVLRkCoNtda332nQwCL/MyxoW6U49UQfe/9Ib1OmerzMWkAEQJZJM4Vjk7ZY3RSHuKxsh5yz0tFK2/69ooJ5++wtxKv/EcBZCjEW4NMmir4QAPslkZOyMBvexvQg2+/gWKEkjPgu5ly9uNw4cOKFZoBEiavNd1lj+GNzhZ4SIgJKOXCk4i9n2xLzDd+Y8Aaz1UzKXkB6DeWsYnXfGj3YtVHrLYmOZuQglehzCk5+iCMh9OIckhtTtGiOiFvJ4FXLAvWhrk1Z8c00zBGyEc8r2e1</encrypted>]]>
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
			<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70F3U5iLct7EGDEuh3oYef2ZbS8tWQz3p/n4IJdXZXBJ1hBYyGsAWZ+7fFFP/gvy8d4CxbPPxZwMVPU7XsmbD+2ZscxRfltlabygoEUqEUDN5D7tgpe0Q2h2LX3ES6KjxGclBIbNUPzHStwnKLBlKUoAgO6NtKHf4DxQ0SO+DcJtInzNkUmK21aKYLCCJL9Or/kRfwv1EykHb5JK+zaX4qPph2tZkuFmiS/BTT+nwumLfSLyaP3Ow4IPngDt1BSmtowvUO3yQTmq144jT0CYpOY6+r7aQpdU8GYuUzWxDWB3Fdm+4yVHz0NPoFyQafGFfVFYSDYpLLANiGGz5KREwSlQvj3TrKXOuInjN/OSG4Eg6</encrypted>]]>
			&ScriptIrregular;
		</text>
	</script>
</dir>