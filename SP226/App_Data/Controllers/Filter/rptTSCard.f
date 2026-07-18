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
      <header v="Thẻ CCDC" e="Tool &amp; Supply Card"></header>
      <items style="AutoComplete" controller="ToolandSupply" reference="ten_ts%l"/>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true">
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
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KmkzrT26qZrevhKRcMhE3pHOYShB9zVYQQM6nyHjUfXZFspBB8O6nbDDf3mp7YWlvJmx9OOOccLqwgg3FtpvnaMRK00yuH1Giu2jZ7y8fg/+</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+CrMQwd9loC6zJGaHx3fsAG13KU4kW4qF1977fQGxN+yVOahSr6Ia5BshOjpKOsuU+0xI75WkC6vENQDAMdKfG+YfZuMwUcudUPm9NnCI6qxmev1On+TQtS/49G9AU30C0bURSzcZhPaqtTCiZJACdt5iKIAQqnRrqpiDIIvGiaoSzr1Pv4LTSeRhhIA8pCeduE2fgbqopHqp7bxYND7+KAM3lvm+Ao+5FA2WyVsg/5jd9mKdjwHdxFRSjEWF5SmeX+nEdzmvn2k8pqWHBAPgYvzYVi3tsdXJ4x0OsfQcYz7ToN1SEKkr/b42Q1k7zbjxShZepZMIc/tnIKTgM3lsKUMi655nPM5es2DhHhC/dPeM6GDFByLSlDXMKc92vvD2Tv1HEdbUxjcA0GDG2eeSOXpv11KjsRggpvL8ufIwQZlwDpnp65T65h7C19kT2KYIsndr0wwIdaalS1RL1CSIM</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>