<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="t05kk_luu" code="ma_dvcs, ma_so, nam" order="ma_dvcs, ma_so, nam" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [nam].Label, [nam]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+s8TTA+ov9/yNBLWf63wo8Oulvy7W/0kzsUmRe3BALojvCGh4DTC4FuIt3rn3jzJuzh+XsHef/64OjBeyKL7c+FlDsxTvDCCXhsFn2u6ElBVfJnjehvjRAqTm3i7BkabcSIIWgJOcdjp6/YkishGFzeJjm1jZt4LNad2rZ9q4gcF2sS2A/wehxN3WfN9i8JC7S6wZZnnBtZFBq0gN+PCUZCmsvZI0cTnXWOShyCRoUJH9MHnBb6AgdQ9mv64RkEdzt2jhA1X+m2Xd9mdVrdubPTAKbBxGQOUnjwFmxz3oI6EX4+PSNecIaINIb2MYAXkpCptnIkH1SEZxblOgm8wCQoWhf772vni9aY+POFgJoOwPPWyfMeZarl+RkIUB+MMhFJUcRKyYSEUs+ofkQMnk8V8YHFSqAJQzf/Uoo94r2HviJmb8JBMsapOFHeY1aTY81SGtOOlLGSoCMnHXroBDarUmxCy/DuBfv6nEg6LGOGg==</encrypted>]]>
    </text>
  </script>
</dir>