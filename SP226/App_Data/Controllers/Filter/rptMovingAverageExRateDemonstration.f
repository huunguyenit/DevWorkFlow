<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY Controller "rptMovingAverageExRateDemonstration">
  <!ENTITY DynamicReportFields ",'&Controller;', '#$query', '@@sysDatabaseName'">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and loai_tk = 1 and (loai_cl_no = 4 or loai_cl_co = 4)" check="loai_tk = 1 and (loai_cl_no = 4 or loai_cl_co = 4)"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZaKDE8NkAheww3P2CifgAo30XkWpyvuUr6FteEwIgYRwMxSMj2w/OEU9CYe7NGT2ZQ==</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" filterSource="Optional">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" external="true">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 200, 130"/>
      <item value="110010: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1100--: [ngay].Label, [ngay]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VqWAolknr9aWWzlwgV7+2FmaIOssxD+Xe1J8CwqIzNNzLHNEl+KrgvXcNPu2FfZqGR02bjSCWQBLSqHVw5t54/C8uztXxc8RvfGgVfXx83cSFTbuAm6I4BJEuJXnGRPzvAXjKx9XBA9CGk8degNFTM+4kSvukkcr3KURz0fDHK4yI6G63Ticz+IJYIGHKh80LrYo7Bwr3U1J1YTORgaWLhJNWoiQfab9ndFhW572MVVCjl9XHtUOW8Tao5am7SVKrcIyGYQQu1OtwiqL1vA2s/wXfMI3/FuTSNk9mQ082yaJuB0pzBzQCkNof6tT2ifqhSfTlcj2GN1emZoIAOcIIc=</encrypted>]]>&DynamicReportFields;&ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYsS0w3kJz0tvCdgJJDma1pWNu0Nb6I9hrNZLJW41QcumvW9Q1vjs6rs6GcZxG1j3NKEwnI8Usnq7VZGROqF0Ux+RJPA3d7rXQtCboDq4B9cIiLI9Stb+e+Az/0JsJhl2T/A7BFvkEH3zmOT5LKDKqSY2eZVQ+H4otlpxdW+Yu4mVTzC67cVIB2t6x9oCHce9psp/ZaZFGvi/JSFYc3hk6J+CFj+MKVSitzs/tBqFQUZQA5VEUfIwINmkCmtt+M85bwkydz4HduSV4rT5WZpDQDRxe7MZ4I3LC4L8MTDSv/72PZXrVNz7GEhuNFhBqKXs01KdOIjD3x7oKwLf8TbmCtnAoGg84LR+4E6zGvjy6S/kT7YRqhyEj5xFYRc/QKHX9XgkrOU+qas36XVP+CpgxtzKm9Edk0LxhCXvaYEXjGb4WHo7s3kljT+2GGV+g23c+ZD9MvRb88+ze/s2ADF6/RovKgFgclxw2CPkU8NbjuKy5mJRJoo/Vs9pFkqmpOZ9sCdPbDmWaD0o4gwlcxB1YQO1AxNF3RbRXyAoXWd95qsh81ynmBqxYV9F67osmeE8u9AjZIwz0H6ehU2NueufHGWNmhAub84aBuNnzTV8leL6/vUiI7IgcJ5SN3dta4dxtFRS8PLcroJ7gyeLOpEjT+tNTlQW5L69fdz0FZfTHi5xn/PS1+z8axeVDJVaGdgY7xMRzQiZp0uNr32JFg29I5ELp6xfAYvMuth88C7Cu2XSzXW/u+A8nJkNF768pXVXAybmonCTqvPEjKzZ3z5EKze4PvFzVImpyCTv2nRLOcFuUIHSMwNiXCsIPOwqZr5E/XbAH8HzZ06jLPBBnbsbgzzEgLxFTgrMv2lntRkOPNyil99H3VX4LMnaDB5876tI6BrSCWmQy5MPGurl83XSNj4BWAmjDrzpHNuNcPJxE4YIFlGBFklIAJrFGzl/3LTYI2+8cCRtYioNO6RUgJHEFepKJGu6z+Ou19LPGb1Za1xmcqbR9DRHQYbKUoiIsXTY/byh8FqlWu9V/e9pII8MiXA==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetCheckAccount">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6eg9iqZLkEShP4g+b+yVTYSdygUhKLSi9fsfrlMx+fTn6BbZOWBuGQeeTiDfTCKNsPPM/jB5vjIuLR7cmhotxU0bMXrIko7bAV4S6cLnT/MrdvjsBBgRnXJOx96dVReRp0T8yUd7aY+34PPGw/KwBpgzhwUXao/IYzn2zc+ImaC3pAoX3mtk+6pE7rOyyuoedA==</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>