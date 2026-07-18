<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY defaultTable "V20GLTHUE3_28">
  <!ENTITY defaultForm "v20GLTHUE3_283">
]>

<dir table="v20dmmaubc" code="ma_maubc, form" order="ma_maubc, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc mẫu báo cáo" e="Filter Condition"></title>
  <fields>
    <field name="ma_maubc" categoryIndex="1" allowNulls="false" defaultValue="&defaultTable;" clientDefault="&defaultTable;" hidden="true" readOnly="true">
      <header v="Mã mẫu báo cáo" e="Report Code"></header>
    </field>
    <field name="ten_ma_maubc%l" categoryIndex="1" readOnly="true" external="true" defaultValue="Default" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="form" allowNulls="false" defaultValue="&defaultForm;" clientDefault="&defaultForm;">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="AutoComplete" controller="ReportForm" reference="ten_form%l" key="form in (select form from v20dmmaubc where ma_maubc = '{$%c[ma_maubc]}')" check="form in (select form from v20dmmaubc where ma_maubc = '{$%c[ma_maubc]}')" information="form$ReportForm.ten_maubc%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZdE9Eq2iM3bUhFKicqnNc2q3fhAVTRG8kgfL78wbojHF4XcHXSUA3EdRUBbacZfTZw==</encrypted>]]></clientScript>
    </field>
    <field name="ten_form%l" categoryIndex="1" readOnly="true" external="true" defaultValue="Default">
      <header v="" e=""></header>
    </field>

    <field name="loai" external="true" dataFormatString="1, 2, 3" clientDefault="2" align="right" allowContain="true" defaultValue="Default">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Tạo mẫu, 2 - Sửa mẫu, 3 - Xóa mẫu" e="1 - New, 2 - Edit, 3 - Delete"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZdE9Eq2iM3bUhFKicqnNc2raBw0IpQ5/chFGwoEs8Hbd1Jr3Xc/ocdPgfx50gSGqQg==</encrypted>]]></clientScript>
    </field>

    <field name="ten_maubc" categoryIndex="1">
      <header v="Tên mẫu báo cáo" e="Report Name"></header>
    </field>
    <field name="ten_maubc2" categoryIndex="1">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="xoa_yn" categoryIndex="1" type="Boolean" external="true" allowContain="true" defaultValue="true">
      <header v="" e=""></header>
      <footer v="Xác nhận xóa mẫu báo cáo" e="Confirm delete"></footer>
      <items style="CheckBox"/>
    </field>

    <field name="h_line1" categoryIndex="9">
      <header v="Thông tin" e="Information"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Thông tin&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Information&lt;/div&gt;"></footer>
    </field>
    <field name="h_line12" categoryIndex="9">
      <header v="Thông tin khác" e="Other Information"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Thông tin khác&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Other Information&lt;/div&gt;"></footer>
    </field>
    <field name="h_line2" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line22" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line3" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line32" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line4" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line42" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line5" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line52" categoryIndex="9">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="157">
      <item value="120, 20, 80, 100, 220, 10"/>
      <item value="110100: [form].Label, [form], [ten_form%l]"/>
      <item value="111000: [loai].Label, [loai], [loai].Description"/>

      <item value="110001: [ten_maubc].Label, [ten_maubc], [ma_maubc]"/>
      <item value="11000-: [ten_maubc2].Label, [ten_maubc2]"/>
      <item value="-1100-: [xoa_yn], [xoa_yn].Description"/>

      <item value="1-1: [h_line1].Desciption, [h_line12].Desciption"/>
      <item value="1-1: [h_line1], [h_line12]"/>
      <item value="1-1: [h_line2], [h_line22]"/>
      <item value="1-1: [h_line3], [h_line32]"/>
      <item value="1-1: [h_line4], [h_line42]"/>
      <item value="1-1: [h_line5], [h_line52]"/>
      <categories>
        <category index="1" columns="120, 20, 80, 100, 230, 0">
          <header v="Thông tin chung" e="General Information"/>
        </category>
        <category index="9" columns="271, 8, 271">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Q8M/QNyyhQgbtZ5e/JFp0dX8gtRO9cYmco5pGVoregwxbCGxWwie5qIcQPS5zRb1qWqG/oZ+cHh9NeTuBrNkKEkQs0CXSrqCbSZWWMg6iS7JG6y+yXIdgJnzT6RjONcIx2THLfbdjObsVMLX/UdPpYBSIIkLRMZNQe9LXQLKjL9NEG9HQFa+PZ5Jsa55X+5etvQYIyC6a4B+XxFsF3U6Ksl4TFWRSIH2/YsflDrwX9JV/hl9gMsGiDRsY47XMz1MqoIZNAonEFR8/C2TJTZvqg=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ePvDEiPLJoZDJnB0zrXDoh7DBNsYbDT3ej3cze9dCdHPeIVS0CKI4bibDVmEiFqoxGVAtVBng9tP6BVUlBbKIme2MIm/T/ArXmndg97QIcfimoQyMjC9Nt74fCgDAdyP/Xw8fXa62TftIj89HCmN6rNAwvLOW3umlr4HoEBEo8WRIxKE7QcLhwVHFeLqAfZDsuEkqzo49mBW95xhX2A3HZ750xEV62DKV82VC8x9Xv6MqVX1rYAQ+iLdpzm49Ke7inLfhdXLneVEFzmIITUbOb0HP7d1Zbpd93jMJcF1YJWOblKJbVfAoSOWTfvD4wLng==</encrypted>]]>&defaultForm;<![CDATA[<encrypted>%aFAbyVXPX5GjVk6SkpZgUeTzBKKuGpK/Vn5c/ZqzXNQ=</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6mYWhc4nYvR9jN96NYRh8WYaQp4hVNvQtC4sToggC6e8+SZ8vv/mPenz+DawFU+rIa6Vszez+RtRgG2DrrShPSjOIdhMhscd5D3f5N4uvzVquVDABz9q8ciXVlpAo8s9SpC9t3GLiTDnwBO380Uzv8T89cJDES6S33tKmAoOm0X</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%2uTMUxyboXuUcKla3E6gp8kIDQkQwVXy5lGVCekhvOCHWmaMheiXTWA3XRE2+T1CyozDB7xiu5ExiHcyjzFG2T78PhPPQUTRbbAFZm8aoli36SVNDJD0SBkhrgekWeRWqI4m5eNLbuA+LLhzBokiCijx7uDYxop4T1JYR5aM5+re/GA/t7E6hkYfRvvmtKAaFVd/ndQD7GnyBNQTEm2gVFVgD4QwM8tkdCXcYCn8ltf51SOsAY8RDF6eqv3AdBAeIMI+XcZTGHu7KVp1HIoqiepHl6059HWKgm5qjpxbyOENBW5WbjHeb9nDjFNeUvYNSByLPzLH2cdjVkwft+MXdZTm9ZTGWNbcK3d32UqMPtlyE4J9lprOHKT0zbcxBy4I7GYESiSpoUjav4QpQTuF/qRY0keqhzciT9qCAm2d9AKGo1DDIcKa+R1Vyw4PFxNfpKPtbHUySVxxm70i/5nzkD0mNcGL3A/BDGQCE/9rE7DCx7Y4qPLgr5W9x2MO7+CDNaxmwpeJBtn25Qb2KhoyWPLcsyYuNwCbiqLKzE/3jr7WNHnaDYa1F/a8y+Y2SQf/ciVS0EZYViv+6OfNUBpHMRpXxI3idOZw2Qmci0L1ygjoMVKo5faNoCbSSdoo/gQE4qVmGPy+/p+bXirAXX5tx2eOOTWFEFFQBtVgJyc+vUOepIJZgSEZJL/HmMXh7TJCzXL35IMiTTrJTYzWZwlbsT/o9aRyYO8ncfORuq0DL+ImeXVeSFeSK5sFRMz/pUVAaTeVnnct+7WM/E6WtG5KVxH6rx0koeBb8Fkm0lOLODIh3umVq/a74LZCg7YxwuIW+HVfPVGo2ni1DK2skc5NKsSlfiV51dcofXPow9e+Em0NoRsFXwDcLFnCyjdjsnKVK1IWZs3PrSoZaDkT9m0oAkEnekGkY4u8IC1oTxz3XjK+T3s1PnRp4kze/J2RI2p79lZ6zrcYMtnlg/wVXhCPVjXQlHxPF7r5VEai27pyxDN809AqlqTy7UqG3RhB/rrHj0A6JcjhThFfCvbTOoMlENWqvsfxi5rO0748r/hppE5oPD7KWJPweIgebBz144wSAq5fLI6LSyme/urJU4LguC5rQqEmM2VToxIjGyDjZ06xCRQ47oJ3pKpr+h8DQRl8QrlXwxpkeZLuvH3p7BT3Yr5fmWq1R4aV+hcHqXSvZvuHs04gJXo7+EH4SZHxk+vghPjQI8wzriYO9XIFErpQFA==</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%2uTMUxyboXuUcKla3E6gp1PLnPBo+C59D1PHqRannakR5HRrd7z0xsRK/krPLlkH761C54j8bmyjabmaMTVUb4yqdztGeb4G5dqt75DJdmA=</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%+JShMBxygFsMjL+5/FpvEVUFl+7ZVBg4tuqsLZrbz5JSRxSEUdbIf5wNcVaSvQLdzpJpobLvefqajaxpf5CRtQZz75ib2UQ4QNiMFjQSIuIUo6mlSMlDqgEl3aLOhR2SBOTT3xTecyIhUZPi+t0DQRuIMiQRj5RjI/dSFoOFI34=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70PldN23+Zg3NpuDqAcd6ybQ/N4lBF2icWNN5xJK0KxksIU0cEeWAiGrpDVJdF9CmjNgEVpR0dLT4PYNTRmdmGMP7zNZSG1OeQmGuzi2GiDv2e+/VKXjkCJ0bW1GB5zYn+5MOHszk9RdgUqF/+sg0Il/4Bv9wykxy16axkdVT1CAIOE9fuGNM7cI3bPZNbdddkUrBA4iH3CajmUntgaaQ6N+60rEyXKoTEilzcYP6s8BM8xs0HRvkknE6ipiNcbXvDh6LPKp4mydhDrjcKgVdg6+sovhxpcN+C+Vqnsprgw8wNBP2E1MYf139Ai2Sm/+ujfQyQhWPdy1168DlSvXzIeWcWqFIylNy8h6M5xTGfPBlDTBKKaz02gZ6sRsOeQ7aPRromyKbFMhuHJEDDWKDos8owWC+yh3qT0/JrUDBjpJMrXoDkIGcXQTg19DQVEvL6SMhpkZTg8CN/tcM9iMtE6vhgR0YsyX4VeFUFsk3p4/XzaAWn8OYX6lkEeMb6gGUpQl/GOGvQmgP3jiwuQNddtfKN+LsQaCrD2oWx9dvJIiwqVgUIzzyd6vYJONREwtYhBeIjNrGEPjpv1R7RUT+vMk2S+9KAvdGnGXlTVqt6KysIV1aLIshbHArY784SXSrzwHlTYBYE5mjYyKaSakeKInvVHDNZ3HzUu5YaPTKF+C5tjdwre+IkzE7xa1z9zgH9FO60W+Rk9Pa6g5zIgIoAy7gMPKm+G1HI68iS3ZfrdW+DaXZpn4fqtkImfiGFxwhXuvg19OFEiHFXjsnEhJX18hbG6JrBJY5o/u0Gv9gTERH8QsrAM+FovloSOvFx/519taJ9pVQRSkbeCA1PpX4FtUhm9A9VALVDJDFM90vabGg3EPJeh1R4TEGf6xxNCbbRaGZqeGiSXXrr4WpYiOGTBtZz3WSxFCa+9HabzPoEFaM2f5xBKgylLOJulvwkxwEnz6eZyIQ60oHTEo4nfeO2UYkupG/H5QErq6zM32fE5PByYvKbCF46W1MkQpRsN8DBec27TYblXXxwLonoQ6BdfSKVrd2iM2NeZ4iKSw4s3tPLdxRpVsj+oeF6omSs5kBsaxKnvgbve3xxgtznC2pOC+MI4vesdwJ4euJT6fosgHPD0MOaa3xxj4s83jw6vjn9ujFnQVJSX+WOrPG0JeS9GX7TLOlMCEiWmCoSyFiecWyF5us8Yd2zx3qNE8Kxun1dWX62y1bQ0wSgzXG5SFHruWoumxnaZtqP6xsLfszS4NQ</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="ReportForm">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4E1o7Is7aq+wrwMknHEW88WYInagQGulzZyMdwsO998ksTcAEucYb9eQP9qNEOP/IC/RgSQEMaykr9aUeBKwrllIxQVAr+29qM6B3hweZD+8xYjZ+oD5rsI+ppbQU6SegHRmgmdkQInfiC94y5m0gb</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ayGeBGQudaG3KaHZ9rzRUoilRlLnkc0MB/ykekvrte95hdrpMP6mtRccjSgwrsfOLQwg3opxoDJDXY1RkoxhOxv84VzGSY0OhL6Ag5FB5tu</encrypted>]]>
    </text>
  </css>
</dir>