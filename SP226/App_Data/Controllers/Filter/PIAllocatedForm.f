<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PIAllocated">
  <!ENTITY DetailTable "d93">
  <!ENTITY c21 "Số phiếu nhu cầu">
  <!ENTITY c22 "Allocated Number">
  <!ENTITY c31 "Ngày phiếu nc">
  <!ENTITY c32 "Allocated Date">
]>

<dir table="m95$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu nhu cầu" e="Supplier Allocation"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" readOnly="true" hidden="true">
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
        <item value="ForeignKey">
          <text v ="String: ma_kh, ma_kh" e="String: ma_kh, ma_kh"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="292" anchor="6" split="10">
      <item value="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 50, 100"/>
      <item value="11010000001101: [ngay_ct].Label, [ngay_ct], [stt_rec], [ma_kh], [so_ct].Label, [so_ct]"/>

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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/0iWNQlg1EGl/HE0H0r+zgF2m6n7iAj2cs/xbEsLQkBNiRuHHGH3aVYui+nLaUkN/HAurDUwRqTYiC+E3EeRkGbZOrHPkjNMUg8RxjBYJ4I5CmGLD/U4A35UZsiVEegHwIsSAWbPSxN+hMw6Ey0XmS5LJ34WzfeveuHFyI5r0R57</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc0T24rU5HdPOvY0VdbCtAyNH4KGGRqhYzibxYZhRvxCQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/8S6CRZbHhun0qB0gC991CMDCBhyP2JXxBafrhURA553eWTeykZ2zQpyFBJpoVWp/WXo3e1Ui9flaCfuBAWmtrPHwi0OUInhrB4Y/0/UR83p8fw7ztcSzisaJ25NBy5Vqf2WcHLcTWItZYgoZyDUQQn9kSq7aA1h00ztOeh8ce1i/Onnw1YXUJW8Y1FxVhatwRAdho8oN2KOCNVqC+2twRG9IDd6K8iRnA6x5BWsdELn</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//4MjJQUpJnC1ijCqrFqRXaUrquhuMz0axBjP4L/rkvjwPq+6vZtGWO6RCXTcqLKKygk+m85MNPVbhwbqeS03lE=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSBh/LHKcK2+43Vtx1iTJcelRC3VBo5wvPUwzkzJOxLp4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/r+iVrzEbkRmWeUPk6rctFJwKFITFmzUxUurH7HyJsOQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/5o7Dde+K2qQe3Z9gPRKbIXaG2gHts7t/84LR79uYrUAobQDzwD6fX8o3IpjZMrqHY0/C/P4ME1e/y2MOI9ynLA=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/+5eIMzAowykGLXWd1AAH7+pLlAjxcHpZEZDYpI9X6+KyIrRZv0AV8jX1V66UuplDQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/158oObqMu7AhAxW4r9TBggOuY1sK45MdLTfrd0oo/Y3XOnIV1Enb4nJzoR+z52ijw==</Encrypted>]]>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9D7BstzDPUAgu+DuxhdiZgf7An4QvAYIqPPHZCRzkefRUiMrI/S6Z7ufOVhH88owGC4DSfsi/kz/GRWyxnTQUhQFETY6FhcUhE8kqQhWm6Rhu+YX43srY+LfGjf49TUFSfUwxTdrkQsbUSWIZF6NfFz/d9i9IZulxhqicfgdfC6oALmBqVJ03ScdSQxbjJSAwPBNWgthFER6Vvwl/HifqB1Lp2tTYJevp3kg/kwRs1n23YZHjcbFRlqZHJlN6joKc91ZTqf3Ftl92NQqlg8a4j6FdSvSJN/MUdkak/HyFPiEthSCCwx3034wDZrtqShtD5Uyt7al1vv1+sHrfaeVLJxrAW4JNHjSiDoJWMxNplA5+4D637T3QWOsU7DXIh1zJRdLHKxOHYqmx2flTiT7Lfhr6oVqfdqsmfrkVLUNccysUlKKoF1oE10ks134M8d2mK5ik6aEQPACzG9ZLDhforsJKG/EvZqWbLA6JT683WBsZaGK+OssBicHX0sX2VOqZ89m6kAWgw/v60Y/WCMLPUe3aWw3MmqB0LBWxhLfyYVwBVVYeqGdDiV+pOOJ76e2XTG8vHcDmmlLZByXyXmwwuctFYDLvRTTmIAqL9XWtwN22C+fFZECiW7Z0N8HJ4Nh6KAh9Dbdtu1lWqcBkYqOnGwNxr3SwsBkGAsWGoSypl8vH+FHcpoHq0JJHn7bt0sDQKRkHXMJgbO633FwbPIVWKEwRTs+YdphMoZrWVOZChW3pHaxFUJFFUtrqq/Ai5B0eyRytx00wEnmdeyaXFG9z9hWfIgDAtY+K5wpPFzrB6XXMX5kYMhSMQB5udE39Nqf4lKrCwYbZ6cztiHS2hUZ2/gfc+NkJVaiQ+BKu8sskFsHc5fDfCWbjITEAIaJhPKam</Encrypted>]]>
    </text>
  </script>
</dir>