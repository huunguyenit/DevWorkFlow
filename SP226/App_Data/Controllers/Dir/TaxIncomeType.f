<?xml version="1.0" encoding="utf-8"?>

<dir table="tdmloaitn" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại thu nhập tính thuế" e="Taxable Income Type"></title>

  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" disabled="true">
      <header v="Mã loại" e="Income Type"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên loại" e="Description"></header>
    </field>
    <field name="ten_loai2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="kieu_thue" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Kiểu tính thuế" e="PIT Type"></header>
      <footer v="1 - Lũy tiến, 2 - Toàn phần" e="1 - Progressive, 2 - Entire"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_loai2" dataFormatString="@upperCaseFormat">
      <header v="Mã thay thế" e="Replacement Code"></header>
      <items style="AutoComplete" controller ="IncomeType" key ="ma_loai &lt;&gt;'{$%c[ma_loai]}' and status = '1'" check ="ma_loai &lt;&gt;'{$%c[ma_loai]}'" reference ="ten_loai_tt%l" information="ma_loai$tdmloaitn.ten_loai%l"/>
    </field>
    <field name="ten_loai_tt%l" defaultValue="''" external="true" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="stt" dataFormatString="##0">
      <header v="Số thứ tự sắp xếp" e="Ordinal Number"/>
      <items style="Numeric"></items>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value = "120, 30, 70, 330"/>
      <item value = "110-: [ma_loai].Label, [ma_loai]"/>
      <item value = "1100: [ten_loai].Label, [ten_loai]"/>
      <item value = "1100: [ten_loai2].Label, [ten_loai2]"/>
      <item value = "1110: [kieu_thue].Label, [kieu_thue], [kieu_thue].Description"/>
      <item value = "1101: [ma_loai2].Label, [ma_loai2], [ten_loai_tt%l]"/>
      <item value = "11--: [stt].Label, [stt]"/>
      <item value = "1100: [ghi_chu].Label, [ghi_chu]"/>
      <item value = "1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6Gq1C5JbCGnUXCbaA9kweMayBuSf1o16beoo0/Q+gOCn6TRWkI27+eMev19PirEqYKIztVxzE91zz/0VgcBFW4=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70F+SXr2tyLGktNDy7D5snBeaZu4X8ivwCpkoeRfVtHy6Xp+7YHAqNnu7q9RbuPj9ds7Rdwpuo11BMlodHoFsCvFO/zRyZTeiG7B8eET2XRZAnla0wEnd4xPj+KQSiCEDkg==</encrypted>]]>
    </text>
  </script>
</dir>