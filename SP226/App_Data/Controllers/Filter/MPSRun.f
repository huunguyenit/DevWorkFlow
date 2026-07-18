<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY % Filter.Process SYSTEM "..\Include\DemoMode.ent">
  %Filter.Process;
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Hoạch định sản xuất" e="MPS Run"></title>
  <fields>
    <field name="ngay_hd" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày hoạch định" e="Planning Date"></header>
    </field>
    <field name="kieu_hd" dataFormatString="0, 1" clientDefault="0" align="right" allowNulls="false">
      <header v="Kiểu hoạch định" e="Planning Mode"></header>
      <footer v="0 - Tái sinh, 1 - Thay đổi ròng" e="0 - Regenerate, 1 - Net Change"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110: [ngay_hd].Label, [ngay_hd]"/>
      <item value="1110: [kieu_hd].Label, [kieu_hd], [kieu_hd].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KkZzJLsIDymGhrO8Q66fqV/bkCxc7WNlqvMHO8cJ7ipxmX+MfYNrO+pSP1bNf0AP24Dw/+RhROk9OsaOHS3vzbs=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVY64w/6mZKJp2EmfUjtQddejzntfvabr9+JcRqgENZrapuUt98jEy7HqCgRHfk/fdmuMmxYoY05YPpCTnF7p3zeyaMvkVG/w8n4p1amLBqW9NvfJaOydo064W3ioLrEdIr</encrypted>]]>&Filter.Process.Add.KeyupHandler;<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KimrwUK/pdvszdovlnlQXWFpuiaJrZS+KhEYTOEq8Iy5L31ecqNNdyFlVt7EwOTWw==</encrypted>]]>&Filter.Process.Remove.KeyupHandler;<![CDATA[<encrypted>%AWhzdzNlvv6koGsyvP7h0aAYBpuLqQ1fE+Q7RwqvxIA=</encrypted>]]>
      &Filter.Process.Script;
    </text>
  </script>
</dir>