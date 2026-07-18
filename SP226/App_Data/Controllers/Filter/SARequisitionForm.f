<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "SARequisition">
  <!ENTITY DetailTable "d91">
  <!ENTITY c21 "Số phiếu">
  <!ENTITY c22 "Number">
  <!ENTITY c31 "Ngày lập">
  <!ENTITY c32 "Date">

]>

<dir table="m91$000000" code="stt_rec" order="ngay_ct, so_ct" id="PR1" xmlns="urn:schemas-fast-com:data-dir">
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
    <field name="dept_id">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>
    <field name="ma_md" allowNulls="false" clientDefault="Default">
      <header v="Mức độ" e="Priority"></header>
    </field>
    <field name="ten_md%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>
    <field name="ma_vt" external="true" defaultValue="''" clientDefault="Default">
      <header v="Mã vật tư" e="Item"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>
    <field name="sl_duyet" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0">
      <header v="Số lượng duyệt" e="Approved Quantity"/>
      <items style="Numeric"/>
    </field>
    <field name="sa_date" external="true" defaultValue="null" disabled="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="&DetailTable;" external="true" clientDefault="0" defaultValue="0" rows="143" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="&Identity;Grid" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ma_vt, ma_vt" e="String: ma_vt, ma_vt"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: sa_date, sa_date" e="String: sa_date, sa_date"></text>
        </item>
      </items>
    </field>
    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>

    <field name="ong_ba" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="203" anchor="9" split="10">
      <item value="100, 30, 70, 35, 65, 37, 100, 100, 0, 8, 58, 50, 100, 0"/>
      <item value="110100000-1011: [dept_id].Label, [dept_id], [ten_bp%l], [so_ct].Label, [so_ct], [stt_rec]"/>
      <item value="110100000-1011:  [ma_md].Label, [ma_md], [ten_md%l], [ngay_ct].Label, [ngay_ct], [ong_ba]"/>
      <item value="110100000-1011: [ma_vt].Label, [ma_vt], [ten_vt%l], [sl_duyet].Label, [sl_duyet], [sa_date]"/>

      <item value="1: [&DetailTable;]"/>

      <item value="------101000: [t_so_luong].Label, [t_so_luong]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="-1" columns="100, 100, 100, 37, 200, 8, 58, 42, 8, 100, 0, 0" anchor="6">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/yvhy3s3I7HvIXOmDkVAKvGmCO4uj1cmEYYLqDTL5QAqWasPVX19DOhFuVpU+PKjpqoPpMCh3oqRYxXQ+EhyF/RUw3dWJGBd1NdQaNW08i77j0VCQTTL1Jsg+avZCZXmf5wCNJ39fKqQzpzaBWLulKD3/YE8iM/bsoHRsBkouFWJ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJcXlv1vlqCfqi2KS05C9imoBL2WVX5mgmjSz0zBOUGtt6CNjE0DDzZIf+Ijc7jVljk=</Encrypted>]]>&DetailTable;<![CDATA[<Encrypted>&ymPgYPXvzpL6Enqd4IDunK7pnavP1dtf6Ucf1UiCVpudNzZAiZlaJskF37BEjsBf7b6ioZQnuYZQVfrCjBIyeQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/8S6CRZbHhun0qB0gC991CNtlhGYCxTFxcVjfFefXYbXK8p+ArS4ERg9c8mxBfPWuTGH+zmVL0MAPH2kE2T/nEnoZl0mGOBdkwEI2CVgZ3NXW/zNhMwJ2EsbJVKxc24u7ItxUDJ1Nu9RmydVsW4gcKT3sNj2HSn9IFNxEuXsC5I557UZMedUICHvSlBgrLO/ni6sziX9zaIC/YrJiVsww0Xu66y99NVY5jRCOv8UMRpPmbqchZgYooSh0J4/XSFD1kdsO5El4M8fzFHoi40zXMVbogTPUmBUW0RJNTH3I/m1C9HoMatnYAp2atXWw15J9yLL8yUQOi0RBX20pDgLgUYi2EDNsVhbKc5XG25zqMpTkiKAyQewe4fpb+5HCPoTY8BXE3M0Zc9GLf1zpaSmWDjP1QeZaxVdgqr6xvci5GLU</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//4MjJQUpJnC1ijCqrFqRXaUrquhuMz0axBjP4L/rkvjwPq+6vZtGWO6RCXTcqLKKygk+m85MNPVbhwbqeS03lE=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSBh/LHKcK2+43Vtx1iTJcelRC3VBo5wvPUwzkzJOxLp4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/qK0/Cpv+vF6mdifvs1SvCWxAuGuztDnd03vYW7y+slsZSJ1bMNUyA4TPBLwKxH43XYOpfBVU2vbzJ3klOd1cKoWxTIhG6ajZXK4Rc+5NB4bUuW8AiiJcDHE8g/mswwZ43OZ11TB+PS5EJk8gpmlaZF7+NAoLixj1K5IYdjaO1U+zAKwofmdX/UbrwcdtL37NOxQBAih/vmIGMsMk8oA7h8hMzAnNB7N7mcwTZzLqr6kMS6G0D6rOiBUHPfmfcsU5ZtGK/RhcpgmSp8IJtLV/tsuSrxs3Nii+NKJfeT4O/4x</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/5o7Dde+K2qQe3Z9gPRKbIXaG2gHts7t/84LR79uYrUAobQDzwD6fX8o3IpjZMrqHY0/C/P4ME1e/y2MOI9ynLA=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/+5eIMzAowykGLXWd1AAH7+pLlAjxcHpZEZDYpI9X6+KyIrRZv0AV8jX1V66UuplDQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/158oObqMu7AhAxW4r9TBggOuY1sK45MdLTfrd0oo/Y3XOnIV1Enb4nJzoR+z52ijw==</Encrypted>]]>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq96K+18nT4o8vY9Undm4QWNSdrlKL+6kB6InsUFwtTYzdhooHsUhpH2MLOyOMPXTDxOwXKOOGNUMec8JV5tgr/g5qFYdYqpo/Lpw5yBvW/DHJ4e1FccP9chYHqLKSOjPAxhDuKVyojq4/zulnAsPTlzGWeEOO5hdIh4yMgdI5POj3cdU2zbKfNSCusOkJNElqUbDApa+qd9wYeMUhyPWzTjUWAqFLxrV1XNwW37m1LhppOsxZvGIYMyXX9TYX8YxwO1wgk1Qy1p7XdWiXQ2mZUR1pqFGnCNHn31pLypRTovPvCTrOJFjJH1Q+KZpAiGPZlj2RV+TbyYQZfbsiLp/Bz6LEPnXpzpf2/5q+IPhnDrbsZsZNXl7qReNwlbS/O7dPSXg6Xhkaoe/3yk555r1tePJ3KnjfFuUfnWV0k98LEg0rxyve4zBoJjvH2RXagJcGZos4tsS0msB8jnCVLiLEqLDndkqGPz6yQRasxTWsun0amKlOj6y3eXXy7b0NHlkhccKWd2vnkzLtxCaJQnLRo13tucfwHRXJRdqiCMPa//alSsWE7sn9kyVc5LzcJVFW9AdTifUWI0NXgoDIx2hQfDrymppPXy7xXqjFH2LFlPoU=</Encrypted>]]>
    </text>
  </script>

</dir>