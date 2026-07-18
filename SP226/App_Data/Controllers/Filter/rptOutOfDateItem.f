<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptOutofDateItem">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormStockRight SYSTEM "..\Include\Command\GetReportFormStockRight.txt">
  <!ENTITY SetReportFormStockRight SYSTEM "..\Include\Javascript\SetReportFormStockRight.txt">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>

    <field name="ma_kho">
      <header v="Mã kho" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
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
    <field name="loai_vt" categoryIndex="1">
      <header v="Loại vật tư" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="20" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    &ReportDataTypeField;

    <field name="nh_theo" categoryIndex="2">
      <header v="Nhóm theo" e="Group by"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZd6YUU18evbskYAc59JkOu3R14O+9fOGlMGXOESPZtuEtOHIKGpa+RHUE4Al0Qg3jA==</encrypted>]]>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="">
          <text v="Không phân nhóm" e="No Group"/>
        </item>
        <item value="0">
          <text v="Loại vật tư" e="Item Type"/>
        </item>
        <item value="1">
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
    <view id="Dir" height="162">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110---: [den_ngay].Label, [den_ngay]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11011-: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

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
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHbbrp5Syp6f/e3YeiJhaAd9FaR/n1jmzGHMS2OUVGJsS9sI8441xUQbbTUkE0Fm+Hw=</encrypted>]]>&GetReportFormStockRight;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ePvDEiPLJoZDJnB0zrXDogUiXkKxB6D6UAiLxoZzgeCUlxdaOlv3DKqUMkfQjtY9MkHWaDvl9dW6KxzvGIrGMgevtDW0hm8BRIChZbZ35mIEixzC2N/SONemIJ2v5GcA5nTGlQu4WDIYtedFc6b8Ff7rx8bXKAZ4dAVMo5BAPkqCR4ZnIUs1k0zywcdy06tP++v0CK4KosiafLJJncdj6pm1Qlv+0nQCXRQBjHwqZjonRad9FowCBZ853/r4nNp0a/GVnosnanOQ+gwtG0ftCkBFKFZrwHe8K4h1v+dZMwE/gssof8pIBFiMQpnnWbpFuTCNXbZE7cNc2FxEIhuG6rwJVBcG1W3GCa344+/Ak1+IvDhyHYhE0+ckSvHEoSBhBO2BjFfDsbHa0FeOVNgLxGgv1jtNnduoBYbPcjSrkBZQWc841Llpt7PusD7atdCiGUPZe2h00/nKf2iFE19cwVk76VRy0MKYzryJ+hW/nWu</encrypted>]]>
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
      &SetReportFormStockRight;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KcCh58IJwrFKWH4ieU3gZnztiQaU9KHEKNrFQyv/DYTUHOurWvWxC26DlkDHIOOWyMNAvMiHf3WaT9MzWCyxnbgbJFZ4t+zrptsXRILbNtTjlvs0oF3KkBc5EzQgXs98TFqw3HFglNVEtAn9cYppWX9rJllVkA89krIH/XLGud9qkmUSZgF+UmaLVSR07ZaUPt67a//kNCIQymyAphCH+ISXa0QSbnwYtp7X9StoxNGYPFEaHKG+dNFEGmRiXCEv6y14QZcdIdTwJysvl7y7sXtBu1t6wbJaVq9FVLxRN0DIu7rBTHED5+in4Lk1d5JMiutQhGG+RPrTPAkzGIuQGm17JD9HNo/V+wDwIMpPLJBnCyHjr+HJNFUM37BxojL68Uoi1MLwKYpJZKOWIVIIpqopSoeY/J9Iu/3Pz9vuU+BvBD8Aus+uJCTiISV7gL+8/bJqw4qHbPyFWGYqvMeOp+5npUmeH2MEAHDd3BuQjlaGG+9Q+wv0GnyQZVhhlDTW838JRqHGZedaLobovWH30269ptLwxqscQX67RTidCroOFs1gy6I2162fKbH/EPGJdz4+8c/qBnHarjPUrpGLgPxZBIIPrGucU8GAlYgeMc+bYUaNAknqsRvrUvECGQIKTQhyoPGINgBQlizn2KEWZ36/jmPWorgAx2Oa2/jLKr1KPhlI8zp+gmzdDHvKDTiFRe7XZjOlhmfnhjmsMpw8fF0SKklEYHt6zOS7qH6nDSX</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>