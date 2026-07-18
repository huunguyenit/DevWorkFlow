<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="ctdmcc" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="CC1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="ctdmcc" prime="ctdmcc" inquiry="icc" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="ma_nv" isPrimaryKey="true" allowNulls="false" width="100" aliasName="a">
      <header v="Mã nguồn vốn" e="Capital"></header>
      <items style="AutoComplete" controller="Capital" reference="ten_nv%l" key="status = '1'" check="1 = 1" information="ma_nv$dmnv.ten_nv%l"/>
      <handle source="dmnv.ma_nv" foreward="true"/>
    </field>
    <field name="ten_nv%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên nguồn vốn" e="Capital Name"></header>
    </field>
    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_da_kh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Gt đã pb nt" e="FC Accumulated Allocation"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" inactivate="true" readOnly="true" width="100">
      <header v="Gt còn lại nt" e="FC Remaining Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_kh_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Gt pb kỳ nt" e="FC Allocation per Period"></header>
      <items style="Numeric"/>
    </field>

    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" allowContain="true">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_da_kh" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" allowContain="true">
      <header v="Gt đã pb" e="Accumulated Allocation"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" inactivate="true" readOnly="true">
      <header v="Gt còn lại" e="Remaining Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_kh_ky" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" allowContain="true">
      <header v="Gt pb kỳ" e="Allocation per Period"></header>
      <items style="Numeric"/>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nv"/>
      <field name="ten_nv%l"/>
      <field name="nguyen_gia_nt"/>
      <field name="gt_da_kh_nt"/>
      <field name="gt_cl_nt"/>
      <field name="gt_kh_ky_nt"/>

      <field name="nguyen_gia"/>
      <field name="gt_da_kh"/>
      <field name="gt_cl"/>
      <field name="gt_kh_ky"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>

      <field name="dien_giai"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zYoXBjtLCfuFJhfaX79HdwFAx5OVbQ+jTUUESwFkfYbPs3P9K5Y+XULO/oJbfc57BB1xGnusZZZlkvf/JskCbaz6VqXVVlG/IxWEuUNoazi</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756/JB6dPeVkwCfYuq8ju3IgTyvaYmP5SXM3CTuGAFlasExTxCBQbPEXIWZA/Ry229hH4j2n/gnYZn8ybEUcQSpI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kLDeym8xloFZHAXKgnrjfOmt7EsuHiwpyiyJb8b6q/hQ1QcBPzmsuiU8R10h1YN8z7triRy8DAYCMJSWVZxcY3i93JOg5bIxby3AJK/1vSKS23LtEfT6V4+7oUrbgc3+wTfSSjrBjse/nS0UOGMSzR9c63+p/roOmkRJFlWNCQpXeDazmy0ABnMdymxjGoPwtG8Wyvit6traxuj7FHmUfUPFkzJs6RbceTLcmbZrgIEp3M09ycUFZcciz49WoPr1zRwVD7jo+5stauQDzbn/0cN0VwmC9U+vb7d9Q3mT57MtTo0EzkvsIUbr7LVapbumqZGVJav/gi1p1BYIF02PZ/4yRrcWn6B6gQ/FNLoj3U4uMKT4WvRSdPMy5pwlnM5JH992h7DoRFXtsqSThJJ8WB2f42r4jmFMG6wFu01yN6AnP0LQ/FjF0/NprVi5puZfcaKIvR4fpTfTp1HNBPW0gtKiXKFxtFvRLKJ3RcX7CYpM8A5BvUIO/QcZWwRqoLvLFKnXrSkrP1hsLwMKqd7viEkb1JNlxZYUa32si7g7gyyvy5Gvce/xynUwC0fpDAEEjQ9RES80kP1E1JPzlPXn9RY2alGvsE5FVNSQEGBaghZsn8/hMXrnj5d8cgKOKmJfBM0w9dblcyzEPLji5Js1Ji3pOO2HQzFebP3UV/Ad7cEwbe80dwwtrW6FC7SQA/kUX54EKsagdvzmH8ptD8TEt+DpDBb1sB++wrqgmovChkuKNWq+eNrRNDR42gawddfvj8kZytI/KU1EH0zX+f0JQcd+LCQxSQiJHhlWnFsZC6NVefOU6ri50zKqDbIPhUNefp+d+2IpA6FFD2PDNoZQvYtyKb5qtSsQtsquY/R48bHhXr+TEQJxRjAfyHBOlDdDK029Hu2def09iUx4kG7Utls=</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSHgjOIcJcK+KdUQtUQ1H9sv4CNTPw4T5jGu7sG/P81qiN++ch482PcGnJhaRZPelL5LdfNeNQ4nUJjEH9aWWXzcSLMz7+V/PRXwWVUQEZnrG</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>