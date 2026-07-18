<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">

  <!ENTITY Identity "WIGenerate">
]>

<dir table="wrkin" code="ma_vt, ma_kho, dvt1, he_so1, sl_xuat1, stt_rec, ma_ct" order="ma_vt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phân bổ" e="Generate"></title>
  <fields>
    <field name="ma_vt" isPrimaryKey="true">
      <header v="Vật tư" e="Item"></header>
    </field>
    <field name="ten_vt" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dvt1" isPrimaryKey="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true">
      <header v="Kho" e="Site"></header>
    </field>
    <field name="ten_kho" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="he_so1" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="sl_xuat1" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="dpb" external="true" clientDefault="0" defaultValue="0" rows="184" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="WHGenerateGrid" row="1">
        <item value="ForeignKey">
          <text v="String: ma_vt, ma_vt" e="String: ma_vt, ma_vt"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: ma_kho, ma_kho" e="String: ma_kho, ma_kho"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: dvt1, dvt1" e="String: dvt1, dvt1"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: he_so1, he_so1" e="String: he_so1, he_so1"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: sl_xuat1, sl_xuat1" e="String: sl_xuat1, sl_xuat1"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: ma_ct, ma_ct" e="String: ma_ct, ma_ct"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="244" anchor="6" split="10">
      <item value="25, 95, 25, 75, 100, 100, 100, 100, 100, 33, 0, 0"/>
      <item value="10101000001: [ma_vt].Label, [ma_vt], [ten_vt], [he_so1]"/>
      <item value="1010------11: [dvt1].Label, [dvt1], [stt_rec], [ma_ct]"/>
      <item value="10101000001: [ma_kho].Label, [ma_kho], [ten_kho], [sl_xuat1]"/>

      <item value="1: [dpb]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>


  <commands>
    <command event="Created">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGC4wXbIV48PhkvsTtGPkVlij7kpDjHKz8xqvhz2dA3q</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/2H0vrO84jKvF8k/RaHymuGAVXVFlREnVJpU0GFACkotqAglVBVnofyyRKOF3IYfWg==</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/2H0vrO84jKvF8k/RaHymuGAVXVFlREnVJpU0GFACkotqAglVBVnofyyRKOF3IYfWg==</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/2H0vrO84jKvF8k/RaHymuGAVXVFlREnVJpU0GFACkotqAglVBVnofyyRKOF3IYfWg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/yLES5gslB8t5c9Kl7VWwveg2Tof2l2/NvTyRQi0kVN/c/oJGz06KztEoOGdbYgBqQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJcwRJeFMF3Hc/qSiSixwhuh4SbS2lbRM6A26UOlk/OsvtZVjiyI7BEc3MaXfAUiOb1pkcDqEVK+SBn5+v3kpT/rHbVUqtZRfAHJ4MomouUPlA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/8S6CRZbHhun0qB0gC991CNiYujK13leZKJYFJt3Any92PMDU6iGYv6h9uHVM7zU7KnGF018TqSVTZO3L4Y5H89ZZfO4Q66Si3wN7HQIXUBQYD3wypvs7vC8shgwQDwUroNWQOxHev2TsAH2QTquaTSB3v4YpAJxVkPo/Tc9JKQIKahPEvwKfsH5W0HEfJrKo0Q5nIBJshUB1dRH8AXvTpOLJdTUwqfTMUmoagHzwx7sQA5uJ8dL9tnHUvk31hd+hQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//4MjJQUpJnC1ijCqrFqRXaUrquhuMz0axBjP4L/rkvjwPq+6vZtGWO6RCXTcqLKKygk+m85MNPVbhwbqeS03lE=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSBh/LHKcK2+43Vtx1iTJcelRC3VBo5wvPUwzkzJOxLp4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/r+iVrzEbkRmWeUPk6rctFJwKFITFmzUxUurH7HyJsOQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/5o7Dde+K2qQe3Z9gPRKbIXaG2gHts7t/84LR79uYrUAobQDzwD6fX8o3IpjZMrqHY0/C/P4ME1e/y2MOI9ynLA=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/+5eIMzAowykGLXWd1AAH7+pLlAjxcHpZEZDYpI9X6+KyIrRZv0AV8jX1V66UuplDQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/158oObqMu7AhAxW4r9TBggOuY1sK45MdLTfrd0oo/Y3XOnIV1Enb4nJzoR+z52ijw==</Encrypted>]]>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9ChUvDcWSUhms7XHK9Lltefgycb3anmqFfLyTNkWZWBNPzdlcmECsn1BtTKyVVi6RUKie2DJ5xM2M7Ojsqnu6v8lcSH6Bi1yhgjGg2vypuRViLTXdIp5UtzSNnUsn1cpedISoI6yxAK3133QT63GGMY83uUBDjSTwadpIk0j1DE8gDi/zP0EWwyqsG0MXnK3BnOSKfyJlCXkfdOvplXAi8DqYZiFqpFzDLh6n2TdytyRgn3vNHB7n01U2ptkz3gTKMvyF/JeWuKyIwzzb4PsT0VmgDimfvBufuG/NmBMxgflkfPltW/sESEtlCB+CAoR6VSwk6MQaKQYJImuj/0F7sNrEqwopPRNCYiy3oWLVF1z5ySPIOBQJjhFyynLbHA0ypphKZ3tDH/0lBK+Wh3xJ60ScOQE6Z4Yt0pOYqOc29qNjlLonLpzsoN3XuLRXLboLMSumH6HOfP3S5UKhNAM5zlqlurMHJhhB/aHAYGdoy9oBMTBF685u7pH7ZZSViqEBgg3phquGU7F5rUP6Yq+v6wf08vrIERPmnkARSqYecCpEXVTWLwna7+hG+HhynTqXd4W6h9mQ7n+QCLHZSBpZQoFbh8Kkj2oUcaMFExBpNxuqFng/nWPsbFOrtHY5+lUsoEpHOeZTgf7fNIp3mMYb7TS2J+ldsoVUJYVIa07M35c=</Encrypted>]]>
    </text>
  </script>
</dir>