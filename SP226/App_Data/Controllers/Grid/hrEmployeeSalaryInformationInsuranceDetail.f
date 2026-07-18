<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
	<!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
	<!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="hrttctluongbh" code="stt_rec, stt_rec0" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
	<title v="" e=""></title>
	<subTitle v="" e=""></subTitle>
	<partition table="hrttctluongbh" prime="hrttctluongbh" field="" expression="''" increase="{0}" default=""/>

	<fields>
		<field name="he_so_luong" type="Decimal" dataFormatString="##0.00" width="80" clientDefault="Default">
			<header v="Hệ số lương" e="Salary Coefficient"></header>
			<items style="Numeric"/>
		</field>
		<field name="tien_bh" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" clientDefault="Default" width="100" allowContain="true">
			<header v="Tiền bảo hiểm" e="Insurance Amount"></header>
			<items style="Numeric"/>
		</field>
		<field name="tien_cl" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" clientDefault="Default" width="100" allowContain="true">
			<header v="Tiền chênh lệch" e="Difference Amount"></header>
			<items style="Numeric"/>
		</field>
		<field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" clientDefault="Default" allowNulls="false">
			<header v="Ngày hiệu lực" e="Effective Date"></header>
		</field>
		<field name="dien_giai" width="300">
			<header v="Diễn giải" e="Description"></header>
		</field>
		<field name="stt_rec" isPrimaryKey="true" readOnly="true" width="0" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
			<header v="" e=""></header>
		</field>
	</fields>

	<views>
		<view id="Grid">
			<field name="he_so_luong"/>
			<field name="tien_bh"/>
			<field name="tien_cl"/>
			<field name="ngay_hl"/>
			<field name="dien_giai"/>
			<field name="stt_rec"/>
			<field name="stt_rec0"/>
			<field name="line_nbr"/>
		</view>
	</views>

	<commands>
		<command event="Loading">
			<text>
				<![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiEsj65rpjrdsc3hcZBdTQMVi1WVIhCO7UraK7DgQlqRUd1h3NE7ZRgHZKvpjVU4kEWqYPraMLpHJ6BjBUlfhlhQL1zali/+iKcK+22PJDt5z</encrypted>]]>
			</text>
		</command>
		<command event="Closing">
			<text>
				<![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiNGGbgpt/sYYDycpkPWOJe34+hiwss1IcQ6pxx9RI26+5QG5UE8BNgNuTba+iVegkJv2u3N2hhvxoLzjsm1SG2Ez7YXs6r1f9sBZWPoW82ty</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hm/OCYDlMWMhxgN4ZB4ZZsgy3kfUryfLNDNWZEeICHmNMGJFRpLLKwgYXAce/RFvHVF6LHYHtxT0BJsWDYkTSfyNj5f/ktFcLluF3CNq60P+glfQARQRWC7Q5O/5Cu7e2rXRKgHA+yoXhksQPyMdDmBC3WvoplWOFw1VKJrlcbmisvMBAQxovu5RYhtc3mCINz9Ey+ayKEXdzqT7H8Kg2BGtrDHpxSsc2zxvaS0LpqfRJ9PrhJr/DWdosVs5AjTLaQXBI27hBBjjX92i50CVRi5QIoKsKKfxDmuAGHJ6fWJJZi5kL/uHbc+89GiI/MFuTBw86yFABmoGWitax2m9S/lOtnuMxONOkEjUmGWNx/sGQ==</encrypted>]]>
		</text>
	</script>

	<queries>
		<query event="Loading">
			<text>
				<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmrZE6rTiEG3WmDYUe1Vl45KmkYnCcU4ocCBz1RBywnpKdOFQ3ioDlUYAKKY8tUZVvcl1LqpYVrdGxq9TKO+nPIsvq/6BXyyS2YwimoQnO0NMQ==</encrypted>]]>
			</text>
		</query>
	</queries>

	&XMLStandardDetailToolbar;
</grid>