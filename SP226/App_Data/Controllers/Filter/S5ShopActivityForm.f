<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">

  <!ENTITY Identity "S5ShopActivity">
  <!ENTITY DetailTable "dext">
  <!ENTITY c11 "Ngày từ/đến">
  <!ENTITY c12 "Date from/to">
  <!ENTITY c21 "Đến ngày">
  <!ENTITY c22 "to">
]>

<dir table="ms1$000000" code="stt_rec" order="ngay_ct, so_ct" id="SF1" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn" e="Select"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_px" hidden="true">
      <header v="Phân xưởng" e="Shop"></header>
    </field>
    <field name="ma_lsx" hidden="true">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
    </field>
    <field name="ma_cd" hidden="true">
      <header v="Công đoạn" e="Operation"></header>
    </field>
    <field name="ngay_ct1">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct2">
      <header v="" e=""></header>
    </field>
    <field name="v_ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="&c11;" e="&c12;"></header>
    </field>
    <field name="v_ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="&c21;" e="&c22;"></header>
    </field>

    <field name="&DetailTable;" external="true" clientDefault="0" defaultValue="0" rows="232" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="&Identity;Grid" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ma_px, ma_px" e="String: ma_px, ma_px"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ma_lsx, ma_lsx" e="String: ma_lsx, ma_lsx"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ma_cd, ma_cd" e="String: ma_cd, ma_cd"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ngay_ct1, ngay_ct1" e="String: ngay_ct1, ngay_ct1"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ngay_ct2, ngay_ct2" e="String: ngay_ct2, ngay_ct2"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="292">
      <item value="100, 100, 100, 453, 0, 0, 0, 0, 0, 0"/>
      <item value="111-1111: [v_ngay_ct1].Label, [v_ngay_ct1], [v_ngay_ct2], [stt_rec], [ma_px], [ma_lsx], [ma_cd], [ngay_ct1], [ngay_ct2]"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/yvhy3s3I7HvIXOmDkVAKvHNHcSZBDVDjiP/9sh4q4tuGCT2uuja00MbidDIsR3v3YxN4T6KPvFl8Cn+xF9oYnqhZwqC6HqSHZFTlO07uvpse7CvMI9idjZd4nFUH/ArGQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc0T24rU5HdPOvY0VdbCtAyNH4KGGRqhYzibxYZhRvxCQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/8S6CRZbHhun0qB0gC991COleNnstdxhDM1VGGzQh3O17h1i/JEVFxqweB3X7D6GqDCv2SbWcOafqujhJ3T5PITWRXm7CGlqCc8mV3vKvM/TLIPJgZPYQ4isZbosQXR6/3zwLVaxuraH0Kt3Gir8u3HxhBQtOkK+QHUDGyZcNOLH2A6Kd3q6sdtGLrKpc7zAgTu1wxjcaIczc0hkk+bYTczcWZWXMWwxh54xlWp7sf3EsoDIWdM2wfKFvCI1Fh4zw+c3759kwFlxklDThUTIcbeZyzVFzikMdux9ibWzUWZK8pT5styzJ5iuPYxNyBfCPQRLJEuwDZy6zBlW05vu8M4jnele9MTY6JkwCXfqZpwEZwwjtYteFOTBV+x0IjRov8+ewI7wgZjNf+GgdlaTVso=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//4MjJQUpJnC1ijCqrFqRXaUrquhuMz0axBjP4L/rkvjwPq+6vZtGWO6RCXTcqLKKygk+m85MNPVbhwbqeS03lE=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSBh/LHKcK2+43Vtx1iTJcelRC3VBo5wvPUwzkzJOxLp4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/r+iVrzEbkRmWeUPk6rctFJwKFITFmzUxUurH7HyJsOQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/5o7Dde+K2qQe3Z9gPRKbIXaG2gHts7t/84LR79uYrUAobQDzwD6fX8o3IpjZMrqHY0/C/P4ME1e/y2MOI9ynLA=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/+5eIMzAowykGLXWd1AAH7+pLlAjxcHpZEZDYpI9X6+KyIrRZv0AV8jX1V66UuplDQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/158oObqMu7AhAxW4r9TBggbtekBWPgTd4aXOAMpQJ876wJpmlelAEDxW8nFXXpWLRQe4ewhybBMxx149PCqez0=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9b3UGukxle1s9JIm8yxaMk+d7W1Azf8C6mzx46EK2UNk=</Encrypted>]]>&DetailTable;<![CDATA[<Encrypted>&ymPgYPXvzpL6Enqd4IDunMVf4RsEAdc9KhEf7JQ7glRXoSTiKY9C3JCII/3IZD0voFonT16Vas8VdXdMmluj+2Ic8pT3PiTpeRBGF6irL54umJXkp8gbytXxqV8J0YqybBTVKE0kJCwsllPYD1MAtEkpy0Y3sDQmNdB/Q5SCf/gPMhAvQaWLhuKhbIsBMlDOGVxK1rZVE1qvNwKeJE0+BGZoi7bq7t4IVHPHw8neZuNKu0H5LV2ew6y9tKLDitqqNiPYy6yLwnMzThdRmiYq7YVzS9V75nvbc/SqMOQtwlkYXw7ilZr8DOkMXF1dsC6/K8EWzNi8JlGebytn0ZTJQQj4IUkmv/hXAIfxrvcL1zpC65d+xxbFV2lyCiP2St3N8A1nSt8XMX2C0lfv9nNjhKRW61GhSwy0m3uoZZHMejj2wKhi2Cam5Ddh9olbYZQAnOtstYmLRTwdbQuAQ5So55n35AZ+oJdTAlGkvnFpgwkDnT+YkCP6YHGApNzERCYF374JwPHkjlK4ki6c5HeLnKWHvKWJjbKuIgRyGCCgvCrGrC+imOtq44oo2VSy95yvQLMYy+gh0gIGZ2A6FWTJupg6ZL0lteYzhF+pUuWWetD7xzaTkOKVJYbqvfpd6uZLgx+P86R9c4Opo93wlY0z6iX/SZN32U1JAYg/859Pqc9AfV55GvI3Y3UviyJgYFiO</Encrypted>]]>
    </text>
  </script>
</dir>