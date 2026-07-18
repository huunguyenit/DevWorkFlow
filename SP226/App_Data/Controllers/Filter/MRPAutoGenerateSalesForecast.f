<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY SiteKey " and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))">
]>

<dir table="mdbbh" code="ngay_ct1, ngay_ct2, ma_vt, ma_kho" order="ngay_ct1, ngay_ct2, ma_vt, ma_kho" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tạo bản ghi tự động" e="Auto Generate Sales Forecast"></title>
  <fields>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="so_ky" type="Decimal" dataFormatString="###0">
      <header v="Số kỳ" e="Number of Periods"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_vt" isPrimaryKey="true" allowNulls="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="kieu_hd &lt;&gt; '0' and status = '1'" check="kieu_hd &lt;&gt; '0' " information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZSI90PFWRrtWUyIEk73twnwV+Y/kYCsiLZoleFhEt7nXJR+rNta7D0GnwCHCLsM53Q==</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true" allowNulls="false">
      <header v="Kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs = @@unit and status = '1'&SiteKey;" check="ma_dvcs = @@unit&SiteKey;" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvt" width="100" allowNulls="false">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="ma_vt = '{$%c[ma_vt]}' or ma_vt ='*'" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" readOnly="true" defaultValue="cast(0 as bit)" hidden="true">
      <header v="" e=""></header>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 80, 330"/>
      <item value="110: [ngay_bd].Label, [ngay_bd]"/>
      <item value="110: [so_ky].Label, [so_ky]"/>
      <item value="1101: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1101: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="1101: [so_luong].Label, [so_luong], [nhieu_dvt]"/>
      <item value="1101: [dvt].Label, [dvt], [ten_dvt%l]"/>
      <item value="11: [theo_tuan].Label, [theo_tuan]"/>
      <item value="110: [ngay_cuoi_tuan].Label, [ngay_cuoi_tuan]"/>
      <item value="11: [theo_thang].Label, [theo_thang]"/>
      <item value="110: [ngay_cuoi_thang].Label, [ngay_cuoi_thang]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwetFxBFoPILuYbQazwN5csi0XC1K5j49FHaCbA4FpNPToAH+b508mYSbfzhjTD2c2g=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYLDNkbb3RpRzNhIUriN+Wor1YZS+9raDRffKFtIJsn5CJ8NBkCN+RJLYSPw9sY1DOE=</encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6cjRuHaoMqwWIMFK9d6NslXSKFBFyjShTE+jZtaAX/FUS/+vfqArZiMy6NGeYwuuPoAEUly5QvXvVzwrP91HrBQFWmQAR7UwnSh89ZX22AJX6xr/dIgqMIQOh9k8JKfz0Eeh7yp1M0EdMcYsu5pr2jALN7saLKlg+qU5fWHQxcM1mc+fKSUU7sA/VbIzjh89JERY/L6RybyR/BNUiTYSWg+D5oNUdBfn7AB+hzAvaNt9updKmQrJ/+JRrJvwnG1QGZh9r6cIAGUThkYI5E2mwXzDpfy6XrjtMDN4HP5ENmbZubsIBC8oc77jJqBdaq4bDFBzmZIWtave5cdDryrjaB4=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZpbOOxDL+f+35TUmms0aB/AkxRh+AsNHDOPZh4aYr6QJpJxY5d3prS2VqA4FCXjlHauogTTTJUyPA54dh9MpFeZrAj+siLPTyXFw9rbYJUPfA5JlB54joNT2Ihqi0wv80IXjwcdZiD4wRf/s+KuORI/DozSVSoj5LQ9yEnJcrgzzawtvWYzsF8WN5cVQLbhg66PoSlZylscZkjQ+qSrkp96uDYD2V2+kA3ZEMljYxfjwgUABOw5C6lLxvi3+JXkOvMHmFL4LnbFErw3I71DhYP5ZbCwwClZ6Aj0S/J83tB7Wj2IOkoVDhrNRz5mwtkgTKjMNoKu8/g+E4OvXqqsK4FUycUzfh0OU8E95SFoxAP0y4WstVDK2p499GTXAi2h9++6XGu6s7F8q14v+DMHLwMgFH5tITtMHQnyQiX+y6TOGefSAMaJbLVvh7VsAqcD+6xiaoHy2oop1YmKC3hMulQe6flFmCXICWVOiXTNYvNFyj8wJf+4Q3p+hzti9kvvvyqsTZbtHEPpYG3FpRYx75mNy2XsHeftToW/XSNiNE7TCzu/8fY6/8nTlYBXBxxTNr0sqDcxWxyIUEUs1AWpzNCZT9pvrd+l1hQQScsQyylb7NYEW1ipPQ/tiMkumzaCYDOjrYCxDiGMaV06kBxUt5q6gsw3bjZ5DgatuWY3ORFfAxolqaJTBb2FPfEmoP4a8FqZi82gQuxpXCQ0hAJolkT75eKyt/TDNeK5V3owKVLguXkh5QiX+goGb2Iu6ETeWh54e/Ub9sfXARCIuzaVj0L5/uZlsrwXosqNzM3E2u91g==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6+INkQWNmjEwlPl+HrVfmFbZmcLoLaTcoJ3VP26WNLB0fkFBlTg4aNqUgTXZEebRR9/hO5IfyyAGIM+5acTIJ+gkRUosVrxayV7KG9LutCZOPy1pbari0RKckzV+1JPLDAQKUnprZCEkib77mY6MUhLspErG3GGM+whdbvBvNhog==</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>