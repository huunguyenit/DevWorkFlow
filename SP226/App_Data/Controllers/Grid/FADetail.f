<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>
<grid table="ctdmts" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="TS1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="ctdmts" prime="ctdmts" inquiry="its" field="ngay_ct" expression="''" increase="{0}" default=""/>
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
      <header v="Gt đã khấu hao nt" e="FC Accumulated Depreciation"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" inactivate="true" readOnly="true" width="100">
      <header v="Gt còn lại nt" e="FC Remaining Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_kh_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Gt kh một kỳ nt" e="FC Depreciation per Period"></header>
      <items style="Numeric"/>
      <handle key="[tab_yn]" field="tab_yn"/>
    </field>
    <field name="gt_da_kh00_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Gt kh đầu kỳ nt" e="FC Depreciation at BoP"></header>
      <items style="Numeric"/>
    </field>


    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" allowContain="true">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_da_kh" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" allowContain="true">
      <header v="Gt đã khấu hao" e="Accumulated Depreciation"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" inactivate="true" readOnly="true">
      <header v="Gt còn lại" e="Remaining Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_kh_ky" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" allowContain="true">
      <header v="Gt kh một kỳ" e="Depreciation per Period"></header>
      <items style="Numeric"/>
      <handle key="[tab_yn]" field="tab_yn"/>
    </field>
    <field name="gt_da_kh00" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Gt kh đầu kỳ" e="Depreciation at BoP"></header>
      <items style="Numeric"/>
    </field>

    <field name="tab_yn" type="Boolean" width="0" external="true" hidden="true" defaultValue="0">
      <header v="" e=""></header>
      <handle key="[tab_yn = 1]"/>
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

    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
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
      <field name="gt_da_kh00_nt"/>

      <field name="nguyen_gia"/>
      <field name="gt_da_kh"/>
      <field name="gt_cl"/>
      <field name="gt_kh_ky"/>
      <field name="gt_da_kh00"/>

      <field name="tab_yn"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kLDeym8xloFZHAXKgnrjfOmt7EsuHiwpyiyJb8b6q/hQ1QcBPzmsuiU8R10h1YN8z7triRy8DAYCMJSWVZxcY3i93JOg5bIxby3AJK/1vSKS23LtEfT6V4+7oUrbgc3+wTfSSjrBjse/nS0UOGMSzR+urDS5QY5z07measwvCeSKzEfxJRrUejuw7V3P2FwIof4I6OQOBpI7bVJ67tMCT5U0BIPe1N9iMLka064pu+b7QRsPdLb3U6UBQiYDZOE7azbtPzNrHKJwRZJZwjtZdRE/fwIs7nJMYjRfvva0+tsr9kHCqPXd+ZF6kI23TulNMrxkfCQ7qI37/7zSALT1t+U/i54zbrA3ANAwF1Pav/szNdsQjcv3kr7b+b+mmIJOeZmdn3CkywqwvpfWdSMeuZYSjToXfc4BlUGGHNuxjXOAbN9963SnxZxiw7sa60t53v0wXgU7PxSSQIet7qtEb5eIFGbcHhELM5xNVQ0sL2+L57KW9BV8eVaL+UZrH6ckXmmP5zB70VvELqscTKL5YofbiQmpzIHbWECMNc3zKFWuOXIzlJSR66oatm3OISVRLm7d3TSaY8naFPVotxj61/bOOl15Wurp3mZ+MfwPIBydF/aRiDTHgBYI6RnUvc6rd2zRMGuu17LygFZqllkk14IVG8JaTI+QphcUyGTYwfubFgvoz2xSe9z/ezzxDG3YBmrVIKkGLKvOSlAnAz2Y7Pl5fuLzE6hhhZZ3wXNtpG+exSR+o4ZmHu9CvDbBaUkmAfYJlJBJJmlXPCJKp9dWmLEKFJV/tWXjM7bocUw+5gw9el8FXCleAIiaAdmQBjw/7z7ney90xN+tSKEvPBDYTrj05R0phvT659w6wurAEXaBQaY8Wn6bwr+C+6nCsuQYerq/73DjhSiSGp2vAiKcwPPQZV/ML++3jMjLRQKhYBKONdgW0j1iKOzP74MIUZpf1nOdkvcMaeNsZeFELopuAug8x+LxPDaYmupD+WKdDy0zWWyNv85ZnPwhQAd5I6YAuzXcN2SnUAY63+LOBRezwMs=</Encrypted>]]>
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