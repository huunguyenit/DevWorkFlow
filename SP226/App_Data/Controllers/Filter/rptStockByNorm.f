<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
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
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="dinh_muc" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Định mức" e="Norm"></header>
      <footer v="0 - Dưới định mức, 1 - Vượt định mức" e="0 - Less Norm, 1 - Cross Norm"></footer>
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
    <field name="mau_bc" clientDefault="10" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    &ReportDataTypeField;

    <field name="nh_theo" categoryIndex="2" clientDefault="">
      <header v="Nhóm theo" e="Group by"/>
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
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZd6YUU18evbskYAc59JkOu3R14O+9fOGlMGXOESPZtuEtOHIKGpa+RHUE4Al0Qg3jA==</encrypted>]]>&OnSelectionOutline;</clientScript>
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
    <view id="Dir" height="186">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [ngay].Label, [ngay]"/>
      <item value="111000: [dinh_muc].Label, [dinh_muc], [dinh_muc].Description"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>
      <item value="11000: [nh_theo].Label, [nh_theo]"/>
      <item value="1111: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 225, 130">
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ePvDEiPLJoZDJnB0zrXDojPZQrTfXMfCJpYJ0UGKM5s8emB0vEEmK5AKPL14fbjSkhQKPv8WngY6bLRvt/kTSMe0YB+2+jTk/wV/FEqI9o4dsfL6iRznOXBBMQspbM439gIrnEvtbpXqTA3nxPn1WJC6vj0MgY/VALHY1cb5DMRaM71o/rDKczVjhgqES4+QXp0KkShjpAygy9hGzFHNTZFy6ZSSN9jtDdWAMcT0JxMFCTT7MnzrKcfgmrSyv23cC84EmWnQf7bqUGQz9p5+/TnqRpIJ1L2BpB+yQ5JRq0PbTUc7hc/YyptAt/wf+7N4ucOrZMZJm0YsZ/ZMPHcwp7YKu4ZRxwbyhXSf48VX6Hm6HNjAhUkAY2yJRZLv3db53ElJCjRWQk8/VLiKKwdHCMfPkJfaJ04/uTxUctF4acx/brHxL/A5Bb0bdWU7CsYppcUQeCcOOHd8o632WqEM80RlYj4ZjTIyzShW1SCg7V7uC6z5Gf+xKOqhngGXTzKfQ==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%cuXNkLI/9J0no/A5pPbabnEIwI9FPUjGjNo7mHh0w9+Pfs8AqDGUSvp5Vy2NBpmyQOw6E2hIs+01/C+nPbokxeBO91Avh/dCOg+eCaDtK/WmP86VqbAplfF9wBVcZF46MOrUS3ooIKbRJTev7xu2prVsXx/hOw0ZCeAg5DA8882F5pe3LwJ/+52cHWZdmXST0Xs9Zrj0WG6VOv4LqqaZ6ISxoKph6abxoh1+NtcB85LRkvIiPnsgRNSEuxNp0K3D19pzNb2qBNFWcEJ1lyU9jVuqmL0Nnmtez5iw/81iq8PJrZsvXkkppRlqm7bRRt1k0ymPLb77pA71lyqTsfdeZDrzRQ9l1zqHTqtySc0lEO0uwf9C6NaPfnj6feZZyV7bk+ANYtYHtx8lSc6mD7K6VQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &SetReportFormStockRight;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KcCh58IJwrFKWH4ieU3gZkq0u/bwhUyUUpNNL7qLq+qV2ZlQ0agRgejydki27fYt0VE2TLn3k7S+pXRLpv4HIyo5XLRfcA4ZVvfYgLOaMCyPZPX29iITAXPIVYlPyFAjPfg/RXLlAosfxSIbcvyDMVXAgrPbsTwYCVKabGJvCpAKrfdP7y2Bwqu1/KMNUNFnVDAMdvIqAcQBRn4ajlvVkldH5FAlEDVu56NeQhunUjjf1QcRiM+aoLFFqBppDwD+G6cUhHorTqYF251E9xEd387zQnqSFZsphNZXZWxJHS+D0pOF+R0wnIXlthgD24wpSTEjvX2lcYVoT0qmr99wE64tFbeqD9FM372RfyV0rZNsKf7fluOuyx86NvSoLrQ8ayFDTd2dH+l3Gq/Q3NE3nmWS90S6goiw9psX62Fuqgo827yx0Pj6Fk/toj6C+03HIG75lOISln14fGISyTKqvVU9gEsv7vhjM26/4UwiXugKh0K+/VW/bdsr1Iusqz7McJFWK6befBZXMU2Mi8ibhbQ24By1HLkHgeCL3K6r+ROvHZZg5lAoSAwoEY+UFbCJ5bUey0XWVkohz/vC5DuDVYQpSYEQjgfHIBe7WLqQYw5AeOmg6E4p00fSbAqoF4mM5XTW/E7EgP7RlzBcN87ieTFxMWEaYjhXKIKDQ7coTROX3Jw9IPOnuBqHMS8shHPMXAlJoTEQus1LhvCicALtEdL3CJLwTqZamNCAMPhL32BMuSmoXi1kCAra2UJu0EECX/vqffBpEcjH1pX1A8HyRo1ycqFj+k4so7M089tlc0xGzy8mAqPJh71O5HL6CO/PQ==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>