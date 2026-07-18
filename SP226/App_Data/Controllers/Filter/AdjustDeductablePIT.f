<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="tdcthuekt2" code="nam, ma_dvcs, loai_tn, ma_ns" order="nam, ma_dvcs, loai_tn, ma_ns" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc số liệu" e="Filter Data"></title>
  <fields>
    <field name="nam" type="Int16" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="loai_tn">
      <header v="Loại thu nhập" e="Income Type"></header>
      <items style="AutoComplete" controller="IncomeType" reference="ten_loai%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_ns">
      <header v="Nhân sự" e="Employee"></header>
      <items style="AutoComplete" controller="TaxEmployee" reference="ten_ns%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_ns%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11---: [nam].Label, [nam]"/>
      <item value="110100: [loai_tn].Label, [loai_tn], [ten_loai%l]"/>
      <item value="110100: [ma_ns].Label, [ma_ns], [ten_ns%l]"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+s8TTA+ov9/yNBLWf63wo8Oulvy7W/0kzsUmRe3BALojvCGh4DTC4FuIt3rn3jzJuzh+XsHef/64OjBeyKL7c+FlDsxTvDCCXhsFn2u6ElBVfJnjehvjRAqTm3i7BkabcBZCNqwQxM7Qn0ER3LAJuWeP7MWEjDOlFx3H+rBTouIuV1Mq6tY+4HHgvDHeRWq/wcunu2BTVrbuvhec8MW3LZ3lUtvGwww89jwLvfOo+9rUjlPh692DAojhGaUbc/GSkN+HiYG2AsQIVbkR0VTjv2Posrmk8P8tnEDEWfcRINcof6I5hI9N0geSqPXfcqVeLxpO6KvTARQpqThcIeKdVYXbYdZ/xMvhNKwK2Uv35F+wykZAhfmy2ZHe7aUvvy15Uey0oz0sCK9xOHGxxRQes2eruBa1aAgoeNUaMdxiqjosVHhvFnuHlGYGVZ4uIB2rK3p8eTUbclfZz1fCJRQItjQ0808CbyJDs5wzZ0v5RUzrElmxEAQBcFZ/lFfXJp9BMbgTB/mtsMVws8MU5pV9ZUCDX9N1r+oTXDb5o/IGIcY+g84UKym66Mo79cWmodfY55lq7Qfp+e394/73DKkSigAZrP7uUNeS84Z7IvSkTzD2peQ6Tbdu+f6jmhDxF7QadENuC2s4xgjdx/xAF/mHO84VJIRG1+2Aj8eFOyMHE+BhRdB2lNnIVGvXXS43An6lfMsJlRrqjO7qcXW1q1if1sf/WTyd6ih5WgnLVLF0WqMo5zusZ0gs0PVOECzW4NhJ6QmtvmgemT+Ftr/BUn+y87x4IpWfYhPXwtEWGGtOR3od/a3eTxnyvU/DQTokL9E9tekmd2WRc7jXYInz8tgkjzXPPZb2ezej11FQMPlCKX5A==</encrypted>]]>
    </text>
  </script>
</dir>