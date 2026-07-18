<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <footer v="Kỳ/năm" e="Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="so_the_ts" allowNulls="false">
      <header v="Thẻ tài sản" e="Asset Card"></header>
      <items style="AutoComplete" controller="FixedAsset" reference="ten_ts%l"/>
    </field>

    <field name="ten_ts%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>
  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111----:[ky].Description, [ky], [nam]"/>
      <item value="11001000:[so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="110000-:[mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a3uhMZIBtnQ4QhO1ZiwI/2WeIGgGnO7JrUxkVTw2YEwWYlxJhl+ffTNzF8hwWL5EXLNOta8w1PUM2pC2qYU71NftsBII2S6D2fVG5OTrEAEwU/PsWCsugfP6o0Ck3pKpBVpXkNo3uoROZXzTPCTBEWgtiRHCmBwv84Prb7wz/kNOvggeYdHLCg63IvDItF2Ji1ghocXfpRT21JrwZFJcThQmD1mi4A1OGX2RMa3GzHsE231jv4mqJV3X3sWwvuSRrcIi5JSdST+aT82rGCz7CGL2Amlu052IA4zajbPUPNKPyZM+HeBiP+5RRLZCtmGmkBgDBzeGcfzViBpsdzol0w8P9MH38pARHSjtfZM9NFCdKUPngqSVETqJMWcEnFmq68u7Yjax6pG4KSlVBBoaFH4B9T9Y+NzVLhBklPU0DU7i59+FqzqbMFWAooUgCL8JnfvAK1Y5eIsTi0etCw+6xuwwFcgaRD5xqoQLi5MxwcGFr5JB9TwDOokJtTSDfhV5aLnV0FbS0q11A/7O+JaTb2cB/Lne8ho1G5fHoapdTqc</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+CrMQwd9loC6zJGaHx3fsALj1aTNQ81DM4zo8+5r4+RkAAqLVdyEAOKcMfBwdRFD9QRiqE/Q7WhIZ6lsKu0856cte4i3mTHbgzh6GWZ93RCog3ndGmDnGBD5cZKwGSRRotTEyq1icVL52ywspShOYGNQzwmFHxG4Z17C989YJTNLU7ZrJuLX5wXdkObKDodVPNG3EUuoq8Q6l+6Ni0v0EVunLRvcfDu3HU2WFaHiWptWy7U6dd7Mg9mvOHMxbmwXPto7B+l2pa5+BukYSMp5HiFc4EFrgfz0c1ZZ7KvOf+la7BQm124osysfo9J9tIKkUbIQ0ClJOWO7zka2FnBJyxFFUDKTJj9EZz/coTSLjlXEjZkUkSXGoOpEeBefLtzDhbIMxy74HJIrGoMEer3pGoio5ZZbGDf6uIuR2zgzEkhA==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>