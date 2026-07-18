<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PORequisition">
  <!ENTITY DetailTable "d91">
  <!ENTITY c21 "Số phiếu nhu cầu">
  <!ENTITY c22 "Requisition Number">
  <!ENTITY c31 "Ngày phiếu nc">
  <!ENTITY c32 "Requisition Date">

]>

<dir table="m91$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu nhu cầu" e="Requisition"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right">
      <header v="&c21;" e="&c22;"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="&c31;" e="&c32;"></header>
    </field>
    <field name="&DetailTable;" external="true" clientDefault="0" defaultValue="0" rows="232" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="&Identity;Grid" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

  </fields>

  <views>
    <view id="Dir" height="292" anchor="6" split="10">
      <item value="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 50, 100"/>
      <item value="1101000000-101: [ngay_ct].Label, [ngay_ct], [stt_rec], [so_ct].Label, [so_ct]"/>

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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/yvhy3s3I7HvIXOmDkVAKvGmCO4uj1cmEYYLqDTL5QAqmpq0S1J36jVSl5V5QYrThNPHNknl1+FV7W/Ukm/SOw4RFKwFX27vKaZ/Q3yFgE7sZGoXd+BXLMzQ41gl4vPqRQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc0T24rU5HdPOvY0VdbCtAyNH4KGGRqhYzibxYZhRvxCQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/8S6CRZbHhun0qB0gC991CMDCBhyP2JXxBafrhURA553eWTeykZ2zQpyFBJpoVWp/WXo3e1Ui9flaCfuBAWmtrNw486dydY1HAXd15bg/qyiHoZCS1FXvGvHynWILzLV0xjZo5p9qPDRViN7mnkT2ur3uA2xSFXjiVZzT92W0kaktBvZy/Cnkrh1xPwmfsCkY2pV+GayMeJCBcJWsG+rXUE=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//4MjJQUpJnC1ijCqrFqRXaUrquhuMz0axBjP4L/rkvjwPq+6vZtGWO6RCXTcqLKKygk+m85MNPVbhwbqeS03lE=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSBh/LHKcK2+43Vtx1iTJcelRC3VBo5wvPUwzkzJOxLp4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/r+iVrzEbkRmWeUPk6rctFJwKFITFmzUxUurH7HyJsOQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/5o7Dde+K2qQe3Z9gPRKbIXaG2gHts7t/84LR79uYrUAobQDzwD6fX8o3IpjZMrqHY0/C/P4ME1e/y2MOI9ynLA=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/+5eIMzAowykGLXWd1AAH7+pLlAjxcHpZEZDYpI9X6+KyIrRZv0AV8jX1V66UuplDQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/158oObqMu7AhAxW4r9TBggOuY1sK45MdLTfrd0oo/Y3XOnIV1Enb4nJzoR+z52ijw==</Encrypted>]]>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq96K+18nT4o8vY9Undm4QWNSdrlKL+6kB6InsUFwtTYzdhooHsUhpH2MLOyOMPXTDxHtaVJt/7Q4o66Zoh3Vdsa/DuSs8Sn+67yOP4MimWoZvLzCzWh8i6e6+mhXUwNbZjW8XXkrhPBl8nlHx/qyVR/1ZXu95ZDpo+rsv9nfeVhZ0n8mr3aJv7iOHhOEhWBF2IN7uFASDcnfWKFt3OpOPoUN7YCJ5ypsPIG2io3K+noaffgwMKe3fm9rl9LXk2CqqmD+TTMmClKA9a5MnWdczuowEwF5fQzMBKHy0d7pjDPYUwudOWer7cPaohcb9ENclDDACa8O/tTKHCIax/aspGr3fiZS+hIzzFacjT44IPT+ZVraxO8sFzLrlKdIliAgCHh/CIq9FVsCVC7wB1YxfXEw==</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6IkGhvq87gsV6V8lEPBLz60OwW56Dw94S9KbXMdKczIoZpKyMUx12cXGArcHLUezJ6s6/NmomLU2zXX0M6vF4T+ixBWN/ZePo/0r/QJDTTYYDiSG4GSGRpWoCAR0/B9d9dzs4nsDs2UMuPJsCoDhDvnroFCdJPKZvIe6pHk2z0J9vqFRf2d3iqtAsQXYPSlQFvX24nomT09LLbPz+QPZdbEe8yDQgJlAtJI76Lfa/9QOAODFPpnuWUHt7KtPFHCf4Be0lIIcn1L9kpn/BhvCiEXsoIe4l060Y3TnYABO2Nso56HTzhwj4vKCNL1AfbAP5EmwbGUb+VDRPxHVlfL49V/zQ1+eIJ5n+Uw7VpZ9r7bRI+0Xuw3UnTHlGD6FZ3y55M42AVGG96L9wo67cCK1LGIcmCVB0ieeK2x3Ht41Zr0EBcfGbdlZIHIfyRLZo1VqtrQKgXhzeZYtes1pCL3CxfzmgVuaYiF77jqBwlR+V2Gunf/gmZWPXNhQ7Sw6qjv6rRD6pmNNHiX80Fwa6cLfTLg2uraPmAU+Fd6G3uhhEoS/</Encrypted>]]>
    </text>
  </script>
</dir>