<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY Identity "S1BM">
  <!ENTITY DetailTable "ddm">
  <!ENTITY c21 "Mã sản phẩm">
  <!ENTITY c22 "Product">
]>

<dir table="phdm" code="stt_rec" order="ma_sp" id="DM1" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Định mức nguyên vật liệu" e="Bill of Materials"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp">
      <header v="&c21;" e="&c22;"></header>
      <items style="AutoComplete" reference="ten_vt%l"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>
    <field name="ngay_ct2" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" hidden="false" dataFormatString="&CoefficientViewFormat;">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityViewFormat" clientDefault="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="&DetailTable;" external="true" clientDefault="0" defaultValue="0" rows="232" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="&Identity;Grid" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ngay_ct2, ngay_ct2" e="String: ngay_ct2, ngay_ct2"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: he_so, he_so" e="String: he_so, he_so"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: t_so_luong, t_so_luong" e="String: t_so_luong, t_so_luong"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="292" anchor="3" split="4">
      <item value="100, 100, 237, 316, 0, 0, 0, 0"/>
      <item value="11101111: [ma_sp].Label, [ma_sp], [ten_vt%l], [he_so], [stt_rec], [ngay_ct2], [t_so_luong]"/>
      <item value="1: [&DetailTable;]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/yvhy3s3I7HvIXOmDkVAKvEkokHGov3NCZTQdeSey7bcLgIOKDfktOgF+ZwZff3awWO/H2xiW0u6En7cO5GknbG7sjyiklD22q6ZzeuUphSG</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc0T24rU5HdPOvY0VdbCtAyNH4KGGRqhYzibxYZhRvxCQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/8S6CRZbHhun0qB0gC991CPeFA2sArEoomEGNrEM7QubY3EwxRoLO6ICeOgpXb2gnChzoyFLVZ0L9rAxKjMCJgwHbVVl2wGHdJCNgfa50oYfVrkamlEmLiUBDDN0CVzibVn41PPpCzeP3bknjlVgvQu7XUp5dFCsAxKc/vY5730dq55s1KDvXvRyVwtwMiXAZSBee7TQbfZ16RE7iuu1oL6mJM5dmkpJYgYW952Gj/uftLEmKBFcnsjrUsnWLPZCLOkID5McOza00TApxVSSp1TCzmVHTaGX9jgE9HJnteWRQ63FcSFN9HI3hyhjtWEJtrutESQQ/PkC5g3W09O6r9/u/Iz6/vParF3mgdioEkc6</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//4MjJQUpJnC1ijCqrFqRXaUrquhuMz0axBjP4L/rkvjwPq+6vZtGWO6RCXTcqLKKygk+m85MNPVbhwbqeS03lE=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSBh/LHKcK2+43Vtx1iTJcelRC3VBo5wvPUwzkzJOxLp4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/r+iVrzEbkRmWeUPk6rctFJwKFITFmzUxUurH7HyJsOQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/5o7Dde+K2qQe3Z9gPRKbIXaG2gHts7t/84LR79uYrUAobQDzwD6fX8o3IpjZMrqHY0/C/P4ME1e/y2MOI9ynLA=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/+5eIMzAowykGLXWd1AAH7+pLlAjxcHpZEZDYpI9X6+KyIrRZv0AV8jX1V66UuplDQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/158oObqMu7AhAxW4r9TBggbtekBWPgTd4aXOAMpQJ876wJpmlelAEDxW8nFXXpWLRQe4ewhybBMxx149PCqez0=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9b3UGukxle1s9JIm8yxaMk+d7W1Azf8C6mzx46EK2UNk=</Encrypted>]]>&DetailTable;<![CDATA[<Encrypted>&ymPgYPXvzpL6Enqd4IDunMVf4RsEAdc9KhEf7JQ7glRXoSTiKY9C3JCII/3IZD0voFonT16Vas8VdXdMmluj+2Ic8pT3PiTpeRBGF6irL552X+qV1cChIIPxH+V2K/hl43ppi29tk3z8ILpxXCRrzM1xtodZooFwRtOzYwxH3qycNeeF2w5B2YsR5NXuS2Gw2YkrRoZbOqrH0FWAeLaZebZghWcba3OTleeKQTSxg09F/jw3+fFfqmCrerfHEFXgXuMNaRptvbaYAIHmTFUTROvItIxDSZjU3edBiUMd0kWu7DT4gKms5rbbZrdSwh5hGRI3Iq7Zky6TMIjlxQ9cgi0gMpwAw0LkN26oKp9eCu2UCwg6tJLsAkfQ05cybky6m3BLSjCBdw4zW8hgMNnSiX9GwjpN5rHpQdcIHx/xjDFOM9U8ayt3Tai2HQrO737lVzVildejh2HK/yapYjlh5HMPKf99EYvjCIoSSLjCl5eVSrSVKql0z8PZB4R9mxpAwflbZl81erzx7N91u99Bn4/ExIAOOhqawfZvzrqW96z7o7mmPTwQEBzrGaxSmuTGiHXQ4hSLyb+5RaSdHjHr0DcyE+mb9MGT3D7LqJW6Fyy3p3nScfeaQFXioMU1EJfJUlOz4//TbRUqV5xPNFt4gbhCss2pBPLoycBbd5CtCcJFQRka423LPYoj2yVQigMg0/YCtcPGufLlsWWuSkgzrg==</Encrypted>]]>
    </text>
  </script>
</dir>