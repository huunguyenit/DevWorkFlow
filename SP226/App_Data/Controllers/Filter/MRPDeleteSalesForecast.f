<?xml version="1.0" encoding="utf-8"?>

<dir table="mdbbh" code="ngay_ct1, ngay_ct2, ma_vt, ma_kho" order="ngay_ct1, ngay_ct2, ma_vt, ma_kho" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Xóa các bản ghi" e="Delete Records"></title>
  <fields>
    <field name="ngay_ct01" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày bắt đầu từ ngày" e="Start Date"></header>
      <footer v="Ngày bắt đầu từ/đến" e="Start Date from/to"></footer>
    </field>
    <field name="ngay_ct02" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày bắt đầu đến ngày" e="Date to"></header>
    </field>

    <field name="ngay_ct11" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày kết thúc từ ngày" e="End Date"></header>
      <footer v="Ngày kết thúc từ/đến" e="End Date from/to"></footer>
    </field>
    <field name="ngay_ct12" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày bắt đầu đến ngày" e="Date to"></header>
    </field>

    <field name="ma_vt">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="kieu_hd &lt;&gt; '0' and status = '1'" check="kieu_hd &lt;&gt; '0' " information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kho">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="xoa_yn" type="Boolean" external="true" allowContain="true" defaultValue="true">
      <header v="" e=""></header>
      <footer v="Xác nhận xóa dự báo" e="Confirm delete"></footer>
      <items style="CheckBox"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 80, 100, 230"/>
      <item value="1101: [ngay_ct01].Description, [ngay_ct01], [ngay_ct02]"/>
      <item value="1101: [ngay_ct11].Description, [ngay_ct11], [ngay_ct12]"/>
      <item value="11010: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11010: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="11: [xoa_yn].Description, [xoa_yn]"/>
    </view>
  </views>
  <commands>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Hw5Uh6FT8yCXTOZBPt0DaOJsLdMyZdboktqFahJ9cqbC1GS/f7iP5pC5O4k27jfEWTx++w0IyZKKDJFHQOSExfnbK/bwLt5PHYiDlb+YUv9hypQ9ZiPNR/xTWk9249UDARNJ6O07V6RLIz7jrtz23fXw5XbvrVnzRLy3iIWVaTGm8pWLCTw3E1F242hz03GVkN12uzU+IYe0w691YRoNDZD8dm0lvaXXWvteeByAKPZxICbpebDei/ty1wsDAI3pA==</encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwPARFv22X5LTgihhffXqb1om4t+Ujma2lD0zBmyQLoLzuE3K+F+rKYS0xQpPsft7EQUyQrRyYO/NE2lMdSEPVovlWfxjKNNfpDF0tsMyRT2XMMy6T9BkPQ76MPMchOkK8G0+dYHupsOuG12KO/i2KqAHVpaxnyx1LSxvumS8lK3cIs6vGTzH6LTKXhNS62srbLtt6l+/qWvk4hfM52R7+NDgzbUsHMt52drreZAQ1wYZ5BUtOVOythbTiCiIydjIV1QZZzDAOjtuzCikOws40+junZp/Tr/rxPs8hSRJL78GYxG6MYBhn+AzQl4rIIbQXZdhU/57it6uq8oujtqTrzPYWOiWg2qTiNBD4uM1LdGZGe52OBl4gDRjzMJypoo1oQknrNfbjpea3/MRbMKkly6S89HITWwVWFFf/aqaLcGoqdwqZeURinU15KwbOVPL7rynrNLmzdrqZ9AcZqV4Iv35CXAocMNsD/J8lCRuvw9HaPcF0UXHgZKJPAb9s6b+w==</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>