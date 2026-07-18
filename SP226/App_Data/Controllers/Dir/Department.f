<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY Identification "Department">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Department;
  %Control.Unit.Ignore;

  <!ENTITY c "DepartmentUnitDetail">
  <!ENTITY h1 "566">
  <!ENTITY h2 "106">
  <!ENTITY k "ma_bp">
  <!ENTITY i "1">
  <!ENTITY Tag "dmbp">
]>

<dir table="dmbp" code="ma_bp" order="ma_bp" xmlns="urn:schemas-fast-com:data-dir">
  <title v="bộ phận" e="Department"></title>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã bộ phận" e="Department"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_bp" allowNulls="false">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ten_bp2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    &UnitFields;

    <field name="dia_chi" categoryIndex="&OtherCategoryIndex;">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="dien_thoai" categoryIndex="&OtherCategoryIndex;">
      <header v="Điện thoại" e="Phone Number"></header>
    </field>
    <field name="ghi_chu" rows="2" categoryIndex="&OtherCategoryIndex;">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="&BottomCategoryIndex;">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    &View;
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwdfwevx6xXowri206sjdEyxTYXisyodx7vTVnnKxmtmOErsJEHZmZGK45k6g9ojpT4=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYaXhD9EUq9woyJdGHRoPlzR0l98HOgJUZzVKMimw+yuj7jgrAENode9gobY61z8Ms8=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7c2JhAIyxdMfUpQjDV7LnyhYVs79JGXE3NBcge+ZJvruOqxdG1948baW4F5AK5tAPKOQxUHHyHoPhoeeQtwAryT3gD8apnuVrlTa8QZjFjXL47WVXhiwLqZn2HqZ/0FMbRRMoDxoI0Mhlg9tQTTwMiTg1LnyyIJUkRkzdd5OFAZloNy6YarDD8vsXupLCaJUu7ce7/hLfb1DGt/MPW/YYwRN27m2/cMk8gtQQ4Mnx48blyvVHR8AhCkPqi570RWOf2cL0IhRAZiBnP6fFaSGa2P8JoknFSgSMR76k+Au+I5WAYAXVnkf6kB5QnhMQiHDXAvXp7xX0ocAVUwVKsipztAZHXycl//5G/QX3qGwsByrinfef6Q9hnWnNczxclkY64KxUVm58fbGtOgYgU9nSX2nhf4lOLfysY2je4uyNwy9w==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nfXhuiGxtx5ilNScGK8aDj/gaPT6XsQe3KalGvQju+Gy2qGtyU1eE44Y58GzT8kuwWrC3e/zyDRi5qNQA+JVXFQrFCNRUUQyPgm1nYV6id+GkKbXQlC7NDEpNwickdge/u8Mufdcdl4k7vWicnJj5YAZosuKaphMbrOPcAD9OxZ4=</encrypted>]]>&UnitBeforeInsert;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw9voEGmT31btGChKToWwF+RN4f58QyaKkJAlUtGdl5iNSHp0qW6Z/CxLtJvSWYy1oj6FhEFVj+DhsKx8kUWrss=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &UnitPostInsert;
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jbmjLVEaL5LOirB19XEEBSYQ5CdLFHvPPQjqV21XHIoAuoFnlsf4ftWBh45PqEvMnbkglLOBVJzy7jwcFBRfEmzSmooj+ofObZz1gJnGOUCau3XvOfu5aetmTtEu8vChHzYDJ9I1FM+21ft/DHtOc0cAsXOrjIr9WXJGYu1yB+grTkqCGfrbo7hnNGPE9HHjha6t8Cvy2g1g7Ee6Fuarx7blOjG79E6qu0EfiqLB3kvUW0qy6SJk4XG8CsCC8UONxsoQlh35U+PtQvhkP9TzpbyFGfG2J7UrTXZ9vVcKPi94rHspiANwNH0HJQzgHORVFhA8AKQ12jk5ScVmk4gNm6A==</encrypted>]]>
        &UnitBeforeUpdate;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbejRN51d98vJNgrmale/BmbKJhKVuFVjZuUVxtvZAdwNA</encrypted>]]>
        &UnitPostUpdate;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHaMIJOIdLApwJ5aUDBaYRCa8TKB7auek8Z09swsfSYjgbIIaOKnK1kG6zAUXWyTvgtISEEu/iw6AmoxJ01HpfEJTVn4yiIqNVw4vAmiIiqhaT7hUMHfSeISETLdCeI+KNFrsjVhpNWPHN1RyWEWwybJTzvtENtrm2/AL25TLGQboXPyNtUIWMQ7LeXwouXbD3Q=</encrypted>]]>
        &UnitPostDelete;
      </text>
    </command>

    <command event ="Checking">
      <text>
        &UnitCheck;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkYVtXGn3RBFf8uvpFdCmJFp+IWKHR6QX8plsdwulAXlwcmBGjDZ4ErEnBQTEvYOdRzxRZL4qHS7xqhtPm0hjp5r</encrypted>]]>&ActiveForm;<![CDATA[<encrypted>%AWhzdzNlvv6koGsyvP7h0bOsIt2Asn7jB/sFw3IOqKfpU++JFSVXWSv3MEylGD6TW+nFUeItVxtRrHozek+XZvcdOBoZO9Zlcs44dpziUbSsZ9q6+RZIX/V9eJShHh81eaHbQLTd2LstsNdQ2RjY8g==</encrypted>]]>&CloseForm;<![CDATA[<encrypted>%AWhzdzNlvv6koGsyvP7h0Zhcm0O//xY9o1cJM0ejf1C2sLFWqrGzxSY/Jz9UbGOHlX9QU4Cvr3etortcfoPoUrppHCwu7cao3eNBcX8OdYziXGV3ikPq/P7NhMJPqobi9CTSKWLN1Rgwp51nBn3neIm9DsPBfmtqvoQve5+Z8Xg4Tpvd5lDTXxXLGTvwSWoL4BiB1pWJfZ+zzQRyyHl6Q0gWVEg/BB5Lo2hcaOl5ucbeUVB6RACgTa2oPswKFZ1a/nNrhe3ZC+ShySfaHpR3YikNMMUxm3F/xWcxZAjZwEc=</encrypted>]]>
      &TabChanged;
      &ScriptIrregular;
    </text>
  </script>

</dir>