<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptStockPhysicsBook">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày" e="Date"/>
    </field>
    <field name="loai_ky" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Đầu kỳ/cuối kỳ" e="Opening/Closing"></header>
      <footer v="1 - Đầu kỳ, 2 - Cuối kỳ" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Mã kho" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mã vật tư" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="nh_vt1" categoryIndex="1">
      <header v="Nhóm vật tư" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_vt2" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_vt3" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="20" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu in chỉ có số lượng" e="Quantity Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="nh_theo" categoryIndex="2" clientDefault="">
      <header v="Nhóm theo" e="Group by"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZd6YUU18evbskYAc59JkOu3R14O+9fOGlMGXOESPZtuEtOHIKGpa+RHUE4Al0Qg3jA==</encrypted>]]>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="0">
          <text v="Không phân nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Loại vật tư" e="Item Type"/>
        </item>
        <item value="2">
          <text v="Nhóm vật tư" e="Item Group"/>
        </item>
      </items>
    </field>
    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <header v="Thứ tự sắp xếp nhóm" e="Item Group Order Type"/>
      <items style="Mask"/>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="138">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110---: [ngay].Label, [ngay]"/>
      <item value="111000: [loai_ky].Label, [loai_ky], [loai_ky].Description"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11011-: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [nh_theo].Label, [nh_theo]"/>
      <item value="1111--: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 20, 20, 20, 240, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHbbrp5Syp6f/e3YeiJhaAd9FaR/n1jmzGHMS2OUVGJsS9sI8441xUQbbTUkE0Fm+Hw=</encrypted>]]>&GetReportFormLimitRight;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf8oS0JjTQQyzd+36GQlQn8P+lVm0WAQBS+c5B67ndrXBynD9E8izJJ1b23bLyqTn/WU5CM9UUZEytZvfdj8ArABkSuYdW6Dcl4C6k7GlXvK7</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ePvDEiPLJoZDJnB0zrXDogUiXkKxB6D6UAiLxoZzgeCUlxdaOlv3DKqUMkfQjtY9Ie/uUw9afPIYCJjnXlFDhZPrYClcH1kqBn6iEx2saLlSLAlZTKXBx4Lt9BsgeudYjPkiprCPuLG0AEpCwYlewRsozKh6neSkcnygckO0gjJjafWWiaAQpPMquXbTodP7cnHBX3OcpdV0MfNWF/hppuH5Me5CtQrm7X1J6CUE3vPsPNRou7F/8u2wEcXoz9MQjT6+59OWfefBuyFRCN21j0HBSGUTrBMPOyBfqIoLjj2mM61NLD8HZ4WP06ittMz0fsJOsay9tal+JqGcOL9QNNVR8F47hKY3CxwkaWqmKBlbVzmECDlp2MkcERcmfD573iSG5IK/vFHj9o2gayimCGzvNdmGsgJF+KUlzQHxDNxXSRUDZ/PHAX85wiMc16g+kYJlg+ZRM+Msr+xIPl7QV5ppO2EatT2kyo8BFrj4VkYOd6UHOj8495XjqTS4i6btlQoAcVUxOYohhfRYbsZf+JHK2fMT0nRJ7MZ/gqgalVrzrv+3iAAtIbdeHDRXMuJJOczGzoozoItrpPzzstlyTHi6rc+0xICws+qdkw+EMMY0+FNt5GbTd7XWu5usw4F3aZEzj+/7/pTPjmlSc7ooLw=</encrypted>]]>&Controller;<![CDATA[<encrypted>%yLooQnL9xQeLYF/0lD7Rzu58mhNsDnC/nFSIVh7H/GUEQEO9fO0iiNU3YgPZ7+AlwekzpUaIQ216lp/NQiCQaA==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Fuxy19djTkmznU5uHz7IrqzVtN46RNSZW9JdMrky1OawIBlUHoXpMxUY61rGGbxvqIfWSkI5tsCBzw+lr1ZwR4+kho3FwjuYeCku8YlmUyVma/E5xbsyPDuZwnN37oOG4XuIzO1Epmcy4jM8l8DLrOUUl40uT9GxrS4/79x3SDhwlk+o3LNid1yR6Wl2pk/ARHCSuCZeB/o8dxoySEO9Hl67vhtMNP+U7+khr2MZJgWh5qN4LmW+mVR//Kvmy5DWL7youfLKB62U334xMZYuwtrfasBcT3knJLx13KVP9bvi58VziwnOXaEknnoEAmKsbvJGNEeIJk0VGJqTgJ6x9ognO1WPAGt3r25hpUucXuRcpjJK03HyRWOrvWETPBjhw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &SetReportFormLimitRight;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KcCh58IJwrFKWH4ieU3gZnztiQaU9KHEKNrFQyv/DYTUHOurWvWxC26DlkDHIOOWyMNAvMiHf3WaT9MzWCyxnZMKCj8jt8luHC9+4dZNTLC9AoKFGHJVyENEaVmZPgYrYnVPq5qr9NdnH/p6a/Nc9Lzy8hr5Gt4Z0fhU+/dkSVslhClEVO8RbQLMXlV5wGzegnIaleEBxGGm+gL78Q5UltI0cC8eW+bjfQkS0WtNN5NQpz1631fjNR9F5dZrwDy5/4R5X9q48S1ARTTM4hdRk/4/e2RvpOTigwr9rqAOE49H7NELec7cLqN3K9T3C+JYAzj6JJi+3WDAhfQRmhWscO+CJ7MKzNE0aO6g31D4M2mIxzO+zRK6L+QkKHwqwsrVPdHqKJiNlSHJ1RbGH6uWGIBqKZ/iJCeQLqwm1jaa2T8XCgawl6TG648gf+44JPxQZq8O3fYhigikMeaslELHQJA1/MxRh1rTwLJtpzG1e4jcCXuWnmU8K2z6Hbqvcodc6iTQ5DdxrevmicKcCy9Cfx6PrBbZvdUXEiSxiSDBIk1HgBKKa4Xc9gre5C/wqKeqS0sribbDhz+gw8RpX8v8dk/S7tsLxpjDIe0gBl4fupwRzl1Rt4PblDdXgjAV8IC5REn1bhi6BC3fqCuXxMsQVwN2Qj4DumbnGi/Q+puUtndU3Ytvv0NbX0H7pGCJpR0wsbndzJbJva+enSzLQeARnvNNz3JOfNAZu7Y6XGq2hFJ97htE5TkeYOd4v9xKnlPjbEb0sTed2aMUBjz8TrItWnWvaDgvI76HHu8sbQ+ttLroOwGgv19v+jzLT9ivPYxYK0TGj0e8apx4pCLrKL9SFrI/V5RAyNYvzUNnUM2bDeqK7nvZ6VMSzSEZGwMeTDs+Mm2f/PPYB3hYmXFIVnJTmA=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>