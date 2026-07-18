<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir table="mctdmky" code="ma_ky, nam, ky" order="ma_ky, nam, ky" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tạo kỳ hoạch định tự động" e="Auto Generate Time Bucket"></title>
  <fields>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày bắt đầu" e="Start Date"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQ2yE6QHlObEiZ5jbuZO80nTuxKCUvIK53C6CLzbAM3BX3zx31GF1AiXbhy9CdcuJQ==</encrypted>]]></clientScript>
    </field>
    <field name="nam" allowNulls="false" dataFormatString="###0" isPrimaryKey="true" type="Decimal">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="theo_tuan" type="Boolean">
      <header v="Theo tuần" e="Weekly"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZSI90PFWRrtWUyIEk73twnyDIHrkgBk90Qx8PZrWHOnNjxKDUjT1C4HJKK4oiikDNQ==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_cuoi_tuan">
      <header v="Ngày cuối tuần" e="End of Week"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="1">
          <text v="Chủ nhật" e="Sunday"/>
        </item>
        <item value="7">
          <text v="Thứ bảy" e="Saturday"/>
        </item>
        <item value="6">
          <text v="Thứ sáu" e="Friday"/>
        </item>
        <item value="5">
          <text v="Thứ năm" e="Thursday"/>
        </item>
        <item value="4">
          <text v="Thứ tư" e="Wednesday"/>
        </item>
        <item value="3">
          <text v="Thứ ba" e="Tuesday"/>
        </item>
        <item value="2">
          <text v="Thứ hai" e="Monday"/>
        </item>
      </items>
    </field>
    <field name="theo_thang" type="Boolean">
      <header v="Theo tháng" e="Monthly"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZSI90PFWRrtWUyIEk73twnwnSu6E2YTqH/1df+MhDjm4TP0yHqg0Bx7cBSWwftO2Vg==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_cuoi_thang" clientDefault="">
      <header v="Ngày cuối tháng" e="End of Month"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="31">
          <text v="31" e="31st"/>
        </item>
        <item value="30">
          <text v="30" e="30th"/>
        </item>
        <item value="29">
          <text v="29" e="29th"/>
        </item>
        <item value="28">
          <text v="28" e="28th"/>
        </item>
        <item value="27">
          <text v="27" e="27th"/>
        </item>
        <item value="26">
          <text v="26" e="26th"/>
        </item>
        <item value="25">
          <text v="25" e="25th"/>
        </item>
        <item value="24">
          <text v="24" e="24th"/>
        </item>
        <item value="23">
          <text v="23" e="23rd"/>
        </item>
        <item value="22">
          <text v="22" e="22nd"/>
        </item>
        <item value="21">
          <text v="21" e="21st"/>
        </item>
        <item value="20">
          <text v="20" e="20th"/>
        </item>
        <item value="19">
          <text v="19" e="19th"/>
        </item>
        <item value="18">
          <text v="18" e="18th"/>
        </item>
        <item value="17">
          <text v="17" e="17th"/>
        </item>
        <item value="16">
          <text v="16" e="16th"/>
        </item>
        <item value="15">
          <text v="15" e="15th"/>
        </item>
        <item value="14">
          <text v="14" e="14th"/>
        </item>
        <item value="13">
          <text v="13" e="13th"/>
        </item>
        <item value="12">
          <text v="12" e="12th"/>
        </item>
        <item value="11">
          <text v="11" e="11th"/>
        </item>
        <item value="10">
          <text v="10" e="10th"/>
        </item>
        <item value="9">
          <text v="9" e="9th"/>
        </item>
        <item value="8">
          <text v="8" e="8th"/>
        </item>
        <item value="7">
          <text v="7" e="7th"/>
        </item>
        <item value="6">
          <text v="6" e="6th"/>
        </item>
        <item value="5">
          <text v="5" e="5th"/>
        </item>
        <item value="4">
          <text v="4" e="4th"/>
        </item>
        <item value="3">
          <text v="3" e="3rd"/>
        </item>
        <item value="2">
          <text v="2" e="2nd"/>
        </item>
        <item value="1">
          <text v="1" e="1st"/>
        </item>
      </items>
    </field>
    <field name="ma_ky" isPrimaryKey="true" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ky" isPrimaryKey="true" inactivate="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 20, 60, 330, 0, 0"/>
      <item value="1100-11: [ngay_bd].Label, [ngay_bd], [ma_ky], [ky]"/>
      <item value="110: [nam].Label, [nam]"/>
      <item value="11: [theo_tuan].Label, [theo_tuan]"/>
      <item value="1100: [ngay_cuoi_tuan].Label, [ngay_cuoi_tuan]"/>
      <item value="11: [theo_thang].Label, [theo_thang]"/>
      <item value="1100: [ngay_cuoi_thang].Label, [ngay_cuoi_thang]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf48u/lxPp/cc+BQWYnSPSVpXeyl6FHZD/6nu01j8G481lsDUbqA4kD6xSyIV/PzWVIA7xuqIMz7bs0MNUnMJhky9cUDhRWYfvbVVg3N9YdRE</encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6cjRuHaoMqwWIMFK9d6NslUzqEH32xuLURLzykLOLfhTq+MUe/dJF/nzP0ywzweEU112nIt8YlvgL0JEspW2TcwSTuLJW8kpw5ZAM6iDJmama+6acN8b5lh1+GblVY9SDWa4JsYlCO8GopCTGHHmyiIDa86uGnOU/WuRtI9xBuimDAHw0AicvGVggrn+v8HPUVmISkYd8Xuzr50FELNScOg=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70O0wy9SVvmau+gtMzpgUrheCYF/WjYePAY4/IkSrb3kHYWYwBolOBhVXc5HeQswaIjbRJncP8o1WtO0GWCF448qQu++BvJp4SutykUMdG011BXma93PlhBn0g/uw8SA7LNy207riGgrDFU9M11UUlb8Pxw+vdQpYNPOZpmAV6PUksfM/wOZthw2sY36XjFVGQfeEItOKRTmeEcHsrZqn4zrM3nYoo3YIGsO01bg0Qvb/ZfvHC8BQ59dn5/xuqDwbsUAqCYJo2pTdUW/OKkIDGsEKc1w5YkaXPPAPlbB38X+VW9/ZGxO3NvhD1mZ0yJS3RbYb5UZo0V0mw356PrwRClKuid+RXVh3siE4mPJKgtgIwyEHIaQKRxCBu3yl3LZi/JlZisBH3nDpKp4fwGLTKoBDgJHCNNk/ZNvifTZ1WFf35b3bphm+4j+CHMncX+ezkdQy2WkY1eBcHuJKFqropGxuxqMOeZIrJ53eOup7jfIA6qlW3JvbeaMPIAyXHJiudHKrrw5xLyNys8eMzFImpxE=</encrypted>]]>
    </text>
  </script>
  &OutlineCss;
</dir>