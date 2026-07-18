<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">

  <!ENTITY Identity "WTMR">
  <!ENTITY DetailTable "d87">
  <!ENTITY c21 "Số phiếu yêu cầu">
  <!ENTITY c22 "Requisition Number">
  <!ENTITY c31 "Ngày yêu cầu">
  <!ENTITY c32 "Requisition Date">
]>

<dir table="m87$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu yêu cầu lĩnh vật tư" e="Material Requisition"></title>
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
    <view id="Dir" height="292" anchor="4" split="4">
      <item value="100, 100, 337, 8, 58, 50, 100, 0"/>
      <item value="1110101: [ngay_ct].Label, [ngay_ct], [stt_rec], [so_ct].Label, [so_ct]"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/yvhy3s3I7HvIXOmDkVAKvGmCO4uj1cmEYYLqDTL5QAqmpq0S1J36jVSl5V5QYrThNPHNknl1+FV7W/Ukm/SOw4RFKwFX27vKaZ/Q3yFgE7sZGoXd+BXLMzQ41gl4vPqRQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc0T24rU5HdPOvY0VdbCtAyNH4KGGRqhYzibxYZhRvxCQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/8S6CRZbHhun0qB0gC991CMDCBhyP2JXxBafrhURA553eWTeykZ2zQpyFBJpoVWp/WXo3e1Ui9flaCfuBAWmtrNw486dydY1HAXd15bg/qyiHoZCS1FXvGvHynWILzLV0xjZo5p9qPDRViN7mnkT2ur3uA2xSFXjiVZzT92W0kaktBvZy/Cnkrh1xPwmfsCkY2pV+GayMeJCBcJWsG+rXUE=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//4MjJQUpJnC1ijCqrFqRXaUrquhuMz0axBjP4L/rkvjwPq+6vZtGWO6RCXTcqLKKygk+m85MNPVbhwbqeS03lE=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSBh/LHKcK2+43Vtx1iTJcelRC3VBo5wvPUwzkzJOxLp4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/r+iVrzEbkRmWeUPk6rctFJwKFITFmzUxUurH7HyJsOQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/5o7Dde+K2qQe3Z9gPRKbIXaG2gHts7t/84LR79uYrUAobQDzwD6fX8o3IpjZMrqHY0/C/P4ME1e/y2MOI9ynLA=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/+5eIMzAowykGLXWd1AAH7+pLlAjxcHpZEZDYpI9X6+KyIrRZv0AV8jX1V66UuplDQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/158oObqMu7AhAxW4r9TBgh6JKldDxvJkgK3J2d9KQNDFerrcpZkZFa00U/ibrW8tjLIXEVIOjf2fpyY+Sf/Gu8=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9b3UGukxle1s9JIm8yxaMk+d7W1Azf8C6mzx46EK2UNk=</Encrypted>]]>&DetailTable;<![CDATA[<Encrypted>&ymPgYPXvzpL6Enqd4IDunMVf4RsEAdc9KhEf7JQ7glRXoSTiKY9C3JCII/3IZD0voFonT16Vas8VdXdMmluj+4Bsgzhxe6zOjzwZozmOXrAT+r5a5tjW9zxk3thPAKUHmBSg9FEAHA+ZgYLWbgecl++3jLMBYKx4O1YeCpLNcoU+NSK+ria27bd096dtD390YCcNdSrnBHlw9goMKsy0lkyKoGINTzRHma+Q19wNFIYRR3DO9xKsHXUlX33zBCRkm1wAbfnRpAducXLZDqoQT272YeJmWyQ4HvhSPy08Viwjm29bV/8xCUri+OC8jducqIcvY0gDHvlzikMa82TT8HoQczHj/SlhBbfu1sIbsTo1GSBQkomi/UjnIiefklPeJW+zCB2/oLNPT4FjnHrLuK2UnEN7K8quLGsx9vi/iLhue2g1KVKLijH+C9ZT3oAOgh9xWEgYOAy65olleOW1DRgDDihZG8X/pBo33WOoGFZHjrC9lUGK4sYmRKUcHDR2XI3iJWvZtrDod9JIACgjvL1z//HicZsf/oHh+zbQmpVBh2UuwWXKr2EjwvJm+csKEfXFFOQxCjBBd4jUo1D3FP1dN6O2ZRY2PkStEo0iV+6hz7oO+X4ZnDCCgJO7HbhlO91JgJPnedibkcYUUwuVo45DIQfLxi/jdOEX2s2pL6OfOapy13gy9ZLp2RAjWZXy</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6A9FH4MAcvXzMj2Jt0NRfijnFR5900TmHkTkFEYnYnR02eMFIFvTR/3AmoK+mXhthJLFhB1fTwLU5Kq6N02/m09aXJwbhjCJFtFR5rjTPvEciI99AqcIIHSG0K7SJ08gy9zezYkQXxsk28grRxW+V+oS+petECUCufsHiyyRG8ytMS6DvSIrp30f/NFLeZUYMS2uCsfuJ9MeMgbdDeFc/AOGc8ADNCd6hB70K/2fkGd/6467AGzbh1l3F4og7JAaoMqlzIbHAtKJ3OA86wcAJ6atwclYU0xDQoF5p0AYi9usJNCY73BOLolKQvb2UI0aS41C40XG0icsHPEUFx+SG3nD2/VZmcuFdMrsDeEu9unL30HKCB+KX+s4o00YqI9E7yy6oNWFHOfD3KOfHbXIrf5m8ELmRgRyGv2no+JsPD8F286JGtH/RGaASppMDfZ41rafHUG1O3Craa6zgib9vwYURSn54Fa1O2PNJ32nByvIz/sY6SCyUd2bXjW97PbnTvVSwbUA97q4b8QGxexovw3mpsLf4/wMHLnSZpff2vp5fbTWY2WuG1F5HZ6+FE3VdvYn62Kf1LZ6aP7so6B7unvZK6/w9r11y2t0ij8NBIqhNysP9gFl5Rzosqycia+4F0NPkkLEwwgEUdiNBtH1DiUtrCXqNWFUyMn/asF+Csn8XWFXTM8p1y+knAdfTadTNaEaX3bVuIlWtprlBwi2j3v9995J4x6xSEyTmcIdU9PSHipCyAZnh0O28hAv+Gi0hw==</Encrypted>]]>
    </text>
  </script>
</dir>