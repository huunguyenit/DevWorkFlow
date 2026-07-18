<?xml version="1.0" encoding="utf-8"?>

<grid table="structmpctyct" type ="Detail" code="so_ct" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="tag" external="true" type="Boolean" width="60">
      <header v="Chọn" e="Select"></header>
      <clientScript><![CDATA[<encrypted>%wLn1SXGDs39WFPeKEFTBo1TA/FPU50fQ+29BCE0grzmFl/iXXjQIk5UPIx/v1lcsr/fISeKKTbZbTjn5IGjl5A==</encrypted>]]></clientScript>
      <items style="CheckBox"/>
      <footer v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></footer>
    </field>

    <field name="ma_vt" width="100" aliasName="a" readOnly ="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt" width="300" aliasName="b" readOnly ="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>

    <field name="sl_dh" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" readOnly ="true">
      <header v="Sl sản xuất" e="Order Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvt" width="100" aliasName="a" readOnly ="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ngay_yc" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly ="true">
      <header v="Ngày yêu cầu" e="Due Date"></header>
    </field>
    <field name="ngay_dat" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly ="true">
      <header v="Ngày đặt" e="Release Date"></header>
    </field>

    <field name="stt_rec" width="0" hidden ="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ma_vt"/>
      <field name="ten_vt"/>
      <field name="sl_dh"/>
      <field name="ngay_yc"/>
      <field name="ngay_dat"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxzofN2X//fRpvBD/Yse60wh4oQ4IHgaGCMgmolFDuLTLbL0qWEpCJpW5VD3X+6dN2BvJ22Qc+nP3XN38DVtz2g=</encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf8rWy5axjYhPsomHmFIEpImG5OZ7cERXsvzbfv25DfOvvG0GgvEot2y3LeKyhrLWn/pUV8bYR2rGx1gOVnOD/oQ=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf63QuaaFY5W9MWBX4Clqf7hsCHQHPk1xSDsiBeV2WqLRrDi3U/NCO9fdfH8VbclqFqW9P4Rt2XcZ6eACIHiEV3I=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70PbkKy5L2f54wmpvPWh8+0zKn6ZnE7lShdbCQhKdtPOLGAm0HrHLIhc/1/3sIZiXS3QyPYWf5rEMrYyLuRSZ/3H3sg8uBSJHnLpVNTfIOyvzfsS4IQmMChkOW8vU2eFxC9hnR8RpoWe4E0JMNSXnIQoytHXIASkvPre7FUQuFATTKI9CMLr0tO67J5oYqJfNHwItWE23KkbHtBq/G9n8mFozHOkcFJt+LJRkSKkGT7JhUfcVRqS/dTV4A4+RdUj1yBPln4cYERZiDqgNgfXLfIeJtjRVjLOIJnZUTkpCq/u3</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KmBa66p/OGU2alh9IDBbr3rZszs1iEjZdq+ej23Y6tP5gljip/OTQmnSh3wj3YJ9yvrw3ZLpPUQs1c5MLKwk3S3TbCwVxmoBh8qpjrNK+tlv</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>