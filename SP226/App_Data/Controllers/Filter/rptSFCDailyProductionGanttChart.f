<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="so_lsx">
      <header v="Lệnh sản xuất" e="Manufacturing Order"/>
      <items style="AutoComplete" controller="MO" reference="dien_giai" key="1 = 1" check="1 = 1"/>
    </field>
    <field name="dien_giai" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_lsx">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
      <items style="AutoComplete" controller="SFCWorkOrder" reference="ten_lsx%l" key="status in ('2','3','4','5')" check="status in ('2','3','4','5')"/>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp">
      <header v="Sản phẩm" e="Product"/>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="kieu_ht" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Kiểu hiển thị" e="Display Type"></header>
      <footer v="1 - Theo ngày, 2 - Theo giờ" e="1 - By Day, 2 - By Hour"></footer>
      <items style="Mask"/>
    </field>
    <field name="duong_ke" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Đường kẻ ngang" e="Horizontal Lines"></header>
      <footer v="1 - Ẩn, 2 - Hiện" e="1 - Hidden, 2 - Visible"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="162">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="110100: [so_lsx].Label, [so_lsx], [dien_giai]"/>
      <item value="110100: [ma_lsx].Label, [ma_lsx], [ten_lsx%l]"/>
      <item value="110100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="111000: [kieu_ht].Label, [kieu_ht], [kieu_ht].Description"/>
      <item value="111000: [duong_ke].Label, [duong_ke], [duong_ke].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDBaaV766j4XqVMPTsxBNLQww3q08fuNcQISGpOyZtsSlqM4jcsZWivfG60vkKufBEJGSlnksyOdWTCoflgLXgR6HPRzbuCS6ZXoTCi+zRx7dwU+5HNQ0NZBhWgXjcI+umbaOMDu1dpZYZIzysLTHM7FrLy35cXCkU4qvMfsTtkKt2HHoFsp93863kGpQ+XSnPeu/kHnR2ubUNidJRJ7lB0=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPhIn5lD66vCmsWgncj6YjXZZ3CyBOrEj03QVdhCrDsNH1M54fZdK4SKxrrGIy2XXR87mgrCnc2XGsxsdIR7sYTDHcYaQrcR+oQ0fUd9f81H6VYWJethmNxJQGVU6beRjRiJ17NDlHhfCOXGkbQbwlRIc2ezbGRiWEyrv0dUX1qs6ygUlMfA+96PkRpQwgQ4CWf+Qi8/HDDhF2vyWOmnvP/GmiuGOzsO7OMVsje2zXHduJZmJN4pH1X8XlhZhw3Xl/0BbDZ8Z1OrZdqndRzUqhcJyq06m/423uP0ZM2Dp5+d8=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>